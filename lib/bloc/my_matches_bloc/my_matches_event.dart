part of 'my_matches_bloc.dart';

@freezed
abstract class MyMatchesEvent with _$MyMatchesEvent {
  const factory MyMatchesEvent.loadMoreMatches(
          DocumentSnapshot? documentSnapshot, List<TruYouUser> previousUsers) =
      _LoadMoreMatches;
}
