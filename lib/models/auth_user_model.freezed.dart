// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) {
  return _AuthUser.fromJson(json);
}

/// @nodoc
class _$AuthUserTearOff {
  const _$AuthUserTearOff();

  _AuthUser call(
      {required String firstName,
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
      required String? sexualOrientation}) {
    return _AuthUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      isWalletVerified: isWalletVerified,
      birthDate: birthDate,
      algoWalletAddress: algoWalletAddress,
      aboutMe: aboutMe,
      lifeStyle: lifeStyle,
      job: job,
      companyName: companyName,
      location: location,
      gender: gender,
      sexualOrientation: sexualOrientation,
    );
  }

  AuthUser fromJson(Map<String, Object?> json) {
    return AuthUser.fromJson(json);
  }
}

/// @nodoc
const $AuthUser = _$AuthUserTearOff();

/// @nodoc
mixin _$AuthUser {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool? get isWalletVerified => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  String? get algoWalletAddress => throw _privateConstructorUsedError;
  String? get aboutMe => throw _privateConstructorUsedError;
  String? get lifeStyle => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint? get location => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get sexualOrientation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserCopyWith<AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      String email,
      bool? isWalletVerified,
      DateTime birthDate,
      String? algoWalletAddress,
      String? aboutMe,
      String? lifeStyle,
      String? job,
      String? companyName,
      @GeoPointConverter() GeoPoint? location,
      String? gender,
      String? sexualOrientation});
}

/// @nodoc
class _$AuthUserCopyWithImpl<$Res> implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  final AuthUser _value;
  // ignore: unused_field
  final $Res Function(AuthUser) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? isWalletVerified = freezed,
    Object? birthDate = freezed,
    Object? algoWalletAddress = freezed,
    Object? aboutMe = freezed,
    Object? lifeStyle = freezed,
    Object? job = freezed,
    Object? companyName = freezed,
    Object? location = freezed,
    Object? gender = freezed,
    Object? sexualOrientation = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isWalletVerified: isWalletVerified == freezed
          ? _value.isWalletVerified
          : isWalletVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      algoWalletAddress: algoWalletAddress == freezed
          ? _value.algoWalletAddress
          : algoWalletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutMe: aboutMe == freezed
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String?,
      lifeStyle: lifeStyle == freezed
          ? _value.lifeStyle
          : lifeStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      job: job == freezed
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      sexualOrientation: sexualOrientation == freezed
          ? _value.sexualOrientation
          : sexualOrientation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) then) =
      __$AuthUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      String email,
      bool? isWalletVerified,
      DateTime birthDate,
      String? algoWalletAddress,
      String? aboutMe,
      String? lifeStyle,
      String? job,
      String? companyName,
      @GeoPointConverter() GeoPoint? location,
      String? gender,
      String? sexualOrientation});
}

/// @nodoc
class __$AuthUserCopyWithImpl<$Res> extends _$AuthUserCopyWithImpl<$Res>
    implements _$AuthUserCopyWith<$Res> {
  __$AuthUserCopyWithImpl(_AuthUser _value, $Res Function(_AuthUser) _then)
      : super(_value, (v) => _then(v as _AuthUser));

  @override
  _AuthUser get _value => super._value as _AuthUser;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? isWalletVerified = freezed,
    Object? birthDate = freezed,
    Object? algoWalletAddress = freezed,
    Object? aboutMe = freezed,
    Object? lifeStyle = freezed,
    Object? job = freezed,
    Object? companyName = freezed,
    Object? location = freezed,
    Object? gender = freezed,
    Object? sexualOrientation = freezed,
  }) {
    return _then(_AuthUser(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isWalletVerified: isWalletVerified == freezed
          ? _value.isWalletVerified
          : isWalletVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      algoWalletAddress: algoWalletAddress == freezed
          ? _value.algoWalletAddress
          : algoWalletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutMe: aboutMe == freezed
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String?,
      lifeStyle: lifeStyle == freezed
          ? _value.lifeStyle
          : lifeStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      job: job == freezed
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      sexualOrientation: sexualOrientation == freezed
          ? _value.sexualOrientation
          : sexualOrientation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthUser extends _AuthUser {
  const _$_AuthUser(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.isWalletVerified,
      required this.birthDate,
      required this.algoWalletAddress,
      required this.aboutMe,
      required this.lifeStyle,
      required this.job,
      required this.companyName,
      @GeoPointConverter() required this.location,
      required this.gender,
      required this.sexualOrientation})
      : super._();

  factory _$_AuthUser.fromJson(Map<String, dynamic> json) =>
      _$$_AuthUserFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final bool? isWalletVerified;
  @override
  final DateTime birthDate;
  @override
  final String? algoWalletAddress;
  @override
  final String? aboutMe;
  @override
  final String? lifeStyle;
  @override
  final String? job;
  @override
  final String? companyName;
  @override
  @GeoPointConverter()
  final GeoPoint? location;
  @override
  final String? gender;
  @override
  final String? sexualOrientation;

  @override
  String toString() {
    return 'AuthUser(firstName: $firstName, lastName: $lastName, email: $email, isWalletVerified: $isWalletVerified, birthDate: $birthDate, algoWalletAddress: $algoWalletAddress, aboutMe: $aboutMe, lifeStyle: $lifeStyle, job: $job, companyName: $companyName, location: $location, gender: $gender, sexualOrientation: $sexualOrientation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthUser &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.isWalletVerified, isWalletVerified) &&
            const DeepCollectionEquality().equals(other.birthDate, birthDate) &&
            const DeepCollectionEquality()
                .equals(other.algoWalletAddress, algoWalletAddress) &&
            const DeepCollectionEquality().equals(other.aboutMe, aboutMe) &&
            const DeepCollectionEquality().equals(other.lifeStyle, lifeStyle) &&
            const DeepCollectionEquality().equals(other.job, job) &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.sexualOrientation, sexualOrientation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(isWalletVerified),
      const DeepCollectionEquality().hash(birthDate),
      const DeepCollectionEquality().hash(algoWalletAddress),
      const DeepCollectionEquality().hash(aboutMe),
      const DeepCollectionEquality().hash(lifeStyle),
      const DeepCollectionEquality().hash(job),
      const DeepCollectionEquality().hash(companyName),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(sexualOrientation));

  @JsonKey(ignore: true)
  @override
  _$AuthUserCopyWith<_AuthUser> get copyWith =>
      __$AuthUserCopyWithImpl<_AuthUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthUserToJson(this);
  }
}

abstract class _AuthUser extends AuthUser {
  const factory _AuthUser(
      {required String firstName,
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
      required String? sexualOrientation}) = _$_AuthUser;
  const _AuthUser._() : super._();

  factory _AuthUser.fromJson(Map<String, dynamic> json) = _$_AuthUser.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  bool? get isWalletVerified;
  @override
  DateTime get birthDate;
  @override
  String? get algoWalletAddress;
  @override
  String? get aboutMe;
  @override
  String? get lifeStyle;
  @override
  String? get job;
  @override
  String? get companyName;
  @override
  @GeoPointConverter()
  GeoPoint? get location;
  @override
  String? get gender;
  @override
  String? get sexualOrientation;
  @override
  @JsonKey(ignore: true)
  _$AuthUserCopyWith<_AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}
