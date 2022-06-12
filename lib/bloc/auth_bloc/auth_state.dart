part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.unAuthenticatedAuthentication() =
      _UnAuthenticatedAuthentication;
  const factory AuthState.authenticatedAuthentication() =
      _AuthenticatedAuthentication;
  const factory AuthState.failed(FailureType exception) = _Failed;
}
