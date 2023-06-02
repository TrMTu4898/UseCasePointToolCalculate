import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter_excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../data/models/use_case_points.dart';
import '../data/models/use_case_points_ecf.dart';
import '../data/models/use_case_points_tcf.dart';
import '../data/models/use_case_points_uaw.dart';
import '../data/models/use_case_points_uucw.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

Future<void> writeToExcel(Project project) async {
  try{
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];
    List<List<dynamic>> data =[
      ['NameProject', project.nameProject],
      ['CreatedDate', '${project.createdProject}'],
      ['UCP', '${project.ucp.toDouble()}'],
      ['UnadjustedUseCaseWeight', '${project.uucw.uucw.toDouble()}'],
      ['SimpleUUCW', '${project.uucw.simple.toDouble()}'],
      ['AverageUUCW', '${project.uucw.average.toDouble()}'],
      ['ComplexUUCW', '${project.uucw.complex.toDouble()}'],
      ['UnadjustedActorWeight', '${project.uaw.uaw.toDouble()}'],
      ['SimpleUAW', '${project.uaw.simple.toDouble()}'],
      ['AverageUAW', '${project.uaw.average.toDouble()}'],
      ['ComplexUAW', '${project.uaw.complex.toDouble()}'],
      ['TechnicalComplexityFactor', '${project.tcf.tcf.toDouble()}'],
      ['DistributedSystem', '${project.tcf.t1.toDouble()}'],
      ['ResponseTimePerformanceObjectives', '${project.tcf.t2.toDouble()}'],
      ['EndUserEfficiency', '${project.tcf.t3.toDouble()}'],
      ['InternalProcessingComplexity', '${project.tcf.t4.toDouble()}'],
      ['CodeReusability', '${project.tcf.t5.toDouble()}'],
      ['EasyToInstall', '${project.tcf.t6.toDouble()}'],
      ['EasyToUse', '${project.tcf.t7.toDouble()}'],
      ['PortabilityToOtherPlatforms', '${project.tcf.t8.toDouble()}'],
      ['SystemMaintenance', '${project.tcf.t9.toDouble()}'],
      ['ConcurrentParallelProcessing', '${project.tcf.t10.toDouble()}'],
      ['SecurityFeatures', '${project.tcf.t11.toDouble()}'],
      ['AccessForThirdParties', '${project.tcf.t12.toDouble()}'],
      ['EndUserTraining', '${project.tcf.t12.toDouble()}'],
      ['EnvironmentComplexityFactor', '${project.ecf.ecf.toDouble()}'],
      ['FamiliarityWithDevelopmentProcessUsed', '${project.ecf.e1.toDouble()}'],
      ['ApplicationExperience', '${project.ecf.e2.toDouble()}'],
      ['ObjectOrientedExperienceOfTeam', '${project.ecf.e3.toDouble()}'],
      ['LeadAnalystCapability', '${project.ecf.e4.toDouble()}'],
      ['MotivationOfTheTeam', '${project.ecf.e5.toDouble()}'],
      ['StabilityOfRequirements', '${project.ecf.e6.toDouble()}'],
      ['PartTimeStaff', '${project.ecf.e7.toDouble()}'],
      ['DifficultProgrammingLanguage', '${project.ecf.e8.toDouble()}'],
    ];
    CellStyle cellStyle = CellStyle( bold: false);
    for (var row = 0; row < data.length; row++) {
      for (var column = 0; column < data[row].length; column++) {
        sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: column, rowIndex: row)).value = data[row][column];
        if (row == 0 || row == 1 || row == 2 || row == 3 || row == 7 || row == 11 || row == 25) {
          sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: column, rowIndex: row)).cellStyle = cellStyle.copyWith(boldVal: true);
        }
      }
    }
    String projectName = project.nameProject;
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Quyền truy cập bộ nhớ ngoài đã được cấp phép
      // Tiến hành đọc hoặc ghi file vào bộ nhớ ngoài ở đây
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        String directoryPath = result.paths.single!;
        String excelPath = path.join(directoryPath, '$projectName.xlsx');
        List<int>? fileBytes = excel.save();
        if (fileBytes != null) {
          File(excelPath)
            ..createSync(recursive: true)
            ..writeAsBytesSync(fileBytes);
          print('File saved at: $excelPath');
        }
      } else {
        // Người dùng không chọn thư mục lưu trữ
      }
    } else if (status.isDenied) {
      status = await Permission.storage.request();
      print('123');
      // Quyền truy cập bộ nhớ ngoài đã bị từ chối
    } else if (status.isPermanentlyDenied) {
      status = await Permission.storage.request();
      print('${status.isPermanentlyDenied}');
      openAppSettings();
      // Quyền truy cập bộ nhớ ngoài đã bị từ chối vĩnh viễn, người dùng không thể thay đổi trong ứng dụng
    }


    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String appDocPath = appDocDir.path;
    // Directory ucpDirectory =
    // await Directory('$appDocPath/UseCasePointCalculate').create(recursive: true);
    // String ucpDirectoryPath = ucpDirectory.path;
    // //String excelPath = '$ucpDirectoryPath/$projectName.xlsx';
    // String excelPath = '$appDocPath/Documents/$projectName.xlsx';
    // //var outputFile  =  excel.save(fileName: excelPath);
    // List<int>? fileBytes = excel.save();
    // if (fileBytes != null) {
    //   File(join(excelPath))
    //     ..createSync(recursive: true)
    //     ..writeAsBytesSync(fileBytes);
    // }
    // print('File saved at: $excelPath');
  }catch(e){
    print(e);
    print('khong thanh cong');
  }
}


