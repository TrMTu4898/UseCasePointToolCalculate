
part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileViewEvent extends ProfileEvent {
  final String uid;
  const ProfileViewEvent({
    required this.uid,
});
}

class ProfileEditEvent extends ProfileEvent {
  final String uid;
  const ProfileEditEvent({
    required this.uid,
  });
}

class ProfileUpdateEvent extends ProfileEvent {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;
  final String phoneNumber;
  final String fullName;

  const ProfileUpdateEvent({
    required this.fullName,
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [uid, email, displayName, photoUrl, phoneNumber];
}
