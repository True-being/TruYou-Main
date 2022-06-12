// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  _AppStarted appStarted() {
    return const _AppStarted();
  }

  _SignInButtonPressed signInButtonPressed(String email, String password) {
    return _SignInButtonPressed(
      email,
      password,
    );
  }

  _SignUpButtonPressed signUpButtonPressed(
      AuthUser user, List<File> photos, String password) {
    return _SignUpButtonPressed(
      user,
      photos,
      password,
    );
  }

  _ResetPassword resetPassword(String email) {
    return _ResetPassword(
      email,
    );
  }

  _UserLogOut userLogOut() {
    return const _UserLogOut();
  }
}

/// @nodoc
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(String email, String password)
        signInButtonPressed,
    required TResult Function(AuthUser user, List<File> photos, String password)
        signUpButtonPressed,
    required TResult Function(String email) resetPassword,
    required TResult Function() userLogOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStarted value) appStarted,
    required TResult Function(_SignInButtonPressed value) signInButtonPressed,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_UserLogOut value) userLogOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$AppStartedCopyWith<$Res> {
  factory _$AppStartedCopyWith(
          _AppStarted value, $Res Function(_AppStarted) then) =
      __$AppStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AppStartedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$AppStartedCopyWith<$Res> {
  __$AppStartedCopyWithImpl(
      _AppStarted _value, $Res Function(_AppStarted) _then)
      : super(_value, (v) => _then(v as _AppStarted));

  @override
  _AppStarted get _value => super._value as _AppStarted;
}

/// @nodoc

class _$_AppStarted implements _AppStarted {
  const _$_AppStarted();

  @override
  String toString() {
    return 'AuthEvent.appStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AppStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(String email, String password)
        signInButtonPressed,
    required TResult Function(AuthUser user, List<File> photos, String password)
        signUpButtonPressed,
    required TResult Function(String email) resetPassword,
    required TResult Function() userLogOut,
  }) {
    return appStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
  }) {
    return appStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
    required TResult orElse(),
  }) {
    if (appStarted != null) {
      return appStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStarted value) appStarted,
    required TResult Function(_SignInButtonPressed value) signInButtonPressed,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_UserLogOut value) userLogOut,
  }) {
    return appStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
  }) {
    return appStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
    required TResult orElse(),
  }) {
    if (appStarted != null) {
      return appStarted(this);
    }
    return orElse();
  }
}

abstract class _AppStarted implements AuthEvent {
  const factory _AppStarted() = _$_AppStarted;
}

