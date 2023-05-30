import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';

@RoutePage()
class UseCasePointHistoryDetailPage extends StatefulWidget{
final String id;
  const UseCasePointHistoryDetailPage({
    Key?key,
    @pathParam required this.id,
}):super(key:key);

  @override
  _UseCasePointHistoryDetailPageState createState () => _UseCasePointHistoryDetailPageState();
}

class _UseCasePointHistoryDetailPageState extends State<UseCasePointHistoryDetailPage>{

  @override
  Widget build(BuildContext context){
    return AutoTabsRouter.pageView(
      routes:  [
        UUCWHistory(),
        UAWHistory(),
        TCFHistory(),
        ECFHistory(),
        UCPHistory(),
      ],
    );
  }
}