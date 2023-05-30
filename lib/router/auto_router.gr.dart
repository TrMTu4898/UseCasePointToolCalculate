// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:usecasepointstool/bloc/authentication/authentication_bloc.dart'
    as _i24;
import 'package:usecasepointstool/bloc/profile_bloc/profile_bloc.dart' as _i25;
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart'
    as _i26;
import 'package:usecasepointstool/screens/authentication/forgot_password_screen.dart'
    as _i1;
import 'package:usecasepointstool/screens/authentication/login_screen.dart'
    as _i2;
import 'package:usecasepointstool/screens/authentication/register_screen.dart'
    as _i3;
import 'package:usecasepointstool/screens/history/history_detail/ecf_detail.dart'
    as _i19;
import 'package:usecasepointstool/screens/history/history_detail/tcf_detail.dart'
    as _i18;
import 'package:usecasepointstool/screens/history/history_detail/uaw_detail.dart'
    as _i17;
import 'package:usecasepointstool/screens/history/history_detail/ucp_detail.dart'
    as _i20;
import 'package:usecasepointstool/screens/history/history_detail/uucw_detail.dart'
    as _i16;
import 'package:usecasepointstool/screens/history/use_case_point_history_detail.dart'
    as _i21;
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

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    ForgotPasswordRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForgotPasswordScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      final args = routeData.argsAs<LogInRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LogInScreen(
          key: args.key,
          authenticationBloc: args.authenticationBloc,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.RegisterScreen(
          key: args.key,
          authenticationBloc: args.authenticationBloc,
        ),
      );
    },
    UseCasePointHistoryRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UseCasePointHistoryRouteArgs>(
          orElse: () =>
              UseCasePointHistoryRouteArgs(id: pathParams.getString('id')));
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.UseCasePointHistoryScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    GetStartedRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.GetStartedScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeViewScreen(),
      );
    },
    ImportRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ImportScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProfileScreen(
          key: args.key,
          profileBloc: args.profileBloc,
          authenticationBloc: args.authenticationBloc,
        ),
      );
    },
    ECFRoute.name: (routeData) {
      final args = routeData.argsAs<ECFRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
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
      return _i22.AutoRoutePage<dynamic>(
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
      return _i22.AutoRoutePage<dynamic>(
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
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.UCPPage(
          key: args.key,
          useCasePointBloc: args.useCasePointBloc,
          uucpFormBloc: args.uucpFormBloc,
          ecfFormBloc: args.ecfFormBloc,
          tcfFormBloc: args.tcfFormBloc,
          uawFormBloc: args.uawFormBloc,
          authenticationBloc: args.authenticationBloc,
        ),
      );
    },
    UUCWRoute.name: (routeData) {
      final args = routeData.argsAs<UUCWRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.UUCWPage(
          key: args.key,
          useCasePointBloc: args.useCasePointBloc,
          uucwFormBloc: args.uucwFormBloc,
        ),
      );
    },
    UseCasePointRoute.name: (routeData) {
      final args = routeData.argsAs<UseCasePointRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.UseCasePointScreen(
          key: args.key,
          authenticationBloc: args.authenticationBloc,
        ),
      );
    },
    UUCWHistory.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.UUCWHistory(),
      );
    },
    UAWHistory.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.UAWHistory(),
      );
    },
    TCFHistory.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.TCFHistory(),
      );
    },
    ECFHistory.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ECFHistory(),
      );
    },
    UCPHistory.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.UCPHistory(),
      );
    },
    UseCasePointHistoryDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UseCasePointHistoryDetailRouteArgs>(
          orElse: () => UseCasePointHistoryDetailRouteArgs(
              id: pathParams.getString('id')));
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.UseCasePointHistoryDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i22.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LogInScreen]
class LogInRoute extends _i22.PageRouteInfo<LogInRouteArgs> {
  LogInRoute({
    _i23.Key? key,
    required _i24.AuthenticationBloc authenticationBloc,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          LogInRoute.name,
          args: LogInRouteArgs(
            key: key,
            authenticationBloc: authenticationBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static const _i22.PageInfo<LogInRouteArgs> page =
      _i22.PageInfo<LogInRouteArgs>(name);
}

class LogInRouteArgs {
  const LogInRouteArgs({
    this.key,
    required this.authenticationBloc,
  });

  final _i23.Key? key;

  final _i24.AuthenticationBloc authenticationBloc;

  @override
  String toString() {
    return 'LogInRouteArgs{key: $key, authenticationBloc: $authenticationBloc}';
  }
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i22.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i23.Key? key,
    required _i24.AuthenticationBloc authenticationBloc,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            authenticationBloc: authenticationBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i22.PageInfo<RegisterRouteArgs> page =
      _i22.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.authenticationBloc,
  });

  final _i23.Key? key;

  final _i24.AuthenticationBloc authenticationBloc;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, authenticationBloc: $authenticationBloc}';
  }
}

