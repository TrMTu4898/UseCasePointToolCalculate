import 'package:auto_route/auto_route.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override
  RouteType get defaultRouteType => const RouteType.material();
  
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/',page: HomeViewRoute.page,
    children: [
      RedirectRoute(path: '', redirectTo: 'Home'),
      AutoRoute(path: 'Home', page: HomeRoute.page),
      AutoRoute(path: ':id', page: UseCasePointHistoryRoute.page,
        children: [
          AutoRoute(page: UseCasePointHistoryDetailRoute.page,path:':id',
              children: [
                AutoRoute(page: UUCWHistory.page),
                AutoRoute(page:UAWHistory.page),
                AutoRoute(page: TCFHistory.page),
                AutoRoute(page: ECFHistory.page),
                AutoRoute(page: UCPHistory.page),
              ],
          ),
        ]
      ),
      AutoRoute(path: 'Profile', page: ProfileRoute.page, maintainState: true),
      AutoRoute(path: 'LogIn',page: LogInRoute.page),
      AutoRoute(path: 'Tool',page: UseCasePointRoute.page,
        children: [
          AutoRoute(page: UUCWRoute.page),
          AutoRoute(page: UAWRoute.page,),
          AutoRoute(page: TCFRoute.page),
          AutoRoute(page: ECFRoute.page),
          AutoRoute(page: UCPRoute.page),
        ]
      ),
    ],
    ),
    AutoRoute(path:'/Import',page: ImportRoute.page),
    AutoRoute(path: '/LogIn',page: LogInRoute.page),
    AutoRoute(path:'/ForgotPassWord',page: ForgotPasswordRoute.page),
    AutoRoute(path:'/Register',page: RegisterRoute.page),
  ];
}
