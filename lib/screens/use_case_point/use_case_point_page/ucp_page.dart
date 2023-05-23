import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/use_case_point/use_case_points_bloc.dart';
import '../../../layout/top_left_layout.dart';
import 'ecf_page.dart';
import 'tcf_page.dart';
import 'uaw_page.dart';
import 'uucw_page.dart';
import '../../../util/ucp_calculate.dart';
import '../../../widgets/button/button_widget.dart';

@RoutePage()
class UCPPage extends StatefulWidget {
  final UseCasePointBloc useCasePointBloc;
  final UUCWFormBloc uucpFormBloc;
  final UAWFormBloc uawFormBloc;
  final TCFFormBloc tcfFormBloc;
  final ECFFormBloc ecfFormBloc;
  const UCPPage({
    Key? key,
    required this.useCasePointBloc,
    required this.uucpFormBloc,
    required this.ecfFormBloc,
    required this.tcfFormBloc,
    required this.uawFormBloc,
  }) : super(key: key);
  @override
  _UCPPageState createState() => _UCPPageState();
}

class _UCPPageState extends State<UCPPage> {
  final TextEditingController _nameProjectController = TextEditingController();
  final dataUUCP = [
    ['Classify', 'Weight', '', 'Number of\nUse case', 'Result'],
    ['Simple', '5', 'X', '', ''],
    ['Average', '10', 'X', '', ''],
    ['Complex', '15', 'X', '', ''],
    ['', '', '', 'Total', ''],
  ];
  final dataUAW = [
    ['Actor ', 'Weight', '', 'Number of\nUse case', 'Result'],
    ['Simple', '1', 'X', '', ''],
    ['Average', '2', 'X', '', ''],
    ['Complex', '3', 'X', '', ''],
    ['', '', '', 'Total', ''],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    const double paddingBottom = 10;
    const double paddingTop = 10;
    double textSize = 16;
    final simpleUUCP = widget.uucpFormBloc.simpleUUCWValue;
    final averageUUCP = widget.uucpFormBloc.averageUUCWValue;
    final complexUUCP = widget.uucpFormBloc.complexUUCWValue;
    //
    final simpleActors = widget.uawFormBloc.simpleActorsValue;
    final averageActors = widget.uawFormBloc.averageActorsValue;
    final complexActors = widget.uawFormBloc.complexActorsValue;

    return BlocBuilder<UseCasePointBloc, UseCasePointState>(
      bloc: widget.useCasePointBloc,
      builder: (context, state) {
        print(uaw);
        dataUUCP[1][3] = simpleUUCP.toString();
        dataUUCP[2][3] = averageUUCP.toString();
        dataUUCP[3][3] = complexUUCP.toString();

        dataUAW[1][3] = simpleActors.toString();
        dataUAW[2][3] = averageActors.toString();
        dataUAW[3][3] = complexActors.toString();
        double ucp = ucpCalculate(uucw, uaw, tcfValue, ecfValue);
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
                    'Main UCP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '5/5',
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
                top: screenHeight / 10,
                left: 15,
                width: screenWidth - 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: paddingTop, bottom: paddingBottom),
                      child: Text(
                        'The UCP is calculated based on the following formula:',
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: paddingTop, bottom: paddingBottom),
                      child: Text(
                        'UCP = (UUCW + UAW) x TCF x ECF',
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: paddingTop, bottom: paddingBottom),
                      child: Text(
                        'UCP = ($uucw + $uaw) x $tcfValue x $ecfValue',
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: paddingTop, bottom: paddingBottom),
                      child: Text(
                        'UCP = $ucp',
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: paddingTop, bottom: paddingBottom),
                      child: Text(
                        'Your project contains $ucp Use Case Points.',
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: paddingTop, bottom: paddingBottom),
                      child: Text(
                        'Thank you for using the Use Case Point Calculator Tool!',
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: screenHeight/20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(top: 10, bottom: 0),
                      child: Center(
                        child: TextFormField(
                          controller: _nameProjectController,
                          decoration: const InputDecoration(
                            hintText: 'Enter a name project',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: paddingBottom),
                            child: ButtonWidget(
                              onPressed: () {},
                              backgroundColor: Colors.white,
                              radiusCircular: 14,
                              sizeButton:
                                  Size(screenWidth / 2.5, screenHeight / 20),
                              textColor: Colors.black,
                              textSize: 16,
                              title: 'Save',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: paddingBottom),
                            child: ButtonWidget(
                              onPressed: () {},
                              backgroundColor: Colors.white,
                              radiusCircular: 14,
                              sizeButton:
                                  Size(screenWidth / 2.5, screenHeight / 20),
                              textColor: Colors.black,
                              textSize: 16,
                              title: 'New calculate',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
        //   Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(bottom: paddingBottom),
        //       child: Text(uucp.toString()),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(bottom: paddingBottom),
        //       child: Text(uucp.toString()),
        //     ),
        //   ],
        // );
      },
    );
  }
}
