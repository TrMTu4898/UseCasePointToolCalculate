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

class UseCasePointStateUUCPSuccess extends UseCasePointState{
  final double uucp;
  const UseCasePointStateUUCPSuccess({required this.uucp});
  @override
  List<Object?> get props => [uucp];
}

class UseCasePointStateUUCPError extends UseCasePointState{
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