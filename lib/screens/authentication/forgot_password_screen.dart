import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget{
  const ForgotPasswordPage({Key ? key}) : super(key: key);
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}
class _ForgotPasswordPageState extends State<ForgotPasswordPage>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Text('Forget Password'),
    );
  }
}