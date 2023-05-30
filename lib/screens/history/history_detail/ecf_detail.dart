import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ECFHistory extends StatefulWidget {
  const ECFHistory({
    Key?key
  }):super(key:key);
  @override
  _ECFHistoryState createState() => _ECFHistoryState();
}

class _ECFHistoryState extends State<ECFHistory>{

  @override
  Widget build(BuildContext context){
    return Text('123');
  }
}