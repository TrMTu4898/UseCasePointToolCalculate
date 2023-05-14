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
  @override
  List<Object?> get props => [];
}

class Unauthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}