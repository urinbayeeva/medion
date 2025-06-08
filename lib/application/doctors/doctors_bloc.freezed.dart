// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctors_bloc.dart';

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
    required TResult Function() fetchDoctors,
    required TResult Function(int doctorId) fetchDoctorDetails,
    required TResult Function() fetchDoctorsJob,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchDoctors,
    TResult? Function(int doctorId)? fetchDoctorDetails,
    TResult? Function()? fetchDoctorsJob,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchDoctors,
    TResult Function(int doctorId)? fetchDoctorDetails,
    TResult Function()? fetchDoctorsJob,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDoctors value) fetchDoctors,
    required TResult Function(_FetchDoctorDetails value) fetchDoctorDetails,
    required TResult Function(_FetchDoctorsJob value) fetchDoctorsJob,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDoctors value)? fetchDoctors,
    TResult? Function(_FetchDoctorDetails value)? fetchDoctorDetails,
    TResult? Function(_FetchDoctorsJob value)? fetchDoctorsJob,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDoctors value)? fetchDoctors,
    TResult Function(_FetchDoctorDetails value)? fetchDoctorDetails,
    TResult Function(_FetchDoctorsJob value)? fetchDoctorsJob,
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
abstract class _$$FetchDoctorsImplCopyWith<$Res> {
  factory _$$FetchDoctorsImplCopyWith(
          _$FetchDoctorsImpl value, $Res Function(_$FetchDoctorsImpl) then) =
      __$$FetchDoctorsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchDoctorsImplCopyWithImpl<$Res>
    extends _$DoctorEventCopyWithImpl<$Res, _$FetchDoctorsImpl>
    implements _$$FetchDoctorsImplCopyWith<$Res> {
  __$$FetchDoctorsImplCopyWithImpl(
      _$FetchDoctorsImpl _value, $Res Function(_$FetchDoctorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchDoctorsImpl implements _FetchDoctors {
  const _$FetchDoctorsImpl();

  @override
  String toString() {
    return 'DoctorEvent.fetchDoctors()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchDoctorsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchDoctors,
    required TResult Function(int doctorId) fetchDoctorDetails,
    required TResult Function() fetchDoctorsJob,
  }) {
    return fetchDoctors();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchDoctors,
    TResult? Function(int doctorId)? fetchDoctorDetails,
    TResult? Function()? fetchDoctorsJob,
  }) {
    return fetchDoctors?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchDoctors,
    TResult Function(int doctorId)? fetchDoctorDetails,
    TResult Function()? fetchDoctorsJob,
    required TResult orElse(),
  }) {
    if (fetchDoctors != null) {
      return fetchDoctors();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDoctors value) fetchDoctors,
    required TResult Function(_FetchDoctorDetails value) fetchDoctorDetails,
    required TResult Function(_FetchDoctorsJob value) fetchDoctorsJob,
  }) {
    return fetchDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDoctors value)? fetchDoctors,
    TResult? Function(_FetchDoctorDetails value)? fetchDoctorDetails,
    TResult? Function(_FetchDoctorsJob value)? fetchDoctorsJob,
  }) {
    return fetchDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDoctors value)? fetchDoctors,
    TResult Function(_FetchDoctorDetails value)? fetchDoctorDetails,
    TResult Function(_FetchDoctorsJob value)? fetchDoctorsJob,
    required TResult orElse(),
  }) {
    if (fetchDoctors != null) {
      return fetchDoctors(this);
    }
    return orElse();
  }
}

abstract class _FetchDoctors implements DoctorEvent {
  const factory _FetchDoctors() = _$FetchDoctorsImpl;
}

/// @nodoc
abstract class _$$FetchDoctorDetailsImplCopyWith<$Res> {
  factory _$$FetchDoctorDetailsImplCopyWith(_$FetchDoctorDetailsImpl value,
          $Res Function(_$FetchDoctorDetailsImpl) then) =
      __$$FetchDoctorDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int doctorId});
}

