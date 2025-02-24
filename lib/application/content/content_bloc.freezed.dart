// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentEvent {
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type) fetchContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type)? fetchContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type)? fetchContent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchContent value) fetchContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchContent value)? fetchContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchContent value)? fetchContent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentEventCopyWith<ContentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentEventCopyWith<$Res> {
  factory $ContentEventCopyWith(
          ContentEvent value, $Res Function(ContentEvent) then) =
      _$ContentEventCopyWithImpl<$Res, ContentEvent>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class _$ContentEventCopyWithImpl<$Res, $Val extends ContentEvent>
    implements $ContentEventCopyWith<$Res> {
  _$ContentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchContentImplCopyWith<$Res>
    implements $ContentEventCopyWith<$Res> {
  factory _$$FetchContentImplCopyWith(
          _$FetchContentImpl value, $Res Function(_$FetchContentImpl) then) =
      __$$FetchContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$$FetchContentImplCopyWithImpl<$Res>
    extends _$ContentEventCopyWithImpl<$Res, _$FetchContentImpl>
    implements _$$FetchContentImplCopyWith<$Res> {
  __$$FetchContentImplCopyWithImpl(
      _$FetchContentImpl _value, $Res Function(_$FetchContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$FetchContentImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchContentImpl implements _FetchContent {
  const _$FetchContentImpl({required this.type});

  @override
  final String type;

  @override
  String toString() {
    return 'ContentEvent.fetchContent(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchContentImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchContentImplCopyWith<_$FetchContentImpl> get copyWith =>
      __$$FetchContentImplCopyWithImpl<_$FetchContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type) fetchContent,
  }) {
    return fetchContent(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type)? fetchContent,
  }) {
    return fetchContent?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type)? fetchContent,
    required TResult orElse(),
  }) {
    if (fetchContent != null) {
      return fetchContent(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchContent value) fetchContent,
  }) {
    return fetchContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchContent value)? fetchContent,
  }) {
    return fetchContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchContent value)? fetchContent,
    required TResult orElse(),
  }) {
    if (fetchContent != null) {
      return fetchContent(this);
    }
    return orElse();
  }
}

abstract class _FetchContent implements ContentEvent {
  const factory _FetchContent({required final String type}) =
      _$FetchContentImpl;

  @override
  String get type;

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchContentImplCopyWith<_$FetchContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContentState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  List<ContentModel> get content => throw _privateConstructorUsedError;

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentStateCopyWith<ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentStateCopyWith<$Res> {
  factory $ContentStateCopyWith(
          ContentState value, $Res Function(ContentState) then) =
      _$ContentStateCopyWithImpl<$Res, ContentState>;
  @useResult
  $Res call(
      {bool loading, bool error, bool success, List<ContentModel> content});
}

/// @nodoc
class _$ContentStateCopyWithImpl<$Res, $Val extends ContentState>
    implements $ContentStateCopyWith<$Res> {
  _$ContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? content = null,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentStateImplCopyWith<$Res>
    implements $ContentStateCopyWith<$Res> {
  factory _$$ContentStateImplCopyWith(
          _$ContentStateImpl value, $Res Function(_$ContentStateImpl) then) =
      __$$ContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading, bool error, bool success, List<ContentModel> content});
}

/// @nodoc
class __$$ContentStateImplCopyWithImpl<$Res>
    extends _$ContentStateCopyWithImpl<$Res, _$ContentStateImpl>
    implements _$$ContentStateImplCopyWith<$Res> {
  __$$ContentStateImplCopyWithImpl(
      _$ContentStateImpl _value, $Res Function(_$ContentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? content = null,
  }) {
    return _then(_$ContentStateImpl(
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
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
    ));
  }
}

/// @nodoc

class _$ContentStateImpl extends _ContentState {
  const _$ContentStateImpl(
      {this.loading = false,
      this.error = false,
      this.success = false,
      final List<ContentModel> content = const []})
      : _content = content,
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
  final List<ContentModel> _content;
  @override
  @JsonKey()
  List<ContentModel> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  String toString() {
    return 'ContentState(loading: $loading, error: $error, success: $success, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error, success,
      const DeepCollectionEquality().hash(_content));

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentStateImplCopyWith<_$ContentStateImpl> get copyWith =>
      __$$ContentStateImplCopyWithImpl<_$ContentStateImpl>(this, _$identity);
}

abstract class _ContentState extends ContentState {
  const factory _ContentState(
      {final bool loading,
      final bool error,
      final bool success,
      final List<ContentModel> content}) = _$ContentStateImpl;
  const _ContentState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  bool get success;
  @override
  List<ContentModel> get content;

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentStateImplCopyWith<_$ContentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
