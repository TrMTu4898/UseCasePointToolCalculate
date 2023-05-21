// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:usecasepointstool/bloc/authentication/authentication_bloc.dart'
    as _i18;
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart'
    as _i19;
import 'package:usecasepointstool/screens/authentication/forgot_password_screen.dart'
    as _i1;
import 'package:usecasepointstool/screens/authentication/login_screen.dart'
    as _i2;
import 'package:usecasepointstool/screens/authentication/register_screen.dart'
    as _i3;
import 'package:usecasepointstool/screens/history/use_case_point_history_screen.dart'
    as _i4;
import 'package:usecasepointstool/screens/home/get_started_screen.dart' as _i5;
import 'package:usecasepointstool/screens/home/home_screen.dart' as _i6;
import 'package:usecasepointstool/screens/home_view_screen.dart' as _i7;
import 'package:usecasepointstool/screens/import/import_screen.dart' as _i8;
import 'package:usecasepointstool/screens/profile/profile_screen.dart' as _i9;
import 'package:usecasepointstool/screens/use_case_point/use_case_point_page/ecf_page.dart'
    as _i10;
import 'package:usecasepointstool/screens/use_case_point/use_case_point_page/tcf_page.dart'
    as _i11;
import 'package:usecasepointstool/screens/use_case_point/use_case_point_page/uaw_page.dart'
    as _i12;
import 'package:usecasepointstool/screens/use_case_point/use_case_point_page/ucp_page.dart'
    as _i13;
import 'package:usecasepointstool/screens/use_case_point/use_case_point_page/uucw_page.dart'
    as _i14;
import 'package:usecasepointstool/screens/use_case_point/use_case_point_screen.dart'
    as _i15;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    ForgotPasswordRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForgotPasswordScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      final args = routeData.argsAs<LogInRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LogInScreen(
          key: args.key,
          authenticationBloc: args.authenticationBloc,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.RegisterScreen(
          key: args.key,
          authenticationBloc: args.authenticationBloc,
        ),
      );
    },
    UseCasePointHistoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.UseCasePointHistoryScreen(),
      );
    },
    GetStartedRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.GetStartedScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeViewScreen(),
      );
    },
    ImportRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ImportScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProfileScreen(
          key: args.key,
          currentUser: args.currentUser,
        ),
      );
    },
    ECFRoute.name: (routeData) {
      final args = routeData.argsAs<ECFRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ECFPage(
          key: args.key,
          useCasePointBloc: args.useCasePointBloc,
          ecfFormBloc: args.ecfFormBloc,
        ),
      );
    },
    TCFRoute.name: (routeData) {
      final args = routeData.argsAs<TCFRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.TCFPage(
          key: args.key,
          tcfFormBloc: args.tcfFormBloc,
          useCasePointBloc: args.useCasePointBloc,
        ),
      );
    },
    UAWRoute.name: (routeData) {
      final args = routeData.argsAs<UAWRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.UAWPage(
          key: args.key,
          uawFormBloc: args.uawFormBloc,
          useCasePointBloc: args.useCasePointBloc,
        ),
      );
    },
    UCPRoute.name: (routeData) {
      final args = routeData.argsAs<UCPRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.UCPPage(
          key: args.key,
          useCasePointBloc: args.useCasePointBloc,
          uucpFormBloc: args.uucpFormBloc,
          ecfFormBloc: args.ecfFormBloc,
          tcfFormBloc: args.tcfFormBloc,
          uawFormBloc: args.uawFormBloc,
        ),
      );
    },
    UUCWRoute.name: (routeData) {
      final args = routeData.argsAs<UUCWRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.UUCWPage(
          key: args.key,
          useCasePointBloc: args.useCasePointBloc,
          uucwFormBloc: args.uucwFormBloc,
        ),
      );
    },
    UseCasePointRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.UseCasePointScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i16.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LogInScreen]