Future<Project> readFromExcel(String filePath) async {
  try {
    var excel = Excel.decodeBytes(File(filePath).readAsBytesSync());

    var sheet = excel['Sheet1'];

    var data = sheet.rows;

    String nameProject = data[0][1].toString();
    DateTime createdProject = DateTime.parse(data[1][1].toString());
    double ucp = double.parse(data[2][1].toString());
    double uucw = double.parse(data[3][1].toString());
    int simpleUUCW = int.parse(data[4][1].toString());
    int averageUUCW = int.parse(data[5][1].toString());
    int complexUUCW = int.parse(data[6][1].toString());
    double uaw = double.parse(data[7][1].toString());
    int simpleUAW = int.parse(data[8][1].toString());
    int averageUAW = int.parse(data[9][1].toString());
    int complexUAW = int.parse(data[10][1].toString());
    double tcf = double.parse(data[11][1].toString());
    int distributedSystem = int.parse(data[12][1].toString());
    int responseTimePerformanceObjectives = int.parse(data[13][1].toString());
    int endUserEfficiency = int.parse(data[14][1].toString());
    int internalProcessingComplexity = int.parse(data[15][1].toString());
    int codeReusability = int.parse(data[16][1].toString());
    int easyToInstall = int.parse(data[17][1].toString());
    int easyToUse = int.parse(data[18][1].toString());
    int portabilityToOtherPlatforms = int.parse(data[19][1].toString());
    int systemMaintenance = int.parse(data[20][1].toString());
    int concurrentParallelProcessing = int.parse(data[21][1].toString());
    int securityFeatures = int.parse(data[22][1].toString());
    int accessForThirdParties = int.parse(data[23][1].toString());
    int endUserTraining = int.parse(data[24][1].toString());
    double ecf = double.parse(data[25][1].toString());
    int familiarityWithDevelopmentProcessUsed = int.parse(data[26][1].toString());
    int applicationExperience = int.parse(data[27][1].toString());
    int objectOrientedExperienceOfTeam = int.parse(data[28][1].toString());
    int leadAnalystCapability = int.parse(data[29][1].toString());
    int motivationOfTheTeam = int.parse(data[30][1].toString());
    int stabilityOfRequirements = int.parse(data[31][1].toString());
    int partTimeStaff = int.parse(data[32][1].toString());
    int difficultProgrammingLanguage = int.parse(data[33][1].toString());

    var project = Project(
      nameProject: nameProject,
      createdProject: createdProject,
      updatedProject: DateTime.now(), // Provide the updatedProject value as needed
      uucw: UseCasePointsUUCW(
        uucw: uucw,
        simple: simpleUUCW,
        average: averageUUCW,
        complex: complexUUCW,
      ),
      tcf: UseCasePointsTCF(
        tcf: tcf,
        t1: distributedSystem,
        t2: responseTimePerformanceObjectives,
        t3: endUserEfficiency,
        t4: internalProcessingComplexity,
        t5: codeReusability,
        t6: easyToInstall,
        t7: easyToUse,
        t8: portabilityToOtherPlatforms,
        t9: systemMaintenance,
        t10: concurrentParallelProcessing,
        t11: securityFeatures,
        t12: accessForThirdParties,
        t13: endUserTraining,
      ),
      uaw: UseCasePointsUAW(
        uaw: uaw,
        simple: simpleUAW,
        average: averageUAW,
        complex: complexUAW,
      ),
      ecf: UseCasePointsECF(
        ecf: ecf,
        e1: familiarityWithDevelopmentProcessUsed,
        e2: applicationExperience,
        e3: objectOrientedExperienceOfTeam,
        e4: leadAnalystCapability,
        e5: motivationOfTheTeam,
        e6: stabilityOfRequirements,
        e7: partTimeStaff,
        e8: difficultProgrammingLanguage,
      ),
      ucp: ucp,
      uid: 'your-uid', // Provide the UID value as needed
    );

    return project;
  } catch (e) {
    print(e);
    throw Exception('Failed to read Excel file');
  }
}

