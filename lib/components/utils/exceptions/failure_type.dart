import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure_type.freezed.dart';

@freezed
abstract class FailureType with _$FailureType {
  const factory FailureType.unknownException(Object error) = _UnknownException;
  const factory FailureType.alreadyHasAccountException() =
      _AlreadyHasAccountNullException;
  const factory FailureType.userAlreadySignedInException() =
      _UserAlreadySignedInException;
  const factory FailureType.wrongPasswordException() = _WrongPasswordException;
  const factory FailureType.userNotFoundException() = _UserNotFoundException;
  const factory FailureType.tooManyRequestsException() =
      _TooManyRequestsException;
  const factory FailureType.emailAlreadyInUseException() =
      _EmailAlreadyInUseException;
  const factory FailureType.weakPasswordException() = _WeakPasswordException;
  const factory FailureType.invalidEmailAdress() = _InvalidEmailAdresss;
  const factory FailureType.requiresRecentLoginException() =
      _RequiresRecentLoginException;
  const factory FailureType.userDisabledException() = _UserDisabledException;
  const factory FailureType.operationNotAllowedException() =
      _OperationNotAllowedException;
  const factory FailureType.invalidEmailException() = _InvalidEmailException;
}