/// @nodoc
abstract class _$SignInButtonPressedCopyWith<$Res> {
  factory _$SignInButtonPressedCopyWith(_SignInButtonPressed value,
          $Res Function(_SignInButtonPressed) then) =
      __$SignInButtonPressedCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$SignInButtonPressedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$SignInButtonPressedCopyWith<$Res> {
  __$SignInButtonPressedCopyWithImpl(
      _SignInButtonPressed _value, $Res Function(_SignInButtonPressed) _then)
      : super(_value, (v) => _then(v as _SignInButtonPressed));

  @override
  _SignInButtonPressed get _value => super._value as _SignInButtonPressed;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignInButtonPressed(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInButtonPressed implements _SignInButtonPressed {
  const _$_SignInButtonPressed(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInButtonPressed(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInButtonPressed &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$SignInButtonPressedCopyWith<_SignInButtonPressed> get copyWith =>
      __$SignInButtonPressedCopyWithImpl<_SignInButtonPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(String email, String password)
        signInButtonPressed,
    required TResult Function(AuthUser user, List<File> photos, String password)
        signUpButtonPressed,
    required TResult Function(String email) resetPassword,
    required TResult Function() userLogOut,
  }) {
    return signInButtonPressed(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
  }) {
    return signInButtonPressed?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
    required TResult orElse(),
  }) {
    if (signInButtonPressed != null) {
      return signInButtonPressed(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStarted value) appStarted,
    required TResult Function(_SignInButtonPressed value) signInButtonPressed,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_UserLogOut value) userLogOut,
  }) {
    return signInButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
  }) {
    return signInButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
    required TResult orElse(),
  }) {
    if (signInButtonPressed != null) {
      return signInButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _SignInButtonPressed implements AuthEvent {
  const factory _SignInButtonPressed(String email, String password) =
      _$_SignInButtonPressed;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$SignInButtonPressedCopyWith<_SignInButtonPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SignUpButtonPressedCopyWith<$Res> {
  factory _$SignUpButtonPressedCopyWith(_SignUpButtonPressed value,
          $Res Function(_SignUpButtonPressed) then) =
      __$SignUpButtonPressedCopyWithImpl<$Res>;
  $Res call({AuthUser user, List<File> photos, String password});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$SignUpButtonPressedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$SignUpButtonPressedCopyWith<$Res> {
  __$SignUpButtonPressedCopyWithImpl(
      _SignUpButtonPressed _value, $Res Function(_SignUpButtonPressed) _then)
      : super(_value, (v) => _then(v as _SignUpButtonPressed));

  @override
  _SignUpButtonPressed get _value => super._value as _SignUpButtonPressed;

  @override
  $Res call({
    Object? user = freezed,
    Object? photos = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignUpButtonPressed(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<File>,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_SignUpButtonPressed implements _SignUpButtonPressed {
  const _$_SignUpButtonPressed(this.user, this.photos, this.password);

  @override
  final AuthUser user;
  @override
  final List<File> photos;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signUpButtonPressed(user: $user, photos: $photos, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpButtonPressed &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(photos),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$SignUpButtonPressedCopyWith<_SignUpButtonPressed> get copyWith =>
      __$SignUpButtonPressedCopyWithImpl<_SignUpButtonPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(String email, String password)
        signInButtonPressed,
    required TResult Function(AuthUser user, List<File> photos, String password)
        signUpButtonPressed,
    required TResult Function(String email) resetPassword,
    required TResult Function() userLogOut,
  }) {
    return signUpButtonPressed(user, photos, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
  }) {
    return signUpButtonPressed?.call(user, photos, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
    required TResult orElse(),
  }) {
    if (signUpButtonPressed != null) {
      return signUpButtonPressed(user, photos, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStarted value) appStarted,
    required TResult Function(_SignInButtonPressed value) signInButtonPressed,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_UserLogOut value) userLogOut,
  }) {
    return signUpButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
  }) {
    return signUpButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
    required TResult orElse(),
  }) {
    if (signUpButtonPressed != null) {
      return signUpButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _SignUpButtonPressed implements AuthEvent {
  const factory _SignUpButtonPressed(
          AuthUser user, List<File> photos, String password) =
      _$_SignUpButtonPressed;

  AuthUser get user;
  List<File> get photos;
  String get password;
  @JsonKey(ignore: true)
  _$SignUpButtonPressedCopyWith<_SignUpButtonPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResetPasswordCopyWith<$Res> {
  factory _$ResetPasswordCopyWith(
          _ResetPassword value, $Res Function(_ResetPassword) then) =
      __$ResetPasswordCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$ResetPasswordCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$ResetPasswordCopyWith<$Res> {
  __$ResetPasswordCopyWithImpl(
      _ResetPassword _value, $Res Function(_ResetPassword) _then)
      : super(_value, (v) => _then(v as _ResetPassword));

  @override
  _ResetPassword get _value => super._value as _ResetPassword;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_ResetPassword(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPassword implements _ResetPassword {
  const _$_ResetPassword(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.resetPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetPassword &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$ResetPasswordCopyWith<_ResetPassword> get copyWith =>
      __$ResetPasswordCopyWithImpl<_ResetPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(String email, String password)
        signInButtonPressed,
    required TResult Function(AuthUser user, List<File> photos, String password)
        signUpButtonPressed,
    required TResult Function(String email) resetPassword,
    required TResult Function() userLogOut,
  }) {
    return resetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
  }) {
    return resetPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStarted value) appStarted,
    required TResult Function(_SignInButtonPressed value) signInButtonPressed,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_UserLogOut value) userLogOut,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements AuthEvent {
  const factory _ResetPassword(String email) = _$_ResetPassword;

  String get email;
  @JsonKey(ignore: true)
  _$ResetPasswordCopyWith<_ResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UserLogOutCopyWith<$Res> {
  factory _$UserLogOutCopyWith(
          _UserLogOut value, $Res Function(_UserLogOut) then) =
      __$UserLogOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$UserLogOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$UserLogOutCopyWith<$Res> {
  __$UserLogOutCopyWithImpl(
      _UserLogOut _value, $Res Function(_UserLogOut) _then)
      : super(_value, (v) => _then(v as _UserLogOut));

  @override
  _UserLogOut get _value => super._value as _UserLogOut;
}

/// @nodoc

class _$_UserLogOut implements _UserLogOut {
  const _$_UserLogOut();

  @override
  String toString() {
    return 'AuthEvent.userLogOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UserLogOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(String email, String password)
        signInButtonPressed,
    required TResult Function(AuthUser user, List<File> photos, String password)
        signUpButtonPressed,
    required TResult Function(String email) resetPassword,
    required TResult Function() userLogOut,
  }) {
    return userLogOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
  }) {
    return userLogOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(String email, String password)? signInButtonPressed,
    TResult Function(AuthUser user, List<File> photos, String password)?
        signUpButtonPressed,
    TResult Function(String email)? resetPassword,
    TResult Function()? userLogOut,
    required TResult orElse(),
  }) {
    if (userLogOut != null) {
      return userLogOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStarted value) appStarted,
    required TResult Function(_SignInButtonPressed value) signInButtonPressed,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_UserLogOut value) userLogOut,
  }) {
    return userLogOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
  }) {
    return userLogOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStarted value)? appStarted,
    TResult Function(_SignInButtonPressed value)? signInButtonPressed,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_UserLogOut value)? userLogOut,
    required TResult orElse(),
  }) {
    if (userLogOut != null) {
      return userLogOut(this);
    }
    return orElse();
  }
}

abstract class _UserLogOut implements AuthEvent {
  const factory _UserLogOut() = _$_UserLogOut;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _UnAuthenticatedAuthentication unAuthenticatedAuthentication() {
    return const _UnAuthenticatedAuthentication();
  }

  _AuthenticatedAuthentication authenticatedAuthentication() {
    return const _AuthenticatedAuthentication();
  }

  _Failed failed(FailureType exception) {
    return _Failed(
      exception,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unAuthenticatedAuthentication,
    required TResult Function() authenticatedAuthentication,
    required TResult Function(FailureType exception) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticatedAuthentication value)
        unAuthenticatedAuthentication,
    required TResult Function(_AuthenticatedAuthentication value)
        authenticatedAuthentication,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unAuthenticatedAuthentication,
    required TResult Function() authenticatedAuthentication,
    required TResult Function(FailureType exception) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticatedAuthentication value)
        unAuthenticatedAuthentication,
    required TResult Function(_AuthenticatedAuthentication value)
        authenticatedAuthentication,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unAuthenticatedAuthentication,
    required TResult Function() authenticatedAuthentication,
    required TResult Function(FailureType exception) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticatedAuthentication value)
        unAuthenticatedAuthentication,
    required TResult Function(_AuthenticatedAuthentication value)
        authenticatedAuthentication,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$UnAuthenticatedAuthenticationCopyWith<$Res> {
  factory _$UnAuthenticatedAuthenticationCopyWith(
          _UnAuthenticatedAuthentication value,
          $Res Function(_UnAuthenticatedAuthentication) then) =
      __$UnAuthenticatedAuthenticationCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnAuthenticatedAuthenticationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$UnAuthenticatedAuthenticationCopyWith<$Res> {
  __$UnAuthenticatedAuthenticationCopyWithImpl(
      _UnAuthenticatedAuthentication _value,
      $Res Function(_UnAuthenticatedAuthentication) _then)
      : super(_value, (v) => _then(v as _UnAuthenticatedAuthentication));

  @override
  _UnAuthenticatedAuthentication get _value =>
      super._value as _UnAuthenticatedAuthentication;
}

/// @nodoc

class _$_UnAuthenticatedAuthentication
    implements _UnAuthenticatedAuthentication {
  const _$_UnAuthenticatedAuthentication();

  @override
  String toString() {
    return 'AuthState.unAuthenticatedAuthentication()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnAuthenticatedAuthentication);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unAuthenticatedAuthentication,
    required TResult Function() authenticatedAuthentication,
    required TResult Function(FailureType exception) failed,
  }) {
    return unAuthenticatedAuthentication();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
  }) {
    return unAuthenticatedAuthentication?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (unAuthenticatedAuthentication != null) {
      return unAuthenticatedAuthentication();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticatedAuthentication value)
        unAuthenticatedAuthentication,
    required TResult Function(_AuthenticatedAuthentication value)
        authenticatedAuthentication,
    required TResult Function(_Failed value) failed,
  }) {
    return unAuthenticatedAuthentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
  }) {
    return unAuthenticatedAuthentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (unAuthenticatedAuthentication != null) {
      return unAuthenticatedAuthentication(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticatedAuthentication implements AuthState {
  const factory _UnAuthenticatedAuthentication() =
      _$_UnAuthenticatedAuthentication;
}

/// @nodoc
abstract class _$AuthenticatedAuthenticationCopyWith<$Res> {
  factory _$AuthenticatedAuthenticationCopyWith(
          _AuthenticatedAuthentication value,
          $Res Function(_AuthenticatedAuthentication) then) =
      __$AuthenticatedAuthenticationCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthenticatedAuthenticationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthenticatedAuthenticationCopyWith<$Res> {
  __$AuthenticatedAuthenticationCopyWithImpl(
      _AuthenticatedAuthentication _value,
      $Res Function(_AuthenticatedAuthentication) _then)
      : super(_value, (v) => _then(v as _AuthenticatedAuthentication));

  @override
  _AuthenticatedAuthentication get _value =>
      super._value as _AuthenticatedAuthentication;
}

/// @nodoc

class _$_AuthenticatedAuthentication implements _AuthenticatedAuthentication {
  const _$_AuthenticatedAuthentication();

  @override
  String toString() {
    return 'AuthState.authenticatedAuthentication()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthenticatedAuthentication);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unAuthenticatedAuthentication,
    required TResult Function() authenticatedAuthentication,
    required TResult Function(FailureType exception) failed,
  }) {
    return authenticatedAuthentication();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
  }) {
    return authenticatedAuthentication?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (authenticatedAuthentication != null) {
      return authenticatedAuthentication();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticatedAuthentication value)
        unAuthenticatedAuthentication,
    required TResult Function(_AuthenticatedAuthentication value)
        authenticatedAuthentication,
    required TResult Function(_Failed value) failed,
  }) {
    return authenticatedAuthentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
  }) {
    return authenticatedAuthentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (authenticatedAuthentication != null) {
      return authenticatedAuthentication(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedAuthentication implements AuthState {
  const factory _AuthenticatedAuthentication() = _$_AuthenticatedAuthentication;
}

/// @nodoc
abstract class _$FailedCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) then) =
      __$FailedCopyWithImpl<$Res>;
  $Res call({FailureType exception});

  $FailureTypeCopyWith<$Res> get exception;
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(_Failed _value, $Res Function(_Failed) _then)
      : super(_value, (v) => _then(v as _Failed));

  @override
  _Failed get _value => super._value as _Failed;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_Failed(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FailureType,
    ));
  }

  @override
  $FailureTypeCopyWith<$Res> get exception {
    return $FailureTypeCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc

class _$_Failed implements _Failed {
  const _$_Failed(this.exception);

  @override
  final FailureType exception;

  @override
  String toString() {
    return 'AuthState.failed(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failed &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$FailedCopyWith<_Failed> get copyWith =>
      __$FailedCopyWithImpl<_Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unAuthenticatedAuthentication,
    required TResult Function() authenticatedAuthentication,
    required TResult Function(FailureType exception) failed,
  }) {
    return failed(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
  }) {
    return failed?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unAuthenticatedAuthentication,
    TResult Function()? authenticatedAuthentication,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticatedAuthentication value)
        unAuthenticatedAuthentication,
    required TResult Function(_AuthenticatedAuthentication value)
        authenticatedAuthentication,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticatedAuthentication value)?
        unAuthenticatedAuthentication,
    TResult Function(_AuthenticatedAuthentication value)?
        authenticatedAuthentication,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements AuthState {
  const factory _Failed(FailureType exception) = _$_Failed;

  FailureType get exception;
  @JsonKey(ignore: true)
  _$FailedCopyWith<_Failed> get copyWith => throw _privateConstructorUsedError;
}
