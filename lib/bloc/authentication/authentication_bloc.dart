import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:usecasepointstool/data/models/person.dart';
import 'package:usecasepointstool/data/repositories/person_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final PersonRepository _personRepository;
  AuthenticationBloc({required PersonRepository personRepository})
      : _personRepository = personRepository,
        super(AuthenticationInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LogInRequested>(_onLogInRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }
  Future<void> _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit)
  async {
    try{
      final isSingedIn = await _personRepository.isSignedIn();
      if(isSingedIn){
        final user = await _personRepository.getUser();
        if(user != null){
          emit(AuthenticationAuthenticated(user: user));
        }
        else{
          emit(const AuthenticationUnauthenticated(error: "Login unsuccessful!!"));
        }
      }
      else{
        emit(const AuthenticationUnauthenticated(error: "Login unsuccessful!!"));
      }
    }catch(_){
      emit(const AuthenticationUnauthenticated(error: "Login unsuccessful!!"));
    }
  }
  Future<void> _onLogInRequested(
      LogInRequested event, Emitter<AuthenticationState> emit)
  async {
    emit(AuthenticationLoading());
    try{
      final Person user = (await _personRepository.signIn(email: event.email, password: event.password)) as Person;
      Fluttertoast.showToast(msg: 'Login success');
      emit(AuthenticationAuthenticated(user: user));
    }catch(_){
      emit(const AuthenticationUnauthenticated(error: "Login unsuccessful!!"));
    }

  }
  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthenticationState> emit)
  async {
      await _personRepository.signOut();
      emit(Unauthenticated());
  }
}
