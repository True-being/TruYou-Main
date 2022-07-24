part of 'unmatch_bloc.dart';

@freezed
class UnmatchState with _$UnmatchState {
  const factory UnmatchState.initial() = _Initial;
  const factory UnmatchState.loading() = _Loading;
  const factory UnmatchState.success() = _Success;
  const factory UnmatchState.failed(FailureType exception) = _Failed;
}
