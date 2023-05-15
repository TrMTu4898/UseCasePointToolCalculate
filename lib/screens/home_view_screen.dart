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

class _HomeViewScreenState extends State<HomeViewScreen> {
  bool _isFirstTimeUser = true;
  var selectedIndex = 0;
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
    List<BottomNavigationBarItem> visibleItems = [
      MyBottomNavigationBarItem(
        label: 'Home',
        icon: const Icon(
          IconlyLight.home,
          size: 25,
        ),
        selectedColor: Colors.blue,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 0,
      ),
      MyBottomNavigationBarItem(
        label: 'Tool',
        icon: const Icon(IconlyLight.work, size: 25),
        selectedColor: Colors.blue,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 1,
      ),
      MyBottomNavigationBarItem(
        label: 'History',
        icon: const Icon(IconlyLight.document, size: 25),
        selectedColor: Colors.blue,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 2,
      ),
      MyBottomNavigationBarItem(
        label: 'Profile',
        icon: const Icon(IconlyLight.profile, size: 25),
        selectedColor: Colors.blue,
        unselectedColor: Colors.transparent,
        isSelected: selectedIndex == 3,
      ),
    ];
final router = AutoRouter.of(context);
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        UseCasePointRoute(),
        UseCasePointHistoryRoute(),
        LogInRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        void onButtonSelected(int index) {
          final tabsRouter = AutoTabsRouter.of(context);
          setState(() {
            selectedIndex = index;
          });
          tabsRouter.setActiveIndex(index);
        }
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            selectedItemColor: const Color(0xff50C2C9),
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
