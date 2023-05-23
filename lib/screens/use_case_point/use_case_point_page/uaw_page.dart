import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/widgets/button/button_calculate.dart';
import 'package:usecasepointstool/widgets/button/button_widget.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_table.dart';

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
  double paddingTextTop = 10.0;
  double paddingTextBottom = 10.0;

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
        body: FormBlocListener<UAWFormBloc, String, String>(
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
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
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
                      SafeArea(
                        minimum:
                            const EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: paddingTextTop,
                                  bottom: paddingTextBottom),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: colorTextField, // Màu nền
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextFieldBlocBuilder(
                                          textFieldBloc:
                                              widget.uawFormBloc.simpleActors,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            hintText:
                                                'Enter number of Simple Actors',
                                            //border: OutlineInputBorder(),
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            setState(() {
                                              _simpleActor =
                                                  int.tryParse(value) ?? 0;
                                              data[0][3] =
                                                  _simpleActor.toString();
                                            });
                                          },
                                          onSubmitted: (value) {
                                            // Xử lý khi nhấn nút "OK"
                                            // Chuyển đến TextFieldBlocBuilder tiếp theo

                                            FocusScope.of(context)
                                                .requestFocus(nodeTwo);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: paddingTextTop,
                                  bottom: paddingTextBottom),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: colorTextField,
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextFieldBlocBuilder(
                                          focusNode: nodeTwo,
                                          textFieldBloc:
                                              widget.uawFormBloc.averageActors,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            hintText:
                                                'Enter number of Average Actors',
                                            // border: OutlineInputBorder(),
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            setState(() {
                                              _averageActor =
                                                  int.tryParse(value) ?? 0;
                                              data[1][3] =
                                                  _averageActor.toString();
                                            });
                                          },
                                          onSubmitted: (value) {
                                            // Xử lý khi nhấn nút "OK"
                                            // Chuyển đến TextFieldBlocBuilder tiếp theo

                                            FocusScope.of(context)
                                                .requestFocus(nodeThree);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: paddingTextTop,
                                  bottom: paddingTextBottom),
                              child: Container(
                                  //width: screenWidth - 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: colorTextField,
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextFieldBlocBuilder(
                                          focusNode: nodeThree,
                                          textFieldBloc:
                                              widget.uawFormBloc.complexActors,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            hintText:
                                                'Enter number of Complex Actors',
                                            //border: OutlineInputBorder(),
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          textInputAction: TextInputAction.done,
                                          onChanged: (value) {
                                            setState(() {
                                              _complexActor =
                                                  int.tryParse(value) ?? 0;
                                              data[2][3] =
                                                  _complexActor.toString();
                                            });
                                          },
                                          onSubmitted: (value) {
                                            onPressed:
                                            widget.uawFormBloc.submit();
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
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
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: screenHeight / 1.7,
                  right: -10,
                  width: 234,
                  height: 218,
                  child: Image.asset(
                    'assets/images/image_uaw.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )));
    //       SafeArea(
    //         child: Stack(
    //           children: [
    //             Positioned(
    //                 top: screenHeight / 3.5,
    //                 left: 15,
    //                 width: screenWidth - 30,
    //                 child: ListView(
    //                     shrinkWrap: true,
    //                     physics: const ClampingScrollPhysics(),
    //                     children: [
    //                       TextFieldBlocBuilder(
    //                         textFieldBloc: widget.uawFormBloc.simpleActors,
    //                         keyboardType: TextInputType.number,
    //                         decoration: const InputDecoration(
    //                             hintText: 'Enter number of Simple Actor',
    //                             border: OutlineInputBorder(),
    //                             hintStyle:
    //                                 TextStyle(fontWeight: FontWeight.bold)),
    //                         onChanged: (value) {
    //                           setState(() {
    //                             _simpleActor = int.tryParse(value) ?? 0;
    //                             data[1][3] = _simpleActor.toString();
    //                           });
    //                         },
    //                       ),
    //                       TextFieldBlocBuilder(
    //                         textFieldBloc: widget.uawFormBloc.averageActors,
    //                         keyboardType: TextInputType.number,
    //                         decoration: const InputDecoration(
    //                             hintText: 'Enter number of Average Actor',
    //                             border: OutlineInputBorder(),
    //                             hintStyle:
    //                                 TextStyle(fontWeight: FontWeight.bold)),
    //                         onChanged: (value) {
    //                           setState(() {
    //                             _averageActor = int.tryParse(value) ?? 0;
    //                             data[2][3] = _averageActor.toString();
    //                           });
    //                         },
    //                       ),
    //                       TextFieldBlocBuilder(
    //                         textFieldBloc: widget.uawFormBloc.complexActors,
    //                         keyboardType: TextInputType.number,
    //                         decoration: const InputDecoration(
    //                             hintText: 'Enter number of Complex Actor',
    //                             border: OutlineInputBorder(),
    //                             hintStyle:
    //                                 TextStyle(fontWeight: FontWeight.bold)),
    //                         onChanged: (value) {
    //                           setState(() {
    //                             _complexActor = int.tryParse(value) ?? 0;
    //                             data[3][3] = _complexActor.toString();
    //                           });
    //                         },
    //                       ),
    //                     ])),
    //             Positioned(
    //               top: MediaQuery.of(context).padding.top,
    //               left: 0,
    //               child: const TopLeftLayout(),
    //             ),
    //             Positioned(
    //               top: screenHeight / 8,
    //               left: 15,
    //               width: screenWidth - 30,
    //               child: WidgetTable(
    //                 data: data,
    //                 header: header,
    //               ),
    //             ),
    //             Positioned(
    //               top: MediaQuery.of(context).padding.top + 20,
    //               left: 0,
    //               right: 0,
    //               child: Center(
    //                 child: Stack(
    //                   children: [
    //                     Image.asset('assets/images/App_bar_without_menu.png'),
    //                     const Positioned(
    //                       top: 15,
    //                       left: 20,
    //                       child: Center(
    //                         child: Text(
    //                           'Main UAW',
    //                           style: TextStyle(
    //                             color: Color(0xFF50C2C9),
    //                             fontSize: 24,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     const Positioned(
    //                       top: 15,
    //                       right: 20,
    //                       child: Center(
    //                         child: Text(
    //                           '2/5',
    //                           style: TextStyle(
    //                             color: Color(0xFF50C2C9),
    //                             fontSize: 24,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               top: screenHeight / 1.6,
    //               right: -10,
    //               width: 234,
    //               height: 218,
    //               child: Image.asset(
    //                 'assets/images/image_uaw.png',
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             Positioned(
    //               top: screenHeight / 1.75,
    //               right: 0,
    //               left: 0,
    //               child: Center(
    //                 child:
    //                     CalculateButton(onPressed: widget.uawFormBloc.submit),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    // );
  }
}
