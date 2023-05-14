import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key ? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Text('Register'),
    );
  }
}