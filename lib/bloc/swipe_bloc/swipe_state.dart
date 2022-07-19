part of 'swipe_bloc.dart';

@freezed
abstract class SwipeState with _$SwipeState{
  const factory SwipeState.initial() = _Initial;
  const factory SwipeState.loading() = _Loading;
  const factory SwipeState.swipeRightCompleted(bool hasMatched) = _SwipeRightCompleted;
  const factory SwipeState.swipeLeftCompleted() = _SwipeLeftCompleted;
  const factory SwipeState.failed(FailureType exception) = _Failed;
}