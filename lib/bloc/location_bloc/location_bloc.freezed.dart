// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationEventTearOff {
  const _$LocationEventTearOff();

  _UpdateLocation updateLocation(GeoPoint location) {
    return _UpdateLocation(
      location,
    );
  }

  _UpdateMatchingDistance updateMatchingDistance(int distance) {
    return _UpdateMatchingDistance(
      distance,
    );
  }

  _UpdateRadiusDistanceSelected updateRadiusDistanceSelected(
      bool isRadiusDistanceSelected) {
    return _UpdateRadiusDistanceSelected(
      isRadiusDistanceSelected,
    );
  }
}

/// @nodoc
const $LocationEvent = _$LocationEventTearOff();

/// @nodoc
mixin _$LocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GeoPoint location) updateLocation,
    required TResult Function(int distance) updateMatchingDistance,
    required TResult Function(bool isRadiusDistanceSelected)
        updateRadiusDistanceSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GeoPoint location)? updateLocation,
    TResult Function(int distance)? updateMatchingDistance,
    TResult Function(bool isRadiusDistanceSelected)?
        updateRadiusDistanceSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GeoPoint location)? updateLocation,
    TResult Function(int distance)? updateMatchingDistance,
    TResult Function(bool isRadiusDistanceSelected)?
        updateRadiusDistanceSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdateMatchingDistance value)
        updateMatchingDistance,
    required TResult Function(_UpdateRadiusDistanceSelected value)
        updateRadiusDistanceSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdateMatchingDistance value)? updateMatchingDistance,
    TResult Function(_UpdateRadiusDistanceSelected value)?
        updateRadiusDistanceSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdateMatchingDistance value)? updateMatchingDistance,
    TResult Function(_UpdateRadiusDistanceSelected value)?
        updateRadiusDistanceSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationEventCopyWithImpl<$Res>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  final LocationEvent _value;
  // ignore: unused_field
  final $Res Function(LocationEvent) _then;
}

/// @nodoc
abstract class _$UpdateLocationCopyWith<$Res> {
  factory _$UpdateLocationCopyWith(
          _UpdateLocation value, $Res Function(_UpdateLocation) then) =
      __$UpdateLocationCopyWithImpl<$Res>;
  $Res call({GeoPoint location});
}

/// @nodoc
class __$UpdateLocationCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements _$UpdateLocationCopyWith<$Res> {
  __$UpdateLocationCopyWithImpl(
      _UpdateLocation _value, $Res Function(_UpdateLocation) _then)
      : super(_value, (v) => _then(v as _UpdateLocation));

  @override
  _UpdateLocation get _value => super._value as _UpdateLocation;

  @override
  $Res call({
    Object? location = freezed,
  }) {
    return _then(_UpdateLocation(
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ));
  }
}

/// @nodoc

class _$_UpdateLocation implements _UpdateLocation {
  const _$_UpdateLocation(this.location);

  @override
  final GeoPoint location;

  @override
  String toString() {
    return 'LocationEvent.updateLocation(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateLocation &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$UpdateLocationCopyWith<_UpdateLocation> get copyWith =>
      __$UpdateLocationCopyWithImpl<_UpdateLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GeoPoint location) updateLocation,
    required TResult Function(int distance) updateMatchingDistance,
    required TResult Function(bool isRadiusDistanceSelected)
        updateRadiusDistanceSelected,
  }) {
    return updateLocation(location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GeoPoint location)? updateLocation,
    TResult Function(int distance)? updateMatchingDistance,
    TResult Function(bool isRadiusDistanceSelected)?
        updateRadiusDistanceSelected,
  }) {
    return updateLocation?.call(location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GeoPoint location)? updateLocation,
    TResult Function(int distance)? updateMatchingDistance,
    TResult Function(bool isRadiusDistanceSelected)?
        updateRadiusDistanceSelected,
    required TResult orElse(),
  }) {
    if (updateLocation != null) {
      return updateLocation(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdateMatchingDistance value)
        updateMatchingDistance,
    required TResult Function(_UpdateRadiusDistanceSelected value)
        updateRadiusDistanceSelected,
  }) {
    return updateLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdateMatchingDistance value)? updateMatchingDistance,
    TResult Function(_UpdateRadiusDistanceSelected value)?
        updateRadiusDistanceSelected,
  }) {
    return updateLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdateMatchingDistance value)? updateMatchingDistance,
    TResult Function(_UpdateRadiusDistanceSelected value)?
        updateRadiusDistanceSelected,
    required TResult orElse(),
  }) {
    if (updateLocation != null) {
      return updateLocation(this);
    }
    return orElse();
  }
}

