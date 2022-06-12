part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStarted() = _AppStarted;
  const factory AuthEvent.signInButtonPressed(String email, String password) =
      _SignInButtonPressed;
  const factory AuthEvent.signUpButtonPressed(
      AuthUser user, List<File> photos, String password) = _SignUpButtonPressed;
  const factory AuthEvent.resetPassword(String email) = _ResetPassword;
  const factory AuthEvent.userLogOut() = _UserLogOut;
}
