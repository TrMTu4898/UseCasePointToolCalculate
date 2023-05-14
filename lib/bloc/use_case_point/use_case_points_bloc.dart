import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/util/uaw_calculate.dart';
import 'package:usecasepointstool/util/uucp_calculate.dart';
part 'use_case_points_event.dart';
part 'use_case_points_state.dart';
part 'form_bloc/uucp_form_bloc.dart';
part 'form_bloc/uaw_form_bloc.dart';
part 'form_bloc/tcf_form_bloc.dart';

class UseCasePointBloc extends Bloc<UseCasePointEvent, UseCasePointState> {
  UseCasePointBloc() : super(UseCasePointStateInitial()) {
    on<CalculateUUCPEvent>(_onCalculateUUCP);
    on<CalculateUAWEvent>(_onCalculateUAW);
  }
  Future<void> _onCalculateUUCP(
      CalculateUUCPEvent event, Emitter<UseCasePointState> emit) async {
    emit(UseCasePointStateUUCPLoading());
    try {
      final uucp = uucpCalculator(
        event.simpleUUCP,
        event.averageUUCP,
        event.complexUUCP,
      );
      emit(UseCasePointStateUUCPSuccess(uucp: uucp));
    } catch (_) {
      emit(UseCasePointStateUUCPError());
    }
  }
}

Future<void> _onCalculateUAW(
    CalculateUAWEvent event, Emitter<UseCasePointState> emit) async {
  emit(UseCasePointStateUAWLoading());
  try {
    final uaw = uawCalculator(
        event.simpleActor,
        event.averageActor,
        event.complexActor
    );
    emit(UseCasePointStateUAWSuccess(uaw: uaw));
  } catch (_) {
    emit(UseCasePointStateUAWError());
  }
}
