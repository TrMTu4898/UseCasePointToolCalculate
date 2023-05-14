
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

@RoutePage()
class RegisterPage extends StatefulWidget{
  const RegisterPage({Key ? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Text('Register'),
    );
  }
}
