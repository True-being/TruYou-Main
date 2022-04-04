//This is a temporary class used for validation and the flow process

import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class AuthUser {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime birthDate;
  final String password;
  final List<File?>? photos;
  final String? algoWalletAddress;
  final String? aboutMe;
  final String? lifeStyle;
  final String? job;
  final String? companyName;
  final LatLng? location;
  final String? gender;
  final String? sexualOrientation;

  AuthUser(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.birthDate,
      required this.password,
      required this.photos,
      required this.algoWalletAddress,
      required this.aboutMe,
      required this.lifeStyle,
      required this.job,
      required this.companyName,
      required this.location,
      required this.gender,
      required this.sexualOrientation});
}