abstract class _UpdateLocation implements LocationEvent {
  const factory _UpdateLocation(GeoPoint location) = _$_UpdateLocation;

  GeoPoint get location;
  @JsonKey(ignore: true)
  _$UpdateLocationCopyWith<_UpdateLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateMatchingDistanceCopyWith<$Res> {
  factory _$UpdateMatchingDistanceCopyWith(_UpdateMatchingDistance value,
          $Res Function(_UpdateMatchingDistance) then) =
      __$UpdateMatchingDistanceCopyWithImpl<$Res>;
  $Res call({int distance});
}

/// @nodoc
class __$UpdateMatchingDistanceCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements _$UpdateMatchingDistanceCopyWith<$Res> {
  __$UpdateMatchingDistanceCopyWithImpl(_UpdateMatchingDistance _value,
      $Res Function(_UpdateMatchingDistance) _then)
      : super(_value, (v) => _then(v as _UpdateMatchingDistance));

  @override
  _UpdateMatchingDistance get _value => super._value as _UpdateMatchingDistance;

  @override
  $Res call({
    Object? distance = freezed,
  }) {
    return _then(_UpdateMatchingDistance(
      distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UpdateMatchingDistance implements _UpdateMatchingDistance {
  const _$_UpdateMatchingDistance(this.distance);

  @override
  final int distance;

  @override
  String toString() {
    return 'LocationEvent.updateMatchingDistance(distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateMatchingDistance &&
            const DeepCollectionEquality().equals(other.distance, distance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(distance));

  @JsonKey(ignore: true)
  @override
  _$UpdateMatchingDistanceCopyWith<_UpdateMatchingDistance> get copyWith =>
      __$UpdateMatchingDistanceCopyWithImpl<_UpdateMatchingDistance>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GeoPoint location) updateLocation,
    required TResult Function(int distance) updateMatchingDistance,
    required TResult Function(bool isRadiusDistanceSelected)
        updateRadiusDistanceSelected,
  }) {
    return updateMatchingDistance(distance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GeoPoint location)? updateLocation,
    TResult Function(int distance)? updateMatchingDistance,
    TResult Function(bool isRadiusDistanceSelected)?
        updateRadiusDistanceSelected,
  }) {
    return updateMatchingDistance?.call(distance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GeoPoint location)? updateLocation,
    TResult Function(int distance)? updateMatchingDistance,
    TResult Function(bool isRadiusDistanceSelected)?
        updateRadiusDistanceSelected,
    required TResult orElse(),
  }) {
    if (updateMatchingDistance != null) {
      return updateMatchingDistance(distance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdateMatchingDistance value)
        updateMatchingDistance,
    required TResult Function(_UpdateRadiusDistanceSelected value)
        updateRadiusDistanceSelected,
  }) {
    return updateMatchingDistance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdateMatchingDistance value)? updateMatchingDistance,
    TResult Function(_UpdateRadiusDistanceSelected value)?
        updateRadiusDistanceSelected,
  }) {
    return updateMatchingDistance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdateMatchingDistance value)? updateMatchingDistance,
    TResult Function(_UpdateRadiusDistanceSelected value)?
        updateRadiusDistanceSelected,
    required TResult orElse(),
  }) {
    if (updateMatchingDistance != null) {
      return updateMatchingDistance(this);
    }
    return orElse();
  }
}

abstract class _UpdateMatchingDistance implements LocationEvent {
  const factory _UpdateMatchingDistance(int distance) =
      _$_UpdateMatchingDistance;

  int get distance;
  @JsonKey(ignore: true)
  _$UpdateMatchingDistanceCopyWith<_UpdateMatchingDistance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateRadiusDistanceSelectedCopyWith<$Res> {
  factory _$UpdateRadiusDistanceSelectedCopyWith(
          _UpdateRadiusDistanceSelected value,
          $Res Function(_UpdateRadiusDistanceSelected) then) =
      __$UpdateRadiusDistanceSelectedCopyWithImpl<$Res>;
  $Res call({bool isRadiusDistanceSelected});
}

/// @nodoc
class __$UpdateRadiusDistanceSelectedCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements _$UpdateRadiusDistanceSelectedCopyWith<$Res> {
  __$UpdateRadiusDistanceSelectedCopyWithImpl(
      _UpdateRadiusDistanceSelected _value,
      $Res Function(_UpdateRadiusDistanceSelected) _then)
      : super(_value, (v) => _then(v as _UpdateRadiusDistanceSelected));

