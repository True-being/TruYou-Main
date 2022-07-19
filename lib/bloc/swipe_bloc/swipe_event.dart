part of 'swipe_bloc.dart';

@freezed
abstract class SwipeEvent with _$SwipeEvent {
  const factory SwipeEvent.swipeRight(
      BuildContext context, TruYouUser user, DateTime? lastDate) = _SwipeRight;
  const factory SwipeEvent.swipeLeft(TruYouUser user, DateTime? lastDate) =
      _SwipeLeft;
}
