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
    required TResult Function(String type) getTeams,
    required TResult Function(int id, String type) getSingleContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type)? fetchContent,
    TResult? Function(String type)? getTeams,
    TResult? Function(int id, String type)? getSingleContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type)? fetchContent,
    TResult Function(String type)? getTeams,
    TResult Function(int id, String type)? getSingleContent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchContent value) fetchContent,
    required TResult Function(_GetTeams value) getTeams,
    required TResult Function(_GetSingleContent value) getSingleContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchContent value)? fetchContent,
    TResult? Function(_GetTeams value)? getTeams,
    TResult? Function(_GetSingleContent value)? getSingleContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchContent value)? fetchContent,
    TResult Function(_GetTeams value)? getTeams,
    TResult Function(_GetSingleContent value)? getSingleContent,
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
    required TResult Function(String type) getTeams,
    required TResult Function(int id, String type) getSingleContent,
  }) {
    return fetchContent(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type)? fetchContent,
    TResult? Function(String type)? getTeams,
    TResult? Function(int id, String type)? getSingleContent,
  }) {
    return fetchContent?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type)? fetchContent,
    TResult Function(String type)? getTeams,
    TResult Function(int id, String type)? getSingleContent,
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
    required TResult Function(_GetTeams value) getTeams,
    required TResult Function(_GetSingleContent value) getSingleContent,
  }) {
    return fetchContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchContent value)? fetchContent,
    TResult? Function(_GetTeams value)? getTeams,
    TResult? Function(_GetSingleContent value)? getSingleContent,
  }) {
    return fetchContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchContent value)? fetchContent,
    TResult Function(_GetTeams value)? getTeams,
    TResult Function(_GetSingleContent value)? getSingleContent,
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
abstract class _$$GetTeamsImplCopyWith<$Res>
    implements $ContentEventCopyWith<$Res> {
  factory _$$GetTeamsImplCopyWith(
          _$GetTeamsImpl value, $Res Function(_$GetTeamsImpl) then) =
      __$$GetTeamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$$GetTeamsImplCopyWithImpl<$Res>
    extends _$ContentEventCopyWithImpl<$Res, _$GetTeamsImpl>
    implements _$$GetTeamsImplCopyWith<$Res> {
  __$$GetTeamsImplCopyWithImpl(
      _$GetTeamsImpl _value, $Res Function(_$GetTeamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$GetTeamsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTeamsImpl implements _GetTeams {
  const _$GetTeamsImpl({required this.type});

  @override
  final String type;

  @override
  String toString() {
    return 'ContentEvent.getTeams(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTeamsImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTeamsImplCopyWith<_$GetTeamsImpl> get copyWith =>
      __$$GetTeamsImplCopyWithImpl<_$GetTeamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type) fetchContent,
    required TResult Function(String type) getTeams,
    required TResult Function(int id, String type) getSingleContent,
  }) {
    return getTeams(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type)? fetchContent,
    TResult? Function(String type)? getTeams,
    TResult? Function(int id, String type)? getSingleContent,
  }) {
    return getTeams?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type)? fetchContent,
    TResult Function(String type)? getTeams,
    TResult Function(int id, String type)? getSingleContent,
    required TResult orElse(),
  }) {
    if (getTeams != null) {
      return getTeams(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchContent value) fetchContent,
    required TResult Function(_GetTeams value) getTeams,
    required TResult Function(_GetSingleContent value) getSingleContent,
  }) {
    return getTeams(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchContent value)? fetchContent,
    TResult? Function(_GetTeams value)? getTeams,
    TResult? Function(_GetSingleContent value)? getSingleContent,
  }) {
    return getTeams?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchContent value)? fetchContent,
    TResult Function(_GetTeams value)? getTeams,
    TResult Function(_GetSingleContent value)? getSingleContent,
    required TResult orElse(),
  }) {
    if (getTeams != null) {
      return getTeams(this);
    }
    return orElse();
  }
}

abstract class _GetTeams implements ContentEvent {
  const factory _GetTeams({required final String type}) = _$GetTeamsImpl;

  @override
  String get type;

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTeamsImplCopyWith<_$GetTeamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSingleContentImplCopyWith<$Res>
    implements $ContentEventCopyWith<$Res> {
  factory _$$GetSingleContentImplCopyWith(_$GetSingleContentImpl value,
          $Res Function(_$GetSingleContentImpl) then) =
      __$$GetSingleContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String type});
}