  @override
  _UpdateRadiusDistanceSelected get _value =>
      super._value as _UpdateRadiusDistanceSelected;

  @override
  $Res call({
    Object? isRadiusDistanceSelected = freezed,
  }) {
    return _then(_UpdateRadiusDistanceSelected(
      isRadiusDistanceSelected == freezed
          ? _value.isRadiusDistanceSelected
          : isRadiusDistanceSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateRadiusDistanceSelected implements _UpdateRadiusDistanceSelected {
  const _$_UpdateRadiusDistanceSelected(this.isRadiusDistanceSelected);

  @override
  final bool isRadiusDistanceSelected;

  @override
  String toString() {
    return 'LocationEvent.updateRadiusDistanceSelected(isRadiusDistanceSelected: $isRadiusDistanceSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateRadiusDistanceSelected &&
            const DeepCollectionEquality().equals(
                other.isRadiusDistanceSelected, isRadiusDistanceSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(isRadiusDistanceSelected));

  @JsonKey(ignore: true)
  @override
  _$UpdateRadiusDistanceSelectedCopyWith<_UpdateRadiusDistanceSelected>
      get copyWith => __$UpdateRadiusDistanceSelectedCopyWithImpl<
          _UpdateRadiusDistanceSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GeoPoint location) updateLocation,
    required TResult Function(int distance) updateMatchingDistance,
    required TResult Function(bool isRadiusDistanceSelected)
        updateRadiusDistanceSelected,
  }) {
    return updateRadiusDistanceSelected(isRadiusDistanceSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GeoPoint location)? updateLocation,
    TResult Function(int distance)? updateMatchingDistance,
    TResult Function(bool isRadiusDistanceSelected)?
        updateRadiusDistanceSelected,
  }) {
    return updateRadiusDistanceSelected?.call(isRadiusDistanceSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GeoPoint location)? updateLocation,
    TResult Function(int distance)? updateMatchingDistance,
    TResult Function(bool isRadiusDistanceSelected)?
        updateRadiusDistanceSelected,
    required TResult orElse(),
  }) {
    if (updateRadiusDistanceSelected != null) {
      return updateRadiusDistanceSelected(isRadiusDistanceSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdateMatchingDistance value)
        updateMatchingDistance,
    required TResult Function(_UpdateRadiusDistanceSelected value)
        updateRadiusDistanceSelected,
  }) {
    return updateRadiusDistanceSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdateMatchingDistance value)? updateMatchingDistance,
    TResult Function(_UpdateRadiusDistanceSelected value)?
        updateRadiusDistanceSelected,
  }) {
    return updateRadiusDistanceSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdateMatchingDistance value)? updateMatchingDistance,
    TResult Function(_UpdateRadiusDistanceSelected value)?
        updateRadiusDistanceSelected,
    required TResult orElse(),
  }) {
    if (updateRadiusDistanceSelected != null) {
      return updateRadiusDistanceSelected(this);
    }
    return orElse();
  }
}

abstract class _UpdateRadiusDistanceSelected implements LocationEvent {
  const factory _UpdateRadiusDistanceSelected(bool isRadiusDistanceSelected) =
      _$_UpdateRadiusDistanceSelected;

  bool get isRadiusDistanceSelected;
  @JsonKey(ignore: true)
  _$UpdateRadiusDistanceSelectedCopyWith<_UpdateRadiusDistanceSelected>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$LocationStateTearOff {
  const _$LocationStateTearOff();

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
const $LocationState = _$LocationStateTearOff();

/// @nodoc
mixin _$LocationState {
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
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
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
    return 'LocationState.initial()';
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

abstract class _Initial implements LocationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
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
    return 'LocationState.loading()';
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

abstract class _Loading implements LocationState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
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
    return 'LocationState.success()';
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

abstract class _Success implements LocationState {
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
class __$FailedCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
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
    return 'LocationState.failed(exception: $exception)';
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

abstract class _Failed implements LocationState {
  const factory _Failed(FailureType exception) = _$_Failed;

  FailureType get exception;
  @JsonKey(ignore: true)
  _$FailedCopyWith<_Failed> get copyWith => throw _privateConstructorUsedError;
}
