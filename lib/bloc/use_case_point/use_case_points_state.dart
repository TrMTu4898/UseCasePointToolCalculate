part of 'use_case_points_bloc.dart';
abstract class UseCasePointState extends Equatable {
  const UseCasePointState();
}
class UseCasePointStateInitial extends UseCasePointState{
  @override
  List<Object?> get props => [];
}

class UseCasePointStateUUCPLoading extends UseCasePointState{
  @override
  List<Object?> get props => [];
}

class UseCasePointStateUUCWSuccess extends UseCasePointState{
  final double uucw;
  const UseCasePointStateUUCWSuccess({required this.uucw});
  @override
  List<Object?> get props => [uucw];
}

class UseCasePointStateUUCWError extends UseCasePointState{
  @override
  List<Object?> get props => [];
}

class UseCasePointStateUAWLoading extends UseCasePointState{
  @override
  List<Object?> get props => [];
}

class UseCasePointStateUAWSuccess extends UseCasePointState{
  final double uaw;
  const UseCasePointStateUAWSuccess({required this.uaw});
  @override
  List<Object?> get props => [uaw];
}

class UseCasePointStateUAWError extends UseCasePointState{
  @override
  List<Object?> get props => [];
}

class UseCasePointStateUCPSuccess extends UseCasePointState{
  final double ucp;
  const UseCasePointStateUCPSuccess({
    required this.ucp,
});
  @override
  List<Object> get props => [ucp];
}
class UseCasePointStateTCFLoading extends UseCasePointState{

  @override
  List<Object> get props =>[];
}
class UseCasePointStateTCFSuccess extends UseCasePointState{
  final double tcf;
  const UseCasePointStateTCFSuccess({
    required this.tcf
});
  @override
  List<Object> get props => [tcf];
}

class UseCasePointStateTCFError extends UseCasePointState{
  @override
  List<Object> get props => [];
}

class UseCasePointStateECFLoading extends UseCasePointState{

  @override
  List<Object> get props => [];
}

class UseCasePointStateECFSuccess extends UseCasePointState{
  final double ecf;
  const UseCasePointStateECFSuccess({
    required this.ecf
});

  @override
  List<Object> get props =>[ecf];
}

class UseCasePointStateECFError extends UseCasePointState{

  @override
  List<Object> get props =>[];
}


class HistoryLoading extends UseCasePointState{

  @override
  List<Object> get props =>[];
}

class HistorySuccess extends UseCasePointState{
  final Project project;
  final String pid;
  const HistorySuccess({
    required this.project,
    required this.pid
});
  @override
  List<Object> get props =>[project,pid];
}

class HistoryFailure extends UseCasePointState{

  @override
  List<Object> get props =>[];
}

class ImportLoading extends UseCasePointState{

  @override
  List<Object> get props =>[];
}

class ImportSuccess extends UseCasePointState{
  final Project project;
  const ImportSuccess({
    required this.project
});
  @override
  List<Object> get props =>[project];
}

class ImportFailure extends UseCasePointState{

  @override
  List<Object> get props =>[];
}