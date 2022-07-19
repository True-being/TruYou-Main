part of 'find_matches_bloc.dart';

@freezed
abstract class FindMatchesEvent with _$FindMatchesEvent {
  const factory FindMatchesEvent.loadMoreMatches(
      DateTime? lastDate, Cursor cursor) = _LoadMoreMatches;
}
