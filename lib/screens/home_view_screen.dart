import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/profile_bloc/profile_bloc.dart';
import '../data/models/person.dart';
import '../data/repositories/person_repository.dart';
import '../router/auto_router.gr.dart';
import '../widgets/button/bottom_navigation.dart';
import 'package:boxicons/boxicons.dart';

import '../bloc/my_app_bloc.dart';
import 'authentication/login_screen.dart';

@RoutePage()
class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({Key? key}) : super(key: key);

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

int selectedIndex = 0;

class _HomeViewScreenState extends State<HomeViewScreen> {
  bool screenIndex = true;

  String uid = '';
  late PersonRepository personRepository;
  late AuthenticationBloc authenticationBloc;
  late SignUpFormBloc signUpFormBloc;
  late ProfileBloc profileBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final myAppBlocData = MyAppBlocProvider.of(context);
    personRepository = PersonRepository();
    authenticationBloc = myAppBlocData.myAppBloc.authenticationBloc;
    profileBloc = myAppBlocData.myAppBloc.profileBloc;
  }

  @override
  void dispose(){
    authenticationBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    const Color selected = Color(0xff50C2C9);
    List<BottomNavigationBarItem> fullItems = [
      MyBottomNavigationBarItem(
        label: 'Home',
        icon: const Icon(
          IconlyLight.home,
          size: 25,
        ),
        selectedColor: selected,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 0,
      ),
      MyBottomNavigationBarItem(
        label: 'Tool',
        icon: const Icon(IconlyLight.work, size: 25),
        selectedColor: selected,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 1,
      ),
      MyBottomNavigationBarItem(
        label: 'History',
        icon: const Icon(IconlyLight.document, size: 25),
        selectedColor: selected,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 2,
      ),
      MyBottomNavigationBarItem(
        label: 'Profile',
        icon: const Icon(IconlyLight.profile, size: 25),
        selectedColor: selected,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 3,
      ),
    ];

    List<BottomNavigationBarItem> visibleItems = [
      MyBottomNavigationBarItem(
        label: 'Home',
        icon: const Icon(
          IconlyLight.home,
          size: 25,
        ),
        selectedColor: selected,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 0,
      ),
      MyBottomNavigationBarItem(
        label: 'Tool',
        icon: const Icon(IconlyLight.work, size: 25),
        selectedColor: selected,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 1,
      ),
      MyBottomNavigationBarItem(
        label: 'LogIn',
        icon: const Icon(IconlyLight.login, size: 25),
        selectedColor: selected,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 2,
      ),
    ];

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listener: (context, state) {
        if(state is ClickButton){
          setState(() {
            selectedIndex = 1;
          });
        }
        if (state is AuthenticationAuthenticated ) {
          setState(() {
            uid = state.uid!;
          });
        } else if (state is AuthenticationUnauthenticated) {
          setState(() {
            uid ='';
          });
        }

      },
      child: Builder(
        builder: (context) {
          return isAuthentication
              ? AutoTabsRouter.pageView(
            routes: [
              const HomeRoute(),
              UseCasePointRoute(authenticationBloc: authenticationBloc),
              UseCasePointHistoryRoute(authenticationBloc: authenticationBloc),
              ProfileRoute( profileBloc: profileBloc, authenticationBloc: authenticationBloc),
            ],
            physics: const NeverScrollableScrollPhysics(),
            builder: (context, child, _) {
              final tabsRouter = AutoTabsRouter.of(context);

              void onButtonSelected(int index) {
                setState(() {
                  selectedIndex = index;
                  screenIndex = tabsRouter.activeIndex == index;
                });
                tabsRouter.setActiveIndex(index);
              }
              return Scaffold(
                body: child,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.black,
                  onTap: onButtonSelected,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: fullItems,
                ),
              );
            },
          )
              : AutoTabsRouter.pageView(
            routes: [
              const HomeRoute(),
               UseCasePointRoute(authenticationBloc: authenticationBloc),
              LogInRoute(authenticationBloc: authenticationBloc),
            ],
            physics: const NeverScrollableScrollPhysics(),
            builder: (context, child, _) {
              final tabsRouter = AutoTabsRouter.of(context);
              void onButtonSelected(int index) {
                setState(() {
                  selectedIndex = index;
                  screenIndex = tabsRouter.activeIndex == index;
                });
                tabsRouter.setActiveIndex(index);
              }

              return Scaffold(
                body: child,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.black,
                  onTap: onButtonSelected,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: visibleItems,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