/// @nodoc
class __$$FetchDoctorDetailsImplCopyWithImpl<$Res>
    extends _$DoctorEventCopyWithImpl<$Res, _$FetchDoctorDetailsImpl>
    implements _$$FetchDoctorDetailsImplCopyWith<$Res> {
  __$$FetchDoctorDetailsImplCopyWithImpl(_$FetchDoctorDetailsImpl _value,
      $Res Function(_$FetchDoctorDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
  }) {
    return _then(_$FetchDoctorDetailsImpl(
      null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchDoctorDetailsImpl implements _FetchDoctorDetails {
  const _$FetchDoctorDetailsImpl(this.doctorId);

  @override
  final int doctorId;

  @override
  String toString() {
    return 'DoctorEvent.fetchDoctorDetails(doctorId: $doctorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDoctorDetailsImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doctorId);

  /// Create a copy of DoctorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDoctorDetailsImplCopyWith<_$FetchDoctorDetailsImpl> get copyWith =>
      __$$FetchDoctorDetailsImplCopyWithImpl<_$FetchDoctorDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchDoctors,
    required TResult Function(int doctorId) fetchDoctorDetails,
    required TResult Function() fetchDoctorsJob,
  }) {
    return fetchDoctorDetails(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchDoctors,
    TResult? Function(int doctorId)? fetchDoctorDetails,
    TResult? Function()? fetchDoctorsJob,
  }) {
    return fetchDoctorDetails?.call(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchDoctors,
    TResult Function(int doctorId)? fetchDoctorDetails,
    TResult Function()? fetchDoctorsJob,
    required TResult orElse(),
  }) {
    if (fetchDoctorDetails != null) {
      return fetchDoctorDetails(doctorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDoctors value) fetchDoctors,
    required TResult Function(_FetchDoctorDetails value) fetchDoctorDetails,
    required TResult Function(_FetchDoctorsJob value) fetchDoctorsJob,
  }) {
    return fetchDoctorDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDoctors value)? fetchDoctors,
    TResult? Function(_FetchDoctorDetails value)? fetchDoctorDetails,
    TResult? Function(_FetchDoctorsJob value)? fetchDoctorsJob,
  }) {
    return fetchDoctorDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDoctors value)? fetchDoctors,
    TResult Function(_FetchDoctorDetails value)? fetchDoctorDetails,
    TResult Function(_FetchDoctorsJob value)? fetchDoctorsJob,
    required TResult orElse(),
  }) {
    if (fetchDoctorDetails != null) {
      return fetchDoctorDetails(this);
    }
    return orElse();
  }
}

abstract class _FetchDoctorDetails implements DoctorEvent {
  const factory _FetchDoctorDetails(final int doctorId) =
      _$FetchDoctorDetailsImpl;

  int get doctorId;

