// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gender_age_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GenderAgeStateTearOff {
  const _$GenderAgeStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Success success() {
    return const _Success();
  }

  _Failed failed(FailureType exception) {
    return _Failed(
      exception,
    );
  }
}

/// @nodoc
const $GenderAgeState = _$GenderAgeStateTearOff();

/// @nodoc
mixin _$GenderAgeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(FailureType exception) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(FailureType exception)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderAgeStateCopyWith<$Res> {
  factory $GenderAgeStateCopyWith(
          GenderAgeState value, $Res Function(GenderAgeState) then) =
      _$GenderAgeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GenderAgeStateCopyWithImpl<$Res>
    implements $GenderAgeStateCopyWith<$Res> {
  _$GenderAgeStateCopyWithImpl(this._value, this._then);

  final GenderAgeState _value;
  // ignore: unused_field
  final $Res Function(GenderAgeState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$GenderAgeStateCopyWithImpl<$Res>
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
    return 'GenderAgeState.initial()';
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
    required TResult Function() success,
    required TResult Function(FailureType exception) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(FailureType exception)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GenderAgeState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$GenderAgeStateCopyWithImpl<$Res>
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
    return 'GenderAgeState.loading()';
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
    required TResult Function() success,
    required TResult Function(FailureType exception) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(FailureType exception)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GenderAgeState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$GenderAgeStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'GenderAgeState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(FailureType exception) failed,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(FailureType exception)? failed,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements GenderAgeState {
  const factory _Success() = _$_Success;
}

/// @nodoc
abstract class _$FailedCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) then) =
      __$FailedCopyWithImpl<$Res>;
  $Res call({FailureType exception});

  $FailureTypeCopyWith<$Res> get exception;
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> extends _$GenderAgeStateCopyWithImpl<$Res>
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
    return 'GenderAgeState.failed(exception: $exception)';
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
    required TResult Function() success,
    required TResult Function(FailureType exception) failed,
  }) {
    return failed(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(FailureType exception)? failed,
  }) {
    return failed?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements GenderAgeState {
  const factory _Failed(FailureType exception) = _$_Failed;

  FailureType get exception;
  @JsonKey(ignore: true)
  _$FailedCopyWith<_Failed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$GenderAgeEventTearOff {
  const _$GenderAgeEventTearOff();

  _UpdateGenderPreference updateGenderPreference(String genderPreference) {
    return _UpdateGenderPreference(
      genderPreference,
    );
  }

  _UpdateAgePreferences updateAgePreferences(
      DateTime lowerAge, DateTime upperAge) {
    return _UpdateAgePreferences(
      lowerAge,
      upperAge,
    );
  }
}

/// @nodoc
const $GenderAgeEvent = _$GenderAgeEventTearOff();

/// @nodoc
mixin _$GenderAgeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String genderPreference) updateGenderPreference,
    required TResult Function(DateTime lowerAge, DateTime upperAge)
        updateAgePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String genderPreference)? updateGenderPreference,
    TResult Function(DateTime lowerAge, DateTime upperAge)?
        updateAgePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String genderPreference)? updateGenderPreference,
    TResult Function(DateTime lowerAge, DateTime upperAge)?
        updateAgePreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateGenderPreference value)
        updateGenderPreference,
    required TResult Function(_UpdateAgePreferences value) updateAgePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateGenderPreference value)? updateGenderPreference,
    TResult Function(_UpdateAgePreferences value)? updateAgePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateGenderPreference value)? updateGenderPreference,
    TResult Function(_UpdateAgePreferences value)? updateAgePreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderAgeEventCopyWith<$Res> {
  factory $GenderAgeEventCopyWith(
          GenderAgeEvent value, $Res Function(GenderAgeEvent) then) =
      _$GenderAgeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GenderAgeEventCopyWithImpl<$Res>
    implements $GenderAgeEventCopyWith<$Res> {
  _$GenderAgeEventCopyWithImpl(this._value, this._then);

  final GenderAgeEvent _value;
  // ignore: unused_field
  final $Res Function(GenderAgeEvent) _then;
}

/// @nodoc
abstract class _$UpdateGenderPreferenceCopyWith<$Res> {
  factory _$UpdateGenderPreferenceCopyWith(_UpdateGenderPreference value,
          $Res Function(_UpdateGenderPreference) then) =
      __$UpdateGenderPreferenceCopyWithImpl<$Res>;
  $Res call({String genderPreference});
}

/// @nodoc
class __$UpdateGenderPreferenceCopyWithImpl<$Res>
    extends _$GenderAgeEventCopyWithImpl<$Res>
    implements _$UpdateGenderPreferenceCopyWith<$Res> {
  __$UpdateGenderPreferenceCopyWithImpl(_UpdateGenderPreference _value,
      $Res Function(_UpdateGenderPreference) _then)
      : super(_value, (v) => _then(v as _UpdateGenderPreference));

  @override
  _UpdateGenderPreference get _value => super._value as _UpdateGenderPreference;

  @override
  $Res call({
    Object? genderPreference = freezed,
  }) {
    return _then(_UpdateGenderPreference(
      genderPreference == freezed
          ? _value.genderPreference
          : genderPreference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateGenderPreference implements _UpdateGenderPreference {
  const _$_UpdateGenderPreference(this.genderPreference);

  @override
  final String genderPreference;

  @override
  String toString() {
    return 'GenderAgeEvent.updateGenderPreference(genderPreference: $genderPreference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateGenderPreference &&
            const DeepCollectionEquality()
                .equals(other.genderPreference, genderPreference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(genderPreference));

  @JsonKey(ignore: true)
  @override
  _$UpdateGenderPreferenceCopyWith<_UpdateGenderPreference> get copyWith =>
      __$UpdateGenderPreferenceCopyWithImpl<_UpdateGenderPreference>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String genderPreference) updateGenderPreference,
    required TResult Function(DateTime lowerAge, DateTime upperAge)
        updateAgePreferences,
  }) {
    return updateGenderPreference(genderPreference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String genderPreference)? updateGenderPreference,
    TResult Function(DateTime lowerAge, DateTime upperAge)?
        updateAgePreferences,
  }) {
    return updateGenderPreference?.call(genderPreference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String genderPreference)? updateGenderPreference,
    TResult Function(DateTime lowerAge, DateTime upperAge)?
        updateAgePreferences,
    required TResult orElse(),
  }) {
    if (updateGenderPreference != null) {
      return updateGenderPreference(genderPreference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateGenderPreference value)
        updateGenderPreference,
    required TResult Function(_UpdateAgePreferences value) updateAgePreferences,
  }) {
    return updateGenderPreference(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateGenderPreference value)? updateGenderPreference,
    TResult Function(_UpdateAgePreferences value)? updateAgePreferences,
  }) {
    return updateGenderPreference?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateGenderPreference value)? updateGenderPreference,
    TResult Function(_UpdateAgePreferences value)? updateAgePreferences,
    required TResult orElse(),
  }) {
    if (updateGenderPreference != null) {
      return updateGenderPreference(this);
    }
    return orElse();
  }
}

