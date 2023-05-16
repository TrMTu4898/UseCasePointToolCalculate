import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecasepointstool/bloc/profile_bloc/profile_bloc.dart';
import 'package:usecasepointstool/data/models/person.dart';
import 'package:usecasepointstool/layout/profile_layout.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_profile.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _displayNameController = TextEditingController();
  late TextEditingController _fullNameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _photoUrlController = TextEditingController();
  bool isEditing = false;

  final _profileBloc = ProfileBloc(
      person: Person(
    uid: '',
    fullName: '',
    email: '',
    displayName: '',
    photoUrl: '',
  ));

  @override
  void initiState() {
    super.initState();
    _displayNameController = TextEditingController(text: '123');
    _fullNameController = TextEditingController(text: '456');
    _emailController = TextEditingController(text: '789');
    _photoUrlController = TextEditingController(text: '1011123');
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return BlocProvider(
      create: (context) => _profileBloc,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xff50C2C9),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // xử lý sự kiện khi người dùng click vào icon back
              router.pop(true);
            },
          ),
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 0, right: 0),
            child: Stack(
              children: [
                const Positioned(
                  top: -85,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: ProfileLayout(),
                  ),
                ),
                const Positioned(
                  bottom: -95,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: ProfileLayout(),
                  ),
                ),
                /*---------------------Widget-------------------------*/
                Positioned(
                  top: screenHeight /5,
                  width: screenWidth-30,
                  height: screenHeight/2,
                  child: SingleChildScrollView(
                    reverse: true,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileViewState) {
                          isEditing = true;
                        } else if (state is ProfileEditState) {
                          isEditing = true;
                        }
                        return WidgetProfile(
                          emailTextController: _emailController,
                          displayNameTextController: _displayNameController,
                          photoUrlTextController: _photoUrlController,
                          fullNameTextController: _fullNameController,
                          isEditing: isEditing,
                        );
                      },
                    ),
                  ),
                ),
                /*---------------------Widget-------------------------*/
              ],
            )),
      ),
    );
  }
}