class LogInRoute extends _i16.PageRouteInfo<LogInRouteArgs> {
  LogInRoute({
    _i17.Key? key,
    required _i18.AuthenticationBloc authenticationBloc,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          LogInRoute.name,
          args: LogInRouteArgs(
            key: key,
            authenticationBloc: authenticationBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static const _i16.PageInfo<LogInRouteArgs> page =
      _i16.PageInfo<LogInRouteArgs>(name);
}

class LogInRouteArgs {
  const LogInRouteArgs({
    this.key,
    required this.authenticationBloc,
  });

  final _i17.Key? key;

  final _i18.AuthenticationBloc authenticationBloc;

  @override
  String toString() {
    return 'LogInRouteArgs{key: $key, authenticationBloc: $authenticationBloc}';
  }
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i16.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i17.Key? key,
    required _i18.AuthenticationBloc authenticationBloc,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            authenticationBloc: authenticationBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i16.PageInfo<RegisterRouteArgs> page =
      _i16.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.authenticationBloc,
  });

  final _i17.Key? key;

  final _i18.AuthenticationBloc authenticationBloc;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, authenticationBloc: $authenticationBloc}';
  }
}

/// generated route for
/// [_i4.UseCasePointHistoryScreen]
class UseCasePointHistoryRoute extends _i16.PageRouteInfo<void> {
  const UseCasePointHistoryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          UseCasePointHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'UseCasePointHistoryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.GetStartedScreen]
class GetStartedRoute extends _i16.PageRouteInfo<void> {
  const GetStartedRoute({List<_i16.PageRouteInfo>? children})
      : super(
          GetStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetStartedRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeViewScreen]
class HomeViewRoute extends _i16.PageRouteInfo<void> {
  const HomeViewRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ImportScreen]
class ImportRoute extends _i16.PageRouteInfo<void> {
  const ImportRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ImportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImportRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRoute extends _i16.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i17.Key? key,
    required String currentUser,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            currentUser: currentUser,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<ProfileRouteArgs> page =
      _i16.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.currentUser,
  });

  final _i17.Key? key;

  final String currentUser;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, currentUser: $currentUser}';
  }
}

