import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import '../../bloc/my_app_bloc.dart';
import '../../data/models/use_case_points.dart';
import '../../data/repositories/use_case_point_repository.dart';
import '../../data/repositories/person_repository.dart';
import '../../layout/top_left_layout.dart';
import '../../router/auto_router.gr.dart';
import '../home_view_screen.dart';
import '../../widgets/widgets_screen/widget_hisroty_card.dart';

import '../../bloc/authentication/authentication_bloc.dart';

@RoutePage()
class UseCasePointHistoryScreen extends StatefulWidget {
  const UseCasePointHistoryScreen({super.key});
  @override
  _UseCasePointHistoryScreenState createState() =>
      _UseCasePointHistoryScreenState();
}

List<Project> dataUCP = [];
int dataIndex = 0;

class _UseCasePointHistoryScreenState extends State<UseCasePointHistoryScreen> {
  late Future<List<Project>> _futureData;
  final UseCasePointsRepository useCasePointsRepository =
      UseCasePointsRepository();
  late AuthenticationBloc authenticationBloc;
  late UseCasePointBloc useCasePointBloc;
  List<String> projectID = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final myAppBlocData = MyAppBlocProvider.of(context);
    authenticationBloc = myAppBlocData.myAppBloc.authenticationBloc;
    useCasePointBloc = myAppBlocData.myAppBloc.useCasePointBloc;
  }

  @override
  void dispose() {
    authenticationBloc.close();
    super.dispose();
  }

  String uid = '';
  bool isDataLoaded = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      builder: (context, state) {
        print(state);
        if (state is AuthenticationAuthenticated) {
          uid = state.uid.toString();
          Future<void> getData() async {
            final QuerySnapshot<Map<String, dynamic>> snapshot =
                await FirebaseFirestore.instance
                    .collection('Project')
                    .where('uid', isEqualTo: uid)
                    .get();
            FirebaseFirestore.instance
                .collection('Project')
                .where('uid', isEqualTo: uid)
                .get()
                .then(
              (querySnapshot) {
                for (var docSnapshot in querySnapshot.docs) {
                  projectID.add(docSnapshot.id);
                }
              },
            );
            final List<Project> projects =
                snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
              final data = doc.data();
              final project = Project.fromMap(data!);
              return project;
            }).toList();
            dataUCP = projects;
            setState(() {
              _futureData = Future.value(dataUCP);
            });
          }

          if (!isDataLoaded) {
            getData();
            isDataLoaded = true;
          }
        }
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
                  top: 30,
                  right: 15,
                  left: 15,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: dataUCP.length,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding:
                          const EdgeInsets.all(0), // Remove padding
                          elevation: 0, // Remove elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Remove border radius
                          ),
                          maximumSize: Size(screenWidth - 30, 120),
                        ),
                        onPressed: () {
                          selectedIndex=1;
                          print(projectID[index]);
                          useCasePointBloc.add(EditingHistory(pid: projectID[index]));
                          context.pushRoute(UseCasePointRoute(authenticationBloc: authenticationBloc));
                        },
                        child: WidgetHistoryCard(
                          nameText: dataUCP[index].nameProject,
                          dateCreated: DateFormat('dd/MM/yyyy')
                              .format(dataUCP[index].createdProject)
                              .toString(),
                          information: 'information',
                          numericalOrder: (index + 1).toString(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );

      },
    );
  }
}
