import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/use_case_point/use_case_points_bloc.dart';
import '../../router/auto_router.gr.dart';

import '../../bloc/my_app_bloc.dart';

@RoutePage()
class UseCasePointScreen extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  const UseCasePointScreen({Key? key, required this.authenticationBloc}) : super(key: key);
  @override
  _UseCasePointScreenState createState() => _UseCasePointScreenState();
}

class _UseCasePointScreenState extends State<UseCasePointScreen> {
  @override
  Widget build(BuildContext context) {
    final myAppBlocData = MyAppBlocProvider.of(context);
    final UseCasePointBloc useCasePointBloc = myAppBlocData.myAppBloc.useCasePointBloc;
    final UUCWFormBloc uucpFormBloc = UUCWFormBloc(useCasePointBloc: useCasePointBloc);
    final UAWFormBloc uawFormBloc = UAWFormBloc(useCasePointBloc: useCasePointBloc);
    final TCFFormBloc tcfFormBloc = TCFFormBloc(useCasePointBloc: useCasePointBloc);
    final ECFFormBloc ecfFormBloc = ECFFormBloc(useCasePointBloc: useCasePointBloc);

    return AutoTabsRouter.pageView(
      routes: [
        UUCWRoute(
          useCasePointBloc: useCasePointBloc,
          uucwFormBloc: uucpFormBloc,
        ),
        UAWRoute(
          useCasePointBloc: useCasePointBloc,
          uawFormBloc: uawFormBloc,
        ),
        TCFRoute(
          useCasePointBloc: useCasePointBloc,
          tcfFormBloc: tcfFormBloc,
        ),
        ECFRoute(
          useCasePointBloc: useCasePointBloc,
          ecfFormBloc: ecfFormBloc,
        ),
        UCPRoute(
          useCasePointBloc: useCasePointBloc,
          uucpFormBloc: uucpFormBloc,
          uawFormBloc: uawFormBloc,
          tcfFormBloc: tcfFormBloc,
          ecfFormBloc: ecfFormBloc,
          authenticationBloc: widget.authenticationBloc,
        ),
      ],
    );
  }
}
