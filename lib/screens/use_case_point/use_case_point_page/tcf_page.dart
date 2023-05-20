import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/widgets/button/button_calculate.dart';
import 'package:usecasepointstool/widgets/button/button_widget.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_card_dropdown.dart';

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
  String dropdownValueT1 = '0';
  String dropdownValueT2 = '0';
  String dropdownValueT3 = '0';
  String dropdownValueT4 = '0';
  String dropdownValueT5 = '0';
  String dropdownValueT6 = '0';
  String dropdownValueT7 = '0';
  String dropdownValueT8 = '0';
  String dropdownValueT9 = '0';
  String dropdownValueT10 = '0';
  String dropdownValueT11 = '0';
  String dropdownValueT12 = '0';
  String dropdownValueT13 = '0';
  final ratting = ['0', '1', '2', '3', '4', '5'].toList();
  double t1 = 0;
  double t2 = 0;
  double t3 = 0;
  double t4 = 0;
  double t5 = 0;
  double t6 = 0;
  double t7 = 0;
  double t8 = 0;
  double t9 = 0;
  double t10 = 0;
  double t11 = 0;
  double t12 = 0;
  double t13 = 0;
  String tcf = '';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
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
              Positioned(
                top: 10,
                right: 0,
                left: 0,
                child: Center(
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
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight / 10,
                right: 15,
                width: screenWidth - 30,
                child: Center(
                  child: SizedBox(
                    height: screenHeight / 1.7,
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
                          subtitleText: 'Response time/performance objectives',
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
                            setState(() {
                              dropdownValueT2 = value as String;
                              t2 = double.parse(dropdownValueT2);
                            });
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
                            setState(() {
                              dropdownValueT3 = value as String;
                              t3 = double.parse(dropdownValueT3);
                            });
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
                            setState(() {
                              dropdownValueT4 = value as String;
                              t4 = double.parse(dropdownValueT4);
                            });
                          },
                        ),

                        //T5
                        CustomCard(
                          titleText: 'T5',
                          subtitleText: 'code reusability',
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
                            setState(() {
                              dropdownValueT5 = value as String;
                              t5 = double.parse(dropdownValueT5);
                            });
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
                            setState(() {
                              dropdownValueT6 = value as String;
                              t6 = double.parse(dropdownValueT6);
                            });
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
                            setState(() {
                              dropdownValueT7 = value as String;
                              t7 = double.parse(dropdownValueT7);
                            });
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
                            setState(() {
                              dropdownValueT8 = value as String;
                              t8 = double.parse(dropdownValueT8);
                            });
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
                            setState(() {
                              dropdownValueT9 = value as String;
                              t9 = double.parse(dropdownValueT9);
                            });
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
                            setState(() {
                              dropdownValueT10 = value as String;
                              t10 = double.parse(dropdownValueT10);
                            });
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
                              ? widget.tcfFormBloc.dropdownFieldBlocs[10].state
                                      .value.isNotEmpty
                                  ? widget.tcfFormBloc.dropdownFieldBlocs[10]
                                      .state.value.first
                                  : '0'
                              : ratting.first,
                          dropdownItems: ratting,
                          onDropdownChanged: (value) {
                            widget.tcfFormBloc.dropdownFieldBlocs[10]
                                .updateValue([value ?? '0']);
                            setState(() {
                              dropdownValueT11 = value as String;
                              t11 = double.parse(dropdownValueT11);
                            });
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
                              ? widget.tcfFormBloc.dropdownFieldBlocs[11].state
                                      .value.isNotEmpty
                                  ? widget.tcfFormBloc.dropdownFieldBlocs[11]
                                      .state.value.first
                                  : '0'
                              : ratting.first,
                          dropdownItems: ratting,
                          onDropdownChanged: (value) {
                            widget.tcfFormBloc.dropdownFieldBlocs[11]
                                .updateValue([value ?? '0']);
                            setState(() {
                              dropdownValueT12 = value as String;
                              t12 = double.parse(dropdownValueT12);
                            });
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
                              ? widget.tcfFormBloc.dropdownFieldBlocs[12].state
                                      .value.isNotEmpty
                                  ? widget.tcfFormBloc.dropdownFieldBlocs[12]
                                      .state.value.first
                                  : '0'
                              : ratting.first,
                          dropdownItems: ratting,
                          onDropdownChanged: (value) {
                            widget.tcfFormBloc.dropdownFieldBlocs[12]
                                .updateValue([value ?? '0']);
                            setState(() {
                              dropdownValueT13 = value as String;
                              t13 = double.parse(dropdownValueT13);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight / 1.4,
                right: 0,
                left: 0,
                child: Center(
                  child:  ButtonWidget(
                    onPressed:widget.tcfFormBloc.submit,
                    title: 'Calculate',
                    backgroundColor: const Color(0xFF50C2C9),
                    textColor: Colors.white,
                    radiusCircular: 24,
                    textSize: 18,
                    sizeButton: Size(screenWidth/1.3,screenWidth/8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
