part of 'gender_age_bloc.dart';

@freezed
class GenderAgeEvent with _$GenderAgeEvent {
  const factory GenderAgeEvent.updateGenderPreference(String genderPreference) =
      _UpdateGenderPreference;
  const factory GenderAgeEvent.updateAgePreferences(
      DateTime lowerAge, DateTime upperAge) = _UpdateAgePreferences;
}
