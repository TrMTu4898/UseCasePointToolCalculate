import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/use_case_points_ecf.dart';
import '../../../data/models/use_case_points_tcf.dart';
import '../../../data/models/use_case_points_uaw.dart';
import '../../../data/models/use_case_points_uucw.dart';
import '../../../bloc/authentication/authentication_bloc.dart';
import '../../../bloc/use_case_point/use_case_points_bloc.dart';
import '../../../data/models/use_case_points.dart';
import '../../../data/repositories/use_case_point_repository.dart';
import '../../../layout/top_left_layout.dart';
import '../../../router/auto_router.gr.dart';
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
  final AuthenticationBloc authenticationBloc;
  const UCPPage(
      {Key? key,
      required this.useCasePointBloc,
      required this.uucpFormBloc,
      required this.ecfFormBloc,
      required this.tcfFormBloc,
      required this.uawFormBloc,
      required this.authenticationBloc})
      : super(key: key);
  @override
  _UCPPageState createState() => _UCPPageState();
}

class _UCPPageState extends State<UCPPage> {
  final TextEditingController _nameProjectController = TextEditingController();
  final UseCasePointsRepository useCasePointsRepository =
      UseCasePointsRepository();
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
    const double paddingBottom = 5;
    const double paddingTop = 5;
    const double paddingRight = 10;
    const double paddingLeft = 10;
    double textSize = 22;
    final simpleUUCP = widget.uucpFormBloc.simpleUUCWValue;
    final averageUUCP = widget.uucpFormBloc.averageUUCWValue;
    final complexUUCP = widget.uucpFormBloc.complexUUCWValue;
    final simpleActors = widget.uawFormBloc.simpleActorsValue;
    final averageActors = widget.uawFormBloc.averageActorsValue;
    final complexActors = widget.uawFormBloc.complexActorsValue;
    final Map<String, String> dropValuesTCF = widget.tcfFormBloc.getDropValue();
    final Map<String, String> dropValuesECF = widget.tcfFormBloc.getDropValue();

    UseCasePointsUUCW ucpUUCW = UseCasePointsUUCW(
      simple: simpleUUCP,
      average: averageUUCP,
      complex: complexUUCP,
      uucw: uucw,
    );
    UseCasePointsUAW ucpUAW = UseCasePointsUAW(
      simple: simpleActors,
      average: averageActors,
      complex: complexActors,
      uaw: uaw,
    );
    UseCasePointsTCF ucpTCF = UseCasePointsTCF(
      t1: int.parse(dropValuesTCF['dropdown_0']!),
      t2: int.parse(dropValuesTCF['dropdown_1']!),
      t3: int.parse(dropValuesTCF['dropdown_2']!),
      t4: int.parse(dropValuesTCF['dropdown_3']!),
      t5: int.parse(dropValuesTCF['dropdown_4']!),
      t6: int.parse(dropValuesTCF['dropdown_5']!),
      t7: int.parse(dropValuesTCF['dropdown_6']!),
      t8: int.parse(dropValuesTCF['dropdown_7']!),
      t9: int.parse(dropValuesTCF['dropdown_8']!),
      t10: int.parse(dropValuesTCF['dropdown_9']!),
      t11: int.parse(dropValuesTCF['dropdown_10']!),
      t12: int.parse(dropValuesTCF['dropdown_11']!),
      t13: int.parse(dropValuesTCF['dropdown_12']!),
      tcf: tcfValue,
    );

