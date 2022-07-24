part of 'gender_age_bloc.dart';

@freezed
class GenderAgeState with _$GenderAgeState {
  const factory GenderAgeState.initial() = _Initial;
  const factory GenderAgeState.loading() = _Loading;
  const factory GenderAgeState.success() = _Success;
  const factory GenderAgeState.failed(FailureType exception) = _Failed;
}
