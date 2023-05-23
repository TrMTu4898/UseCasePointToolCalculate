import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../layout/top_left_layout.dart';
import '../../router/auto_router.gr.dart';
import '../../widgets/button/button_import.dart';
import '../../widgets/button/button_use_case_point.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/my_app_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Use Case Tool',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        leading: null,
        backgroundColor: const Color(0xff50C2C9),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 0, right: 0, top: 0),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              child: TopLeftLayout(),
            ),
            Positioned(
              top: screenHeight / 25,
              width: screenWidth,
              child: Center(
                child: UseCasePointButton(
                  onPressed: () {
                    final myAppBlocData = MyAppBlocProvider.of(context);
                    final AuthenticationBloc authenticationBloc = myAppBlocData.myAppBloc.authenticationBloc;
                    authenticationBloc.add(ClickButtonEvent());
                    context.navigateTo(const UseCasePointRoute());
                    final tabsRouter = AutoTabsRouter.of(context);

                  },
                ),
              ),
            ),
            Positioned(
              top: screenHeight / 2.3,
              width: screenWidth,
              child: Center(
                child: ImportButton(
                  onPressed: () {
                    context.pushRoute(const ImportRoute());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
