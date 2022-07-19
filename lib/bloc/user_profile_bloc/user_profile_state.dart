part of 'user_profile_bloc.dart';

@freezed
abstract class UserProfileState with _$UserProfileState{
  const factory UserProfileState.initial() = _Initial;
  const factory UserProfileState.loading() = _Loading;
  const factory UserProfileState.success(TruYouUser user, String location) = _Success;
  const factory UserProfileState.failed(FailureType exception) = _Failed;
}