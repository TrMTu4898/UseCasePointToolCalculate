import '../../../../data/models/use_case_points_uucp.dart';
import '../../../../data/models/use_case_points_tcf.dart';
import '../../../../data/models/use_case_points_uaw.dart';
import '../../../../data/models/use_case_points_ecf.dart';

class UseCasePoint {
  String nameProject;
  DateTime createdProject;
  DateTime updatedProject;
  UseCasePointsUUCP uucp;
  UseCasePointsTCF tcf;
  UseCasePointsUAW uaw;
  UseCasePointsECF ecf;
  double ucp;
  String uid;
  String pid;

  UseCasePoint({
    required this.nameProject,
    required this.createdProject,
    required this.updatedProject,
    required this.uucp,
    required this.tcf,
    required this.ecf,
    required this.uaw,
    required this.ucp,
    required this.uid,
    required this.pid,
  });
}
