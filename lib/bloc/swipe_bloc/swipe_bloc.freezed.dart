// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'swipe_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SwipeEventTearOff {
  const _$SwipeEventTearOff();

  _SwipeRight swipeRight(
      BuildContext context, TruYouUser user, DateTime? lastDate) {
    return _SwipeRight(
      context,
      user,
      lastDate,
    );
  }

  _SwipeLeft swipeLeft(TruYouUser user, DateTime? lastDate) {
    return _SwipeLeft(
      user,
      lastDate,
    );
  }
}

/// @nodoc
const $SwipeEvent = _$SwipeEventTearOff();

/// @nodoc
mixin _$SwipeEvent {
  TruYouUser get user => throw _privateConstructorUsedError;
  DateTime? get lastDate => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, TruYouUser user, DateTime? lastDate)
        swipeRight,
    required TResult Function(TruYouUser user, DateTime? lastDate) swipeLeft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, TruYouUser user, DateTime? lastDate)?
        swipeRight,
    TResult Function(TruYouUser user, DateTime? lastDate)? swipeLeft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, TruYouUser user, DateTime? lastDate)?
        swipeRight,
    TResult Function(TruYouUser user, DateTime? lastDate)? swipeLeft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwipeRight value) swipeRight,
    required TResult Function(_SwipeLeft value) swipeLeft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SwipeRight value)? swipeRight,
    TResult Function(_SwipeLeft value)? swipeLeft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwipeRight value)? swipeRight,
    TResult Function(_SwipeLeft value)? swipeLeft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwipeEventCopyWith<SwipeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwipeEventCopyWith<$Res> {
  factory $SwipeEventCopyWith(
          SwipeEvent value, $Res Function(SwipeEvent) then) =
      _$SwipeEventCopyWithImpl<$Res>;
  $Res call({TruYouUser user, DateTime? lastDate});

  $TruYouUserCopyWith<$Res> get user;
}

/// @nodoc
class _$SwipeEventCopyWithImpl<$Res> implements $SwipeEventCopyWith<$Res> {
  _$SwipeEventCopyWithImpl(this._value, this._then);

  final SwipeEvent _value;
  // ignore: unused_field
  final $Res Function(SwipeEvent) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? lastDate = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as TruYouUser,
      lastDate: lastDate == freezed
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $TruYouUserCopyWith<$Res> get user {
    return $TruYouUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$SwipeRightCopyWith<$Res> implements $SwipeEventCopyWith<$Res> {
  factory _$SwipeRightCopyWith(
          _SwipeRight value, $Res Function(_SwipeRight) then) =
      __$SwipeRightCopyWithImpl<$Res>;
  @override
  $Res call({BuildContext context, TruYouUser user, DateTime? lastDate});

  @override
  $TruYouUserCopyWith<$Res> get user;
}

/// @nodoc
class __$SwipeRightCopyWithImpl<$Res> extends _$SwipeEventCopyWithImpl<$Res>
    implements _$SwipeRightCopyWith<$Res> {
  __$SwipeRightCopyWithImpl(
      _SwipeRight _value, $Res Function(_SwipeRight) _then)
      : super(_value, (v) => _then(v as _SwipeRight));

  @override
  _SwipeRight get _value => super._value as _SwipeRight;

  @override
  $Res call({
    Object? context = freezed,
    Object? user = freezed,
    Object? lastDate = freezed,
  }) {
    return _then(_SwipeRight(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as TruYouUser,
      lastDate == freezed
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_SwipeRight implements _SwipeRight {
  const _$_SwipeRight(this.context, this.user, this.lastDate);

  @override
  final BuildContext context;
  @override
  final TruYouUser user;
  @override
  final DateTime? lastDate;

  @override
  String toString() {
    return 'SwipeEvent.swipeRight(context: $context, user: $user, lastDate: $lastDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SwipeRight &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.lastDate, lastDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(lastDate));

  @JsonKey(ignore: true)
  @override
  _$SwipeRightCopyWith<_SwipeRight> get copyWith =>
      __$SwipeRightCopyWithImpl<_SwipeRight>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, TruYouUser user, DateTime? lastDate)
        swipeRight,
    required TResult Function(TruYouUser user, DateTime? lastDate) swipeLeft,
  }) {
    return swipeRight(context, user, lastDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, TruYouUser user, DateTime? lastDate)?
        swipeRight,
    TResult Function(TruYouUser user, DateTime? lastDate)? swipeLeft,
  }) {
    return swipeRight?.call(context, user, lastDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, TruYouUser user, DateTime? lastDate)?
        swipeRight,
    TResult Function(TruYouUser user, DateTime? lastDate)? swipeLeft,
    required TResult orElse(),
  }) {
    if (swipeRight != null) {
      return swipeRight(context, user, lastDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwipeRight value) swipeRight,
    required TResult Function(_SwipeLeft value) swipeLeft,
  }) {
    return swipeRight(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SwipeRight value)? swipeRight,
    TResult Function(_SwipeLeft value)? swipeLeft,
  }) {
    return swipeRight?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwipeRight value)? swipeRight,
    TResult Function(_SwipeLeft value)? swipeLeft,
    required TResult orElse(),
  }) {
    if (swipeRight != null) {
      return swipeRight(this);
    }
    return orElse();
  }
}

