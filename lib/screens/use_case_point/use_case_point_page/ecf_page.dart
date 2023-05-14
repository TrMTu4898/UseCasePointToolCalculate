import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/widgets/button/button_calculate.dart';
import 'package:usecasepointstool/widgets/custom_card.dart';

@RoutePage()
class ECFPage extends StatefulWidget{
  const ECFPage({Key ? key}) : super(key: key);
  @override
  _ECFPageState createState() => _ECFPageState();
}

class _ECFPageState extends State<ECFPage> {
  String dropdownValueE1 = '0';
  String dropdownValueE2 = '0';
  String dropdownValueE3 = '0';
  String dropdownValueE4 = '0';
  String dropdownValueE5 = '0';
  String dropdownValueE6 = '0';
  String dropdownValueE7 = '0';
  String dropdownValueE8 = '0';

  final ratting =  ['0', '1', '2', '3', '4', '5'];
  double e1=0;
  double e2=0;
  double e3=0;
  double e4=0;
  double e5=0;
  double e6=0;
  double e7=0;
  double e8=0;
  double ecfValue = 0;
  String ecf = '';
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
                            'Main ECF',
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
                            '4/5',
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
                        //E1
                        CustomCard(
                          titleText: 'E1',
                          subtitleText: 'Familiarity with development process used',
                          weightText: 'Weight: 1.5',
                          dropdownValue: dropdownValueE1,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueE1 = value as String;
                              e1 = double.parse(dropdownValueE1);
                            });
                          },
                        ),
                        //E2
                        CustomCard(
                          titleText: 'E2',
                          subtitleText: 'Application experience',
                          weightText: 'Weight: 0.5',
                          dropdownValue: dropdownValueE2,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueE2 = value as String;
                              e2 = double.parse(dropdownValueE2);
                            });
                          },
                        ),
                        //E3
                        CustomCard(
                          titleText: 'E3',
                          subtitleText: 'Object-oriented experience of team',
                          weightText: 'Weight: 1.0',
                          dropdownValue: dropdownValueE3,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueE3 = value as String;
                              e3 = double.parse(dropdownValueE3);
                            });
                          },
                        ),

                        //E4
                        CustomCard(
                          titleText: 'E4',
                          subtitleText: 'Lead analyst capability',
                          weightText: 'Weight: 0.5',
                          dropdownValue: dropdownValueE4,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueE4 = value as String;
                              e4 = double.parse(dropdownValueE4);
                            });
                          },
                        ),

                        //E5
                        CustomCard(
                          titleText: 'E5',
                          subtitleText: 'Motivation of the team',
                          weightText: 'Weight: 1.0',
                          dropdownValue: dropdownValueE5,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueE5 = value as String;
                              e5 = double.parse(dropdownValueE5);
                            });
                          },
                        ),

                        //E6
                        CustomCard(
                          titleText: 'E6',
                          subtitleText: 'Stability of requirements',
                          weightText: 'Weight: 2.0',
                          dropdownValue: dropdownValueE6,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueE6 = value as String;
                              e6 = double.parse(dropdownValueE6);
                            });
                          },
                        ),
                        //E7
                        CustomCard(
                          titleText: 'E7',
                          subtitleText: 'Part-time staff',
                          weightText: 'Weight: -1.0',
                          dropdownValue: dropdownValueE7,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueE7 = value as String;
                              e7 = double.parse(dropdownValueE7);
                            });
                          },
                        ),

                        //E8
                        CustomCard(
                          titleText: 'E8',
                          subtitleText: 'Difficult programming language',
                          weightText: 'Weight: -1.0',
                          dropdownValue: dropdownValueE8,
                          dropdownItems:ratting ,
                          onDropdownChanged: (value) {
                            setState(() {
                              dropdownValueE8 = value as String;
                              e8 = double.parse(dropdownValueE8);
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
                        ecf = ecf.toString();
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
                            'EF Total: ECF = 1.4 +(-0.03 x EF) \nECF = $ecf',
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
