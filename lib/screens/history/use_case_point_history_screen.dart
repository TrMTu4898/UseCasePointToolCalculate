import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/person_repository.dart';
import '../../layout/top_left_layout.dart';
import '../../router/auto_router.gr.dart';
import '../home_view_screen.dart';
import '../../widgets/widgets_screen/widget_hisroty_card.dart';

import '../../bloc/authentication/authentication_bloc.dart';

@RoutePage()
class UseCasePointHistoryScreen extends StatefulWidget {
  final String uid;
  final AuthenticationBloc authenticationBloc;
  const UseCasePointHistoryScreen({Key? key, required this.uid, required this.authenticationBloc}) : super(key: key);
  @override
  _UseCasePointHistoryScreenState createState() =>
      _UseCasePointHistoryScreenState();
}

class _UseCasePointHistoryScreenState extends State<UseCasePointHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final PersonRepository personRepository = PersonRepository();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 30,),
            onPressed: () {
              // Do something when the search button is pressed
            },
          ),
        ],
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
              onPressed: () {
              context.pushRoute(const HomeRoute());
              setState(() {
              selectedIndex = 0;
              });
              },
      ),
        backgroundColor: const Color(0xff50C2C9),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 0, right: 0, top: 0),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              child: TopLeftLayout(),
            ),
            Positioned(
              top: screenHeight / 30,
              right: 15,
              height: screenHeight / 1.3,
              width: screenWidth - 30,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<AuthenticationBloc,AuthenticationState>(
                      bloc:widget.authenticationBloc,
                      builder: (context, state){
                        late String currentuser1 = 'ugsgiRMIVIT8ADVIwNXV7mP8Sd83';
                        List<Map<String, dynamic>> data = [];
                        if(state is AuthenticationLoading){

                        }else if(state is AuthenticationAuthenticated){
                          currentuser1 = state.uid.toString();
                          print(currentuser1);
                        }
                        return const WidgetHistoryCard(
                            nameText: 'nameText',
                            dateCreated: 'dateCreated',
                            information: 'information',
                            numericalOrder: '1',
                        );
                      },
                    )
                  ],
                )
              )
              // Center(
              //   child: ListView(
              //     shrinkWrap: true,
              //     physics: const ClampingScrollPhysics(),
              //     children: const [
              //       WidgetHistoryCard(
              //         nameText: 'Test1',
              //         dateCreated: '14/05/2003',
              //         information: 'information',
              //         numericalOrder: '1',
              //       ),
              //       // WidgetHistoryCard(
              //       //   nameText: 'Test1',
              //       //   dateCreated: '14/05/2003',
              //       //   information: 'information',
              //       //   numericalOrder: '1',
              //       // ),
              //       // WidgetHistoryCard(
              //       //   nameText: 'Test1',
              //       //   dateCreated: '14/05/2003',
              //       //   information: 'information',
              //       //   numericalOrder: '1',
              //       // ),
              //       // WidgetHistoryCard(
              //       //   nameText: 'Test1',
              //       //   dateCreated: '14/05/2003',
              //       //   information: 'information',
              //       //   numericalOrder: '1',
              //       // ),
              //       // WidgetHistoryCard(
              //       //   nameText: 'Test1',
              //       //   dateCreated: '14/05/2003',
              //       //   information: 'information',
              //       //   numericalOrder: '1',
              //       // ),
              //       // WidgetHistoryCard(
              //       //   nameText: 'Test1',
              //       //   dateCreated: '14/05/2003',
              //       //   information: 'information',
              //       //   numericalOrder: '1',
              //       // ),
              //       // WidgetHistoryCard(
              //       //   nameText: 'Test1',
              //       //   dateCreated: '14/05/2003',
              //       //   information: 'information',
              //       //   numericalOrder: '1',
              //       // ),
              //     ],
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
