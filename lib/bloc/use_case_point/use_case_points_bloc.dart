import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../util/ecf_calculate.dart';
import '../../util/tcf_calculate.dart';
import '../../util/uaw_calculate.dart';
import '../../util/uucw_calculate.dart';
part 'use_case_points_event.dart';
part 'use_case_points_state.dart';
part 'form_bloc/uucw_form_bloc.dart';
part 'form_bloc/uaw_form_bloc.dart';
part 'form_bloc/tcf_form_bloc.dart';
part 'form_bloc/ecf_form_bloc.dart';

class UseCasePointBloc extends Bloc<UseCasePointEvent, UseCasePointState> {
  UseCasePointBloc()
      :super(UseCasePointStateInitial()) {
    on<CalculateUUCWEvent>(_onCalculateUUCW);
    on<CalculateUAWEvent>(_onCalculateUAW);
    on<CalculateTCFEvent>(_onCalculateTCF);
    on<CalculateECFEvent>(_onCalculateECF);
  }
  Future<void> _onCalculateUUCW(
      CalculateUUCWEvent event, Emitter<UseCasePointState> emit) async {
    emit(UseCasePointStateUUCPLoading());
    try {
      final uucw = uucwCalculator(
        event.simpleUUCW,
        event.averageUUCW,
        event.complexUUCW,
      );
      emit(UseCasePointStateUUCWSuccess(uucw: uucw));
    } catch (_) {
      emit(UseCasePointStateUUCWError());
    }
  }

  Future<void> _onCalculateUAW(
      CalculateUAWEvent event, Emitter<UseCasePointState> emit) async {
    emit(UseCasePointStateUAWLoading());
    try {
      final uaw = uawCalculator(
          event.simpleActor, event.averageActor, event.complexActor);
      emit(UseCasePointStateUAWSuccess(uaw: uaw));
    } catch (_) {
      emit(UseCasePointStateUAWError());
    }
  }

  Future<void> _onCalculateTCF(
      CalculateTCFEvent event, Emitter<UseCasePointState> emit) async {
    emit(UseCasePointStateTCFLoading());
    try {
      final tcf = calculateTCF(event.dropValues);
      emit(UseCasePointStateTCFSuccess(tcf:tcf));
    } catch (e) {
      print('Error: $e');
      emit(UseCasePointStateTCFError());
    }
  }

  Future<void> _onCalculateECF(
      CalculateECFEvent event, Emitter<UseCasePointState> emit) async{
    emit(UseCasePointStateECFLoading());
    try{
      final ecf = calculateECF(event.dropValues);
      emit(UseCasePointStateECFSuccess(ecf:ecf));
    }catch(_){
      emit(UseCasePointStateECFError());
    }
  }
  double get uucp {
    final state = this.state;
    if (state is UseCasePointStateUUCWSuccess) {
      return state.uucw;
    }
    return 0.0;
  }
  double get uaw {
    final state = this.state;
    if (state is UseCasePointStateUAWSuccess) {
      return state.uaw;
    }
    return 0.0;
  }
  double get tcf {
    final state = this.state;
    if (state is UseCasePointStateTCFSuccess) {
      return state.tcf;
    }
    return 0.0;
  }
  double get ecf {
    final state = this.state;
    if (state is UseCasePointStateECFSuccess) {
      return state.ecf;
    }
    return 0.0;
  }
}
