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
  DoctorCategory? get doctors => throw _privateConstructorUsedError;
  FormzSubmissionStatus get doctorSingleStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get fetchDoctors => throw _privateConstructorUsedError;
  FormzSubmissionStatus get fetchDoctorsJobs =>
      throw _privateConstructorUsedError; // Doctor details specific state
  ModelDoctor? get doctorDetails => throw _privateConstructorUsedError;
  List<String> get doctorsFilterList => throw _privateConstructorUsedError;
  List<DoctorsJob> get doctorsJob => throw _privateConstructorUsedError;
  List<DoctorsInfo> get doctorInfoItems => throw _privateConstructorUsedError;

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
      {DoctorCategory? doctors,
      FormzSubmissionStatus doctorSingleStatus,
      FormzSubmissionStatus fetchDoctors,
      FormzSubmissionStatus fetchDoctorsJobs,
      ModelDoctor? doctorDetails,
      List<String> doctorsFilterList,
      List<DoctorsJob> doctorsJob,
      List<DoctorsInfo> doctorInfoItems});
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
    Object? doctors = freezed,
    Object? doctorSingleStatus = null,
    Object? fetchDoctors = null,
    Object? fetchDoctorsJobs = null,
    Object? doctorDetails = freezed,
    Object? doctorsFilterList = null,
    Object? doctorsJob = null,
    Object? doctorInfoItems = null,
  }) {
    return _then(_value.copyWith(
      doctors: freezed == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as DoctorCategory?,
      doctorSingleStatus: null == doctorSingleStatus
          ? _value.doctorSingleStatus
          : doctorSingleStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      fetchDoctors: null == fetchDoctors
          ? _value.fetchDoctors
          : fetchDoctors // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      fetchDoctorsJobs: null == fetchDoctorsJobs
          ? _value.fetchDoctorsJobs
          : fetchDoctorsJobs // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      doctorDetails: freezed == doctorDetails
          ? _value.doctorDetails
          : doctorDetails // ignore: cast_nullable_to_non_nullable
              as ModelDoctor?,
      doctorsFilterList: null == doctorsFilterList
          ? _value.doctorsFilterList
          : doctorsFilterList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      doctorsJob: null == doctorsJob
          ? _value.doctorsJob
          : doctorsJob // ignore: cast_nullable_to_non_nullable
              as List<DoctorsJob>,
      doctorInfoItems: null == doctorInfoItems
          ? _value.doctorInfoItems
          : doctorInfoItems // ignore: cast_nullable_to_non_nullable
              as List<DoctorsInfo>,
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
      {DoctorCategory? doctors,
      FormzSubmissionStatus doctorSingleStatus,
      FormzSubmissionStatus fetchDoctors,
      FormzSubmissionStatus fetchDoctorsJobs,
      ModelDoctor? doctorDetails,
      List<String> doctorsFilterList,
      List<DoctorsJob> doctorsJob,
      List<DoctorsInfo> doctorInfoItems});
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
    Object? doctors = freezed,
    Object? doctorSingleStatus = null,
    Object? fetchDoctors = null,
    Object? fetchDoctorsJobs = null,
    Object? doctorDetails = freezed,
    Object? doctorsFilterList = null,
    Object? doctorsJob = null,
    Object? doctorInfoItems = null,
  }) {
    return _then(_$DoctorStateImpl(
      doctors: freezed == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as DoctorCategory?,
      doctorSingleStatus: null == doctorSingleStatus
          ? _value.doctorSingleStatus
          : doctorSingleStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      fetchDoctors: null == fetchDoctors
          ? _value.fetchDoctors
          : fetchDoctors // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      fetchDoctorsJobs: null == fetchDoctorsJobs
          ? _value.fetchDoctorsJobs
          : fetchDoctorsJobs // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      doctorDetails: freezed == doctorDetails
          ? _value.doctorDetails
          : doctorDetails // ignore: cast_nullable_to_non_nullable
              as ModelDoctor?,
      doctorsFilterList: null == doctorsFilterList
          ? _value._doctorsFilterList
          : doctorsFilterList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      doctorsJob: null == doctorsJob
          ? _value._doctorsJob
          : doctorsJob // ignore: cast_nullable_to_non_nullable
              as List<DoctorsJob>,
      doctorInfoItems: null == doctorInfoItems
          ? _value._doctorInfoItems
          : doctorInfoItems // ignore: cast_nullable_to_non_nullable
              as List<DoctorsInfo>,
    ));
  }
}

/// @nodoc

