import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/utils/constants/constants.dart';
import 'package:truyou/components/utils/constants/keys.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:truyou/components/widgets/dialogs/custom_dialog.dart';

class ExceptionHandler {
  static void showErrorDialog(BuildContext context, FailureType exception) {
    if (exception == const FailureType.invalidEmailAdress()) {
      CustomDialog.showBasicDialog(
        context,
        Constants.INVALID_EMAIL_ADDRESS,
        Constants.INVALID_EMAIL_ADDRESS_MESSAGE,
        Routes.invalidEmailDialog,
      );
    } else if (exception == const FailureType.operationNotAllowedException()) {
      CustomDialog.showBasicDialog(
        context,
        Constants.OPERATION_NOT_ALLOWED,
        Constants.OPERATION_NOT_ALLOWED_MESSAGE,
        Routes.operationNotAllowedDialog,
      );
    } else if (exception == const FailureType.requiresRecentLoginException()) {
      CustomDialog.showBasicDialog(
        context,
        Constants.REQUIRES_RECENT_LOGIN,
        Constants.REQUIRES_RECENT_LOGIN_MESSAGE,
        Routes.requiresRecentLoginDialog,
      );
    } else if (exception == const FailureType.tooManyRequestsException()) {
      CustomDialog.showBasicDialog(
        context,
        Constants.TOO_MANY_REQUESTS,
        Constants.TOO_MANY_REQUESTS_MESSAGE,
        Routes.tooManyRequestDialog,
      );
    } else if (exception == const FailureType.userDisabledException()) {
      CustomDialog.showBasicDialog(
        context,
        Constants.USER_DISABLED,
        Constants.USER_DISABLED_MESSAGE,
        Routes.userDisabledDialog,
      );
    } else if (exception == const FailureType.userNotFoundException()) {
      CustomDialog.showBasicDialog(
        context,
        Constants.USER_NOT_FOUND_EXCEPTION,
        Constants.USER_NOT_FOUND_EXCEPTION_MESSAGE,
        Routes.userNotFoundDialog,
      );
    } else if (exception == const FailureType.weakPasswordException()) {
      CustomDialog.showBasicDialog(
        context,
        Constants.WEAK_PASSWORD,
        Constants.WEAK_PASSWORD_MESSAGE,
        Routes.weakPasswordException,
      );
    } else if (exception == const FailureType.wrongPasswordException()) {
      CustomDialog.showBasicDialog(
        context,
        Constants.WRONG_PASSWORD,
        Constants.WRONG_PASSWORD_MESSAGE,
        Routes.wrongEmailOrPasswordException,
      );
    } else {
      print('Unknown exception');
      CustomDialog.showBasicDialog(
        context,
        Constants.UNKNOWN_ERROR,
        Constants.UNKNOWN_ERROR_MESSAGE,
        Routes.unknownException,
      );
    }
  }

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
