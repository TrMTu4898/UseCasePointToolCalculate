import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/widgets/button/button_calculate.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_card_dropdown.dart';

@RoutePage()
class TCFPage extends StatefulWidget {
  const TCFPage({Key? key}) : super(key: key);
  @override
  _TCFPageState createState() => _TCFPageState();
}

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
  final ratting =  ['0', '1', '2', '3', '4', '5'];
   double t1=0;
   double t2=0;
   double t3=0;
   double t4=0;
   double t5=0;
   double t6=0;
   double t7=0;
   double t8=0;
   double t9=0;
   double t10=0;
   double t11=0;
   double t12=0;
   double t13=0;
  double tcfValue = 0;
  String tcf = '';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return BlocProvider(
      create: (context) =>
          UUCPFormBloc(useCasePointBloc: UseCasePointBloc()),
      child: FormBlocListener<UUCPFormBloc, String, String>(
        onSubmitting: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Calculating')),
          );
        },
        onSuccess: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Calculate success')),
          );
        },
        onFailure: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Calculate failure')),
          );
        },
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFEEEEEE),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 0,
                child: const TopLeftLayOut(),
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
                            'Main TCF',
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
                            '3/5',
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
                top: screenHeight/10,
                right: 15,
                height: 400,
                width: screenWidth-30,
                child: Center(
                  child: SizedBox(
                    height: 500,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        //T1
                        CustomCard(
                          titleText: 'T1',
                          subtitleText: 'Distributed System',
                          weightText: 'Weight: 2.0',
                          dropdownValue: dropdownValueT1,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueT1 = value as String;
                              t1 = double.parse(dropdownValueT1);
                            });
                          },
                        ),
                        //T2
                        CustomCard(
                          titleText: 'T2',
                          subtitleText: 'Response time/performance objectives',
                          weightText: 'Weight: 1.0',
                          dropdownValue: dropdownValueT2,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT3,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT4,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueT4 = value as String;
                              t4 = double.parse(dropdownValueT4);
                            });
                          },
                        ),

                        //T5
                        CustomCard(
                          titleText: 'T5',
                          subtitleText: 'Code reusability',
                          weightText: 'Weight: 1.0',
                          dropdownValue: dropdownValueT5,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT6,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT7,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT8,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT9,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT10,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT11,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT12,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                          dropdownValue: dropdownValueT13,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
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
                top: screenHeight/1.4,
                right: 0,
                left: 0,
                child: Center(
                  child: CalculateButton(
                    onPressed: (){
                      context.read<UUCPFormBloc>().submit();
                      setState(() {
                        tcf = tcf.toString();
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                top:screenHeight/1.75,
                right: 0,
                left: 0,
                child: Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan,
                    ),
                    child: SizedBox(
                      height: 80,
                      width: screenWidth-30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          Text(
                            'TF Total:TCF = 0.6 +(TF/100)\n TCF = $tcf',
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
