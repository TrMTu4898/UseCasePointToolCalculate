import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecasepointstool/bloc/profile_bloc/profile_bloc.dart';
import 'package:usecasepointstool/data/models/person.dart';
import 'package:usecasepointstool/layout/profile_layout.dart';
import 'package:usecasepointstool/widgets/button/button_profile.dart';
import 'package:usecasepointstool/widgets/widgets_screen/widget_profile.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  final String currentUser;
  const ProfileScreen({Key? key, required this.currentUser}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _displayNameController = TextEditingController();
  late TextEditingController _fullNameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _photoUrlController = TextEditingController();
  late TextEditingController _phoneNumberController = TextEditingController();

  bool isEditing = true;

  final _profileBloc = ProfileBloc(
      person: Person(
    uid: '',
    fullName: '',
    email: '',
    displayName: '',
    photoUrl: '',
    phoneNumber: '',
  ));
  final String _fullName = 'Tran Minh Tu';
  final String _displayName = 'Tran Minh Tu';
  final String _email = 'minhtu04081998.work@gmail.com';
  final String _photoUrl = 'assets/images/Profile_Image.jpg';
  final String _phoneNumber = '0342769724';

  @override
  void initiState() {
    super.initState();
    _displayNameController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _photoUrlController = TextEditingController();
    _phoneNumberController = TextEditingController();
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
            onPressed: () {},
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
                Positioned(
                  top: screenHeight / 1.6,
                  right: 0,
                  left: 0,
                  child: const Center(
                    child: ProfileLayout(),
                  ),
                ),
                /*---------------------Widget-------------------------*/
                Positioned(
                  top: 50,
                  left: 15,
                  width: screenWidth - 30,
                  height: screenHeight / 1.5,
                  child: WidgetProfile(
                    emailTextController: _emailController,
                    displayNameTextController: _displayNameController,
                    photoUrlTextController: _photoUrlController,
                    fullNameTextController: _fullNameController,
                    phoneNumberTextController: _phoneNumberController,
                    email: _email,
                    displayName: _displayName,
                    photoURL: _photoUrl,
                    fullName: _fullName,
                    isEditing: isEditing,
                    phoneNumber: _phoneNumber,
                  ),
                ),
                /*---------------------Widget-------------------------*/
              ],
            )),
      ),
    );
  }
}
