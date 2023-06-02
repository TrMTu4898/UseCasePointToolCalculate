import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usecasepointstool/data/models/use_case_points.dart';
import '../models/use_case_points_ecf.dart';
import '../models/use_case_points_tcf.dart';
import '../models/use_case_points_uaw.dart';
import '../models/use_case_points_uucw.dart';
import 'package:logging/logging.dart';

class UseCasePointsRepository {
  final _logger = Logger('UseCasePointsRepository');
  final CollectionReference _useCasePointsCollection =
      FirebaseFirestore.instance.collection('Project');
//Function create a new Use CasePoints
  Future<void> createUseCasePoints({
    required String uid,
    required Project ucp,
    required UseCasePointsUUCW uucw,
    required UseCasePointsTCF tcf,
    required UseCasePointsUAW uaw,
    required UseCasePointsECF ecf,
    required String nameProject,
  }) async {
    try {
      DocumentReference documentRef = _useCasePointsCollection.doc();
      Map<String, dynamic> data = {
        'uid': uid,
        'NameProject': nameProject,
        'CreatedDate': DateTime.now(),
        'UpdatedDate': DateTime.now(),
        'UCP': ucp.ucp,
        'UUCW': {
          'Simple': uucw.simple,
          'Average': uucw.average,
          'Complex': uucw.complex,
          'UUCW': uucw.uucw,
        },
        'UAW': {
          'Simple': uaw.simple,
          'Average': uaw.average,
          'Complex': uaw.complex,
          'UAW': uaw.uaw,
        },
        'TCF': {
          'DistributedSystem': tcf.t1,
          'ResponseTimePerformanceObjectives': tcf.t2,
          'EndUserEfficiency': tcf.t3,
          'InternalProcessingComplexity': tcf.t4,
          'CodeReusability': tcf.t5,
          'EasyToInstall': tcf.t6,
          'EasyToUser': tcf.t7,
          'PortabilityToOtherPlatforms': tcf.t8,
          'SystemMaintenance': tcf.t9,
          'ConcurrentParallelProcessing': tcf.t10,
          'SecurityFeatures': tcf.t11,
          'AccessForThirdParties': tcf.t12,
          'EndUserTraining': tcf.t13,
          'TCF': tcf.tcf,
        },
        'ECF': {
          'FamiliarityWithDevelopmentProcessUsed': ecf.e1,
          'ApplicationExperience': ecf.e2,
          'ObjectOrientedExperienceOfTeam': ecf.e3,
          'LeadAnalystCapability': ecf.e4,
          'MotivationOfTheTeam': ecf.e5,
          'StabilityOfRequirements': ecf.e6,
          'PartTimeStaff': ecf.e7,
          'DifficultProgrammingLanguage': ecf.e8,
          'ECF': ecf.ecf,
        }
      };
      await documentRef.set(data);
      print('Dữ liệu đã được thêm thành công vào collection "UCP"');
    } catch (e, stackTrace) {
      _logger.severe('Failed to created Use Case Points:', e, stackTrace);
    }
  }

  //Function update Use Case Points
  Future<void> updateUseCasePoints({
    required String pid,
    required String uid,
    required Project ucp,
    required UseCasePointsUUCW uucw,
    required UseCasePointsTCF tcf,
    required UseCasePointsUAW uaw,
    required UseCasePointsECF ecf,
  }) async {
    try {
      await _useCasePointsCollection.doc(pid).set({
        'NameProject': ucp.nameProject,
        'UpdatedDate': DateTime.now(),
        'UCP': ucp.ucp,
        'UUCW': {
          'Simple': uucw.simple,
          'Average': uucw.average,
          'Complex': uucw.complex,
          'UUCW': uucw.uucw,
        },
        'UAW': {
          'Simple': uaw.simple,
          'Average': uaw.average,
          'Complex': uaw.complex,
          'UAW': uaw.uaw,
        },
        'TCF': {
          'DistributedSystem': tcf.t1,
          'ResponseTimePerformanceObjectives': tcf.t2,
          'EndUserEfficiency': tcf.t3,
          'InternalProcessingComplexity': tcf.t4,
          'CodeReusability': tcf.t5,
          'EasyToInstall': tcf.t6,
          'EasyToUser': tcf.t7,
          'PortabilityToOtherPlatforms': tcf.t8,
          'SystemMaintenance': tcf.t9,
          'Concurrent/parallelProcessing': tcf.t10,
          'SecurityFeatures': tcf.t11,
          'AccessForThirdParties': tcf.t12,
          'EndUserTraining': tcf.t13,
          'TCF': tcf.tcf,
        },
        'ECF': {
          'FamiliarityWithDevelopmentProcessUsed': ecf.e1,
          'ApplicationExperience': ecf.e2,
          'ObjectOrientedExperienceOfTeam': ecf.e3,
          'LeadAnalystCapability': ecf.e4,
          'MotivationOfTheTeam': ecf.e5,
          'StabilityOfRequirements': ecf.e6,
          'PartTimeStaff': ecf.e7,
          'DifficultProgrammingLanguage': ecf.e8,
          'ECF': ecf.ecf,
        }
      });
    } catch (e, stackTrace) {
      _logger.severe('Failed to update Use Case Points:', e, stackTrace);
    }
  }

// Function to get a specific use case point document by ID
  Future<List<Project>> getAllProjectsByUid(String uid) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('Project')
        .where('uid', isEqualTo: uid)
        .get();

