import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../data/models/use_case_points_uucw.dart';
import '../../../../data/models/use_case_points_tcf.dart';
import '../../../../data/models/use_case_points_uaw.dart';
import '../../../../data/models/use_case_points_ecf.dart';

class Project {
  String nameProject;
  DateTime createdProject;
  DateTime updatedProject;
  UseCasePointsUUCW uucw;
  UseCasePointsTCF tcf;
  UseCasePointsUAW uaw;
  UseCasePointsECF ecf;
  double ucp;
  String uid;

  Project({
    required this.nameProject,
    required this.createdProject,
    required this.updatedProject,
    required this.uucw,
    required this.tcf,
    required this.ecf,
    required this.uaw,
    required this.ucp,
    required this.uid,
  });
  factory Project.fromMap(Map<String, dynamic> map) {
    final tcfMap = Map<String, dynamic>.from(map['TCF'] ?? {});
    final ecfMap = Map<String, dynamic>.from(map['ECF'] ?? {});
    final uucwMap = Map<String, dynamic>.from(map['UUCP'] ?? {});
    final uawMap = Map<String, dynamic>.from(map['UAW'] ?? {});

    final UseCasePointsTCF tcf = UseCasePointsTCF.fromMap(tcfMap);
    final UseCasePointsECF ecf = UseCasePointsECF.fromMap(ecfMap);
    final UseCasePointsUUCW uucw = UseCasePointsUUCW.fromMap(uucwMap);
    final UseCasePointsUAW uaw = UseCasePointsUAW.fromMap(uawMap);

    return Project(
      nameProject: map['NameProject'] ?? '',
      createdProject: (map['CreatedDate'] as Timestamp).toDate(),
      updatedProject: (map['UpdatedDate'] as Timestamp).toDate(),
      uucw: uucw,
      tcf: tcf,
      ecf: ecf,
      uaw: uaw,
      ucp: map['UCP'] ?? 0,
      uid: map['uid'] ?? '',
    );
  }


}
