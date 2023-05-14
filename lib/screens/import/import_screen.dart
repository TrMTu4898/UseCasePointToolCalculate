import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

@RoutePage()
class ImportScreen extends StatefulWidget{
  const ImportScreen({Key ? key}) : super(key: key);
  @override
  _ImportScreenState createState() => _ImportScreenState();
}
class _ImportScreenState extends State<ImportScreen>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Center(
        child: Text('Import'),
      ),
    );
  }
}