abstract class _SwipeRight implements SwipeEvent {
  const factory _SwipeRight(
          BuildContext context, TruYouUser user, DateTime? lastDate) =
      _$_SwipeRight;

  BuildContext get context;
  @override
  TruYouUser get user;
  @override
  DateTime? get lastDate;
  @override
  @JsonKey(ignore: true)
  _$SwipeRightCopyWith<_SwipeRight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SwipeLeftCopyWith<$Res> implements $SwipeEventCopyWith<$Res> {
  factory _$SwipeLeftCopyWith(
          _SwipeLeft value, $Res Function(_SwipeLeft) then) =
      __$SwipeLeftCopyWithImpl<$Res>;
  @override
  $Res call({TruYouUser user, DateTime? lastDate});

  @override
  $TruYouUserCopyWith<$Res> get user;
}

/// @nodoc
class __$SwipeLeftCopyWithImpl<$Res> extends _$SwipeEventCopyWithImpl<$Res>
    implements _$SwipeLeftCopyWith<$Res> {
  __$SwipeLeftCopyWithImpl(_SwipeLeft _value, $Res Function(_SwipeLeft) _then)
      : super(_value, (v) => _then(v as _SwipeLeft));

  @override
  _SwipeLeft get _value => super._value as _SwipeLeft;

  @override
  $Res call({
    Object? user = freezed,
    Object? lastDate = freezed,
  }) {
    return _then(_SwipeLeft(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as TruYouUser,
      lastDate == freezed
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_SwipeLeft implements _SwipeLeft {
  const _$_SwipeLeft(this.user, this.lastDate);

  @override
  final TruYouUser user;
  @override
  final DateTime? lastDate;

  @override
  String toString() {
    return 'SwipeEvent.swipeLeft(user: $user, lastDate: $lastDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SwipeLeft &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.lastDate, lastDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(lastDate));

  @JsonKey(ignore: true)
  @override
  _$SwipeLeftCopyWith<_SwipeLeft> get copyWith =>
      __$SwipeLeftCopyWithImpl<_SwipeLeft>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, TruYouUser user, DateTime? lastDate)
        swipeRight,
    required TResult Function(TruYouUser user, DateTime? lastDate) swipeLeft,
  }) {
    return swipeLeft(user, lastDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, TruYouUser user, DateTime? lastDate)?
        swipeRight,
    TResult Function(TruYouUser user, DateTime? lastDate)? swipeLeft,
  }) {
    return swipeLeft?.call(user, lastDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, TruYouUser user, DateTime? lastDate)?
        swipeRight,
    TResult Function(TruYouUser user, DateTime? lastDate)? swipeLeft,
    required TResult orElse(),
  }) {
    if (swipeLeft != null) {
      return swipeLeft(user, lastDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwipeRight value) swipeRight,
    required TResult Function(_SwipeLeft value) swipeLeft,
  }) {
    return swipeLeft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SwipeRight value)? swipeRight,
    TResult Function(_SwipeLeft value)? swipeLeft,
  }) {
    return swipeLeft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwipeRight value)? swipeRight,
    TResult Function(_SwipeLeft value)? swipeLeft,
    required TResult orElse(),
  }) {
    if (swipeLeft != null) {
      return swipeLeft(this);
    }
    return orElse();
  }
}

