import 'dart:io';

import 'package:truyou/components/utils/exceptions/exception_handler.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthState.initial()) {
    on<_AppStarted>(_appStarted);
    on<_SignInButtonPressed>(_signInButtonPressed);
    on<_SignUpButtonPressed>(_signUpButtonPressed);
    on<_ResetPassword>(_resetPassword);
    on<_UserLogOut>(_userLogOut);
  }

  Future<void> _signInButtonPressed(
      _SignInButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());
    await Future.delayed(Duration(seconds: 2));
    try {
      final User? user = await userRepository.signInUserEmailAndPassword(
        event.email,
        event.password,
      );

      if (user != null) {
        emit(AuthState.authenticatedAuthentication());
      } else {
        emit(AuthState.unAuthenticatedAuthentication());
      }
    } on FirebaseAuthException catch (_e) {
      print(_e);

      emit(AuthState.failed(ExceptionHandler.catchFirebaseAuthExceptions(_e)));
    } catch (_e) {
      print(_e);
      emit(AuthState.failed(ExceptionHandler.catchErrors(_e)));
    }
  }

  Future<void> _signUpButtonPressed(
      _SignUpButtonPressed event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final user = await userRepository.signUpUserEmailAndPassword(
          event.user, event.photos, event.password);

      if (user != null) {
        emit(const AuthState.authenticatedAuthentication());
      } else {
        emit(AuthState.unAuthenticatedAuthentication());
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthState.failed(ExceptionHandler.catchFirebaseAuthExceptions(e)));
    } catch (e) {
      emit(AuthState.failed(FailureType.unknownException(e)));
    }
  }

  Future<void> _appStarted(_AppStarted event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    //Delay for loading screen
    await Future.delayed(Duration(seconds: 2));
    try {
      User? user = userRepository.getCurrentUser();
      //Checks if user is signed in
      if (user != null) {
        emit(const AuthState.authenticatedAuthentication());
      } else {
        emit(const AuthState.unAuthenticatedAuthentication());
      }
    } on FirebaseAuthException catch (_e) {
      emit(AuthState.failed(ExceptionHandler.catchFirebaseAuthExceptions(_e)));
    } catch (_e) {
      emit(AuthState.failed(ExceptionHandler.catchErrors(_e)));
    }
  }

  Future<void> _resetPassword(
      _ResetPassword event, Emitter<AuthState> emit) async {
    try {
      await userRepository.resetPassword(event.email);
      emit(const AuthState.unAuthenticatedAuthentication());
    } on FirebaseAuthException catch (_e) {
      emit(AuthState.failed(ExceptionHandler.catchFirebaseAuthExceptions(_e)));
    } catch (_e) {
      emit(AuthState.failed(ExceptionHandler.catchErrors(_e)));
    }
  }

  Future<void> _userLogOut(_UserLogOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await userRepository.signOut();
      emit(const AuthState.unAuthenticatedAuthentication());
    } on FirebaseAuthException catch (_e) {
      emit(AuthState.failed(ExceptionHandler.catchFirebaseAuthExceptions(_e)));
    } catch (_e) {
      emit(AuthState.failed(ExceptionHandler.catchErrors(_e)));
    }
  }
}
