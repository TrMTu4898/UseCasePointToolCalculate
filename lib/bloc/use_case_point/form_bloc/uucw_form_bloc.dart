part of '../use_case_points_bloc.dart';
class UUCWFormBloc extends FormBloc<String, String> {
  final UseCasePointBloc useCasePointBloc;
  final simpleUUCW = TextFieldBloc();
  final averageUUCW = TextFieldBloc();
  final complexUUCW = TextFieldBloc();
  int get simpleUUCWValue => simpleUUCW.value.isNotEmpty ? int.parse(simpleUUCW.value) : 0;
  int get averageUUCWValue => averageUUCW.value.isNotEmpty ? int.parse(averageUUCW.value) : 0;
  int get complexUUCWValue => complexUUCW.value.isNotEmpty ? int.parse(complexUUCW.value) : 0;

  UUCWFormBloc({required this.useCasePointBloc}) {
    addFieldBlocs(fieldBlocs: [
      simpleUUCW,
      averageUUCW,
      complexUUCW,
    ]);
  }

  @override
  void onSubmitting() async {
    final uucp = uucwCalculator(
      simpleUUCW.value.isNotEmpty ? int.parse(simpleUUCW.value) : 0,
      averageUUCW.value.isNotEmpty ? int.parse(averageUUCW.value) : 0,
      complexUUCW.value.isNotEmpty ? int.parse(complexUUCW.value) : 0,
    );
    useCasePointBloc.add(CalculateUUCWEvent(
      simpleUUCW: simpleUUCW.value.isNotEmpty ? int.parse(simpleUUCW.value) : 0,
      averageUUCW:
      averageUUCW.value.isNotEmpty ? int.parse(averageUUCW.value) : 0,
      complexUUCW:
      complexUUCW.value.isNotEmpty ? int.parse(complexUUCW.value) : 0,
    ));
    emitSuccess(canSubmitAgain: true);
  }

  void onSuccess() async {}
}
