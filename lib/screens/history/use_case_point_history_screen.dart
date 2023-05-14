import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

@RoutePage()
class UseCasePointHistoryScreen extends StatefulWidget{
  const UseCasePointHistoryScreen({Key ? key}) : super(key: key);
  @override
  _UseCasePointHistoryScreenState createState() => _UseCasePointHistoryScreenState();
}
class _UseCasePointHistoryScreenState extends State<UseCasePointHistoryScreen>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Center(
        child: Text(
          'History'
        ),
      ),
    );
  }
}