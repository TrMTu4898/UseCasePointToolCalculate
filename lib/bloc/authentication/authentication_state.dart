part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}
//start
class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
class AuthenticationLoading extends AuthenticationState{
  @override
  List<Object?> get props => [];
}

class AuthenticationAuthenticated extends AuthenticationState {
  final Person user;
  const AuthenticationAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthenticationUnauthenticated extends AuthenticationState {
  final String error;

  const AuthenticationUnauthenticated({required this.error});

  String getError() {
    return error;
  }

  @override
  List<Object> get props => [error];
}

class Unauthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class IsAuthenticationState {
  final bool isAuthenticated;
  final Person user;

  IsAuthenticationState({required this.isAuthenticated, required this.user});

  @override
  List<Object?> get props => [isAuthenticated];
}

class ClickButton extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class SignUpStateLoading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class SignUpStateSuccess extends AuthenticationState {
  final Person currentUser;
  const SignUpStateSuccess({
    required this.currentUser
});

  @override
  List<Object?> get props => [];
}

class SignUpStateFailure extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
