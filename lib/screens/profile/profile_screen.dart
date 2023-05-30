import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecasepointstool/router/auto_router.gr.dart';
import '../../bloc/authentication/authentication_bloc.dart';
import '../../data/models/person.dart';
import '../../data/repositories/person_repository.dart';
import '../../bloc/my_app_bloc.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';
import '../../layout/profile_layout.dart';
import '../../widgets/widgets_screen/widget_profile.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

@RoutePage()
class ProfileScreen extends StatefulWidget {
  final ProfileBloc profileBloc;
  final AuthenticationBloc authenticationBloc;
  const ProfileScreen(
      {Key? key,
      required this.profileBloc,
      required this.authenticationBloc})
      : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;
  late PersonRepository personRepository;
  @override
  void initState() {
    super.initState();
    personRepository = PersonRepository();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _displayName = '';
  String _email = '';
  String _photoUrl = '';
  String _phoneNumber = '';
  String _fullName = '';
  String _displayNameUpdate = '';
  String _photoUrlUpdate = '';
  String _phoneNumberUpdate = '';
  String _fullNameUpdate = '';
  Future<void> onPressedChangeImage() async {
    try {
      final imagePicker = ImagePicker();
      final XFile? imageFile =
      await imagePicker.pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        File file = File(imageFile.path);

        String fileName = path.basename(file.path);
        firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
        firebase_storage.Reference ref = storage.ref().child('images').child(fileName);
        firebase_storage.UploadTask uploadTask = ref.putFile(file);
        String newPhotoUrl = await (await uploadTask).ref.getDownloadURL();
          _photoUrlUpdate = newPhotoUrl;
      }
      else{
        _photoUrlUpdate = _photoUrl;
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }
  void _resetScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ProfileScreen(
          profileBloc: widget.profileBloc,
          authenticationBloc: widget.authenticationBloc,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;

    return BlocProvider(
      create: (context) => widget.authenticationBloc,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xff50C2C9),
          automaticallyImplyLeading: false,
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
              Positioned.fill(
                child: Center(
                  child: SingleChildScrollView(
                    reverse: true,
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      bloc: widget.authenticationBloc,
                      builder: (context, state) {
                        String uid = '';
                        if(state is AuthenticationAuthenticated){
                         uid = state.uid.toString();
                        }
                        return BlocBuilder<ProfileBloc,ProfileState>(
                          bloc: widget.profileBloc,
                          builder: (context,state) {

                            if(state is ProfileViewStateLoading){
                              widget.profileBloc.add(ProfileViewEvent(uid:uid));
                            }
                            if(state is ProfileViewStateSuccess){
                              _email=state.person.email;
                              _displayName = state.person.displayName;
                              _fullName = state.person.fullName;
                              _phoneNumber = state.person.phoneNumber;
                              _photoUrl = state.person.photoUrl;
                            } else if( state is ProfileEditState){
                              isEditing = true;
                            } else if(state is ProfileUpdateSuccessState ){
                              isEditing = false;
                              print(_photoUrlUpdate);
                            } return WidgetProfile(
                              onPressedEditProfile: (){
                                widget.profileBloc.add(ProfileEditEvent(uid: uid));
                              },
                              onPressedChangeImage: onPressedChangeImage,
                              onChangedDisplayName: (value){
                                if(value!=null){
                                  _displayNameUpdate = value;
                                  _displayName = value;
                                }else{
                                  _displayNameUpdate = _displayName;
                                }
                              },
                              onChangedFullName: (value){
                                if(value!=null){
                                  _fullNameUpdate = value;
                                  _fullName = value;
                                }else{
                                  _fullNameUpdate = _fullName;
                                }
                              },
                              onChangedPhoneNumber: (value){
                                if(value!=null){
                                  _phoneNumberUpdate = value;
                                  _phoneNumber =value;
                                }else{
                                  _phoneNumberUpdate = _phoneNumber;
                                }
                              },
                              onPressedSaveProfile: (){
                                widget.profileBloc.add(ProfileUpdateEvent(
                                  fullName: _fullNameUpdate,
                                  uid: uid,
                                  email: _email,
                                  displayName: _displayNameUpdate,
                                  photoUrl:_photoUrlUpdate,
                                  phoneNumber: _phoneNumberUpdate,
                                ));
                                context.router.popAndPush(ProfileRoute(profileBloc: widget.profileBloc, authenticationBloc: widget.authenticationBloc));
                              },
                              email: _email,
                              fullName: _fullName,
                              displayName: _displayName,
                              photoURL: _photoUrl,
                              isEditing: isEditing,
                              phoneNumber: _phoneNumber,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              /*---------------------Widget-------------------------*/
            ],
          ),
        ),
      ),
    );
  }
}