  /// Create a copy of DoctorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchDoctorDetailsImplCopyWith<_$FetchDoctorDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchDoctorsJobImplCopyWith<$Res> {
  factory _$$FetchDoctorsJobImplCopyWith(_$FetchDoctorsJobImpl value,
          $Res Function(_$FetchDoctorsJobImpl) then) =
      __$$FetchDoctorsJobImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchDoctorsJobImplCopyWithImpl<$Res>
    extends _$DoctorEventCopyWithImpl<$Res, _$FetchDoctorsJobImpl>
    implements _$$FetchDoctorsJobImplCopyWith<$Res> {
  __$$FetchDoctorsJobImplCopyWithImpl(
      _$FetchDoctorsJobImpl _value, $Res Function(_$FetchDoctorsJobImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchDoctorsJobImpl implements _FetchDoctorsJob {
  const _$FetchDoctorsJobImpl();

  @override
  String toString() {
    return 'DoctorEvent.fetchDoctorsJob()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchDoctorsJobImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchDoctors,
    required TResult Function(int doctorId) fetchDoctorDetails,
    required TResult Function() fetchDoctorsJob,
  }) {
    return fetchDoctorsJob();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchDoctors,
    TResult? Function(int doctorId)? fetchDoctorDetails,
    TResult? Function()? fetchDoctorsJob,
  }) {
    return fetchDoctorsJob?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchDoctors,
    TResult Function(int doctorId)? fetchDoctorDetails,
    TResult Function()? fetchDoctorsJob,
    required TResult orElse(),
  }) {
    if (fetchDoctorsJob != null) {
      return fetchDoctorsJob();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDoctors value) fetchDoctors,
    required TResult Function(_FetchDoctorDetails value) fetchDoctorDetails,
    required TResult Function(_FetchDoctorsJob value) fetchDoctorsJob,
  }) {
    return fetchDoctorsJob(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDoctors value)? fetchDoctors,
    TResult? Function(_FetchDoctorDetails value)? fetchDoctorDetails,
    TResult? Function(_FetchDoctorsJob value)? fetchDoctorsJob,
  }) {
    return fetchDoctorsJob?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDoctors value)? fetchDoctors,
    TResult Function(_FetchDoctorDetails value)? fetchDoctorDetails,
    TResult Function(_FetchDoctorsJob value)? fetchDoctorsJob,
    required TResult orElse(),
  }) {
    if (fetchDoctorsJob != null) {
      return fetchDoctorsJob(this);
    }
    return orElse();
  }
}

abstract class _FetchDoctorsJob implements DoctorEvent {
  const factory _FetchDoctorsJob() = _$FetchDoctorsJobImpl;
}

/// @nodoc
mixin _$DoctorState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  DoctorCategory? get doctors =>
      throw _privateConstructorUsedError; // Doctor details specific state
  bool get doctorDetailsLoading => throw _privateConstructorUsedError;
  bool get doctorDetailsError => throw _privateConstructorUsedError;
  bool get doctorDetailsSuccess => throw _privateConstructorUsedError;
  ModelDoctor? get doctorDetails => throw _privateConstructorUsedError;
  List<DoctorsJob> get doctorsJob => throw _privateConstructorUsedError;

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
      DoctorCategory? doctors,
      bool doctorDetailsLoading,
      bool doctorDetailsError,
      bool doctorDetailsSuccess,
      ModelDoctor? doctorDetails,
      List<DoctorsJob> doctorsJob});
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
    Object? doctorDetailsLoading = null,
    Object? doctorDetailsError = null,
    Object? doctorDetailsSuccess = null,
    Object? doctorDetails = freezed,
    Object? doctorsJob = null,
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
              as DoctorCategory?,
      doctorDetailsLoading: null == doctorDetailsLoading
          ? _value.doctorDetailsLoading
          : doctorDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorDetailsError: null == doctorDetailsError
          ? _value.doctorDetailsError
          : doctorDetailsError // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorDetailsSuccess: null == doctorDetailsSuccess
          ? _value.doctorDetailsSuccess
          : doctorDetailsSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorDetails: freezed == doctorDetails
          ? _value.doctorDetails
          : doctorDetails // ignore: cast_nullable_to_non_nullable
              as ModelDoctor?,
      doctorsJob: null == doctorsJob
          ? _value.doctorsJob
          : doctorsJob // ignore: cast_nullable_to_non_nullable
              as List<DoctorsJob>,
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
      DoctorCategory? doctors,
      bool doctorDetailsLoading,
      bool doctorDetailsError,
      bool doctorDetailsSuccess,
      ModelDoctor? doctorDetails,
      List<DoctorsJob> doctorsJob});
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
    Object? doctorDetailsLoading = null,
    Object? doctorDetailsError = null,
    Object? doctorDetailsSuccess = null,
    Object? doctorDetails = freezed,
    Object? doctorsJob = null,
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
              as DoctorCategory?,
      doctorDetailsLoading: null == doctorDetailsLoading
          ? _value.doctorDetailsLoading
          : doctorDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorDetailsError: null == doctorDetailsError
          ? _value.doctorDetailsError
          : doctorDetailsError // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorDetailsSuccess: null == doctorDetailsSuccess
          ? _value.doctorDetailsSuccess
          : doctorDetailsSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorDetails: freezed == doctorDetails
          ? _value.doctorDetails
          : doctorDetails // ignore: cast_nullable_to_non_nullable
              as ModelDoctor?,
      doctorsJob: null == doctorsJob
          ? _value._doctorsJob
          : doctorsJob // ignore: cast_nullable_to_non_nullable
              as List<DoctorsJob>,
    ));
  }
}

