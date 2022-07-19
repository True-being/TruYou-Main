import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:truyou/bloc/auth_bloc/auth_bloc.dart';
import 'package:truyou/models/auth_user/truyou_user_model.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/user_repository.dart';

//TODO: Add Failure blocs to with: .thenThrow(FirebaseAuthException(code:'invalid-login'))

class UserRepositoryMock extends Mock implements UserRepository {}

final mockAuthUser =TruYouUser(
  firstName: 'James',
  lastName: 'Bekket',
  email: 'jamesbekket@gmail.com',
  isWalletVerified: true,
  birthDate: DateTime(1979, 01, 01),
  algoWalletAddress: '2HUGHU942HJGJU2894HG249G2HGH24H8GH928GH249HG7824G',
  aboutMe: 'I am a Snr Dev at Wookie, the new messaging platform.',
  lifeStyle: 'Pretty much live on my computer/metaverse',
  job: 'SNR DEV',
  companyName: 'Wookie',
  location: GeoPoint(27.0, 32.0),
  gender: 'Male',
  sexualOrientation: 'Straight',
  images: []
);

void main() {
  group('Auth Bloc Tests', () {
    late UserRepositoryMock _userRepositoryMock;

    setUp(() {
      _userRepositoryMock = UserRepositoryMock();
    });

    test(
        'User is logged out or is signing up for the first time when the app starts',
        () async* {
      final bloc = AuthBloc(userRepository: _userRepositoryMock);

      when(_userRepositoryMock.getCurrentUser()).thenAnswer((_) => null);

      bloc.add(const AuthEvent.appStarted());

      await expectLater(
          bloc,
          emitsInOrder([
            const AuthState.initial(),
            const AuthState.loading(),
            const AuthState.unAuthenticatedAuthentication()
          ]));
    });

    test('User is logged in when the app starts', () async* {
      final bloc = AuthBloc(userRepository: _userRepositoryMock);

      when(_userRepositoryMock.getCurrentUser()).thenAnswer((_) => any);
      bloc.add(const AuthEvent.appStarted());

      await expectLater(
          bloc,
          emitsInOrder([
            const AuthState.initial(),
            const AuthState.loading(),
            const AuthState.authenticatedAuthentication()
          ]));
    });

    test('User sign up', () async* {
      final bloc = AuthBloc(userRepository: _userRepositoryMock);

      when(_userRepositoryMock.signUpUserEmailAndPassword(
              mockAuthUser, [], 'password123'))
          .thenAnswer((_) async => any);

      bloc.add(AuthEvent.signUpButtonPressed(mockAuthUser, [], 'password123'));

      await expectLater(
          bloc,
          emitsInOrder([
            const AuthState.initial(),
            const AuthState.loading(),
            const AuthState.authenticatedAuthentication()
          ]));
    });

    test('User sign in', () async* {
      final bloc = AuthBloc(userRepository: _userRepositoryMock);

      when(_userRepositoryMock.signInUserEmailAndPassword(
              'jamesbarker@gmail.com', 'password123'))
          .thenAnswer((_) async => any);

      bloc.add(AuthEvent.signInButtonPressed(
          'jamesbarker@gmail.com', 'password123'));

      await expectLater(
          bloc,
          emitsInOrder([
            const AuthState.initial(),
            const AuthState.loading(),
            const AuthState.authenticatedAuthentication()
          ]));
    });

    test('User sign out', () async* {
      final bloc = AuthBloc(userRepository: _userRepositoryMock);

      when(_userRepositoryMock.signOut()).thenAnswer((_) async => null);

      bloc.add(AuthEvent.userLogOut());

      await expectLater(
          bloc,
          emitsInOrder([
            const AuthState.initial(),
            const AuthState.loading(),
            const AuthState.unAuthenticatedAuthentication()
          ]));
    });

    test('Reset Users password', () async* {
      final bloc = AuthBloc(userRepository: _userRepositoryMock);

      when(_userRepositoryMock.resetPassword('jamesbarker@gmail.com'))
          .thenAnswer((_) async => null);

      bloc.add(AuthEvent.resetPassword('jamesbarker@gmail.com'));

      await expectLater(
          bloc,
          emitsInOrder([
            const AuthState.initial(),
            const AuthState.unAuthenticatedAuthentication()
          ]));
    });
  });
}
