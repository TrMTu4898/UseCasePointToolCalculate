import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/person.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class  ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  final Person _person;
  ProfileBloc({
    required Person person
}) : _person = person,
  super(ProfileViewState()){
    on<ProfileEditEvent>(_onProfileEdit);
    on<ProfileUpdateEvent>(_onProfileUpdate);
  }

  Future<void> _onProfileEdit(
      ProfileEditEvent event, Emitter<ProfileState> emit
      ) async{
    try{

    }catch(_){

    }
  }

  Future<void> _onProfileUpdate(
      ProfileUpdateEvent event, Emitter<ProfileState> emit
      ) async {

  }
}