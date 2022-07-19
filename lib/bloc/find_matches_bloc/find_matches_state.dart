part of 'find_matches_bloc.dart';

@freezed
abstract class FindMatchesState with _$FindMatchesState {
  const factory FindMatchesState.initial() = _Initial;
  const factory FindMatchesState.loading() = _Loading;
  const factory FindMatchesState.success(List<TruYouUser> users) = _Success;
  const factory FindMatchesState.failed(FailureType exception) = _Failed;
}
