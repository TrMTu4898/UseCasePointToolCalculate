import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UCPHistory extends StatefulWidget {
  const UCPHistory({
    Key?key
  }):super(key:key);
  @override
  _UCPHistoryState createState() => _UCPHistoryState();
}

class _UCPHistoryState extends State<UCPHistory>{

  @override
  Widget build(BuildContext context){
    return Text('123');
  }
}