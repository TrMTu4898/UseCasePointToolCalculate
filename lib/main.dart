import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:provider/provider.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import 'package:usecasepointstool/firebase_options.dart';
import 'package:usecasepointstool/router/auto_router.dart';
import 'package:usecasepointstool/widgets/button/bottom_navigation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        Provider<UseCasePointBloc>(
          create:(_) => UseCasePointBloc(),
        ),
        // BlocProvider<UseCasePointsFormBloc>(
        //   create:(_) => UseCasePointsFormBloc(useCasePointBloc: UseCasePointBloc()),
        // ),
      ],
      child: const MyApp(),
    ),
  );
  configLoading();
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
@override
State<MyApp> createState()=> _MyAppState();
}

class _MyAppState extends State<MyApp>{
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
        title: 'Use Case Points Tool',
        theme: ThemeData(
            primaryColor: Colors.grey.shade200,
            brightness: Brightness.light,
            fontFamily: 'Roboto',
            cardTheme: CardTheme(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white60,
            )
        ),
      routerConfig: _appRouter.config(),
      builder: EasyLoading.init(),
    );
  }
}

