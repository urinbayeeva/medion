// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DoctorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctors value) getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctors value)? getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctors value)? getDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorEventCopyWith<$Res> {
  factory $DoctorEventCopyWith(
          DoctorEvent value, $Res Function(DoctorEvent) then) =
      _$DoctorEventCopyWithImpl<$Res, DoctorEvent>;
}

/// @nodoc
class _$DoctorEventCopyWithImpl<$Res, $Val extends DoctorEvent>
    implements $DoctorEventCopyWith<$Res> {
  _$DoctorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetDoctorsImplCopyWith<$Res> {
  factory _$$GetDoctorsImplCopyWith(
          _$GetDoctorsImpl value, $Res Function(_$GetDoctorsImpl) then) =
      __$$GetDoctorsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDoctorsImplCopyWithImpl<$Res>
    extends _$DoctorEventCopyWithImpl<$Res, _$GetDoctorsImpl>
    implements _$$GetDoctorsImplCopyWith<$Res> {
  __$$GetDoctorsImplCopyWithImpl(
      _$GetDoctorsImpl _value, $Res Function(_$GetDoctorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetDoctorsImpl implements _GetDoctors {
  const _$GetDoctorsImpl();

  @override
  String toString() {
    return 'DoctorEvent.getDoctors()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDoctorsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDoctors,
  }) {
    return getDoctors();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDoctors,
  }) {
    return getDoctors?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctors value) getDoctors,
  }) {
    return getDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctors value)? getDoctors,
  }) {
    return getDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctors value)? getDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetDoctors implements DoctorEvent {
  const factory _GetDoctors() = _$GetDoctorsImpl;
}

/// @nodoc
mixin _$DoctorState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  BuiltList<DoctorCategory>? get doctors => throw _privateConstructorUsedError;

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorStateCopyWith<DoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorStateCopyWith<$Res> {
  factory $DoctorStateCopyWith(
          DoctorState value, $Res Function(DoctorState) then) =
      _$DoctorStateCopyWithImpl<$Res, DoctorState>;
  @useResult
  $Res call(
      {bool loading,
      bool error,
      bool success,
      BuiltList<DoctorCategory>? doctors});
}

/// @nodoc
class _$DoctorStateCopyWithImpl<$Res, $Val extends DoctorState>
    implements $DoctorStateCopyWith<$Res> {
  _$DoctorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? doctors = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      doctors: freezed == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as BuiltList<DoctorCategory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorStateImplCopyWith<$Res>
    implements $DoctorStateCopyWith<$Res> {
  factory _$$DoctorStateImplCopyWith(
          _$DoctorStateImpl value, $Res Function(_$DoctorStateImpl) then) =
      __$$DoctorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool error,
      bool success,
      BuiltList<DoctorCategory>? doctors});
}

/// @nodoc
class __$$DoctorStateImplCopyWithImpl<$Res>
    extends _$DoctorStateCopyWithImpl<$Res, _$DoctorStateImpl>
    implements _$$DoctorStateImplCopyWith<$Res> {
  __$$DoctorStateImplCopyWithImpl(
      _$DoctorStateImpl _value, $Res Function(_$DoctorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? doctors = freezed,
  }) {
    return _then(_$DoctorStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      doctors: freezed == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as BuiltList<DoctorCategory>?,
    ));
  }
}

/// @nodoc

class _$DoctorStateImpl implements _DoctorState {
  const _$DoctorStateImpl(
      {this.loading = false,
      this.error = false,
      this.success = false,
      this.doctors = null});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool error;
  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final BuiltList<DoctorCategory>? doctors;

  @override
  String toString() {
    return 'DoctorState(loading: $loading, error: $error, success: $success, doctors: $doctors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.doctors, doctors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error, success,
      const DeepCollectionEquality().hash(doctors));

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorStateImplCopyWith<_$DoctorStateImpl> get copyWith =>
      __$$DoctorStateImplCopyWithImpl<_$DoctorStateImpl>(this, _$identity);
}

abstract class _DoctorState implements DoctorState {
  const factory _DoctorState(
      {final bool loading,
      final bool error,
      final bool success,
      final BuiltList<DoctorCategory>? doctors}) = _$DoctorStateImpl;

  @override
  bool get loading;
  @override
  bool get error;
  @override
  bool get success;
  @override
  BuiltList<DoctorCategory>? get doctors;

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorStateImplCopyWith<_$DoctorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
