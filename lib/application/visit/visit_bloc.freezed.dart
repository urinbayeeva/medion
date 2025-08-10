// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VisitEvent {
  List<VisitRequest> get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<VisitRequest> request) createVisit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<VisitRequest> request)? createVisit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<VisitRequest> request)? createVisit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateVisit value) createVisit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateVisit value)? createVisit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateVisit value)? createVisit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of VisitEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitEventCopyWith<VisitEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitEventCopyWith<$Res> {
  factory $VisitEventCopyWith(
          VisitEvent value, $Res Function(VisitEvent) then) =
      _$VisitEventCopyWithImpl<$Res, VisitEvent>;
  @useResult
  $Res call({List<VisitRequest> request});
}

/// @nodoc
class _$VisitEventCopyWithImpl<$Res, $Val extends VisitEvent>
    implements $VisitEventCopyWith<$Res> {
  _$VisitEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as List<VisitRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateVisitImplCopyWith<$Res>
    implements $VisitEventCopyWith<$Res> {
  factory _$$CreateVisitImplCopyWith(
          _$CreateVisitImpl value, $Res Function(_$CreateVisitImpl) then) =
      __$$CreateVisitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VisitRequest> request});
}

/// @nodoc
class __$$CreateVisitImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$CreateVisitImpl>
    implements _$$CreateVisitImplCopyWith<$Res> {
  __$$CreateVisitImplCopyWithImpl(
      _$CreateVisitImpl _value, $Res Function(_$CreateVisitImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisitEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$CreateVisitImpl(
      request: null == request
          ? _value._request
          : request // ignore: cast_nullable_to_non_nullable
              as List<VisitRequest>,
    ));
  }
}

/// @nodoc

class _$CreateVisitImpl implements _CreateVisit {
  const _$CreateVisitImpl({required final List<VisitRequest> request})
      : _request = request;

  final List<VisitRequest> _request;
  @override
  List<VisitRequest> get request {
    if (_request is EqualUnmodifiableListView) return _request;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_request);
  }

  @override
  String toString() {
    return 'VisitEvent.createVisit(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVisitImpl &&
            const DeepCollectionEquality().equals(other._request, _request));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_request));

  /// Create a copy of VisitEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVisitImplCopyWith<_$CreateVisitImpl> get copyWith =>
      __$$CreateVisitImplCopyWithImpl<_$CreateVisitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<VisitRequest> request) createVisit,
  }) {
    return createVisit(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<VisitRequest> request)? createVisit,
  }) {
    return createVisit?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<VisitRequest> request)? createVisit,
    required TResult orElse(),
  }) {
    if (createVisit != null) {
      return createVisit(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateVisit value) createVisit,
  }) {
    return createVisit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateVisit value)? createVisit,
  }) {
    return createVisit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateVisit value)? createVisit,
    required TResult orElse(),
  }) {
    if (createVisit != null) {
      return createVisit(this);
    }
    return orElse();
  }
}

abstract class _CreateVisit implements VisitEvent {
  const factory _CreateVisit({required final List<VisitRequest> request}) =
      _$CreateVisitImpl;

  @override
  List<VisitRequest> get request;

  /// Create a copy of VisitEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateVisitImplCopyWith<_$CreateVisitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VisitState {
  FormzSubmissionStatus get createVisitStatus =>
      throw _privateConstructorUsedError;
  CreateVisitResponse? get visits => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of VisitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitStateCopyWith<VisitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitStateCopyWith<$Res> {
  factory $VisitStateCopyWith(
          VisitState value, $Res Function(VisitState) then) =
      _$VisitStateCopyWithImpl<$Res, VisitState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus createVisitStatus,
      CreateVisitResponse? visits,
      String errorMessage});
}

/// @nodoc
class _$VisitStateCopyWithImpl<$Res, $Val extends VisitState>
    implements $VisitStateCopyWith<$Res> {
  _$VisitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createVisitStatus = null,
    Object? visits = freezed,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      createVisitStatus: null == createVisitStatus
          ? _value.createVisitStatus
          : createVisitStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      visits: freezed == visits
          ? _value.visits
          : visits // ignore: cast_nullable_to_non_nullable
              as CreateVisitResponse?,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitStateImplCopyWith<$Res>
    implements $VisitStateCopyWith<$Res> {
  factory _$$VisitStateImplCopyWith(
          _$VisitStateImpl value, $Res Function(_$VisitStateImpl) then) =
      __$$VisitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus createVisitStatus,
      CreateVisitResponse? visits,
      String errorMessage});
}

/// @nodoc
class __$$VisitStateImplCopyWithImpl<$Res>
    extends _$VisitStateCopyWithImpl<$Res, _$VisitStateImpl>
    implements _$$VisitStateImplCopyWith<$Res> {
  __$$VisitStateImplCopyWithImpl(
      _$VisitStateImpl _value, $Res Function(_$VisitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createVisitStatus = null,
    Object? visits = freezed,
    Object? errorMessage = null,
  }) {
    return _then(_$VisitStateImpl(
      createVisitStatus: null == createVisitStatus
          ? _value.createVisitStatus
          : createVisitStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      visits: freezed == visits
          ? _value.visits
          : visits // ignore: cast_nullable_to_non_nullable
              as CreateVisitResponse?,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VisitStateImpl extends _VisitState {
  const _$VisitStateImpl(
      {this.createVisitStatus = FormzSubmissionStatus.initial,
      this.visits,
      this.errorMessage = ''})
      : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus createVisitStatus;
  @override
  final CreateVisitResponse? visits;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'VisitState(createVisitStatus: $createVisitStatus, visits: $visits, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitStateImpl &&
            (identical(other.createVisitStatus, createVisitStatus) ||
                other.createVisitStatus == createVisitStatus) &&
            (identical(other.visits, visits) || other.visits == visits) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, createVisitStatus, visits, errorMessage);

  /// Create a copy of VisitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitStateImplCopyWith<_$VisitStateImpl> get copyWith =>
      __$$VisitStateImplCopyWithImpl<_$VisitStateImpl>(this, _$identity);
}

abstract class _VisitState extends VisitState {
  const factory _VisitState(
      {final FormzSubmissionStatus createVisitStatus,
      final CreateVisitResponse? visits,
      final String errorMessage}) = _$VisitStateImpl;
  const _VisitState._() : super._();

  @override
  FormzSubmissionStatus get createVisitStatus;
  @override
  CreateVisitResponse? get visits;
  @override
  String get errorMessage;

  /// Create a copy of VisitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitStateImplCopyWith<_$VisitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
