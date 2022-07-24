part of 'my_matches_bloc.dart';

@freezed
abstract class MyMatchesState with _$MyMatchesState {
  const factory MyMatchesState.initial() = _Initial;
  const factory MyMatchesState.loading() = _Loading;
  const factory MyMatchesState.success(DocumentSnapshot? documentSnapshot,
      List<TruYouUser> users, List<String> locations) = _Success;
  const factory MyMatchesState.failed(FailureType exception) = _Failed;
}
