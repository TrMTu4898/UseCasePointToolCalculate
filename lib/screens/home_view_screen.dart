import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usecasepointstool/widgets/button/bottom_navigation.dart';

@RoutePage()
class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({Key? key}) : super(key: key);

  // ignore: unused_field

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  bool _isFirstTimeUser = true;
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
        icon: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/Bottom_Navigation_Home_Icon.png',
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          ),
        ),

      ),
      MyBottomNavigationBarItem(
          label: 'Tool',
          icon: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/Bottom_Navigation_Tool_Icon.png',
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
          ),
      MyBottomNavigationBarItem(
          label: 'Home',
          icon: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/Bottom_Navigation_History_Icon.png',
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
          ),
      MyBottomNavigationBarItem(
          label: 'Home',
          icon: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/Bottom_Navigation_Profile_Icon.png',
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
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
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            selectedItemColor: const Color(0xff50C2C9),
            unselectedItemColor: Colors.grey,
            onTap: tabsRouter.setActiveIndex,
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