class _$DoctorStateImpl extends _DoctorState {
  const _$DoctorStateImpl(
      {this.doctors = null,
      this.doctorSingleStatus = FormzSubmissionStatus.initial,
      this.fetchDoctors = FormzSubmissionStatus.initial,
      this.fetchDoctorsJobs = FormzSubmissionStatus.initial,
      this.doctorDetails = null,
      final List<String> doctorsFilterList = const [],
      final List<DoctorsJob> doctorsJob = const [],
      final List<DoctorsInfo> doctorInfoItems = const []})
      : _doctorsFilterList = doctorsFilterList,
        _doctorsJob = doctorsJob,
        _doctorInfoItems = doctorInfoItems,
        super._();

  @override
  @JsonKey()
  final DoctorCategory? doctors;
  @override
  @JsonKey()
  final FormzSubmissionStatus doctorSingleStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus fetchDoctors;
  @override
  @JsonKey()
  final FormzSubmissionStatus fetchDoctorsJobs;
// Doctor details specific state
  @override
  @JsonKey()
  final ModelDoctor? doctorDetails;
  final List<String> _doctorsFilterList;
  @override
  @JsonKey()
  List<String> get doctorsFilterList {
    if (_doctorsFilterList is EqualUnmodifiableListView)
      return _doctorsFilterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctorsFilterList);
  }

  final List<DoctorsJob> _doctorsJob;
  @override
  @JsonKey()
  List<DoctorsJob> get doctorsJob {
    if (_doctorsJob is EqualUnmodifiableListView) return _doctorsJob;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctorsJob);
  }

  final List<DoctorsInfo> _doctorInfoItems;
  @override
  @JsonKey()
  List<DoctorsInfo> get doctorInfoItems {
    if (_doctorInfoItems is EqualUnmodifiableListView) return _doctorInfoItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctorInfoItems);
  }

  @override
  String toString() {
    return 'DoctorState(doctors: $doctors, doctorSingleStatus: $doctorSingleStatus, fetchDoctors: $fetchDoctors, fetchDoctorsJobs: $fetchDoctorsJobs, doctorDetails: $doctorDetails, doctorsFilterList: $doctorsFilterList, doctorsJob: $doctorsJob, doctorInfoItems: $doctorInfoItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorStateImpl &&
            (identical(other.doctors, doctors) || other.doctors == doctors) &&
            (identical(other.doctorSingleStatus, doctorSingleStatus) ||
                other.doctorSingleStatus == doctorSingleStatus) &&
            (identical(other.fetchDoctors, fetchDoctors) ||
                other.fetchDoctors == fetchDoctors) &&
            (identical(other.fetchDoctorsJobs, fetchDoctorsJobs) ||
                other.fetchDoctorsJobs == fetchDoctorsJobs) &&
            (identical(other.doctorDetails, doctorDetails) ||
                other.doctorDetails == doctorDetails) &&
            const DeepCollectionEquality()
                .equals(other._doctorsFilterList, _doctorsFilterList) &&
            const DeepCollectionEquality()
                .equals(other._doctorsJob, _doctorsJob) &&
            const DeepCollectionEquality()
                .equals(other._doctorInfoItems, _doctorInfoItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      doctors,
      doctorSingleStatus,
      fetchDoctors,
      fetchDoctorsJobs,
      doctorDetails,
      const DeepCollectionEquality().hash(_doctorsFilterList),
      const DeepCollectionEquality().hash(_doctorsJob),
      const DeepCollectionEquality().hash(_doctorInfoItems));

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
      {final DoctorCategory? doctors,
      final FormzSubmissionStatus doctorSingleStatus,
      final FormzSubmissionStatus fetchDoctors,
      final FormzSubmissionStatus fetchDoctorsJobs,
      final ModelDoctor? doctorDetails,
      final List<String> doctorsFilterList,
      final List<DoctorsJob> doctorsJob,
      final List<DoctorsInfo> doctorInfoItems}) = _$DoctorStateImpl;
  const _DoctorState._() : super._();

  @override
  DoctorCategory? get doctors;
  @override
  FormzSubmissionStatus get doctorSingleStatus;
  @override
  FormzSubmissionStatus get fetchDoctors;
  @override
  FormzSubmissionStatus get fetchDoctorsJobs; // Doctor details specific state
  @override
  ModelDoctor? get doctorDetails;
  @override
  List<String> get doctorsFilterList;
  @override
  List<DoctorsJob> get doctorsJob;
  @override
  List<DoctorsInfo> get doctorInfoItems;

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorStateImplCopyWith<_$DoctorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
