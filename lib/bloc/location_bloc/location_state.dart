part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;
  const factory LocationState.success() = _Success;
  const factory LocationState.failed(FailureType exception) = _Failed;
}
