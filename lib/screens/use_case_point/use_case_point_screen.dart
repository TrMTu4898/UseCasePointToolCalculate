import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';

@RoutePage()
class UseCasePointScreen extends StatefulWidget {
  const UseCasePointScreen({Key? key}) : super(key: key);
  @override
  _UseCasePointScreenState createState() => _UseCasePointScreenState();
}

class _UseCasePointScreenState extends State<UseCasePointScreen> {
  @override
  Widget build(BuildContext context) {
    final UseCasePointBloc useCasePointBloc = UseCasePointBloc();
    final UUCWFormBloc uucpFormBloc =
        UUCWFormBloc(useCasePointBloc: useCasePointBloc);
    final UAWFormBloc uawFormBloc =
        UAWFormBloc(useCasePointBloc: useCasePointBloc);
    final TCFFormBloc tcfFormBloc =
        TCFFormBloc(useCasePointBloc: useCasePointBloc);
    final ECFFormBloc ecfFormBloc =
        ECFFormBloc(useCasePointBloc: useCasePointBloc);

    return AutoTabsRouter.pageView(
      routes: [
        UUCWRoute(
            useCasePointBloc: useCasePointBloc, uucwFormBloc: uucpFormBloc),
        UAWRoute(useCasePointBloc: useCasePointBloc, uawFormBloc: uawFormBloc),
        TCFRoute(useCasePointBloc: useCasePointBloc, tcfFormBloc: tcfFormBloc),
        ECFRoute(useCasePointBloc: useCasePointBloc, ecfFormBloc: ecfFormBloc),
        UCPRoute(
          useCasePointBloc: useCasePointBloc,
          uucpFormBloc: uucpFormBloc,
          uawFormBloc: uawFormBloc,
          tcfFormBloc: tcfFormBloc,
          ecfFormBloc: ecfFormBloc,
        ),
      ],
    );
  }
}
