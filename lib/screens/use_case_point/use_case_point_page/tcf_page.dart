import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../bloc/use_case_point/use_case_points_bloc.dart';
import '../../../layout/top_left_layout.dart';
import '../../../widgets/button/button_widget.dart';
import '../../../widgets/widgets_screen/widget_card_dropdown.dart';
import 'uucw_page.dart';

@RoutePage()
class TCFPage extends StatefulWidget {
  final UseCasePointBloc useCasePointBloc;
  final TCFFormBloc tcfFormBloc;
  const TCFPage(
      {Key? key, required this.tcfFormBloc, required this.useCasePointBloc})
      : super(key: key);
  @override
  _TCFPageState createState() => _TCFPageState();
}

double tcfValue = 0;

class _TCFPageState extends State<TCFPage> {
  final ratting = ['0', '1', '2', '3', '4', '5'].toList();
  int t1 = 0;
  int t2 = 0;
  int t3 = 0;
  int t4 = 0;
  int t5 = 0;
  int t6 = 0;
  int t7 = 0;
  int t8 = 0;
  int t9 = 0;
  int t10 = 0;
  int t11 = 0;
  int t12 = 0;
  int t13 = 0;
  String tcf = '';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return BlocBuilder<UseCasePointBloc, UseCasePointState>(
      bloc: widget.useCasePointBloc,
      builder: (context, state){
        widget.useCasePointBloc.add(EditingHistory(pid: pid));
        if(state is HistorySuccess){
          tcfValue = state.project.tcf.tcf;
          tcf = tcfValue.toString();
          t1 = state.project.tcf.t1;
          t2 = state.project.tcf.t1;
          t3 = state.project.tcf.t1;
          t4 = state.project.tcf.t1;
          t5 = state.project.tcf.t1;
          t5 = state.project.tcf.t1;
          t6 = state.project.tcf.t1;
          t7 = state.project.tcf.t1;
          t8 = state.project.tcf.t1;
          t9 = state.project.tcf.t1;
          t10 = state.project.tcf.t1;
          t11 = state.project.tcf.t1;
          t12 = state.project.tcf.t1;
          t13 = state.project.tcf.t1;

        }
        return BlocProvider(
          create: (context) => widget.tcfFormBloc,
          child: FormBlocListener<TCFFormBloc, String, String>(
            onSubmitting: (context, state) {},
            onSuccess: (context, state) {
              final tcfState = widget.useCasePointBloc.state;
              if (tcfState is UseCasePointStateTCFSuccess) {
                tcfValue = tcfState.tcf;
                setState(() {
                  tcf = tcfValue.toString();
                });
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calculate success')),
              );
            },
            onFailure: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calculate failure')),
              );
            },
            child: Scaffold(
              backgroundColor: const Color(0xFFF5F5F5),
              appBar: AppBar(
                backgroundColor: const Color(0xFF50C2C9),
                automaticallyImplyLeading: false,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Main TCF',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '3/5',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(
                        20,
                      )),
                ),
              ),
              body: Stack(
                children: [
                  const Positioned(
                    top: 0,
                    left: 0,
                    child: TopLeftLayout(),
                  ),
                  Positioned.fill(
                    top: 5,
                    right: 15,
                    left: 15,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                            ),
                            child: SizedBox(
                              height: 60,
                              width: screenWidth - 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'TF Total: TCF = 0.6 +(TF/100)\n TCF = $tcf',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              //T1
                              CustomCard(
                                titleText: 'T1',
                                subtitleText: 'Distributed System',
                                weightText: 'Weight: 2.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[0]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[0]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[0].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[0]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[0]
                                      .updateValue([value ?? '0']);
                                },
                              ),
                              //T2
                              CustomCard(
                                titleText: 'T2',
                                subtitleText:
                                'Response time/performance objectives',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[1]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[1]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[1].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[1]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[1]
                                      .updateValue([value ?? '0']);
                                },
                              ),
                              //T3
                              CustomCard(
                                titleText: 'T3',
                                subtitleText: 'End-user efficiency',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[2]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[2]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[2].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[2]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[2]
                                      .updateValue([value ?? '0']);
                                },
                              ),

                              //T4
                              CustomCard(
                                titleText: 'T4',
                                subtitleText: 'Internal processing complexity',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[3]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[3]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[3].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[3]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[3]
                                      .updateValue([value ?? '0']);
                                },
                              ),

                              //T5
                              CustomCard(
                                titleText: 'T5',
                                subtitleText: 'Code reusability',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[4]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[4]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[4].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[4]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[4]
                                      .updateValue([value ?? '0']);
                                },
                              ),

                              //T6
                              CustomCard(
                                titleText: 'T6',
                                subtitleText: 'Easy to install',
                                weightText: 'Weight: 0.5',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[5]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[5]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[5].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[5]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[5]
                                      .updateValue([value ?? '0']);
                                },
                              ),
                              //T7
                              CustomCard(
                                titleText: 'T7',
                                subtitleText: 'Easy to use',
                                weightText: 'Weight: 0.5',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[6]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[6]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[6].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[6]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[6]
                                      .updateValue([value ?? '0']);
                                },
                              ),

                              //T8
                              CustomCard(
                                titleText: 'T8',
                                subtitleText: 'Portability to other platforms',
                                weightText: 'Weight: 2.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[7]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[7]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[7].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[7]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[7]
                                      .updateValue([value ?? '0']);
                                },
                              ),
                              CustomCard(
                                titleText: 'T9',
                                subtitleText: 'System maintenance',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[8]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[8]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[8].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[8]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[8]
                                      .updateValue([value ?? '0']);
                                },
                              ),
                              CustomCard(
                                titleText: 'T10',
                                subtitleText: 'Concurrent/parallel processing',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[9]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[9]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[9].state
                                    .value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[9]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[9]
                                      .updateValue([value ?? '0']);
                                },
                              ),
                              CustomCard(
                                titleText: 'T11',
                                subtitleText: 'Security features',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[10]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[10]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[10]
                                    .state.value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[10]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[10]
                                      .updateValue([value ?? '0']);
                                },
                              ),
                              CustomCard(
                                titleText: 'T12',
                                subtitleText: 'Access for third parties',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[11]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[11]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[11]
                                    .state.value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[11]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[11]
                                      .updateValue([value ?? '0']);
                                },
                              ),

                              //T13
                              CustomCard(
                                titleText: 'T13',
                                subtitleText: 'End user training',
                                weightText: 'Weight: 1.0',
                                dropdownValue: ratting.contains(widget
                                    .tcfFormBloc
                                    .dropdownFieldBlocs[12]
                                    .state
                                    .value
                                    .isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[12]
                                    .state.value.first
                                    : '0')
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[12]
                                    .state.value.isNotEmpty
                                    ? widget.tcfFormBloc.dropdownFieldBlocs[12]
                                    .state.value.first
                                    : '0'
                                    : ratting.first,
                                dropdownItems: ratting,
                                onDropdownChanged: (value) {
                                  widget.tcfFormBloc.dropdownFieldBlocs[12]
                                      .updateValue([value ?? '0']);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: ButtonWidget(
                            onPressed: widget.tcfFormBloc.submit,
                            title: 'Calculate',
                            backgroundColor: const Color(0xFF50C2C9),
                            textColor: Colors.white,
                            radiusCircular: 24,
                            textSize: 18,
                            sizeButton: Size(screenWidth / 1.3, screenWidth / 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
