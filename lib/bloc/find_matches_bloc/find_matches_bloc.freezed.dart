// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'find_matches_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FindMatchesEventTearOff {
  const _$FindMatchesEventTearOff();

  _LoadMoreMatches loadMoreMatches(DateTime? lastDate, Cursor cursor) {
    return _LoadMoreMatches(
      lastDate,
      cursor,
    );
  }
}

/// @nodoc
const $FindMatchesEvent = _$FindMatchesEventTearOff();

/// @nodoc
mixin _$FindMatchesEvent {
  DateTime? get lastDate => throw _privateConstructorUsedError;
  Cursor get cursor => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? lastDate, Cursor cursor)
        loadMoreMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime? lastDate, Cursor cursor)? loadMoreMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? lastDate, Cursor cursor)? loadMoreMatches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMoreMatches value) loadMoreMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMoreMatches value)? loadMoreMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMoreMatches value)? loadMoreMatches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindMatchesEventCopyWith<FindMatchesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindMatchesEventCopyWith<$Res> {
  factory $FindMatchesEventCopyWith(
          FindMatchesEvent value, $Res Function(FindMatchesEvent) then) =
      _$FindMatchesEventCopyWithImpl<$Res>;
  $Res call({DateTime? lastDate, Cursor cursor});
}

/// @nodoc
class _$FindMatchesEventCopyWithImpl<$Res>
    implements $FindMatchesEventCopyWith<$Res> {
  _$FindMatchesEventCopyWithImpl(this._value, this._then);

  final FindMatchesEvent _value;
  // ignore: unused_field
  final $Res Function(FindMatchesEvent) _then;

  @override
  $Res call({
    Object? lastDate = freezed,
    Object? cursor = freezed,
  }) {
    return _then(_value.copyWith(
      lastDate: lastDate == freezed
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as Cursor,
    ));
  }
}

/// @nodoc
abstract class _$LoadMoreMatchesCopyWith<$Res>
    implements $FindMatchesEventCopyWith<$Res> {
  factory _$LoadMoreMatchesCopyWith(
          _LoadMoreMatches value, $Res Function(_LoadMoreMatches) then) =
      __$LoadMoreMatchesCopyWithImpl<$Res>;
  @override
  $Res call({DateTime? lastDate, Cursor cursor});
}

/// @nodoc
class __$LoadMoreMatchesCopyWithImpl<$Res>
    extends _$FindMatchesEventCopyWithImpl<$Res>
    implements _$LoadMoreMatchesCopyWith<$Res> {
  __$LoadMoreMatchesCopyWithImpl(
      _LoadMoreMatches _value, $Res Function(_LoadMoreMatches) _then)
      : super(_value, (v) => _then(v as _LoadMoreMatches));

  @override
  _LoadMoreMatches get _value => super._value as _LoadMoreMatches;

  @override
  $Res call({
    Object? lastDate = freezed,
    Object? cursor = freezed,
  }) {
    return _then(_LoadMoreMatches(
      lastDate == freezed
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as Cursor,
    ));
  }
}

/// @nodoc

class _$_LoadMoreMatches implements _LoadMoreMatches {
  const _$_LoadMoreMatches(this.lastDate, this.cursor);

  @override
  final DateTime? lastDate;
  @override
  final Cursor cursor;

  @override
  String toString() {
    return 'FindMatchesEvent.loadMoreMatches(lastDate: $lastDate, cursor: $cursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadMoreMatches &&
            const DeepCollectionEquality().equals(other.lastDate, lastDate) &&
            const DeepCollectionEquality().equals(other.cursor, cursor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lastDate),
      const DeepCollectionEquality().hash(cursor));

