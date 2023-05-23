import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/authentication_bloc.dart';
import 'profile_bloc/profile_bloc.dart';
import 'use_case_point/use_case_points_bloc.dart';

class MyAppBloc {
  final AuthenticationBloc authenticationBloc;
  final ProfileBloc profileBloc;
  final UseCasePointBloc useCasePointBloc;

  MyAppBloc({
    required this.authenticationBloc,
    required this.profileBloc,
    required this.useCasePointBloc,
  });
}

class MyAppBlocProvider extends InheritedWidget {
  final Widget child;
  final MyAppBlocProviderData data;

  const MyAppBlocProvider({
    Key? key,
    required this.child,
    required this.data,
  }) : super(key: key, child: child);

  static MyAppBlocProviderData of(BuildContext context) {
    final provider =
    context.dependOnInheritedWidgetOfExactType<MyAppBlocProvider>();
    if (provider == null) {
      throw Exception('No MyAppBlocProvider found in context.');
    }
    return provider.data;
  }

  @override
  bool updateShouldNotify(MyAppBlocProvider oldWidget) {
    return data != oldWidget.data;
  }
}

class MyAppBlocProviderData {
  final MyAppBloc myAppBloc;

  const MyAppBlocProviderData(this.myAppBloc);
}
