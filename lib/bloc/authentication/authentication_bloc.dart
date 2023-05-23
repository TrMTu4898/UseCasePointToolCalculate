import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../data/models/person.dart';
import '../../data/repositories/person_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'form_bloc/signup_form_bloc.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final PersonRepository _personRepository;
  AuthenticationBloc({required PersonRepository personRepository})
      : _personRepository = personRepository,
        super(AuthenticationInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LogInRequested>(_onLogInRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<ClickButtonEvent>((event, emit) {
      emit(ClickButton());
    }
    );
    on<SignUpEvent>(_onSignUp);
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
    }catch(e){
      print('error$e');
      emit(const AuthenticationUnauthenticated(error: "Login unsuccessful!!"));
    }

  }
  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthenticationState> emit)
  async {
      await _personRepository.signOut();
      emit(Unauthenticated());
  }

  Future<void> _onSignUp( SignUpEvent event, Emitter<AuthenticationState> emit) async{
    emit(SignUpStateLoading());
    try {
      final User? user = await _personRepository.signUp(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        // Đăng ký thành công, tạo đối tượng Person và cập nhật trạng thái
        final Person currentUser = Person(
          displayName: event.fullName,
            email: event.email,
            fullName: event.fullName,
            phoneNumber: '',
            photoUrl: 'https://fiverr-res.cloudinary.com/t_mobile_web_2,q_auto,f_auto/gigs/223707076/original/56c8ceb28a6e47c9ca11b2213c09cb7728461541.png?fbclid=IwAR315H9zjgoxqiiONT4Or5lUTG96ipSBfV7SQEv3wtJuwlBRJXcbMnv3QMI',
            uid: user.uid,
        );
        Fluttertoast.showToast(msg: 'SignUp success');
        emit(SignUpStateSuccess(currentUser: currentUser));
      } else {
        // Đăng ký không thành công
        print('123');
        emit(SignUpStateFailure());
      }
    } catch (e) {
      print('Error $e');
      emit(SignUpStateFailure());
    }
  }
}
