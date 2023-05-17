import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usecasepointstool/widgets/button/bottom_navigation.dart';
import 'package:boxicons/boxicons.dart';

@RoutePage()
class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({Key? key}) : super(key: key);

  // ignore: unused_field

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

int selectedIndex = 0;
class _HomeViewScreenState extends State<HomeViewScreen> {
  bool _isFirstTimeUser = true;
  bool screenIndex = true;
  @override
  void initState() {
    super.initState();
  }
  Future<void> _checkIfFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTimeUser = prefs.getBool('first_time_user') ?? true;
    setState(() {
      _isFirstTimeUser = isFirstTimeUser;
    });
    if (isFirstTimeUser) {
      prefs.setBool('first_time_user', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color selected = Color(0xff50C2C9);
    final router = AutoRouter.of(context);
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        UseCasePointRoute(),
        UseCasePointHistoryRoute(),
        //ProfileRoute(),
        LogInRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        void onButtonSelected(int index) {
          setState(() {
            selectedIndex = index;
            screenIndex = tabsRouter.activeIndex == index;
          });
          tabsRouter.setActiveIndex(index);
        }

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
            //isScreen: screenIndex,
          ),
          MyBottomNavigationBarItem(
            label: 'Tool',
            icon: const Icon(IconlyLight.work, size: 25),
            selectedColor: selected,
            unselectedColor: Colors.transparent,
            isSelected: selectedIndex == 1,
            //isScreen: screenIndex,
          ),
          MyBottomNavigationBarItem(
            label: 'History',
            icon: const Icon(IconlyLight.document, size: 25),
            selectedColor: selected,
            unselectedColor: Colors.transparent,
            isSelected: selectedIndex == 2,
            //isScreen: screenIndex,
          ),
          MyBottomNavigationBarItem(
            label: 'Profile',
            icon: const Icon(IconlyLight.profile, size: 25),
            selectedColor: selected,
            unselectedColor: Colors.transparent,
            isSelected: selectedIndex == 3,
            //isScreen: screenIndex,
          ),
        ];

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
  }
}
