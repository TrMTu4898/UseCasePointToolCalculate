import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

@RoutePage()
class UCPPage extends StatefulWidget{
  const UCPPage({Key ? key}) : super(key: key);
  @override
  _UCPPageState createState() => _UCPPageState();
}
class _UCPPageState extends State<UCPPage>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Text('Register'),
    );
  }
}
