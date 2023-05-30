
part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileViewStateLoading extends ProfileState {}

class ProfileViewStateSuccess extends ProfileState {
  final Person person;

  const ProfileViewStateSuccess({required this.person});

  @override
  List<Object?> get props => [person];
}

class ProfileViewStateEmpty extends ProfileState {}

class ProfileViewStateError extends ProfileState {
  final String errorMessage;

  const ProfileViewStateError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ProfileEditState extends ProfileState {
  final Person person;

  const ProfileEditState({required this.person});

  @override
  List<Object?> get props => [person];
}

class ProfileEditStateEmpty extends ProfileState {}

class ProfileEditStateError extends ProfileState {
  final String errorMessage;

  const ProfileEditStateError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ProfileUpdateInProgressState extends ProfileState {}

class ProfileUpdateSuccessState extends ProfileState {
  final Person updatedPerson;

  const ProfileUpdateSuccessState({required this.updatedPerson});

  @override
  List<Object?> get props => [updatedPerson];
}

class ProfileUpdateError extends ProfileState {
  final String errorMessage;

  const ProfileUpdateError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
