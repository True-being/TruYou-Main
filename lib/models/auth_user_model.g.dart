// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthUser _$$_AuthUserFromJson(Map<String, dynamic> json) => _$_AuthUser(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      isWalletVerified: json['isWalletVerified'] as bool?,
      birthDate: DateTime.parse(json['birthDate'] as String),
      algoWalletAddress: json['algoWalletAddress'] as String?,
      aboutMe: json['aboutMe'] as String?,
      lifeStyle: json['lifeStyle'] as String?,
      job: json['job'] as String?,
      companyName: json['companyName'] as String?,
      location:
          const GeoPointConverter().fromJson(json['location'] as GeoPoint?),
      gender: json['gender'] as String?,
      sexualOrientation: json['sexualOrientation'] as String?,
    );

Map<String, dynamic> _$$_AuthUserToJson(_$_AuthUser instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'isWalletVerified': instance.isWalletVerified,
      'birthDate': instance.birthDate.toIso8601String(),
      'algoWalletAddress': instance.algoWalletAddress,
      'aboutMe': instance.aboutMe,
      'lifeStyle': instance.lifeStyle,
      'job': instance.job,
      'companyName': instance.companyName,
      'location': const GeoPointConverter().toJson(instance.location),
      'gender': instance.gender,
      'sexualOrientation': instance.sexualOrientation,
    };
