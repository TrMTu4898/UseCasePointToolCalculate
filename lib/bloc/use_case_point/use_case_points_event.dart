part of 'use_case_points_bloc.dart';
abstract class UseCasePointEvent extends Equatable{
  const UseCasePointEvent();
}
class UseCasePointEventInitial extends UseCasePointEvent{
  @override
  List<Object> get props => [];
}
class CalculateUUCPEvent extends UseCasePointEvent{
  final int simpleUUCP;
  final int averageUUCP;
  final int complexUUCP;
  const CalculateUUCPEvent({
    required this.simpleUUCP,
    required this.averageUUCP,
    required this.complexUUCP
  });
  @override
  List<Object> get props => [simpleUUCP,averageUUCP,complexUUCP];
}

class CalculateUAWEvent extends UseCasePointEvent{
  final int simpleActor;
  final int averageActor;
  final int complexActor;
  const CalculateUAWEvent({
    required this.simpleActor,
    required this.averageActor,
    required this.complexActor
  });
  @override
  List<Object> get props => [simpleActor,averageActor,complexActor];
}