  @JsonKey(ignore: true)
  @override
  _$LoadMoreMatchesCopyWith<_LoadMoreMatches> get copyWith =>
      __$LoadMoreMatchesCopyWithImpl<_LoadMoreMatches>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? lastDate, Cursor cursor)
        loadMoreMatches,
  }) {
    return loadMoreMatches(lastDate, cursor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime? lastDate, Cursor cursor)? loadMoreMatches,
  }) {
    return loadMoreMatches?.call(lastDate, cursor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? lastDate, Cursor cursor)? loadMoreMatches,
    required TResult orElse(),
  }) {
    if (loadMoreMatches != null) {
      return loadMoreMatches(lastDate, cursor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMoreMatches value) loadMoreMatches,
  }) {
    return loadMoreMatches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadMoreMatches value)? loadMoreMatches,
  }) {
    return loadMoreMatches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMoreMatches value)? loadMoreMatches,
    required TResult orElse(),
  }) {
    if (loadMoreMatches != null) {
      return loadMoreMatches(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreMatches implements FindMatchesEvent {
  const factory _LoadMoreMatches(DateTime? lastDate, Cursor cursor) =
      _$_LoadMoreMatches;

  @override
  DateTime? get lastDate;
  @override
  Cursor get cursor;
  @override
  @JsonKey(ignore: true)
  _$LoadMoreMatchesCopyWith<_LoadMoreMatches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FindMatchesStateTearOff {
  const _$FindMatchesStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Success success(List<TruYouUser> users) {
    return _Success(
      users,
    );
  }

  _Failed failed(FailureType exception) {
    return _Failed(
      exception,
    );
  }
}

/// @nodoc
const $FindMatchesState = _$FindMatchesStateTearOff();

/// @nodoc
mixin _$FindMatchesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TruYouUser> users) success,
    required TResult Function(FailureType exception) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
    TResult Function(FailureType exception)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
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
abstract class $FindMatchesStateCopyWith<$Res> {
  factory $FindMatchesStateCopyWith(
          FindMatchesState value, $Res Function(FindMatchesState) then) =
      _$FindMatchesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FindMatchesStateCopyWithImpl<$Res>
    implements $FindMatchesStateCopyWith<$Res> {
  _$FindMatchesStateCopyWithImpl(this._value, this._then);

  final FindMatchesState _value;
  // ignore: unused_field
  final $Res Function(FindMatchesState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$FindMatchesStateCopyWithImpl<$Res>
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
    return 'FindMatchesState.initial()';
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
    required TResult Function(List<TruYouUser> users) success,
    required TResult Function(FailureType exception) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
    TResult Function(FailureType exception)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
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

abstract class _Initial implements FindMatchesState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$FindMatchesStateCopyWithImpl<$Res>
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
    return 'FindMatchesState.loading()';
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
    required TResult Function(List<TruYouUser> users) success,
    required TResult Function(FailureType exception) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
    TResult Function(FailureType exception)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
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

abstract class _Loading implements FindMatchesState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({List<TruYouUser> users});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$FindMatchesStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_Success(
      users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<TruYouUser>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.users);

  @override
  final List<TruYouUser> users;

  @override
  String toString() {
    return 'FindMatchesState.success(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(users));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TruYouUser> users) success,
    required TResult Function(FailureType exception) failed,
  }) {
    return success(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
    TResult Function(FailureType exception)? failed,
  }) {
    return success?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(users);
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

abstract class _Success implements FindMatchesState {
  const factory _Success(List<TruYouUser> users) = _$_Success;

  List<TruYouUser> get users;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailedCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) then) =
      __$FailedCopyWithImpl<$Res>;
  $Res call({FailureType exception});

  $FailureTypeCopyWith<$Res> get exception;
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> extends _$FindMatchesStateCopyWithImpl<$Res>
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
    return 'FindMatchesState.failed(exception: $exception)';
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
    required TResult Function(List<TruYouUser> users) success,
    required TResult Function(FailureType exception) failed,
  }) {
    return failed(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
    TResult Function(FailureType exception)? failed,
  }) {
    return failed?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TruYouUser> users)? success,
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

abstract class _Failed implements FindMatchesState {
  const factory _Failed(FailureType exception) = _$_Failed;

  FailureType get exception;
  @JsonKey(ignore: true)
  _$FailedCopyWith<_Failed> get copyWith => throw _privateConstructorUsedError;
}
