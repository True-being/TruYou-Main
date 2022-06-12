import 'package:firebase_auth/firebase_auth.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';

class ExceptionHandler {
  static FailureType catchErrors(dynamic _exception) {
    //TODO: Add custom errors here
    return FailureType.unknownException(_exception);
  }

  static FailureType catchFirebaseAuthExceptions(FirebaseAuthException _e) {
    if (_e.code == 'invalid-email') {
      return FailureType.invalidEmailException();
    } else if (_e.code == 'user-disabled') {
      return FailureType.userDisabledException();
    } else if (_e.code == 'user-not-found') {
      return FailureType.userNotFoundException();
    } else if (_e.code == 'wrong-password') {
      return FailureType.wrongPasswordException();
    } else if (_e.code == 'email-already-in-use') {
      return FailureType.emailAlreadyInUseException();
    } else if (_e.code == 'operation-not-allowed') {
      return FailureType.operationNotAllowedException();
    } else if (_e.code == 'weak-password') {
      return FailureType.weakPasswordException();
    } else if (_e.code == 'requires-recent-login') {
      return FailureType.requiresRecentLoginException();
    } else if (_e.code == 'too-many-requests') {
      return FailureType.tooManyRequestsException();
    } else {
      return FailureType.unknownException(_e);
    }
  }
}
