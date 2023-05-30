import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/use_case_point/use_case_points_bloc.dart';
import 'data/repositories/person_repository.dart';
import 'firebase_options.dart';
import 'router/auto_router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'bloc/my_app_bloc.dart';
import 'bloc/profile_bloc/profile_bloc.dart';
import 'data/models/person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  PersonRepository personRepository = PersonRepository();
  Person person = Person(uid: '', email: '', displayName: '', photoUrl: '', phoneNumber: '', fullName: '');
  final authenticationBloc = AuthenticationBloc(personRepository: personRepository);
  final profileBloc = ProfileBloc(personRepository: personRepository);
  final useCasePointBloc = UseCasePointBloc();

  final myAppBloc = MyAppBloc(
    authenticationBloc: authenticationBloc,
    profileBloc: profileBloc,
    useCasePointBloc: useCasePointBloc,
  );

  runApp(
    MyAppBlocProvider(
      data: MyAppBlocProviderData(myAppBloc),
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
    final myAppBloc = MyAppBlocProvider.of(context).myAppBloc;

    return MaterialApp.router(
        title: 'Use Case Points Tool',
        theme: ThemeData(
            primaryColor: const Color(0xff50C2C9),
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
      debugShowCheckedModeBanner: false,

    );
  }
}

