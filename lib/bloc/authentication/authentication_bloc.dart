import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../data/models/person.dart';
import '../../data/repositories/person_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../my_app_bloc.dart';
import '../profile_bloc/profile_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'form_bloc/signup_form_bloc.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final PersonRepository _personRepository;
  final ProfileBloc? _profileBloc;
  AuthenticationBloc({required PersonRepository personRepository, ProfileBloc? profileBloc})
      : _personRepository = personRepository,
        _profileBloc = profileBloc,
        super(AuthenticationInitial()) {
    on<LogInRequested>(_onLogInRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<ClickButtonEvent>((event, emit) {
      emit(ClickButton());
    }
    );
    on<CheckLoggedIn>(_onCheckLoggedIn);
    on<SignUpEvent>(_onSignUp);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<SignInWithFacebook>(_onSignInWithFacebook);
    // on<SignOutWithGoogle>(_onSignOutWithGoogle);
    // on<SignOutWithFacebook>(_onSignOutWithFacebook);
  }
  Future<void> _onLogInRequested(
      LogInRequested event, Emitter<AuthenticationState> emit)
  async {
    emit(AuthenticationLoading());
    try{
      final String? uid = await _personRepository.signIn(email: event.email, password: event.password) ;
      Fluttertoast.showToast(msg: 'Login success');
      emit(AuthenticationAuthenticated(uid: uid));
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

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(SignUpStateLoading());
    try {
      final Person? person = await _personRepository.signUp(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      );
      if (person != null) {
        emit(SignUpStateSuccess(currentUser: person));
      } else {
        emit(SignUpStateFailure());
      }
    } catch (e) {
      print('Error $e');
      emit(SignUpStateFailure());
    }
  }
  Future<void> _onCheckLoggedIn(CheckLoggedIn event, Emitter<AuthenticationState> emit) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final String uid = user.uid;
        emit(AuthenticationAuthenticated(uid: uid));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      print('Error $e');
      emit(Unauthenticated());
    }
  }

  Future<void> _onSignInWithGoogle(
      SignInWithGoogle event,
      Emitter<AuthenticationState> emit,
      ) async {
    // Xử lý đăng nhập bằng Google
    try {
      final UserCredential userCredential = await _personRepository.signInWithGoogle();

      if (userCredential.user != null) {
        final User user = userCredential.user!;
        emit(AuthenticationAuthenticated(uid: user.uid));
      } else {

        emit(const AuthenticationUnauthenticated(error: "Failed to sign in with Google"));
      }
    } catch (e) {
      print('Error $e');

      emit(const AuthenticationUnauthenticated(error: "Failed to sign in with Google"));
    }
  }

  Future<void> _onSignInWithFacebook(
      SignInWithFacebook event,
      Emitter<AuthenticationState> emit,
      ) async {
    try {
      final UserCredential userCredential = await _personRepository.signInWithFacebook();
      if (userCredential.user != null) {
        final User user = userCredential.user!;
        emit(AuthenticationAuthenticated(uid: user.uid));
      } else {
        emit(const AuthenticationUnauthenticated(error: "Failed to sign in with Facebook"));
      }
    } catch (e) {
      print('Error $e');
      emit(const AuthenticationUnauthenticated(error: "Failed to sign in with Facebook"));
    }
  }

  // Future<void> _onSignOutWithGoogle(
  //     SignOutWithGoogle event,
  //     Emitter<AuthenticationState> emit,
  //     ) async {
  //   // Xử lý đăng xuất Google
  //   try {
  //     await _personRepository.signOutWithGoogle();
  //     // Emit sự kiện đăng xuất thành công
  //     emit(Unauthenticated());
  //   } catch (e) {
  //     print('Error $e');
  //     // Emit sự kiện đăng xuất thất bại và hiển thị lỗi
  //     emit(const AuthenticationUnauthenticated(error: "Failed to sign out with Google"));
  //   }
  // }

  // Future<void> _onSignOutWithFacebook(
  //     SignOutWithFacebook event,
  //     Emitter<AuthenticationState> emit,
  //     ) async {
  //   // Xử lý đăng xuất Facebook
  //   try {
  //     await _personRepository.signOutWithFacebook();
  //     // Emit sự kiện đăng xuất thành công
  //     emit(Unauthenticated());
  //   } catch (e) {
  //     print('Error $e');
  //     // Emit sự kiện đăng xuất thất bại và hiển thị lỗi
  //     emit(const AuthenticationUnauthenticated(error: "Failed to sign out with Facebook"));
  //   }
  // }

}

