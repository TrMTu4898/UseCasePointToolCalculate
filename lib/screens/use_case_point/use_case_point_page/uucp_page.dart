import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/widgets/button/button_calculate.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_table.dart';

@RoutePage()
class UUCPPage extends StatefulWidget {
  const UUCPPage({Key? key}) : super(key: key);
  @override
  _UUCPPageState createState() => _UUCPPageState();
}

class _UUCPPageState extends State<UUCPPage> {
  final _formBloc = UUCPFormBloc(useCasePointBloc: UseCasePointBloc());
  int _simpleUUCP = 0;
  int _averageUUCP = 0;
  int _complexUUCP = 0;
  double uucp = 0;
  final data = [
    ['Classify', 'Weight', '', 'Number of\nUse case', 'Result'],
    ['Simple', '5', 'X', '', ''],
    ['Average', '10', 'X', '', ''],
    ['Complex', '15', 'X', '', ''],
    ['', '', '', 'Total', ''],
  ];
  @override
  void dispose() {
    _formBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(
      body: FormBlocListener<UUCPFormBloc, String, String>(
        formBloc: _formBloc,
        onSubmitting: (context, state) {

        },
        onSuccess: (context, state) {
          // Show the result of the calculation
          final uucpState = _formBloc.useCasePointBloc.state;
          if (uucpState is UseCasePointStateUUCPSuccess) {
             uucp = uucpState.uucp;
            setState(() {
              data[4][4] = uucpState.uucp.toString();
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
        child: SafeArea(
          minimum: const EdgeInsets.only(left: 0, right: 0, top: 0),
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFEEEEEE),
              ),
              Positioned(
                  top: screenHeight / 3.5,
                  left: 15,
                  width: screenWidth-30,
                  child: ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        TextFieldBlocBuilder(
                          textFieldBloc:
                          _formBloc.simpleUUCP,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter number of Simple Use Case',
                              border: OutlineInputBorder(),
                              hintStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                          onChanged: (value) {
                            setState(() {
                              _simpleUUCP = int.tryParse(value) ?? 0;
                              data[1][3] = _simpleUUCP.toString();
                            });
                          },
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc:
                          _formBloc.averageUUCP,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter number of Average Use Case',
                              border: OutlineInputBorder(),
                              hintStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                          onChanged: (value) {
                            setState(() {
                              _averageUUCP = int.tryParse(value) ?? 0;
                              data[2][3] = _averageUUCP.toString();
                            });
                          },
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc:
                          _formBloc.complexUUCP,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter number of Complex Use Case',
                              border: OutlineInputBorder(),
                              hintStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                          onChanged: (value) {
                            setState(() {
                              _complexUUCP = int.tryParse(value) ?? 0;
                              data[3][3] = _complexUUCP.toString();
                            });
                          },
                        ),
                      ])),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 0,
                child: const TopLeftLayOut(),
              ),
              Positioned(
                top: screenHeight / 8,
                left: 15,
                width: screenWidth-30,
                child: CustomTable(
                  data: data,
                  hasHeader: false,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset('assets/images/App_bar_without_menu.png'),
                      const Positioned(
                        top: 15,
                        left: 20,
                        child: Center(
                          child: Text(
                            'Main UUCP',
                            style: TextStyle(
                              color: Color(0xFF50C2C9),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 15,
                        right: 20,
                        child: Center(
                          child: Text(
                            '1/5',
                            style: TextStyle(
                              color: Color(0xFF50C2C9),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: screenHeight / 1.5,
                right: 0,
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/image_uucp.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: screenHeight/1.7,
                right: 0,
                left: 0,
                child: Center(
                  child: CalculateButton(
                    onPressed: _formBloc.submit
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



// class UUCPPage extends StatefulWidget {
//   const UUCPPage({Key? key}) : super(key: key);
//   @override
//   _UUCPPageState createState() => _UUCPPageState();
// }
//
// class _UUCPPageState extends State<UUCPPage> {
//   int _simpleUUCP = 0;
//   int _averageUUCP = 0;
//   int _complexUUCP = 0;
//   double uucp = 0;
//   final data = [
//     ['Classify', 'Weight', '', 'Number of\nUse case', 'Result'],
//     ['Simple', '5', 'X', '', ''],
//     ['Average', '10', 'X', '', ''],
//     ['Complex', '15', 'X', '', ''],
//     ['', '', '', 'Total', ''],
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double screenWidth = size.width;
//     final double screenHeight = size.height;
//     return
    //BlocProvider(
    //   create: (context) =>
    //       UseCasePointsFormBloc(useCasePointBloc: UseCasePointBloc()),
    //   child: FormBlocListener<UseCasePointsFormBloc, String, String>(
    //     onSubmitting: (context, state) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Calculating')),
    //       );
    //     },
    //     onSuccess: (context, state) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Calculate success')),
    //       );
    //     },
    //     onFailure: (context, state) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Calculate failure')),
    //       );
    //     },
    //     child: SafeArea(
    //       child: Stack(
    //         children: [
    //           Container(
    //             color: const Color(0xFFEEEEEE),
    //           ),
    //           Positioned(
    //               top: screenHeight / 3.5,
    //               left: 0,
    //               right: 0,
    //               child: ListView(
    //                   shrinkWrap: true,
    //                   physics: const ClampingScrollPhysics(),
    //                   children: [
    //                     TextFieldBlocBuilder(
    //                       textFieldBloc:
    //                           BlocProvider.of<UseCasePointsFormBloc>(context)
    //                               .simpleUUCP,
    //                       keyboardType: TextInputType.number,
    //                       decoration: const InputDecoration(
    //                           hintText: 'Enter number of Simple Use Case',
    //                           border: OutlineInputBorder(),
    //                           hintStyle:
    //                               TextStyle(fontWeight: FontWeight.bold)),
    //                       onChanged: (value) {
    //                         setState(() {
    //                           _simpleUUCP = int.tryParse(value) ?? 0;
    //                           data[1][3] = _simpleUUCP.toString();
    //                         });
    //                       },
    //                     ),
    //                     TextFieldBlocBuilder(
    //                       textFieldBloc:
    //                           BlocProvider.of<UseCasePointsFormBloc>(context)
    //                               .averageUUCP,
    //                       keyboardType: TextInputType.number,
    //                       decoration: const InputDecoration(
    //                           hintText: 'Enter number of Average Use Case',
    //                           border: OutlineInputBorder(),
    //                           hintStyle:
    //                               TextStyle(fontWeight: FontWeight.bold)),
    //                       onChanged: (value) {
    //                         setState(() {
    //                           debugPrint('movieTitle: ');
    //                           _averageUUCP = int.tryParse(value) ?? 0;
    //                           data[2][3] = _averageUUCP.toString();
    //                         });
    //                       },
    //                     ),
    //                     TextFieldBlocBuilder(
    //                       textFieldBloc:
    //                           BlocProvider.of<UseCasePointsFormBloc>(context)
    //                               .complexUUCP,
    //                       keyboardType: TextInputType.number,
    //                       decoration: const InputDecoration(
    //                           hintText: 'Enter number of Complex Use Case',
    //                           border: OutlineInputBorder(),
    //                           hintStyle:
    //                               TextStyle(fontWeight: FontWeight.bold)),
    //                       onChanged: (value) {
    //                         setState(() {
    //                           _complexUUCP = int.tryParse(value) ?? 0;
    //                           data[3][3] = _complexUUCP.toString();
    //                         });
    //                       },
    //                     ),
    //                   ])),
    //           Positioned(
    //             top: MediaQuery.of(context).padding.top,
    //             left: 0,
    //             child: const TopLeftLayOut(),
    //           ),
    //           Positioned(
    //             top: screenHeight / 8,
    //             left: 0,
    //             right: 0,
    //             bottom: 0,
    //             child: CustomTable(
    //               data: data,
    //               hasHeader: false,
    //             ),
    //           ),
    //           Positioned(
    //             top: MediaQuery.of(context).padding.top + 20,
    //             left: 0,
    //             right: 0,
    //             child: Center(
    //               child: Stack(
    //                 children: [
    //                   Image.asset('assets/images/App_bar_without_menu.png'),
    //                   const Positioned(
    //                     top: 15,
    //                     left: 20,
    //                     child: Center(
    //                       child: Text(
    //                         'Main UUCP',
    //                         style: TextStyle(
    //                           color: Color(0xFF50C2C9),
    //                           fontSize: 24,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   const Positioned(
    //                     top: 15,
    //                     right: 20,
    //                     child: Center(
    //                       child: Text(
    //                         '1/5',
    //                         style: TextStyle(
    //                           color: Color(0xFF50C2C9),
    //                           fontSize: 24,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: screenHeight / 1.5,
    //             right: 0,
    //             width: 150,
    //             height: 150,
    //             child: Image.asset(
    //               'assets/images/image_uucp.png',
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //           Positioned(
    //             top: screenHeight / 1.75,
    //             right: 0,
    //             left: 0,
    //             child: Builder(
    //               builder: (context) => Center(
    //                 child: CalculateButton(
    //                   onPressed: () {
    //                     context.read<UseCasePointsFormBloc>().submit();
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
//   }
// }