/// @nodoc
class __$$GetSingleContentImplCopyWithImpl<$Res>
    extends _$ContentEventCopyWithImpl<$Res, _$GetSingleContentImpl>
    implements _$$GetSingleContentImplCopyWith<$Res> {
  __$$GetSingleContentImplCopyWithImpl(_$GetSingleContentImpl _value,
      $Res Function(_$GetSingleContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_$GetSingleContentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSingleContentImpl implements _GetSingleContent {
  const _$GetSingleContentImpl({required this.id, required this.type});

  @override
  final int id;
  @override
  final String type;

  @override
  String toString() {
    return 'ContentEvent.getSingleContent(id: $id, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSingleContentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type);

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSingleContentImplCopyWith<_$GetSingleContentImpl> get copyWith =>
      __$$GetSingleContentImplCopyWithImpl<_$GetSingleContentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type) fetchContent,
    required TResult Function(String type) getTeams,
    required TResult Function(int id, String type) getSingleContent,
  }) {
    return getSingleContent(id, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type)? fetchContent,
    TResult? Function(String type)? getTeams,
    TResult? Function(int id, String type)? getSingleContent,
  }) {
    return getSingleContent?.call(id, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type)? fetchContent,
    TResult Function(String type)? getTeams,
    TResult Function(int id, String type)? getSingleContent,
    required TResult orElse(),
  }) {
    if (getSingleContent != null) {
      return getSingleContent(id, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchContent value) fetchContent,
    required TResult Function(_GetTeams value) getTeams,
    required TResult Function(_GetSingleContent value) getSingleContent,
  }) {
    return getSingleContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchContent value)? fetchContent,
    TResult? Function(_GetTeams value)? getTeams,
    TResult? Function(_GetSingleContent value)? getSingleContent,
  }) {
    return getSingleContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchContent value)? fetchContent,
    TResult Function(_GetTeams value)? getTeams,
    TResult Function(_GetSingleContent value)? getSingleContent,
    required TResult orElse(),
  }) {
    if (getSingleContent != null) {
      return getSingleContent(this);
    }
    return orElse();
  }
}

abstract class _GetSingleContent implements ContentEvent {
  const factory _GetSingleContent(
      {required final int id,
      required final String type}) = _$GetSingleContentImpl;

  int get id;
  @override
  String get type;

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSingleContentImplCopyWith<_$GetSingleContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContentState {
  Map<String, List<ContentModel>> get contentByType =>
      throw _privateConstructorUsedError;
  List<Team> get team => throw _privateConstructorUsedError;
  List<String> get jobTypes => throw _privateConstructorUsedError;
  FormzSubmissionStatus get teamStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get activityStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get fetchContentStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get singleContentStatus =>
      throw _privateConstructorUsedError;
  List<ContentModel> get content => throw _privateConstructorUsedError;
  ContentModel? get singleContent => throw _privateConstructorUsedError;
  MedionModel? get medionModel => throw _privateConstructorUsedError;

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
      {Map<String, List<ContentModel>> contentByType,
      List<Team> team,
      List<String> jobTypes,
      FormzSubmissionStatus teamStatus,
      FormzSubmissionStatus activityStatus,
      FormzSubmissionStatus fetchContentStatus,
      FormzSubmissionStatus singleContentStatus,
      List<ContentModel> content,
      ContentModel? singleContent,
      MedionModel? medionModel});
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
    Object? contentByType = null,
    Object? team = null,
    Object? jobTypes = null,
    Object? teamStatus = null,
    Object? activityStatus = null,
    Object? fetchContentStatus = null,
    Object? singleContentStatus = null,
    Object? content = null,
    Object? singleContent = freezed,
    Object? medionModel = freezed,
  }) {
    return _then(_value.copyWith(
      contentByType: null == contentByType
          ? _value.contentByType
          : contentByType // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContentModel>>,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as List<Team>,
      jobTypes: null == jobTypes
          ? _value.jobTypes
          : jobTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamStatus: null == teamStatus
          ? _value.teamStatus
          : teamStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      activityStatus: null == activityStatus
          ? _value.activityStatus
          : activityStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      fetchContentStatus: null == fetchContentStatus
          ? _value.fetchContentStatus
          : fetchContentStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      singleContentStatus: null == singleContentStatus
          ? _value.singleContentStatus
          : singleContentStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
      singleContent: freezed == singleContent
          ? _value.singleContent
          : singleContent // ignore: cast_nullable_to_non_nullable
              as ContentModel?,
      medionModel: freezed == medionModel
          ? _value.medionModel
          : medionModel // ignore: cast_nullable_to_non_nullable
              as MedionModel?,
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
      {Map<String, List<ContentModel>> contentByType,
      List<Team> team,
      List<String> jobTypes,
      FormzSubmissionStatus teamStatus,
      FormzSubmissionStatus activityStatus,
      FormzSubmissionStatus fetchContentStatus,
      FormzSubmissionStatus singleContentStatus,
      List<ContentModel> content,
      ContentModel? singleContent,
      MedionModel? medionModel});
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
    Object? contentByType = null,
    Object? team = null,
    Object? jobTypes = null,
    Object? teamStatus = null,
    Object? activityStatus = null,
    Object? fetchContentStatus = null,
    Object? singleContentStatus = null,
    Object? content = null,
    Object? singleContent = freezed,
    Object? medionModel = freezed,
  }) {
    return _then(_$ContentStateImpl(
      contentByType: null == contentByType
          ? _value._contentByType
          : contentByType // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContentModel>>,
      team: null == team
          ? _value._team
          : team // ignore: cast_nullable_to_non_nullable
              as List<Team>,
      jobTypes: null == jobTypes
          ? _value._jobTypes
          : jobTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamStatus: null == teamStatus
          ? _value.teamStatus
          : teamStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      activityStatus: null == activityStatus
          ? _value.activityStatus
          : activityStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      fetchContentStatus: null == fetchContentStatus
          ? _value.fetchContentStatus
          : fetchContentStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      singleContentStatus: null == singleContentStatus
          ? _value.singleContentStatus
          : singleContentStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
      singleContent: freezed == singleContent
          ? _value.singleContent
          : singleContent // ignore: cast_nullable_to_non_nullable
              as ContentModel?,
      medionModel: freezed == medionModel
          ? _value.medionModel
          : medionModel // ignore: cast_nullable_to_non_nullable
              as MedionModel?,
    ));
  }
}

