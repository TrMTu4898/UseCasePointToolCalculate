import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../router/auto_router.gr.dart';
import '../../screens/authentication/login_screen.dart';
import '../../screens/home_view_screen.dart';
import '../button/button_profile.dart';
import '../button/button_widget.dart';
import '../text/text_editing.dart';
import '../../data/repositories/person_repository.dart';

class WidgetProfile extends StatefulWidget {
  late String displayName;
  final String email;
  late String photoURL;
  late String phoneNumber;
  late String fullName;
  bool isEditing;
  final void Function() onPressedEditProfile;
  final void Function() onPressedSaveProfile;
  final void Function() onPressedChangeImage;
  final void Function(String) onChangedFullName;
  final void Function(String) onChangedPhoneNumber;
  final void Function(String) onChangedDisplayName;
  WidgetProfile({
    Key? key,
    required this.displayName,
    required this.fullName,
    required this.email,
    required this.photoURL,
    required this.phoneNumber,
    required this.isEditing,
    required this.onPressedEditProfile,
    required this.onPressedSaveProfile,
    required this.onPressedChangeImage,
    required this.onChangedDisplayName,
    required this.onChangedFullName,
    required this.onChangedPhoneNumber,
  }) : super(key: key);
  @override
  _WidgetProfile createState() => _WidgetProfile();
}

class _WidgetProfile extends State<WidgetProfile> {
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
          maxHeight: MediaQuery.of(context).size.height / 1.2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
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
                            child: Image.network(
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
                                      onPressed: widget.onPressedChangeImage,
                                    )
                                  : const SizedBox(),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
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
              title: widget.isEditing ? 'Save' : 'Edit Profile',
              onPressed: widget.isEditing
                  ? widget.onPressedSaveProfile
                  : widget.onPressedEditProfile,
              backgroundColor: const Color(0xFF3D405B),
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: paddingBottom),
              child: TextEditing(
                title: 'Email:',
                content: widget.email,
                isEditingState: false,
                isTitle: true,
                isContainer: true,
                onChanged: (value){},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: paddingBottom),
              child: TextEditing(
                title: 'Full name:',
                content: widget.fullName,
                isEditingState: widget.isEditing,
                isTitle: true,
                isContainer: true,
                onChanged: widget.onChangedFullName,
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
                onChanged: widget.onChangedDisplayName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: paddingBottom),
              child: TextEditing(
                title: 'Phone number:',
                content: widget.phoneNumber,
                isEditingState: widget.isEditing,
                isTitle: true,
                isContainer: true,
                onChanged: widget.onChangedPhoneNumber,
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
                      selectedIndex = 0;
                      widget.isEditing = false;
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