abstract class _SwipeLeft implements SwipeEvent {
  const factory _SwipeLeft(TruYouUser user, DateTime? lastDate) = _$_SwipeLeft;

  @override
  TruYouUser get user;
  @override
  DateTime? get lastDate;
  @override
  @JsonKey(ignore: true)
  _$SwipeLeftCopyWith<_SwipeLeft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SwipeStateTearOff {
  const _$SwipeStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _SwipeRightCompleted swipeRightCompleted(bool hasMatched) {
    return _SwipeRightCompleted(
      hasMatched,
    );
  }

  _SwipeLeftCompleted swipeLeftCompleted() {
    return const _SwipeLeftCompleted();
  }

  _Failed failed(FailureType exception) {
    return _Failed(
      exception,
    );
  }
}

/// @nodoc
const $SwipeState = _$SwipeStateTearOff();

/// @nodoc
mixin _$SwipeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool hasMatched) swipeRightCompleted,
    required TResult Function() swipeLeftCompleted,
    required TResult Function(FailureType exception) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SwipeRightCompleted value) swipeRightCompleted,
    required TResult Function(_SwipeLeftCompleted value) swipeLeftCompleted,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwipeStateCopyWith<$Res> {
  factory $SwipeStateCopyWith(
          SwipeState value, $Res Function(SwipeState) then) =
      _$SwipeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SwipeStateCopyWithImpl<$Res> implements $SwipeStateCopyWith<$Res> {
  _$SwipeStateCopyWithImpl(this._value, this._then);

  final SwipeState _value;
  // ignore: unused_field
  final $Res Function(SwipeState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SwipeStateCopyWithImpl<$Res>
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
    return 'SwipeState.initial()';
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
    required TResult Function(bool hasMatched) swipeRightCompleted,
    required TResult Function() swipeLeftCompleted,
    required TResult Function(FailureType exception) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
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
    required TResult Function(_SwipeRightCompleted value) swipeRightCompleted,
    required TResult Function(_SwipeLeftCompleted value) swipeLeftCompleted,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SwipeState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$SwipeStateCopyWithImpl<$Res>
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
    return 'SwipeState.loading()';
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
    required TResult Function(bool hasMatched) swipeRightCompleted,
    required TResult Function() swipeLeftCompleted,
    required TResult Function(FailureType exception) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
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
    required TResult Function(_SwipeRightCompleted value) swipeRightCompleted,
    required TResult Function(_SwipeLeftCompleted value) swipeLeftCompleted,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SwipeState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$SwipeRightCompletedCopyWith<$Res> {
  factory _$SwipeRightCompletedCopyWith(_SwipeRightCompleted value,
          $Res Function(_SwipeRightCompleted) then) =
      __$SwipeRightCompletedCopyWithImpl<$Res>;
  $Res call({bool hasMatched});
}

/// @nodoc
class __$SwipeRightCompletedCopyWithImpl<$Res>
    extends _$SwipeStateCopyWithImpl<$Res>
    implements _$SwipeRightCompletedCopyWith<$Res> {
  __$SwipeRightCompletedCopyWithImpl(
      _SwipeRightCompleted _value, $Res Function(_SwipeRightCompleted) _then)
      : super(_value, (v) => _then(v as _SwipeRightCompleted));

  @override
  _SwipeRightCompleted get _value => super._value as _SwipeRightCompleted;

  @override
  $Res call({
    Object? hasMatched = freezed,
  }) {
    return _then(_SwipeRightCompleted(
      hasMatched == freezed
          ? _value.hasMatched
          : hasMatched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SwipeRightCompleted implements _SwipeRightCompleted {
  const _$_SwipeRightCompleted(this.hasMatched);

  @override
  final bool hasMatched;

  @override
  String toString() {
    return 'SwipeState.swipeRightCompleted(hasMatched: $hasMatched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SwipeRightCompleted &&
            const DeepCollectionEquality()
                .equals(other.hasMatched, hasMatched));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(hasMatched));

  @JsonKey(ignore: true)
  @override
  _$SwipeRightCompletedCopyWith<_SwipeRightCompleted> get copyWith =>
      __$SwipeRightCompletedCopyWithImpl<_SwipeRightCompleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool hasMatched) swipeRightCompleted,
    required TResult Function() swipeLeftCompleted,
    required TResult Function(FailureType exception) failed,
  }) {
    return swipeRightCompleted(hasMatched);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
  }) {
    return swipeRightCompleted?.call(hasMatched);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (swipeRightCompleted != null) {
      return swipeRightCompleted(hasMatched);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SwipeRightCompleted value) swipeRightCompleted,
    required TResult Function(_SwipeLeftCompleted value) swipeLeftCompleted,
    required TResult Function(_Failed value) failed,
  }) {
    return swipeRightCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
  }) {
    return swipeRightCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (swipeRightCompleted != null) {
      return swipeRightCompleted(this);
    }
    return orElse();
  }
}

