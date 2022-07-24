part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.updateLocation(GeoPoint location) =
      _UpdateLocation;
  const factory LocationEvent.updateMatchingDistance(int distance) =
      _UpdateMatchingDistance;
  const factory LocationEvent.updateRadiusDistanceSelected(
      bool isRadiusDistanceSelected) = _UpdateRadiusDistanceSelected;
}
