part of 'use_case_points_bloc.dart';
abstract class UseCasePointEvent extends Equatable{
  const UseCasePointEvent();
}
class UseCasePointEventInitial extends UseCasePointEvent{
  @override
  List<Object> get props => [];
}
class CalculateUUCWEvent extends UseCasePointEvent{
  final int simpleUUCW;
  final int averageUUCW;
  final int complexUUCW;
  const CalculateUUCWEvent({
    required this.simpleUUCW,
    required this.averageUUCW,
    required this.complexUUCW
  });
  @override
  List<Object> get props => [simpleUUCW,averageUUCW,complexUUCW];
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

class CalculateTCFEvent extends UseCasePointEvent{
  final Map<String, String> dropValues;
  const CalculateTCFEvent({
    required this.dropValues
  });
  @override
  List<Object> get props => [dropValues];
}

class CalculateECFEvent extends UseCasePointEvent{
  final Map<String, String> dropValues;
  const CalculateECFEvent({
    required this.dropValues
});

  @override
  List<Object> get props => [dropValues];
}

class CalculateUCPEvent extends UseCasePointEvent{
  final double uucp;
  final double uaw;
  final double ecf;
  final double tcf;
  const CalculateUCPEvent({
    required this.uucp,
    required this.tcf,
    required this.ecf,
    required this.uaw,
});
  @override
  List<Object> get props => [uucp,uaw,ecf,tcf];
}


class EditingHistory extends UseCasePointEvent{
  final String pid;
  const EditingHistory({
    required this.pid
});
  @override
  List<Object> get props => [pid];
}


class EditingImport extends UseCasePointEvent{

  @override
  List<Object> get props => [];
}