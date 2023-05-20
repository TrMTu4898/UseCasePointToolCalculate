import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:usecasepointstool/bloc/authentication/authentication_bloc.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usecasepointstool/widgets/button/bottom_navigation.dart';
import 'package:boxicons/boxicons.dart';

@RoutePage()
class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({Key? key}) : super(key: key);

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

int selectedIndex = 0;

class _HomeViewScreenState extends State<HomeViewScreen> {
  bool screenIndex = true;

  @override
  void initState() {
    super.initState();
  }

  String currentUser = '';

  @override
  Widget build(BuildContext context) {
    bool isAuthentication = false;
    const Color selected = Color(0xff50C2C9);
    final router = AutoRouter.of(context);
    final tabsRouter = AutoTabsRouter.of(context);

    void onButtonSelected(int index) {
      setState(() {
        selectedIndex = index;
        screenIndex = tabsRouter.activeIndex == index;
      });
      tabsRouter.setActiveIndex(index);
    }

    List<BottomNavigationBarItem> fullItems =  [
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

    List<BottomNavigationBarItem> visibleItems =  [
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

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          setState(() {
            isAuthentication = true;
            currentUser = state.user.uid;
          });
        } else if (state is AuthenticationUnauthenticated) {
          setState(() {
            isAuthentication = false;
          });
        }

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
          routes: const [
            HomeRoute(),
            UseCasePointRoute(),
            LogInRoute(),
          ],
          physics: const NeverScrollableScrollPhysics(),
          builder: (context, child, _) {
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
        );
      },
    );
  }
}
