part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable{
  const ProfileEvent();
  @override
  List<Object> get props =>[];
}
class ProfileViewEvent extends ProfileEvent{}

class ProfileEditEvent extends ProfileEvent{}

class ProfileUpdateEvent extends ProfileEvent{
  final String fullName;
  final String displayName;
  final String photoUrl;
  const ProfileUpdateEvent({
    required this.fullName,
    required this.displayName,
    required this.photoUrl,
});
  @override
  List<Object> get props => [fullName,displayName,photoUrl];
}
