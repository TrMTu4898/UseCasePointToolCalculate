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
  }) async {
    try {
      DocumentReference documentRef = _useCasePointsCollection.doc();
      Map<String, dynamic> data = {
        'uid': uid,
        'Name Project': ucp.nameProject,
        'Created Date ': DateTime.now(),
        'Updated Date ': DateTime.now(),
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
          'DistributedSystem	': tcf.t1,
          'ResponseTime/PerformanceObjectives': tcf.t2,
          'End-UserEfficiency': tcf.t3,
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
          'Object-orientedExperienceOfTeam': ecf.e3,
          'LeadAnalystCapability': ecf.e4,
          'MotivationOfTheTeam': ecf.e5,
          'StabilityOfRequirements': ecf.e6,
          'Part-timeStaff': ecf.e7,
          'DifficultProgrammingLanguage': ecf.e8,
          'ECF: ': ecf.ecf,
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
        'Name Project': ucp.nameProject,
        'Updated Date ': DateTime.now(),
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
          'DistributedSystem	': tcf.t1,
          'ResponseTime/PerformanceObjectives': tcf.t2,
          'End-UserEfficiency': tcf.t3,
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
          'Object-orientedExperienceOfTeam': ecf.e3,
          'LeadAnalystCapability': ecf.e4,
          'MotivationOfTheTeam': ecf.e5,
          'StabilityOfRequirements': ecf.e6,
          'Part-timeStaff': ecf.e7,
          'DifficultProgrammingLanguage': ecf.e8,
          'ECF: ': ecf.ecf,
        }
      });
    } catch (e, stackTrace) {
      _logger.severe('Failed to update Use Case Points:', e, stackTrace);
    }
  }

// Function to get a specific use case point document by ID
  Future<List<Project>> getProjectsByUid(String uid) async {
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
}
