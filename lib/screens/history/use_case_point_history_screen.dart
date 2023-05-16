import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';
import 'package:usecasepointstool/screens/home_view_screen.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_hisroty_card.dart';

@RoutePage()
class UseCasePointHistoryScreen extends StatefulWidget {
  const UseCasePointHistoryScreen({Key? key}) : super(key: key);
  @override
  _UseCasePointHistoryScreenState createState() =>
      _UseCasePointHistoryScreenState();
}

class _UseCasePointHistoryScreenState extends State<UseCasePointHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 30,),
            onPressed: () {
              // Do something when the search button is pressed
            },
          ),
        ],
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
              onPressed: () {
              context.pushRoute(const HomeRoute());
              setState(() {
              selectedIndex = 0;
              });
              },
      ),
        backgroundColor: const Color(0xff50C2C9),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 0, right: 0, top: 0),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              child: TopLeftLayout(),
            ),
            Positioned(
              top: screenHeight / 30,
              right: 15,
              height: screenHeight / 1.3,
              width: screenWidth - 30,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: const [
                    WidgetHistoryCard(
                      nameText: 'Test1',
                      dateCreated: '14/05/2003',
                      information: 'information',
                      numericalOrder: '1',
                    ),
                    // WidgetHistoryCard(
                    //   nameText: 'Test1',
                    //   dateCreated: '14/05/2003',
                    //   information: 'information',
                    //   numericalOrder: '1',
                    // ),
                    // WidgetHistoryCard(
                    //   nameText: 'Test1',
                    //   dateCreated: '14/05/2003',
                    //   information: 'information',
                    //   numericalOrder: '1',
                    // ),
                    // WidgetHistoryCard(
                    //   nameText: 'Test1',
                    //   dateCreated: '14/05/2003',
                    //   information: 'information',
                    //   numericalOrder: '1',
                    // ),
                    // WidgetHistoryCard(
                    //   nameText: 'Test1',
                    //   dateCreated: '14/05/2003',
                    //   information: 'information',
                    //   numericalOrder: '1',
                    // ),
                    // WidgetHistoryCard(
                    //   nameText: 'Test1',
                    //   dateCreated: '14/05/2003',
                    //   information: 'information',
                    //   numericalOrder: '1',
                    // ),
                    // WidgetHistoryCard(
                    //   nameText: 'Test1',
                    //   dateCreated: '14/05/2003',
                    //   information: 'information',
                    //   numericalOrder: '1',
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