/// @nodoc

class _$ContentStateImpl extends _ContentState {
  const _$ContentStateImpl(
      {final Map<String, List<ContentModel>> contentByType =
          const <String, List<ContentModel>>{},
      final List<Team> team = const <Team>[],
      final List<String> jobTypes = const <String>[],
      this.teamStatus = FormzSubmissionStatus.initial,
      this.activityStatus = FormzSubmissionStatus.initial,
      this.fetchContentStatus = FormzSubmissionStatus.initial,
      this.singleContentStatus = FormzSubmissionStatus.initial,
      final List<ContentModel> content = const [],
      this.singleContent,
      this.medionModel})
      : _contentByType = contentByType,
        _team = team,
        _jobTypes = jobTypes,
        _content = content,
        super._();

  final Map<String, List<ContentModel>> _contentByType;
  @override
  @JsonKey()
  Map<String, List<ContentModel>> get contentByType {
    if (_contentByType is EqualUnmodifiableMapView) return _contentByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_contentByType);
  }

  final List<Team> _team;
  @override
  @JsonKey()
  List<Team> get team {
    if (_team is EqualUnmodifiableListView) return _team;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_team);
  }

  final List<String> _jobTypes;
  @override
  @JsonKey()
  List<String> get jobTypes {
    if (_jobTypes is EqualUnmodifiableListView) return _jobTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobTypes);
  }

  @override
  @JsonKey()
  final FormzSubmissionStatus teamStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus activityStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus fetchContentStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus singleContentStatus;
  final List<ContentModel> _content;
  @override
  @JsonKey()
  List<ContentModel> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final ContentModel? singleContent;
  @override
  final MedionModel? medionModel;

  @override
  String toString() {
    return 'ContentState(contentByType: $contentByType, team: $team, jobTypes: $jobTypes, teamStatus: $teamStatus, activityStatus: $activityStatus, fetchContentStatus: $fetchContentStatus, singleContentStatus: $singleContentStatus, content: $content, singleContent: $singleContent, medionModel: $medionModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentStateImpl &&
            const DeepCollectionEquality()
                .equals(other._contentByType, _contentByType) &&
            const DeepCollectionEquality().equals(other._team, _team) &&
            const DeepCollectionEquality().equals(other._jobTypes, _jobTypes) &&
            (identical(other.teamStatus, teamStatus) ||
                other.teamStatus == teamStatus) &&
            (identical(other.activityStatus, activityStatus) ||
                other.activityStatus == activityStatus) &&
            (identical(other.fetchContentStatus, fetchContentStatus) ||
                other.fetchContentStatus == fetchContentStatus) &&
            (identical(other.singleContentStatus, singleContentStatus) ||
                other.singleContentStatus == singleContentStatus) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.singleContent, singleContent) ||
                other.singleContent == singleContent) &&
            (identical(other.medionModel, medionModel) ||
                other.medionModel == medionModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_contentByType),
      const DeepCollectionEquality().hash(_team),
      const DeepCollectionEquality().hash(_jobTypes),
      teamStatus,
      activityStatus,
      fetchContentStatus,
      singleContentStatus,
      const DeepCollectionEquality().hash(_content),
      singleContent,
      medionModel);

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
      {final Map<String, List<ContentModel>> contentByType,
      final List<Team> team,
      final List<String> jobTypes,
      final FormzSubmissionStatus teamStatus,
      final FormzSubmissionStatus activityStatus,
      final FormzSubmissionStatus fetchContentStatus,
      final FormzSubmissionStatus singleContentStatus,
      final List<ContentModel> content,
      final ContentModel? singleContent,
      final MedionModel? medionModel}) = _$ContentStateImpl;
  const _ContentState._() : super._();

  @override
  Map<String, List<ContentModel>> get contentByType;
  @override
  List<Team> get team;
  @override
  List<String> get jobTypes;
  @override
  FormzSubmissionStatus get teamStatus;
  @override
  FormzSubmissionStatus get activityStatus;
  @override
  FormzSubmissionStatus get fetchContentStatus;
  @override
  FormzSubmissionStatus get singleContentStatus;
  @override
  List<ContentModel> get content;
  @override
  ContentModel? get singleContent;
  @override
  MedionModel? get medionModel;

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentStateImplCopyWith<_$ContentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
