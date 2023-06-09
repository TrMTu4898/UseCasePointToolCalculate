part of '../use_case_points_bloc.dart';

class TCFFormBloc extends FormBloc<String, String> {
  final UseCasePointBloc useCasePointBloc;
  final List<MultiSelectFieldBloc<String, String>> dropdownFieldBlocs;
  TCFFormBloc({required this.useCasePointBloc})
      : dropdownFieldBlocs = List.generate(13, (_) =>
      MultiSelectFieldBloc<String, String>(items: ['0', '1', '2', '3', '4', '5'])),
        super();
  @override
  void onSubmitting() async{
    final Map<String, String> dropValues = {};
    for (var i = 0; i < dropdownFieldBlocs.length; i++) {
      final bloc = dropdownFieldBlocs[i];
      final values = bloc.state.value;
      dropValues['dropdown_$i'] = values.isNotEmpty ? values.join(',') : '0';
    }
    useCasePointBloc.add(CalculateTCFEvent(dropValues: dropValues));
    emitSuccess(canSubmitAgain: true);
  }
  void onSuccess() async {}

  Map<String, String> getDropValue() {
    final Map<String, String> dropValues = {};
    for (var i = 0; i < dropdownFieldBlocs.length; i++) {
      final bloc = dropdownFieldBlocs[i];
      final values = bloc.state.value;
      dropValues['dropdown_$i'] = values.isNotEmpty ? values.join(',') : '0';
    }
    return dropValues;
  }
  }

