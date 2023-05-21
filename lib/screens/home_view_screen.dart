import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:usecasepointstool/bloc/authentication/authentication_bloc.dart';
import 'package:usecasepointstool/data/models/person.dart';
import 'package:usecasepointstool/data/repositories/person_repository.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';
import 'package:usecasepointstool/widgets/button/bottom_navigation.dart';
import 'package:boxicons/boxicons.dart';

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

  String currentUser = '';
  late PersonRepository personRepository;
  late Person person;
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    personRepository = PersonRepository();
    authenticationBloc = AuthenticationBloc(personRepository: personRepository);
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
        print(state);
        if (state is AuthenticationAuthenticated) {
          setState(() {
            person = state.user;
            currentUser = person.uid;
            print(currentUser);
          });
        } else if (state is AuthenticationUnauthenticated) {
          setState(() {
            currentUser ='';
          });
        }

      },
      child: Builder(
        builder: (context) {
          print(isAuthentication);
          return isAuthentication
              ? AutoTabsRouter.pageView(
            routes: [
              const HomeRoute(),
              const UseCasePointRoute(),
              const UseCasePointHistoryRoute(),
              ProfileRoute(currentUser: currentUser),
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
              const UseCasePointRoute(),
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
