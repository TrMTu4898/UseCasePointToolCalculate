import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';
import 'package:usecasepointstool/screens/authentication/login_screen.dart';
import 'package:usecasepointstool/screens/home_view_screen.dart';
import 'package:usecasepointstool/widgets/button/button_profile.dart';
import 'package:usecasepointstool/widgets/button/button_widget.dart';
import 'package:usecasepointstool/widgets/text/text_editing.dart';
import 'package:usecasepointstool/data/repositories/person_repository.dart';

class WidgetProfile extends StatefulWidget {
  final TextEditingController emailTextController;
  final TextEditingController displayNameTextController;
  final TextEditingController photoUrlTextController;
  final TextEditingController fullNameTextController;
  final TextEditingController phoneNumberTextController;
  final String fullName;
  final String displayName;
  final String email;
  final String photoURL;
  final String phoneNumber;
  final bool isEditing;
  const WidgetProfile({
    Key? key,
    required this.emailTextController,
    required this.fullNameTextController,
    required this.displayNameTextController,
    required this.photoUrlTextController,
    required this.fullName,
    required this.displayName,
    required this.email,
    required this.photoURL,
    required this.phoneNumber,
    required this.phoneNumberTextController,
    required this.isEditing,
    // required this.onPressedEditProfile,
    // required this.onPressedLogOut,
  }) : super(key: key);
  @override
  _WidgetProfile createState() => _WidgetProfile();
}

class _WidgetProfile extends State<WidgetProfile> {
  bool isEditing = false;
  PersonRepository personRepository = PersonRepository();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    const double paddingBottom = 5;
    return SingleChildScrollView(
      reverse: true,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 1.5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    //color: Colors.blue,
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipOval(
                          child: Image.asset(
                            widget.photoURL,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFB2EBF2),
                            ),
                            child: widget.isEditing
                                ? IconButton(
                                    icon: const Icon(
                                      IconlyLight.image,
                                      size: 25,
                                    ),
                                    onPressed: () {},
                                  )
                                : const SizedBox(),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Center(
                    child: widget.isEditing
                        ? TextEditing(
                            isTitle: false,
                            content: widget.displayName,
                            title: '',
                            isEditingState: true,
                            isContainer: false,
                          )
                        : Text(
                            widget.displayName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
            ButtonProfile(
              title: 'Edit Profile',
              onPressed: () {},
              backgroundColor: const Color(0xFF3D405B),
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: paddingBottom),
              child: TextEditing(
                title: 'FullName:',
                content: widget.fullName,
                isEditingState: widget.isEditing,
                isTitle: true,
                isContainer: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: paddingBottom),
              child: TextEditing(
                title: 'Email:',
                content: widget.email,
                isEditingState: false,
                isTitle: true,
                isContainer: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: paddingBottom),
              child: TextEditing(
                title: 'Display name:',
                content: widget.displayName,
                isEditingState: widget.isEditing,
                isTitle: true,
                isContainer: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: paddingBottom),
              child: TextEditing(
                title: 'Phone Number:',
                content: widget.phoneNumber,
                isEditingState: widget.isEditing,
                isTitle: true,
                isContainer: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ButtonWidget(
                  sizeButton: Size(screenWidth / 2.5, screenHeight / 22),
                  textSize: 18,
                  radiusCircular: 24,
                  title: 'Home',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    context.pushRoute(const HomeRoute());
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: ButtonWidget(
                      sizeButton: Size(screenWidth / 2.5, screenHeight / 22),
                      textSize: 18,
                      radiusCircular: 24,
                      title: 'LogOut',
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      onPressed: () {
                        personRepository.signOut().then((_) {
                          context.pushRoute(const HomeRoute());
                          isAuthentication = false;
                          selectedIndex=0;
                      print('Thanh Cong');
                    }).catchError((error) {
                         // print(error);
                    });
                      },
                    )),
                const SizedBox(
                  width: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
