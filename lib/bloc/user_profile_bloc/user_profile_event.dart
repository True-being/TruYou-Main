part of 'user_profile_bloc.dart';

@freezed
abstract class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.loadMyProfile() = _LoadMyProfile;
  const factory UserProfileEvent.loadedProfile(TruYouUser user) =
      _LoadedProfile;
}
