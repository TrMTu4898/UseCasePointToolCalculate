import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/widgets/button/button_calculate.dart';
import 'package:usecasepointstool/widgets/button/button_widget.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_table.dart';

import '../../../data/models/use_case_points_uaw.dart';
import '../../../widgets/text/text_field_bloc_builder.dart';
import 'uucw_page.dart';

@RoutePage()
class UAWPage extends StatefulWidget {
  final UseCasePointBloc useCasePointBloc;
  final UAWFormBloc uawFormBloc;
  const UAWPage(
      {Key? key, required this.uawFormBloc, required this.useCasePointBloc})
      : super(key: key);
  @override
  _UAWPageState createState() => _UAWPageState();
}

double uaw = 0;

class _UAWPageState extends State<UAWPage> {
  int _simpleActor = 0;
  int _averageActor = 0;
  int _complexActor = 0;

  final data = [
    ['Simple', '1', 'X', '', ''],
    ['Average', '2', 'X', '', ''],
    ['Complex', '3', 'X', '', ''],
    ['', '', '', 'Total', ''],
  ];

  final header = ['Actor ', 'Weight', '', 'Number of \nUse Cases', 'Result'];
  @override
  void dispose() {
    super.dispose();
  }

  final FocusNode nodeOne = FocusNode();
  final FocusNode nodeTwo = FocusNode();
  final FocusNode nodeThree = FocusNode();
  double paddingTextTop = 5;
  double paddingTextBottom = 5;
  double paddingTextLeft = 15;
  double paddingTextRight = 15;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    const Color colorTextField = Color(0xFFFFFFFF);

    return Scaffold(
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
                'Main UAW',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              '2/5',
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
      body: BlocBuilder<UseCasePointBloc, UseCasePointState>(
        bloc: widget.useCasePointBloc,
        builder: (context, state){
          widget.useCasePointBloc.add(EditingHistory(pid: pid));
          if(state is HistorySuccess){
            UseCasePointsUAW useCasePointsUAW = UseCasePointsUAW(
              simple: state.project.uaw.simple,
              complex: state.project.uaw.complex,
              average: state.project.uaw.average,
              uaw: state.project.uaw.uaw,
            );
            _simpleActor = useCasePointsUAW.simple;
            _averageActor = useCasePointsUAW.average;
            _complexActor = useCasePointsUAW.complex;
            uaw = useCasePointsUAW.uaw;
            data[0][3] = _simpleActor.toString();
            data[1][3] = _averageActor.toString();
            data[2][3] = _complexActor.toString();
            data[3][4] = uaw.toString();
          }
          return FormBlocListener<UAWFormBloc, String, String>(
            formBloc: widget.uawFormBloc,
            onSubmitting: (context, state) {},
            onSuccess: (context, state) {
              // Show the result of the calculation
              final uawState = widget.useCasePointBloc.state;
              if (uawState is UseCasePointStateUAWSuccess) {
                uaw = uawState.uaw;
                setState(() {
                  data[3][4] = uawState.uaw.toString();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Calculate success')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Calculate failure')),
                );
              }
            },
            onFailure: (context, state) {
              // Show an error message if the form fails to submit
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calculate failure')),
              );
            },
            child: Stack(
              children: [
                const Positioned(
                  top: 0,
                  left: 0,
                  child: TopLeftLayout(),
                ),
                Positioned.fill(
                  child: Center(
                    child: SingleChildScrollView(
                      reverse: true,
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Container(
                              width: screenWidth - 30,
                              child: WidgetTable(
                                data: data,
                                header: header,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              width: screenWidth - 30,
                              child: const Center(
                                child: Text(
                                  'Table 2: Calculate UAW',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: paddingTextTop,
                                bottom: paddingTextBottom,
                                left: paddingTextLeft,
                                right: paddingTextRight),
                            child: WidgetTextFieldBloc(
                              prefixIcon: null,
                              onSubmitted: (value) {
                                FocusScope.of(context).requestFocus(nodeTwo);
                              },
                              onChange: (value) {
                                setState(() {
                                  _simpleActor = int.tryParse(value) ?? 0;
                                  data[0][3] = _simpleActor.toString();
                                });
                              },
                              hintText: 'Enter number of Simple Use Case',
                              focusNode: null,
                              textFieldBloc: widget.uawFormBloc.simpleActors,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: paddingTextTop,
                                bottom: paddingTextBottom,
                                left: paddingTextLeft,
                                right: paddingTextRight),
                            child: WidgetTextFieldBloc(
                              prefixIcon: null,
                              onSubmitted: (value) {
                                FocusScope.of(context).requestFocus(nodeThree);
                              },
                              onChange: (value) {
                                setState(() {
                                  _averageActor = int.tryParse(value) ?? 0;
                                  data[1][3] = _averageActor.toString();
                                });
                              },
                              hintText: 'Enter number of Average Use Case',
                              focusNode: nodeTwo,
                              textFieldBloc: widget.uawFormBloc.averageActors,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: paddingTextTop,
                                bottom: paddingTextBottom,
                                left: paddingTextLeft,
                                right: paddingTextRight),
                            child: WidgetTextFieldBloc(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              textFieldBloc: widget.uawFormBloc.complexActors,
                              focusNode: nodeThree,
                              hintText: 'Enter number of Complex Use Case',
                              onChange: (value) {
                                setState(() {
                                  _complexActor = int.tryParse(value) ?? 0;
                                  data[2][3] = _complexActor.toString();
                                });
                              },
                              onSubmitted: (value) {
                                onPressed:
                                widget.uawFormBloc.submit();
                              },
                              prefixIcon: null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 0),
                            child: Center(
                              child: ButtonWidget(
                                onPressed: widget.uawFormBloc.submit,
                                title: 'Calculate',
                                backgroundColor: const Color(0xFF50C2C9),
                                textColor: Colors.white,
                                radiusCircular: 24,
                                textSize: 18,
                                sizeButton:
                                Size(screenWidth / 1.3, screenWidth / 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