/// generated route for
/// [_i4.UseCasePointHistoryScreen]
class UseCasePointHistoryRoute
    extends _i22.PageRouteInfo<UseCasePointHistoryRouteArgs> {
  UseCasePointHistoryRoute({
    _i23.Key? key,
    required String id,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          UseCasePointHistoryRoute.name,
          args: UseCasePointHistoryRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'UseCasePointHistoryRoute';

  static const _i22.PageInfo<UseCasePointHistoryRouteArgs> page =
      _i22.PageInfo<UseCasePointHistoryRouteArgs>(name);
}

class UseCasePointHistoryRouteArgs {
  const UseCasePointHistoryRouteArgs({
    this.key,
    required this.id,
  });

  final _i23.Key? key;

  final String id;

  @override
  String toString() {
    return 'UseCasePointHistoryRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.GetStartedScreen]
class GetStartedRoute extends _i22.PageRouteInfo<void> {
  const GetStartedRoute({List<_i22.PageRouteInfo>? children})
      : super(
          GetStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetStartedRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeViewScreen]
class HomeViewRoute extends _i22.PageRouteInfo<void> {
  const HomeViewRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ImportScreen]
class ImportRoute extends _i22.PageRouteInfo<void> {
  const ImportRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ImportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImportRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRoute extends _i22.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i23.Key? key,
    required _i25.ProfileBloc profileBloc,
    required _i24.AuthenticationBloc authenticationBloc,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            profileBloc: profileBloc,
            authenticationBloc: authenticationBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i22.PageInfo<ProfileRouteArgs> page =
      _i22.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.profileBloc,
    required this.authenticationBloc,
  });

  final _i23.Key? key;

  final _i25.ProfileBloc profileBloc;

  final _i24.AuthenticationBloc authenticationBloc;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, profileBloc: $profileBloc, authenticationBloc: $authenticationBloc}';
  }
}

/// generated route for
/// [_i10.ECFPage]
class ECFRoute extends _i22.PageRouteInfo<ECFRouteArgs> {
  ECFRoute({
    _i23.Key? key,
    required _i26.UseCasePointBloc useCasePointBloc,
    required _i26.ECFFormBloc ecfFormBloc,
    List<_i22.PageRouteInfo>? children,
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

  static const _i22.PageInfo<ECFRouteArgs> page =
      _i22.PageInfo<ECFRouteArgs>(name);
}

class ECFRouteArgs {
  const ECFRouteArgs({
    this.key,
    required this.useCasePointBloc,
    required this.ecfFormBloc,
  });

  final _i23.Key? key;

  final _i26.UseCasePointBloc useCasePointBloc;

  final _i26.ECFFormBloc ecfFormBloc;

  @override
  String toString() {
    return 'ECFRouteArgs{key: $key, useCasePointBloc: $useCasePointBloc, ecfFormBloc: $ecfFormBloc}';
  }
}

/// generated route for
/// [_i11.TCFPage]
class TCFRoute extends _i22.PageRouteInfo<TCFRouteArgs> {
  TCFRoute({
    _i23.Key? key,
    required _i26.TCFFormBloc tcfFormBloc,
    required _i26.UseCasePointBloc useCasePointBloc,
    List<_i22.PageRouteInfo>? children,
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

  static const _i22.PageInfo<TCFRouteArgs> page =
      _i22.PageInfo<TCFRouteArgs>(name);
}

class TCFRouteArgs {
  const TCFRouteArgs({
    this.key,
    required this.tcfFormBloc,
    required this.useCasePointBloc,
  });

  final _i23.Key? key;

  final _i26.TCFFormBloc tcfFormBloc;

  final _i26.UseCasePointBloc useCasePointBloc;

  @override
  String toString() {
    return 'TCFRouteArgs{key: $key, tcfFormBloc: $tcfFormBloc, useCasePointBloc: $useCasePointBloc}';
  }
}

/// generated route for
/// [_i12.UAWPage]
class UAWRoute extends _i22.PageRouteInfo<UAWRouteArgs> {
  UAWRoute({
    _i23.Key? key,
    required _i26.UAWFormBloc uawFormBloc,
    required _i26.UseCasePointBloc useCasePointBloc,
    List<_i22.PageRouteInfo>? children,
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

  static const _i22.PageInfo<UAWRouteArgs> page =
      _i22.PageInfo<UAWRouteArgs>(name);
}

class UAWRouteArgs {
  const UAWRouteArgs({
    this.key,
    required this.uawFormBloc,
    required this.useCasePointBloc,
  });

  final _i23.Key? key;

  final _i26.UAWFormBloc uawFormBloc;

  final _i26.UseCasePointBloc useCasePointBloc;

  @override
  String toString() {
    return 'UAWRouteArgs{key: $key, uawFormBloc: $uawFormBloc, useCasePointBloc: $useCasePointBloc}';
  }
}

/// generated route for
/// [_i13.UCPPage]
class UCPRoute extends _i22.PageRouteInfo<UCPRouteArgs> {
  UCPRoute({
    _i23.Key? key,
    required _i26.UseCasePointBloc useCasePointBloc,
    required _i26.UUCWFormBloc uucpFormBloc,
    required _i26.ECFFormBloc ecfFormBloc,
    required _i26.TCFFormBloc tcfFormBloc,
    required _i26.UAWFormBloc uawFormBloc,
    required _i24.AuthenticationBloc authenticationBloc,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          UCPRoute.name,
          args: UCPRouteArgs(
            key: key,
            useCasePointBloc: useCasePointBloc,
            uucpFormBloc: uucpFormBloc,
            ecfFormBloc: ecfFormBloc,
            tcfFormBloc: tcfFormBloc,
            uawFormBloc: uawFormBloc,
            authenticationBloc: authenticationBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'UCPRoute';

  static const _i22.PageInfo<UCPRouteArgs> page =
      _i22.PageInfo<UCPRouteArgs>(name);
}

class UCPRouteArgs {
  const UCPRouteArgs({
    this.key,
    required this.useCasePointBloc,
    required this.uucpFormBloc,
    required this.ecfFormBloc,
    required this.tcfFormBloc,
    required this.uawFormBloc,
    required this.authenticationBloc,
  });

  final _i23.Key? key;

  final _i26.UseCasePointBloc useCasePointBloc;

  final _i26.UUCWFormBloc uucpFormBloc;

  final _i26.ECFFormBloc ecfFormBloc;

  final _i26.TCFFormBloc tcfFormBloc;

  final _i26.UAWFormBloc uawFormBloc;

  final _i24.AuthenticationBloc authenticationBloc;

  @override
  String toString() {
    return 'UCPRouteArgs{key: $key, useCasePointBloc: $useCasePointBloc, uucpFormBloc: $uucpFormBloc, ecfFormBloc: $ecfFormBloc, tcfFormBloc: $tcfFormBloc, uawFormBloc: $uawFormBloc, authenticationBloc: $authenticationBloc}';
  }
}

/// generated route for
/// [_i14.UUCWPage]
class UUCWRoute extends _i22.PageRouteInfo<UUCWRouteArgs> {
  UUCWRoute({
    _i23.Key? key,
    required _i26.UseCasePointBloc useCasePointBloc,
    required _i26.UUCWFormBloc uucwFormBloc,
    List<_i22.PageRouteInfo>? children,
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

  static const _i22.PageInfo<UUCWRouteArgs> page =
      _i22.PageInfo<UUCWRouteArgs>(name);
}

class UUCWRouteArgs {
  const UUCWRouteArgs({
    this.key,
    required this.useCasePointBloc,
    required this.uucwFormBloc,
  });

  final _i23.Key? key;

  final _i26.UseCasePointBloc useCasePointBloc;

  final _i26.UUCWFormBloc uucwFormBloc;

  @override
  String toString() {
    return 'UUCWRouteArgs{key: $key, useCasePointBloc: $useCasePointBloc, uucwFormBloc: $uucwFormBloc}';
  }
}

/// generated route for
/// [_i15.UseCasePointScreen]
class UseCasePointRoute extends _i22.PageRouteInfo<UseCasePointRouteArgs> {
  UseCasePointRoute({
    _i23.Key? key,
    required _i24.AuthenticationBloc authenticationBloc,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          UseCasePointRoute.name,
          args: UseCasePointRouteArgs(
            key: key,
            authenticationBloc: authenticationBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'UseCasePointRoute';

  static const _i22.PageInfo<UseCasePointRouteArgs> page =
      _i22.PageInfo<UseCasePointRouteArgs>(name);
}

class UseCasePointRouteArgs {
  const UseCasePointRouteArgs({
    this.key,
    required this.authenticationBloc,
  });

  final _i23.Key? key;

  final _i24.AuthenticationBloc authenticationBloc;

  @override
  String toString() {
    return 'UseCasePointRouteArgs{key: $key, authenticationBloc: $authenticationBloc}';
  }
}

/// generated route for
/// [_i16.UUCWHistory]
class UUCWHistory extends _i22.PageRouteInfo<void> {
  const UUCWHistory({List<_i22.PageRouteInfo>? children})
      : super(
          UUCWHistory.name,
          initialChildren: children,
        );

  static const String name = 'UUCWHistory';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i17.UAWHistory]
class UAWHistory extends _i22.PageRouteInfo<void> {
  const UAWHistory({List<_i22.PageRouteInfo>? children})
      : super(
          UAWHistory.name,
          initialChildren: children,
        );

  static const String name = 'UAWHistory';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.TCFHistory]
class TCFHistory extends _i22.PageRouteInfo<void> {
  const TCFHistory({List<_i22.PageRouteInfo>? children})
      : super(
          TCFHistory.name,
          initialChildren: children,
        );

  static const String name = 'TCFHistory';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ECFHistory]
class ECFHistory extends _i22.PageRouteInfo<void> {
  const ECFHistory({List<_i22.PageRouteInfo>? children})
      : super(
          ECFHistory.name,
          initialChildren: children,
        );

  static const String name = 'ECFHistory';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.UCPHistory]
class UCPHistory extends _i22.PageRouteInfo<void> {
  const UCPHistory({List<_i22.PageRouteInfo>? children})
      : super(
          UCPHistory.name,
          initialChildren: children,
        );

  static const String name = 'UCPHistory';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i21.UseCasePointHistoryDetailPage]
class UseCasePointHistoryDetailRoute
    extends _i22.PageRouteInfo<UseCasePointHistoryDetailRouteArgs> {
  UseCasePointHistoryDetailRoute({
    _i23.Key? key,
    required String id,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          UseCasePointHistoryDetailRoute.name,
          args: UseCasePointHistoryDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'UseCasePointHistoryDetailRoute';

  static const _i22.PageInfo<UseCasePointHistoryDetailRouteArgs> page =
      _i22.PageInfo<UseCasePointHistoryDetailRouteArgs>(name);
}

class UseCasePointHistoryDetailRouteArgs {
  const UseCasePointHistoryDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i23.Key? key;

  final String id;

  @override
  String toString() {
    return 'UseCasePointHistoryDetailRouteArgs{key: $key, id: $id}';
  }
}
