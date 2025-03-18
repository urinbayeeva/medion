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
  VisitRequest get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VisitRequest request) createVisit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VisitRequest request)? createVisit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VisitRequest request)? createVisit,
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
  $Res call({VisitRequest request});
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
              as VisitRequest,
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
  $Res call({VisitRequest request});
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
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as VisitRequest,
    ));
  }
}

/// @nodoc

class _$CreateVisitImpl implements _CreateVisit {
  const _$CreateVisitImpl({required this.request});

  @override
  final VisitRequest request;

  @override
  String toString() {
    return 'VisitEvent.createVisit(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVisitImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

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
    required TResult Function(VisitRequest request) createVisit,
  }) {
    return createVisit(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VisitRequest request)? createVisit,
  }) {
    return createVisit?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VisitRequest request)? createVisit,
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
  const factory _CreateVisit({required final VisitRequest request}) =
      _$CreateVisitImpl;

  @override
  VisitRequest get request;

  /// Create a copy of VisitEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateVisitImplCopyWith<_$CreateVisitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VisitState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  List<VisitResponse> get visits => throw _privateConstructorUsedError;
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
      {bool loading,
      bool error,
      bool success,
      List<VisitResponse> visits,
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
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? visits = null,
    Object? errorMessage = null,
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
      visits: null == visits
          ? _value.visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<VisitResponse>,
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
      {bool loading,
      bool error,
      bool success,
      List<VisitResponse> visits,
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
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? visits = null,
    Object? errorMessage = null,
  }) {
    return _then(_$VisitStateImpl(
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
      visits: null == visits
          ? _value._visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<VisitResponse>,
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
      {this.loading = false,
      this.error = false,
      this.success = false,
      final List<VisitResponse> visits = const [],
      this.errorMessage = ''})
      : _visits = visits,
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
  final List<VisitResponse> _visits;
  @override
  @JsonKey()
  List<VisitResponse> get visits {
    if (_visits is EqualUnmodifiableListView) return _visits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visits);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'VisitState(loading: $loading, error: $error, success: $success, visits: $visits, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._visits, _visits) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error, success,
      const DeepCollectionEquality().hash(_visits), errorMessage);

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
      {final bool loading,
      final bool error,
      final bool success,
      final List<VisitResponse> visits,
      final String errorMessage}) = _$VisitStateImpl;
  const _VisitState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  bool get success;
  @override
  List<VisitResponse> get visits;
  @override
  String get errorMessage;

  /// Create a copy of VisitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitStateImplCopyWith<_$VisitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
