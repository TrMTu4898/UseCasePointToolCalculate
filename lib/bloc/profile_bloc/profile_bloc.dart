import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/person.dart';
import '../../data/repositories/person_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final PersonRepository _personRepository;

  ProfileBloc({required PersonRepository personRepository})
      : _personRepository = personRepository,
        super(ProfileViewStateLoading()) {
    on<ProfileViewEvent>(_onProfileView);
    on<ProfileEditEvent>(_onProfileEdit);
    on<ProfileUpdateEvent>(_onProfileUpdate);
  }

  Future<void> _onProfileView(
      ProfileViewEvent event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      if (event.uid != null && event.uid.isNotEmpty) {
        final currentUser = await _personRepository.getUser(event.uid);
        if (currentUser != null) {
          emit(ProfileViewStateSuccess(person: currentUser));
        } else {
          emit(ProfileViewStateEmpty());
        }
      } else {
        emit(ProfileViewStateError(
          errorMessage: 'Invalid user ID',
        ));
      }
    } catch (_) {
      emit(ProfileViewStateError(
        errorMessage: 'Error occurred while viewing profile',
      ));
    }
  }



  Future<void> _onProfileEdit(
    ProfileEditEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final currentUser = await _personRepository.getUser(event.uid);
      if (currentUser != null) {
        emit(ProfileEditState(person: currentUser));
      } else {
        emit(ProfileEditStateEmpty());
      }
    } catch (_) {
      emit(const ProfileEditStateError(
          errorMessage: 'Error occurred while editing profile'));
    }
  }

  Future<void> _onProfileUpdate(
    ProfileUpdateEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileUpdateInProgressState());
      await _personRepository.updateUser(
        userID: event.uid,
        email: event.email,
        photoUrl: event.photoUrl,
        displayName: event.displayName,
        phoneNumber: event.phoneNumber,
        fullName: event.fullName,
      );

      final updatedPerson = Person(
        uid: event.uid,
        email: event.email,
        fullName: event.fullName,
        displayName: event.displayName,
        photoUrl: event.photoUrl,
        phoneNumber: event.phoneNumber,
      );

      emit(ProfileUpdateSuccessState(updatedPerson: updatedPerson));
    } catch (_) {
      emit(const ProfileUpdateError(
          errorMessage: 'Error occurred while updating profile'));
    }
  }
}
