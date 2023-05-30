import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../bloc/use_case_point/use_case_points_bloc.dart';
import '../../../layout/top_left_layout.dart';
import '../../../widgets/button/button_widget.dart';
import '../../../widgets/widgets_screen/widget_card_dropdown.dart';

@RoutePage()
class ECFPage extends StatefulWidget {
  final UseCasePointBloc useCasePointBloc;
  final ECFFormBloc ecfFormBloc;
  const ECFPage(
      {Key? key, required this.useCasePointBloc, required this.ecfFormBloc})
      : super(key: key);
  @override
  _ECFPageState createState() => _ECFPageState();
}

double ecfValue = 0;

class _ECFPageState extends State<ECFPage> {
  final ratting = ['0', '1', '2', '3', '4', '5'].toList();
  String ecf = '';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return BlocProvider(
      create: (context) => widget.ecfFormBloc,
      child: FormBlocListener<ECFFormBloc, String, String>(
        onSubmitting: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Calculating')),
          );
        },
        onSuccess: (context, state) {
          final ecfState = widget.useCasePointBloc.state;
          if (ecfState is UseCasePointStateECFSuccess) {
            ecfValue = ecfState.ecf;
            setState(() {
              ecf = ecfValue.toString();
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
                    'Main ECF',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '4/5',
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
                                'EF Total: ECF = 1.4 +(-0.03 x EF)\nECF = $ecf',
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
                            titleText: 'E1',
                            subtitleText:
                                'Familiarity with development process used',
                            weightText: 'Weight: 1.5',
                            dropdownValue: ratting.contains(widget
                                        .ecfFormBloc
                                        .dropdownFieldBlocs[0]
                                        .state
                                        .value
                                        .isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[0]
                                        .state.value.first
                                    : '0')
                                ? widget.ecfFormBloc.dropdownFieldBlocs[0].state
                                        .value.isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[0]
                                        .state.value.first
                                    : '0'
                                : ratting.first,
                            dropdownItems: ratting,
                            onDropdownChanged: (value) {
                              widget.ecfFormBloc.dropdownFieldBlocs[0]
                                  .updateValue([value ?? '0']);
                            },
                          ),
                          //E2
                          CustomCard(
                            titleText: 'E2',
                            subtitleText: 'Application experience',
                            weightText: 'Weight: 0.5',
                            dropdownValue: ratting.contains(widget
                                        .ecfFormBloc
                                        .dropdownFieldBlocs[1]
                                        .state
                                        .value
                                        .isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[1]
                                        .state.value.first
                                    : '0')
                                ? widget.ecfFormBloc.dropdownFieldBlocs[1].state
                                        .value.isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[1]
                                        .state.value.first
                                    : '0'
                                : ratting.first,
                            dropdownItems: ratting,
                            onDropdownChanged: (value) {
                              widget.ecfFormBloc.dropdownFieldBlocs[1]
                                  .updateValue([value ?? '0']);
                            },
                          ),
                          //E3
                          CustomCard(
                            titleText: 'E3',
                            subtitleText: 'Object-oriented experience of team',
                            weightText: 'Weight: 1.0',
                            dropdownValue: ratting.contains(widget
                                        .ecfFormBloc
                                        .dropdownFieldBlocs[2]
                                        .state
                                        .value
                                        .isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[2]
                                        .state.value.first
                                    : '0')
                                ? widget.ecfFormBloc.dropdownFieldBlocs[2].state
                                        .value.isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[2]
                                        .state.value.first
                                    : '0'
                                : ratting.first,
                            dropdownItems: ratting,
                            onDropdownChanged: (value) {
                              widget.ecfFormBloc.dropdownFieldBlocs[2]
                                  .updateValue([value ?? '0']);
                            },
                          ),

                          //E4
                          CustomCard(
                            titleText: 'E4',
                            subtitleText: 'Lead analyst capability',
                            weightText: 'Weight: 0.5',
                            dropdownValue: ratting.contains(widget
                                        .ecfFormBloc
                                        .dropdownFieldBlocs[3]
                                        .state
                                        .value
                                        .isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[3]
                                        .state.value.first
                                    : '0')
                                ? widget.ecfFormBloc.dropdownFieldBlocs[3].state
                                        .value.isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[3]
                                        .state.value.first
                                    : '0'
                                : ratting.first,
                            dropdownItems: ratting,
                            onDropdownChanged: (value) {
                              widget.ecfFormBloc.dropdownFieldBlocs[3]
                                  .updateValue([value ?? '0']);
                            },
                          ),

                          //E5
                          CustomCard(
                            titleText: 'E5',
                            subtitleText: 'Motivation of the team',
                            weightText: 'Weight: 1.0',
                            dropdownValue: ratting.contains(widget
                                        .ecfFormBloc
                                        .dropdownFieldBlocs[4]
                                        .state
                                        .value
                                        .isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[4]
                                        .state.value.first
                                    : '0')
                                ? widget.ecfFormBloc.dropdownFieldBlocs[4].state
                                        .value.isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[4]
                                        .state.value.first
                                    : '0'
                                : ratting.first,
                            dropdownItems: ratting,
                            onDropdownChanged: (value) {
                              widget.ecfFormBloc.dropdownFieldBlocs[4]
                                  .updateValue([value ?? '0']);
                            },
                          ),

                          //E6
                          CustomCard(
                            titleText: 'E6',
                            subtitleText: 'Stability of requirements',
                            weightText: 'Weight: 2.0',
                            dropdownValue: ratting.contains(widget
                                        .ecfFormBloc
                                        .dropdownFieldBlocs[5]
                                        .state
                                        .value
                                        .isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[5]
                                        .state.value.first
                                    : '0')
                                ? widget.ecfFormBloc.dropdownFieldBlocs[5].state
                                        .value.isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[5]
                                        .state.value.first
                                    : '0'
                                : ratting.first,
                            dropdownItems: ratting,
                            onDropdownChanged: (value) {
                              widget.ecfFormBloc.dropdownFieldBlocs[5]
                                  .updateValue([value ?? '0']);
                            },
                          ),
                          //E7
                          CustomCard(
                            titleText: 'E7',
                            subtitleText: 'Part-time staff',
                            weightText: 'Weight: -1.0',
                            dropdownValue: ratting.contains(widget
                                        .ecfFormBloc
                                        .dropdownFieldBlocs[6]
                                        .state
                                        .value
                                        .isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[6]
                                        .state.value.first
                                    : '0')
                                ? widget.ecfFormBloc.dropdownFieldBlocs[6].state
                                        .value.isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[6]
                                        .state.value.first
                                    : '0'
                                : ratting.first,
                            dropdownItems: ratting,
                            onDropdownChanged: (value) {
                              widget.ecfFormBloc.dropdownFieldBlocs[6]
                                  .updateValue([value ?? '0']);
                            },
                          ),

                          //E8
                          CustomCard(
                            titleText: 'E8',
                            subtitleText: 'Difficult programming language',
                            weightText: 'Weight: -1.0',
                            dropdownValue: ratting.contains(widget
                                        .ecfFormBloc
                                        .dropdownFieldBlocs[7]
                                        .state
                                        .value
                                        .isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[7]
                                        .state.value.first
                                    : '0')
                                ? widget.ecfFormBloc.dropdownFieldBlocs[7].state
                                        .value.isNotEmpty
                                    ? widget.ecfFormBloc.dropdownFieldBlocs[7]
                                        .state.value.first
                                    : '0'
                                : ratting.first,
                            dropdownItems: ratting,
                            onDropdownChanged: (value) {
                              widget.ecfFormBloc.dropdownFieldBlocs[7]
                                  .updateValue([value ?? '0']);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ButtonWidget(
                        onPressed: widget.ecfFormBloc.submit,
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
  }
}
