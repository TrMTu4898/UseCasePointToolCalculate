import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/widgets/button/button_calculate.dart';
import 'package:usecasepointstool/widgets/button/button_widget.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_table.dart';

@RoutePage()
class UUCWPage extends StatefulWidget {
  final UseCasePointBloc useCasePointBloc;
  final UUCWFormBloc uucwFormBloc;
  const UUCWPage(
      {Key? key, required this.useCasePointBloc, required this.uucwFormBloc})
      : super(key: key);
  @override
  _UUCWPageState createState() => _UUCWPageState();
}

double uucw = 0;

class _UUCWPageState extends State<UUCWPage> {
  int _simpleUUCW = 0;
  int _averageUUCW = 0;
  int _complexUUCW = 0;
  final data = [
    ['Simple', '5', 'X', '', ''],
    ['Average', '10', 'X', '', ''],
    ['Complex', '15', 'X', '', ''],
    ['', '', '', 'Total', ''],
  ];
  final header = ['Classify', 'Weight', '', 'Number of \nUse Case', 'Result'];
  @override
  void initState() {
    super.initState();
  }

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
                'Main UUCW',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              '1/5',
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
      body: FormBlocListener<UUCWFormBloc, String, String>(
        formBloc: widget.uucwFormBloc,
        onSubmitting: (context, state) {},
        onSuccess: (context, state) {
          // Show the result of the calculation
          final uucwState = widget.useCasePointBloc.state;
          if (uucwState is UseCasePointStateUUCWSuccess) {
            uucw = uucwState.uucw;
            setState(() {
              data[3][4] = uucwState.uucw.toString();
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
                            'Table 1: Calculate UUCW',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                        )),
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
                              top: paddingTextTop, bottom: paddingTextBottom),
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
                                          widget.uucwFormBloc.simpleUUCW,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          hintText:
                                              'Enter number of Simple Use Case',
                                          //border: OutlineInputBorder(),
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        setState(() {
                                          _simpleUUCW =
                                              int.tryParse(value) ?? 0;
                                          data[0][3] = _simpleUUCW.toString();
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
                              top: paddingTextTop, bottom: paddingTextBottom),
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
                                          widget.uucwFormBloc.averageUUCW,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          hintText:
                                              'Enter number of Average Use Case',
                                          // border: OutlineInputBorder(),
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        setState(() {
                                          _averageUUCW =
                                              int.tryParse(value) ?? 0;
                                          data[1][3] = _averageUUCW.toString();
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
                              top: paddingTextTop, bottom: paddingTextBottom),
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
                                          widget.uucwFormBloc.complexUUCW,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          hintText:
                                              'Enter number of Complex Use Case',
                                          //border: OutlineInputBorder(),
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      textInputAction: TextInputAction.done,
                                      onChanged: (value) {
                                        setState(() {
                                          _complexUUCW =
                                              int.tryParse(value) ?? 0;
                                          data[2][3] = _complexUUCW.toString();
                                        });
                                      },
                                      onSubmitted: (value) {
                                        onPressed:
                                        widget.uucwFormBloc.submit();
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
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Center(
                            child: ButtonWidget(
                              onPressed:widget.uucwFormBloc.submit,
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
                ],
              ),
            ),
            Positioned(
              top: screenHeight / 1.55,
              right: 0,
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/images/image_uucp.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