abstract class _SwipeRightCompleted implements SwipeState {
  const factory _SwipeRightCompleted(bool hasMatched) = _$_SwipeRightCompleted;

  bool get hasMatched;
  @JsonKey(ignore: true)
  _$SwipeRightCompletedCopyWith<_SwipeRightCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SwipeLeftCompletedCopyWith<$Res> {
  factory _$SwipeLeftCompletedCopyWith(
          _SwipeLeftCompleted value, $Res Function(_SwipeLeftCompleted) then) =
      __$SwipeLeftCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SwipeLeftCompletedCopyWithImpl<$Res>
    extends _$SwipeStateCopyWithImpl<$Res>
    implements _$SwipeLeftCompletedCopyWith<$Res> {
  __$SwipeLeftCompletedCopyWithImpl(
      _SwipeLeftCompleted _value, $Res Function(_SwipeLeftCompleted) _then)
      : super(_value, (v) => _then(v as _SwipeLeftCompleted));

  @override
  _SwipeLeftCompleted get _value => super._value as _SwipeLeftCompleted;
}

/// @nodoc

class _$_SwipeLeftCompleted implements _SwipeLeftCompleted {
  const _$_SwipeLeftCompleted();

  @override
  String toString() {
    return 'SwipeState.swipeLeftCompleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SwipeLeftCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool hasMatched) swipeRightCompleted,
    required TResult Function() swipeLeftCompleted,
    required TResult Function(FailureType exception) failed,
  }) {
    return swipeLeftCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
  }) {
    return swipeLeftCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
    required TResult orElse(),
  }) {
    if (swipeLeftCompleted != null) {
      return swipeLeftCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SwipeRightCompleted value) swipeRightCompleted,
    required TResult Function(_SwipeLeftCompleted value) swipeLeftCompleted,
    required TResult Function(_Failed value) failed,
  }) {
    return swipeLeftCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
  }) {
    return swipeLeftCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (swipeLeftCompleted != null) {
      return swipeLeftCompleted(this);
    }
    return orElse();
  }
}

abstract class _SwipeLeftCompleted implements SwipeState {
  const factory _SwipeLeftCompleted() = _$_SwipeLeftCompleted;
}

/// @nodoc
abstract class _$FailedCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) then) =
      __$FailedCopyWithImpl<$Res>;
  $Res call({FailureType exception});

  $FailureTypeCopyWith<$Res> get exception;
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> extends _$SwipeStateCopyWithImpl<$Res>
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
    return 'SwipeState.failed(exception: $exception)';
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
    required TResult Function(bool hasMatched) swipeRightCompleted,
    required TResult Function() swipeLeftCompleted,
    required TResult Function(FailureType exception) failed,
  }) {
    return failed(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
    TResult Function(FailureType exception)? failed,
  }) {
    return failed?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool hasMatched)? swipeRightCompleted,
    TResult Function()? swipeLeftCompleted,
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
    required TResult Function(_SwipeRightCompleted value) swipeRightCompleted,
    required TResult Function(_SwipeLeftCompleted value) swipeLeftCompleted,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SwipeRightCompleted value)? swipeRightCompleted,
    TResult Function(_SwipeLeftCompleted value)? swipeLeftCompleted,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements SwipeState {
  const factory _Failed(FailureType exception) = _$_Failed;

  FailureType get exception;
  @JsonKey(ignore: true)
  _$FailedCopyWith<_Failed> get copyWith => throw _privateConstructorUsedError;
}
