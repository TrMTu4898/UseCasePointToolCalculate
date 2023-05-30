import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:usecasepointstool/data/models/use_case_points.dart';
import 'package:usecasepointstool/data/repositories/use_case_point_repository.dart';
import '../../data/repositories/person_repository.dart';
import '../../layout/top_left_layout.dart';
import '../../router/auto_router.gr.dart';
import '../home_view_screen.dart';
import '../../widgets/widgets_screen/widget_hisroty_card.dart';

import '../../bloc/authentication/authentication_bloc.dart';

@RoutePage()
class UseCasePointHistoryScreen extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  const UseCasePointHistoryScreen({Key? key, required this.authenticationBloc})
      : super(key: key);
  @override
  _UseCasePointHistoryScreenState createState() =>
      _UseCasePointHistoryScreenState();
}

class _UseCasePointHistoryScreenState extends State<UseCasePointHistoryScreen> {
  String currentuser = '';
  List<Project> data = [];
  String name = '';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final UseCasePointsRepository useCasePointsRepository =
        UseCasePointsRepository();

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
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
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
            Positioned.fill(
              top: 50,
              right: 15,
              left: 15,
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                bloc: widget.authenticationBloc,
                builder: (context, state) {
                  print(state);
                  if (state is AuthenticationLoading) {
                  } else if (state is AuthenticationAuthenticated) {
                    currentuser = state.uid.toString();
                    void getProject() async {
                      data = await useCasePointsRepository
                          .getProjectsByUid(currentuser);
                    }
                    getProject();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0), // Remove padding
                              elevation: 0, // Remove elevation
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Remove border radius
                              ),
                              maximumSize:  Size(screenWidth-30, 120),
                            ),
                            onPressed: () {},
                            child: WidgetHistoryCard(
                              nameText: data[index].nameProject,
                              dateCreated: DateFormat('dd/MM/yyyy')
                                  .format(data[index].createdProject)
                                  .toString(),
                              information: 'information',
                              numericalOrder: (index + 1).toString(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
