part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LogInRequested extends AuthenticationEvent {
  final String email;
  final String password;
  const LogInRequested({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'LoginRequested { email: $email }';
}

class LogoutRequested extends AuthenticationEvent {
  const LogoutRequested();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LogoutRequested';
}

class ClickButtonEvent extends AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String fullName;
  const SignUpEvent({
    required this.confirmPassword,
    required this.password,
    required this.email,
    required this.fullName,
  });
  @override
  List<Object> get props => [email, password, confirmPassword, fullName];
}

class ViewProfileEvent extends AuthenticationEvent {}

class EditProfileEvent extends AuthenticationEvent {}

class CheckLoggedIn extends AuthenticationEvent{}

class SignInWithGoogle extends AuthenticationEvent{}

class SignInWithFacebook extends AuthenticationEvent{}
class SignOutWithGoogle extends AuthenticationEvent{}
class SignOutWithFacebook extends AuthenticationEvent{}