    UseCasePointsECF ucpECF = UseCasePointsECF(
      e1: int.parse(dropValuesECF['dropdown_0']!),
      e2: int.parse(dropValuesECF['dropdown_1']!),
      e3: int.parse(dropValuesECF['dropdown_2']!),
      e4: int.parse(dropValuesECF['dropdown_3']!),
      e5: int.parse(dropValuesECF['dropdown_4']!),
      e6: int.parse(dropValuesECF['dropdown_5']!),
      e7: int.parse(dropValuesECF['dropdown_6']!),
      e8: int.parse(dropValuesECF['dropdown_7']!),
      ecf: ecfValue,
    );
    String uid = '';
    bool isOnPressedSave = false;
    String nameProject = _nameProjectController.text;
    double ucpValue = ucpCalculate(uucw, uaw, tcfValue, ecfValue);
    Project ucpUCP = Project(
      nameProject: nameProject,
      createdProject: DateTime.now(),
      updatedProject: DateTime.now(),
      uucw: ucpUUCW,
      tcf: ucpTCF,
      ecf: ucpECF,
      uaw: ucpUAW,
      ucp: ucpValue,
      uid: uid,
    );
    return BlocProvider(
      create: (context) => widget.authenticationBloc,
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: widget.authenticationBloc,
        builder: (context, state) {
          widget.authenticationBloc.add(CheckLoggedIn());
          if (state is AuthenticationAuthenticated) {
            uid = state.uid.toString();
            isOnPressedSave = true;
          } else if (state is AuthenticationUnauthenticated) {
            isOnPressedSave = false;
          }
          return BlocBuilder<UseCasePointBloc, UseCasePointState>(
            bloc: widget.useCasePointBloc,
            builder: (context, state) {
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
                    Positioned.fill(
                        child: Center(
                            child: Container(
                      width: screenWidth - 30,
                      child: SingleChildScrollView(
                        reverse: true,
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: paddingTop,
                                        bottom: paddingBottom,
                                        right: paddingRight,
                                        left: paddingLeft),
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
                                        top: paddingTop,
                                        bottom: paddingBottom,
                                        right: paddingRight,
                                        left: paddingLeft),
                                    child: Text(
                                      'UCP = (UUCW + UAW) x TCF x ECF',
                                      style: TextStyle(
                                        fontSize: textSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: paddingTop,
                                        bottom: paddingBottom,
                                        right: paddingRight,
                                        left: paddingLeft),
                                    child: Text(
                                      'UCP = ($uucw + $uaw) x $tcfValue x $ecfValue',
                                      style: TextStyle(
                                        fontSize: textSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: paddingTop,
                                        bottom: paddingBottom,
                                        right: paddingRight,
                                        left: paddingLeft),
                                    child: Text(
                                      'UCP = $ucpValue',
                                      style: TextStyle(
                                        fontSize: textSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: paddingTop,
                                        bottom: paddingBottom,
                                        right: paddingRight,
                                        left: paddingLeft),
                                    child: Text(
                                      'Your project contains $ucpValue Use Case Points.',
                                      style: TextStyle(
                                        fontSize: textSize,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: paddingTop,
                                        bottom: paddingBottom,
                                        right: paddingRight,
                                        left: paddingLeft),
                                    child: Text(
                                      'Thank you for using the Use Case Point Calculator Tool!',
                                      style: TextStyle(
                                        fontSize: textSize,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: screenHeight / 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.white,
                              ),
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 0),
                              child: Center(
                                child: TextFormField(
                                  controller: _nameProjectController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter a name project',
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: paddingBottom),
                                    child: ButtonWidget(
                                      onPressed: isOnPressedSave
                                          ? () {
                                              useCasePointsRepository
                                                  .createUseCasePoints(
                                                uid: uid,
                                                ucp: ucpUCP,
                                                uucw: ucpUUCW,
                                                tcf: ucpTCF,
                                                uaw: ucpUAW,
                                                ecf: ucpECF,
                                              );
                                            }
                                          : () {},
                                      backgroundColor: const Color(0xFF50C2C9),
                                      radiusCircular: 14,
                                      sizeButton: Size(
                                          screenWidth / 2.5, screenHeight / 20),
                                      textColor: Colors.white,
                                      textSize: 16,
                                      title: 'Save',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: paddingBottom),
                                    child: ButtonWidget(
                                      onPressed: () {},
                                      backgroundColor: const Color(0xFF50C2C9),
                                      radiusCircular: 14,
                                      sizeButton: Size(
                                          screenWidth / 2.5, screenHeight / 20),
                                      textColor: Colors.white,
                                      textSize: 16,
                                      title: 'Export',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: paddingBottom),
                                    child: ButtonWidget(
                                      onPressed: () {
                                        AutoRouter.of(context).pushAll([
                                          UseCasePointRoute(
                                              authenticationBloc:
                                                  widget.authenticationBloc,
                                              children: [
                                                UUCWRoute(
                                                  useCasePointBloc:
                                                      widget.useCasePointBloc,
                                                  uucwFormBloc:
                                                      widget.uucpFormBloc,
                                                ),
                                                UAWRoute(
                                                  useCasePointBloc:
                                                      widget.useCasePointBloc,
                                                  uawFormBloc:
                                                      widget.uawFormBloc,
                                                ),
                                                TCFRoute(
                                                  useCasePointBloc:
                                                      widget.useCasePointBloc,
                                                  tcfFormBloc:
                                                      widget.tcfFormBloc,
                                                ),
                                                ECFRoute(
                                                  useCasePointBloc:
                                                      widget.useCasePointBloc,
                                                  ecfFormBloc:
                                                      widget.ecfFormBloc,
                                                ),
                                                UCPRoute(
                                                  useCasePointBloc:
                                                      widget.useCasePointBloc,
                                                  uucpFormBloc:
                                                      widget.uucpFormBloc,
                                                  uawFormBloc:
                                                      widget.uawFormBloc,
                                                  tcfFormBloc:
                                                      widget.tcfFormBloc,
                                                  ecfFormBloc:
                                                      widget.ecfFormBloc,
                                                  authenticationBloc:
                                                      widget.authenticationBloc,
                                                ),
                                              ]),
                                        ]);
                                      },
                                      backgroundColor: const Color(0xFF50C2C9),
                                      radiusCircular: 14,
                                      sizeButton: Size(
                                          screenWidth / 2.5, screenHeight / 20),
                                      textColor: Colors.white,
                                      textSize: 16,
                                      title: 'New',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
