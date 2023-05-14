part of '../use_case_points_bloc.dart';
class UUCPFormBloc extends FormBloc<String, String> {
  final UseCasePointBloc useCasePointBloc;
  final simpleUUCP = TextFieldBloc();
  final averageUUCP = TextFieldBloc();
  final complexUUCP = TextFieldBloc();

  UUCPFormBloc({required this.useCasePointBloc}) {
    addFieldBlocs(fieldBlocs: [
      simpleUUCP,
      averageUUCP,
      complexUUCP,
    ]);
  }

  @override
  void onSubmitting() async {
    final uucp = uucpCalculator(
      simpleUUCP.value.isNotEmpty ? int.parse(simpleUUCP.value) : 0,
      averageUUCP.value.isNotEmpty ? int.parse(averageUUCP.value) : 0,
      complexUUCP.value.isNotEmpty ? int.parse(complexUUCP.value) : 0,
    );
    useCasePointBloc.add(CalculateUUCPEvent(
      simpleUUCP: simpleUUCP.value.isNotEmpty ? int.parse(simpleUUCP.value) : 0,
      averageUUCP:
      averageUUCP.value.isNotEmpty ? int.parse(averageUUCP.value) : 0,
      complexUUCP:
      complexUUCP.value.isNotEmpty ? int.parse(complexUUCP.value) : 0,
    ));
    emitSuccess(canSubmitAgain: true);
  }

  void onSuccess() async {}
}