abstract class _UpdateGenderPreference implements GenderAgeEvent {
  const factory _UpdateGenderPreference(String genderPreference) =
      _$_UpdateGenderPreference;

  String get genderPreference;
  @JsonKey(ignore: true)
  _$UpdateGenderPreferenceCopyWith<_UpdateGenderPreference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateAgePreferencesCopyWith<$Res> {
  factory _$UpdateAgePreferencesCopyWith(_UpdateAgePreferences value,
          $Res Function(_UpdateAgePreferences) then) =
      __$UpdateAgePreferencesCopyWithImpl<$Res>;
  $Res call({DateTime lowerAge, DateTime upperAge});
}

/// @nodoc
class __$UpdateAgePreferencesCopyWithImpl<$Res>
    extends _$GenderAgeEventCopyWithImpl<$Res>
    implements _$UpdateAgePreferencesCopyWith<$Res> {
  __$UpdateAgePreferencesCopyWithImpl(
      _UpdateAgePreferences _value, $Res Function(_UpdateAgePreferences) _then)
      : super(_value, (v) => _then(v as _UpdateAgePreferences));

  @override
  _UpdateAgePreferences get _value => super._value as _UpdateAgePreferences;

  @override
  $Res call({
    Object? lowerAge = freezed,
    Object? upperAge = freezed,
  }) {
    return _then(_UpdateAgePreferences(
      lowerAge == freezed
          ? _value.lowerAge
          : lowerAge // ignore: cast_nullable_to_non_nullable
              as DateTime,
      upperAge == freezed
          ? _value.upperAge
          : upperAge // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_UpdateAgePreferences implements _UpdateAgePreferences {
  const _$_UpdateAgePreferences(this.lowerAge, this.upperAge);

  @override
  final DateTime lowerAge;
  @override
  final DateTime upperAge;

  @override
  String toString() {
    return 'GenderAgeEvent.updateAgePreferences(lowerAge: $lowerAge, upperAge: $upperAge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateAgePreferences &&
            const DeepCollectionEquality().equals(other.lowerAge, lowerAge) &&
            const DeepCollectionEquality().equals(other.upperAge, upperAge));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lowerAge),
      const DeepCollectionEquality().hash(upperAge));

  @JsonKey(ignore: true)
  @override
  _$UpdateAgePreferencesCopyWith<_UpdateAgePreferences> get copyWith =>
      __$UpdateAgePreferencesCopyWithImpl<_UpdateAgePreferences>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String genderPreference) updateGenderPreference,
    required TResult Function(DateTime lowerAge, DateTime upperAge)
        updateAgePreferences,
  }) {
    return updateAgePreferences(lowerAge, upperAge);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String genderPreference)? updateGenderPreference,
    TResult Function(DateTime lowerAge, DateTime upperAge)?
        updateAgePreferences,
  }) {
    return updateAgePreferences?.call(lowerAge, upperAge);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String genderPreference)? updateGenderPreference,
    TResult Function(DateTime lowerAge, DateTime upperAge)?
        updateAgePreferences,
    required TResult orElse(),
  }) {
    if (updateAgePreferences != null) {
      return updateAgePreferences(lowerAge, upperAge);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateGenderPreference value)
        updateGenderPreference,
    required TResult Function(_UpdateAgePreferences value) updateAgePreferences,
  }) {
    return updateAgePreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateGenderPreference value)? updateGenderPreference,
    TResult Function(_UpdateAgePreferences value)? updateAgePreferences,
  }) {
    return updateAgePreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateGenderPreference value)? updateGenderPreference,
    TResult Function(_UpdateAgePreferences value)? updateAgePreferences,
    required TResult orElse(),
  }) {
    if (updateAgePreferences != null) {
      return updateAgePreferences(this);
    }
    return orElse();
  }
}

abstract class _UpdateAgePreferences implements GenderAgeEvent {
  const factory _UpdateAgePreferences(DateTime lowerAge, DateTime upperAge) =
      _$_UpdateAgePreferences;

  DateTime get lowerAge;
  DateTime get upperAge;
  @JsonKey(ignore: true)
  _$UpdateAgePreferencesCopyWith<_UpdateAgePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
