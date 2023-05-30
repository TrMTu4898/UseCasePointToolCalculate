import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TCFHistory extends StatefulWidget {
  const TCFHistory({
    Key?key
  }):super(key:key);
  @override
  _TCFHistoryState createState() => _TCFHistoryState();
}

class _TCFHistoryState extends State<TCFHistory>{

  @override
  Widget build(BuildContext context){
    return Text('123');
  }
}