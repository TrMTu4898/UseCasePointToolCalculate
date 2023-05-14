import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/widgets/button/button_calculate.dart';
import 'package:usecasepointstool/widgets/custom_table.dart';

@RoutePage()
class UAWPage extends StatefulWidget {
  const UAWPage({Key? key}) : super(key: key);
  @override
  _UAWPageState createState() => _UAWPageState();
}

class _UAWPageState extends State<UAWPage> {
  final _formBloc = UAWFormBloc(useCasePointBloc: UseCasePointBloc());
  int _simpleActor = 0;
  int _averageActor = 0;
  int _complexActor = 0;
  double uaw = 0;
  final data = [
    ['Actor ', 'Weight', '', 'Number of\nUse case', 'Result'],
    ['Simple', '1', 'X', '', ''],
    ['Average', '2', 'X', '', ''],
    ['Complex', '3', 'X', '', ''],
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
      body: FormBlocListener<UAWFormBloc,String,String>(
        formBloc: _formBloc,
        onSubmitting: (context, state) {
        },
        onSuccess: (context, state) {
          // Show the result of the calculation
          final uawState = _formBloc.useCasePointBloc.state;
          if (uawState is UseCasePointStateUAWSuccess) {
            uaw = uawState.uaw;
            setState(() {
              data[4][4] = uawState.uaw.toString();
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
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFEEEEEE),
              ),
              Positioned(
                  top: screenHeight / 3.5,
                  left: 0,
                  right: 0,
                  child: ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        TextFieldBlocBuilder(
                          textFieldBloc:
                          _formBloc.simpleActors,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter number of Simple Actor',
                              border: OutlineInputBorder(),
                              hintStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                          onChanged: (value) {
                            setState(() {
                              _simpleActor = int.tryParse(value) ?? 0;
                              data[1][3] = _simpleActor.toString();
                            });
                          },
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc:
                          _formBloc.averageActors,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter number of Average Actor',
                              border: OutlineInputBorder(),
                              hintStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                          onChanged: (value) {
                            setState(() {
                              _averageActor = int.tryParse(value) ?? 0;
                              data[2][3] = _averageActor.toString();
                            });
                          },
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc:
                          _formBloc.complexActors,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter number of Complex Actor',
                              border: OutlineInputBorder(),
                              hintStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                          onChanged: (value) {
                            setState(() {
                              _complexActor = int.tryParse(value) ?? 0;
                              data[3][3] = _complexActor.toString();
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
                left: 0,
                right: 0,
                bottom: 0,
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
                            'Main UAW',
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
                            '2/5',
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
                top: screenHeight / 1.6,
                right: -10,
                width: 234,
                height: 218,
                child: Image.asset(
                  'assets/images/image_uaw.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: screenHeight/1.75,
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
      )
    );
  }
}
