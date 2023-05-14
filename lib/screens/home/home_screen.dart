import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usecasepointstool/layout/top_left_layout.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';
import 'package:usecasepointstool/widgets/button/button_import.dart';
import 'package:usecasepointstool/widgets/button/button_use_case_point.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Use Case Tool',
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
          )
        ),
      ),
      body: SafeArea(
        minimum:const EdgeInsets.only(left: 0,right: 0,top: 0),
        child: Stack(
          children: [
            const Positioned(
              top:0,
              left:0,
              child: TopLeftLayOut(),
            ),
            Positioned(
              top: screenHeight/25,
              width: screenWidth,
              child: Center(
                child: UseCasePointButton(
                      onPressed: (){
                        context.pushRoute(const UseCasePointRoute());
                      },
                    ),
                ),
              ),
            Positioned(
              top: screenHeight/2.3,
              width: screenWidth,
              child: Center(
                child: ImportButton(
                  onPressed: (){
                    context.pushRoute(const ImportRoute());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
