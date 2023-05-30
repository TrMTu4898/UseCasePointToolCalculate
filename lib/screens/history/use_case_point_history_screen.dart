import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  final String id;
  const UseCasePointHistoryScreen({super.key,
    @pathParam required this.id
  });
  @override
  _UseCasePointHistoryScreenState createState() =>
      _UseCasePointHistoryScreenState();
}

class _UseCasePointHistoryScreenState extends State<UseCasePointHistoryScreen> {
  List<Project> data = [];
  late Future<List<Project>> _futureData;
  final UseCasePointsRepository useCasePointsRepository =
      UseCasePointsRepository();
  List<String> projectID = [];
  @override
  void initState() {
    super.initState();
    _futureData = Future.value(data);
    getData();
  }

  Future<void> getData() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('Project')
        .where('uid', isEqualTo: widget.id)
        .get();
    FirebaseFirestore.instance
        .collection('Project')
        .where('uid', isEqualTo: widget.id).get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          projectID.add(docSnapshot.id);
        }
      },
    );
    final List<Project> projects = snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      final data = doc.data();
      final project = Project.fromMap(data!);
      return project;
    }).toList();
    data = projects;
    setState(() {
      _futureData = Future.value(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final String uid = widget.id;
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
              child:FutureBuilder<List<Project>>(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0), // Remove padding
                            elevation: 0, // Remove elevation
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Remove border radius
                            ),
                            maximumSize: Size(screenWidth - 30, 120),
                          ),
                          onPressed: () {
                            AutoRouter.of(context).push( UseCasePointHistoryDetailRoute(id:projectID[index].toString()));
                          },
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
                    );
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
