part of '../use_case_points_bloc.dart';
class UAWFormBloc extends FormBloc<String, String> {
  final UseCasePointBloc useCasePointBloc;
  final simpleActors = TextFieldBloc();
  final averageActors = TextFieldBloc();
  final complexActors = TextFieldBloc();
  int get simpleActorsValue => simpleActors.value.isNotEmpty ? int.parse(simpleActors.value) : 0;
  int get averageActorsValue => averageActors.value.isNotEmpty ? int.parse(averageActors.value) : 0;
  int get complexActorsValue => complexActors.value.isNotEmpty ? int.parse(complexActors.value) : 0;

  UAWFormBloc({required this.useCasePointBloc}) {
    addFieldBlocs(fieldBlocs: [
      simpleActors,
      averageActors,
      complexActors,
    ]);
  }

  @override
  void onSubmitting() async {
    final uaw = uawCalculator(
      simpleActors.value.isNotEmpty ? int.parse(simpleActors.value) : 0,
      averageActors.value.isNotEmpty ? int.parse(averageActors.value) : 0,
      complexActors.value.isNotEmpty ? int.parse(complexActors.value) : 0,
    );
    useCasePointBloc.add(CalculateUAWEvent(
      simpleActor:
      simpleActors.value.isNotEmpty ? int.parse(simpleActors.value) : 0,
      averageActor:
      averageActors.value.isNotEmpty ? int.parse(averageActors.value) : 0,
      complexActor:
      complexActors.value.isNotEmpty ? int.parse(complexActors.value) : 0,
    ));
    emitSuccess(canSubmitAgain: true);
  }

  void onSuccess() async {}
}
