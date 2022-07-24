part of 'unmatch_bloc.dart';

@freezed
class UnmatchEvent with _$UnmatchEvent {
  const factory UnmatchEvent.unmatch(TruYouUser matchedUser) = _Unmatch;
}
