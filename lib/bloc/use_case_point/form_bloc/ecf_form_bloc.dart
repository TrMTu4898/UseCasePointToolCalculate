part of '../use_case_points_bloc.dart';

class ECFFormBloc extends FormBloc<String, String> {
  final UseCasePointBloc useCasePointBloc;
  final List<MultiSelectFieldBloc<String, String>> dropdownFieldBlocs;
  ECFFormBloc({required this.useCasePointBloc})
      : dropdownFieldBlocs = List.generate(
            8,
            (_) => MultiSelectFieldBloc<String, String>(
                items: ['0', '1', '2', '3', '4', '5'])),
        super();

  @override
  void onSubmitting() async {
    final Map<String, String> dropValues = {};
    for (var i = 0; i < dropdownFieldBlocs.length; i++) {
      final bloc = dropdownFieldBlocs[i];
      final values = bloc.state.value;
      dropValues['dropdown_$i'] = values.isNotEmpty ? values.join(',') : '0';
    }
    useCasePointBloc.add(CalculateECFEvent(dropValues: dropValues));
    emitSuccess(canSubmitAgain: true);
  }

  void onSuccess() async {}
}
