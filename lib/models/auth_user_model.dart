import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  const AuthUser._();

  const factory AuthUser({
    required String firstName,
    required String lastName,
    required String email,
    required bool? isWalletVerified,
    required DateTime birthDate,
    required String? algoWalletAddress,
    required String? aboutMe,
    required String? lifeStyle,
    required String? job,
    required String? companyName,
    @GeoPointConverter() required GeoPoint? location,
    required String? gender,
    required String? sexualOrientation,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, Object?> json) =>
      _$AuthUserFromJson(json);
}

class GeoPointConverter implements JsonConverter<GeoPoint?, GeoPoint?> {
  const GeoPointConverter();

  @override
  GeoPoint? fromJson(GeoPoint? geoPoint) {
    return geoPoint;
  }

  @override
  GeoPoint? toJson(GeoPoint? geoPoint) => geoPoint;
}