    final List<Project> projects = snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      final data = doc.data();
      final project = Project.fromMap(data!);
      return project;
    }).toList();

    return projects;
  }


// Function to delete a specific use case point document by ID
  Future<void> deleteUseCasePoints(String id) async {
    try {
      await _useCasePointsCollection.doc(id).delete();
    } catch (e) {
      _logger.severe('Failed to delete Use Case Points:', e);
      rethrow;
    }
  }

  Future<Project?> getProject(String pid) async {
    try {
      final projectDoc = await FirebaseFirestore.instance.collection('Project').doc(pid).get();
      if (projectDoc.exists) {
        final projectData = projectDoc.data() as Map<String, dynamic>;

        //Xây dựng đối tượng Project từ dữ liệu nhận được
        final project = Project(
          nameProject: projectData!['NameProject'].toString(),
          createdProject: projectData['CreatedDate'].toDate(),
          updatedProject: projectData['UpdatedDate'].toDate(),
          uid: projectData['uid'].toString(),
          ucp: double.parse(projectData['UCP'].toString()),
          uucw: UseCasePointsUUCW(
            simple: int.parse(projectData['UUCW']['Simple'].toString()),
            average: int.parse(projectData['UUCW']['Average'].toString()),
            complex: int.parse(projectData['UUCW']['Complex'].toString()),
            uucw: double.parse(projectData['UUCW']['UUCW'].toString()),
          ),
          uaw: UseCasePointsUAW(
            simple: int.parse(projectData['UAW']['Simple'].toString()),
            average: int.parse(projectData['UAW']['Average'].toString()),
            complex: int.parse(projectData['UAW']['Complex'].toString()),
            uaw: double.parse(projectData['UAW']['UAW'].toString()),
          ),
          tcf: UseCasePointsTCF(
            t1: int.parse(projectData['TCF']['DistributedSystem'].toString()) ,
            t2: int.parse(projectData['TCF']['ResponseTimePerformanceObjectives'].toString()) ,
            t3: int.parse(projectData['TCF']['EndUserEfficiency'].toString()) ,
            t4: int.parse(projectData['TCF']['InternalProcessingComplexity'].toString()) ,
            t5: int.parse(projectData['TCF']['CodeReusability'].toString()) ,
            t6: int.parse(projectData['TCF']['EasyToInstall'].toString()) ,
            t7: int.parse(projectData['TCF']['EasyToUser'].toString()) ,
            t8: int.parse(projectData['TCF']['PortabilityToOtherPlatforms'].toString()) ,
            t9: int.parse(projectData['TCF']['SystemMaintenance'].toString()) ,
            t10: int.parse(projectData['TCF']['ConcurrentParallelProcessing'].toString()) ,
            t11: int.parse(projectData['TCF']['SecurityFeatures'].toString()) ,
            t12: int.parse(projectData['TCF']['AccessForThirdParties'].toString()) ,
            t13: int.parse(projectData['TCF']['EndUserTraining'].toString()) ,
            tcf: double.parse(projectData['TCF']['TCF'].toString()),
          ),
          ecf: UseCasePointsECF(
            ecf: double.parse(projectData['ECF']['ECF'].toString()),
            e1: int.parse(projectData['ECF']['FamiliarityWithDevelopmentProcessUsed'].toString()) ,
            e2: int.parse(projectData['ECF']['ApplicationExperience'].toString()) ,
            e3: int.parse(projectData['ECF']['ObjectOrientedExperienceOfTeam'].toString()) ,
            e4: int.parse(projectData['ECF']['LeadAnalystCapability'].toString()) ,
            e5: int.parse(projectData['ECF']['MotivationOfTheTeam'].toString()) ,
            e6: int.parse(projectData['ECF']['StabilityOfRequirements'].toString()) ,
            e7: int.parse(projectData['ECF']['PartTimeStaff'].toString()) ,
            e8: int.parse(projectData['ECF']['DifficultProgrammingLanguage'].toString()) ,
          ),
        );
        return project;
      }
    } catch (e) {
      print('Error getting project: $e');
    }
    return null; // Trả về null nếu không tìm thấy dự án
  }
}