/// @nodoc

class _$DoctorStateImpl extends _DoctorState {
  const _$DoctorStateImpl(
      {this.loading = false,
      this.error = false,
      this.success = false,
      this.doctors = null,
      this.doctorDetailsLoading = false,
      this.doctorDetailsError = false,
      this.doctorDetailsSuccess = false,
      this.doctorDetails = null,
      final List<DoctorsJob> doctorsJob = const []})
      : _doctorsJob = doctorsJob,
        super._();

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
  final DoctorCategory? doctors;
// Doctor details specific state
  @override
  @JsonKey()
  final bool doctorDetailsLoading;
  @override
  @JsonKey()
  final bool doctorDetailsError;
  @override
  @JsonKey()
  final bool doctorDetailsSuccess;
  @override
  @JsonKey()
  final ModelDoctor? doctorDetails;
  final List<DoctorsJob> _doctorsJob;
  @override
  @JsonKey()
  List<DoctorsJob> get doctorsJob {
    if (_doctorsJob is EqualUnmodifiableListView) return _doctorsJob;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctorsJob);
  }

  @override
  String toString() {
    return 'DoctorState(loading: $loading, error: $error, success: $success, doctors: $doctors, doctorDetailsLoading: $doctorDetailsLoading, doctorDetailsError: $doctorDetailsError, doctorDetailsSuccess: $doctorDetailsSuccess, doctorDetails: $doctorDetails, doctorsJob: $doctorsJob)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.doctors, doctors) || other.doctors == doctors) &&
            (identical(other.doctorDetailsLoading, doctorDetailsLoading) ||
                other.doctorDetailsLoading == doctorDetailsLoading) &&
            (identical(other.doctorDetailsError, doctorDetailsError) ||
                other.doctorDetailsError == doctorDetailsError) &&
            (identical(other.doctorDetailsSuccess, doctorDetailsSuccess) ||
                other.doctorDetailsSuccess == doctorDetailsSuccess) &&
            (identical(other.doctorDetails, doctorDetails) ||
                other.doctorDetails == doctorDetails) &&
            const DeepCollectionEquality()
                .equals(other._doctorsJob, _doctorsJob));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      error,
      success,
      doctors,
      doctorDetailsLoading,
      doctorDetailsError,
      doctorDetailsSuccess,
      doctorDetails,
      const DeepCollectionEquality().hash(_doctorsJob));

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorStateImplCopyWith<_$DoctorStateImpl> get copyWith =>
      __$$DoctorStateImplCopyWithImpl<_$DoctorStateImpl>(this, _$identity);
}

abstract class _DoctorState extends DoctorState {
  const factory _DoctorState(
      {final bool loading,
      final bool error,
      final bool success,
      final DoctorCategory? doctors,
      final bool doctorDetailsLoading,
      final bool doctorDetailsError,
      final bool doctorDetailsSuccess,
      final ModelDoctor? doctorDetails,
      final List<DoctorsJob> doctorsJob}) = _$DoctorStateImpl;
  const _DoctorState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  bool get success;
  @override
  DoctorCategory? get doctors; // Doctor details specific state
  @override
  bool get doctorDetailsLoading;
  @override
  bool get doctorDetailsError;
  @override
  bool get doctorDetailsSuccess;
  @override
  ModelDoctor? get doctorDetails;
  @override
  List<DoctorsJob> get doctorsJob;

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorStateImplCopyWith<_$DoctorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