/// generated route for
/// [_i10.ECFPage]
class ECFRoute extends _i16.PageRouteInfo<ECFRouteArgs> {
  ECFRoute({
    _i17.Key? key,
    required _i19.UseCasePointBloc useCasePointBloc,
    required _i19.ECFFormBloc ecfFormBloc,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ECFRoute.name,
          args: ECFRouteArgs(
            key: key,
            useCasePointBloc: useCasePointBloc,
            ecfFormBloc: ecfFormBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'ECFRoute';

  static const _i16.PageInfo<ECFRouteArgs> page =
      _i16.PageInfo<ECFRouteArgs>(name);
}

class ECFRouteArgs {
  const ECFRouteArgs({
    this.key,
    required this.useCasePointBloc,
    required this.ecfFormBloc,
  });

  final _i17.Key? key;

  final _i19.UseCasePointBloc useCasePointBloc;

  final _i19.ECFFormBloc ecfFormBloc;

  @override
  String toString() {
    return 'ECFRouteArgs{key: $key, useCasePointBloc: $useCasePointBloc, ecfFormBloc: $ecfFormBloc}';
  }
}

/// generated route for
/// [_i11.TCFPage]
class TCFRoute extends _i16.PageRouteInfo<TCFRouteArgs> {
  TCFRoute({
    _i17.Key? key,
    required _i19.TCFFormBloc tcfFormBloc,
    required _i19.UseCasePointBloc useCasePointBloc,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          TCFRoute.name,
          args: TCFRouteArgs(
            key: key,
            tcfFormBloc: tcfFormBloc,
            useCasePointBloc: useCasePointBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'TCFRoute';

  static const _i16.PageInfo<TCFRouteArgs> page =
      _i16.PageInfo<TCFRouteArgs>(name);
}

class TCFRouteArgs {
  const TCFRouteArgs({
    this.key,
    required this.tcfFormBloc,
    required this.useCasePointBloc,
  });

  final _i17.Key? key;

  final _i19.TCFFormBloc tcfFormBloc;

  final _i19.UseCasePointBloc useCasePointBloc;

  @override
  String toString() {
    return 'TCFRouteArgs{key: $key, tcfFormBloc: $tcfFormBloc, useCasePointBloc: $useCasePointBloc}';
  }
}

/// generated route for
/// [_i12.UAWPage]
class UAWRoute extends _i16.PageRouteInfo<UAWRouteArgs> {
  UAWRoute({
    _i17.Key? key,
    required _i19.UAWFormBloc uawFormBloc,
    required _i19.UseCasePointBloc useCasePointBloc,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          UAWRoute.name,
          args: UAWRouteArgs(
            key: key,
            uawFormBloc: uawFormBloc,
            useCasePointBloc: useCasePointBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'UAWRoute';

  static const _i16.PageInfo<UAWRouteArgs> page =
      _i16.PageInfo<UAWRouteArgs>(name);
}

class UAWRouteArgs {
  const UAWRouteArgs({
    this.key,
    required this.uawFormBloc,
    required this.useCasePointBloc,
  });

  final _i17.Key? key;

  final _i19.UAWFormBloc uawFormBloc;

  final _i19.UseCasePointBloc useCasePointBloc;

  @override
  String toString() {
    return 'UAWRouteArgs{key: $key, uawFormBloc: $uawFormBloc, useCasePointBloc: $useCasePointBloc}';
  }
}

/// generated route for
/// [_i13.UCPPage]
class UCPRoute extends _i16.PageRouteInfo<UCPRouteArgs> {
  UCPRoute({
    _i17.Key? key,
    required _i19.UseCasePointBloc useCasePointBloc,
    required _i19.UUCWFormBloc uucpFormBloc,
    required _i19.ECFFormBloc ecfFormBloc,
    required _i19.TCFFormBloc tcfFormBloc,
    required _i19.UAWFormBloc uawFormBloc,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          UCPRoute.name,
          args: UCPRouteArgs(
            key: key,
            useCasePointBloc: useCasePointBloc,
            uucpFormBloc: uucpFormBloc,
            ecfFormBloc: ecfFormBloc,
            tcfFormBloc: tcfFormBloc,
            uawFormBloc: uawFormBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'UCPRoute';

  static const _i16.PageInfo<UCPRouteArgs> page =
      _i16.PageInfo<UCPRouteArgs>(name);
}

class UCPRouteArgs {
  const UCPRouteArgs({
    this.key,
    required this.useCasePointBloc,
    required this.uucpFormBloc,
    required this.ecfFormBloc,
    required this.tcfFormBloc,
    required this.uawFormBloc,
  });

  final _i17.Key? key;

  final _i19.UseCasePointBloc useCasePointBloc;

  final _i19.UUCWFormBloc uucpFormBloc;

  final _i19.ECFFormBloc ecfFormBloc;

  final _i19.TCFFormBloc tcfFormBloc;

  final _i19.UAWFormBloc uawFormBloc;

  @override
  String toString() {
    return 'UCPRouteArgs{key: $key, useCasePointBloc: $useCasePointBloc, uucpFormBloc: $uucpFormBloc, ecfFormBloc: $ecfFormBloc, tcfFormBloc: $tcfFormBloc, uawFormBloc: $uawFormBloc}';
  }
}

/// generated route for
/// [_i14.UUCWPage]
class UUCWRoute extends _i16.PageRouteInfo<UUCWRouteArgs> {
  UUCWRoute({
    _i17.Key? key,
    required _i19.UseCasePointBloc useCasePointBloc,
    required _i19.UUCWFormBloc uucwFormBloc,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          UUCWRoute.name,
          args: UUCWRouteArgs(
            key: key,
            useCasePointBloc: useCasePointBloc,
            uucwFormBloc: uucwFormBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'UUCWRoute';

  static const _i16.PageInfo<UUCWRouteArgs> page =
      _i16.PageInfo<UUCWRouteArgs>(name);
}

class UUCWRouteArgs {
  const UUCWRouteArgs({
    this.key,
    required this.useCasePointBloc,
    required this.uucwFormBloc,
  });

  final _i17.Key? key;

  final _i19.UseCasePointBloc useCasePointBloc;

  final _i19.UUCWFormBloc uucwFormBloc;

  @override
  String toString() {
    return 'UUCWRouteArgs{key: $key, useCasePointBloc: $useCasePointBloc, uucwFormBloc: $uucwFormBloc}';
  }
}

/// generated route for
/// [_i15.UseCasePointScreen]
class UseCasePointRoute extends _i16.PageRouteInfo<void> {
  const UseCasePointRoute({List<_i16.PageRouteInfo>? children})
      : super(
          UseCasePointRoute.name,
          initialChildren: children,
        );

  static const String name = 'UseCasePointRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
