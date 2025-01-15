// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchDiseases,
    required TResult Function() fetchAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNew value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNew value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNew value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchNewImplCopyWith<$Res> {
  factory _$$FetchNewImplCopyWith(
          _$FetchNewImpl value, $Res Function(_$FetchNewImpl) then) =
      __$$FetchNewImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchNewImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchNewImpl>
    implements _$$FetchNewImplCopyWith<$Res> {
  __$$FetchNewImplCopyWithImpl(
      _$FetchNewImpl _value, $Res Function(_$FetchNewImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchNewImpl implements _FetchNew {
  const _$FetchNewImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchNews()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchNewImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchDiseases,
    required TResult Function() fetchAds,
  }) {
    return fetchNews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
  }) {
    return fetchNews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    required TResult orElse(),
  }) {
    if (fetchNews != null) {
      return fetchNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNew value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
  }) {
    return fetchNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNew value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
  }) {
    return fetchNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNew value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    required TResult orElse(),
  }) {
    if (fetchNews != null) {
      return fetchNews(this);
    }
    return orElse();
  }
}

abstract class _FetchNew implements HomeEvent {
  const factory _FetchNew() = _$FetchNewImpl;
}

/// @nodoc
abstract class _$$FetchDiseasesImplCopyWith<$Res> {
  factory _$$FetchDiseasesImplCopyWith(
          _$FetchDiseasesImpl value, $Res Function(_$FetchDiseasesImpl) then) =
      __$$FetchDiseasesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchDiseasesImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchDiseasesImpl>
    implements _$$FetchDiseasesImplCopyWith<$Res> {
  __$$FetchDiseasesImplCopyWithImpl(
      _$FetchDiseasesImpl _value, $Res Function(_$FetchDiseasesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchDiseasesImpl implements _FetchDiseases {
  const _$FetchDiseasesImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchDiseases()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchDiseasesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchDiseases,
    required TResult Function() fetchAds,
  }) {
    return fetchDiseases();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
  }) {
    return fetchDiseases?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    required TResult orElse(),
  }) {
    if (fetchDiseases != null) {
      return fetchDiseases();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNew value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
  }) {
    return fetchDiseases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNew value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
  }) {
    return fetchDiseases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNew value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    required TResult orElse(),
  }) {
    if (fetchDiseases != null) {
      return fetchDiseases(this);
    }
    return orElse();
  }
}

abstract class _FetchDiseases implements HomeEvent {
  const factory _FetchDiseases() = _$FetchDiseasesImpl;
}

/// @nodoc
abstract class _$$FetchAdsImplCopyWith<$Res> {
  factory _$$FetchAdsImplCopyWith(
          _$FetchAdsImpl value, $Res Function(_$FetchAdsImpl) then) =
      __$$FetchAdsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAdsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchAdsImpl>
    implements _$$FetchAdsImplCopyWith<$Res> {
  __$$FetchAdsImplCopyWithImpl(
      _$FetchAdsImpl _value, $Res Function(_$FetchAdsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchAdsImpl implements _FetchAds {
  const _$FetchAdsImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchAds()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAdsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchDiseases,
    required TResult Function() fetchAds,
  }) {
    return fetchAds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
  }) {
    return fetchAds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    required TResult orElse(),
  }) {
    if (fetchAds != null) {
      return fetchAds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNew value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
  }) {
    return fetchAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNew value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
  }) {
    return fetchAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNew value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    required TResult orElse(),
  }) {
    if (fetchAds != null) {
      return fetchAds(this);
    }
    return orElse();
  }
}

abstract class _FetchAds implements HomeEvent {
  const factory _FetchAds() = _$FetchAdsImpl;
}

/// @nodoc
mixin _$HomeState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  List<News> get news => throw _privateConstructorUsedError;
  List<DiseaseModle> get diseases => throw _privateConstructorUsedError;
  List<AdModel> get ads => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool loading,
      bool error,
      bool success,
      List<News> news,
      List<DiseaseModle> diseases,
      List<AdModel> ads});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? news = null,
    Object? diseases = null,
    Object? ads = null,
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
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      diseases: null == diseases
          ? _value.diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<DiseaseModle>,
      ads: null == ads
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool error,
      bool success,
      List<News> news,
      List<DiseaseModle> diseases,
      List<AdModel> ads});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? news = null,
    Object? diseases = null,
    Object? ads = null,
  }) {
    return _then(_$HomeStateImpl(
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
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      diseases: null == diseases
          ? _value._diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<DiseaseModle>,
      ads: null == ads
          ? _value._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {this.loading = false,
      this.error = false,
      this.success = false,
      final List<News> news = const [],
      final List<DiseaseModle> diseases = const [],
      final List<AdModel> ads = const []})
      : _news = news,
        _diseases = diseases,
        _ads = ads,
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
  final List<News> _news;
  @override
  @JsonKey()
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  final List<DiseaseModle> _diseases;
  @override
  @JsonKey()
  List<DiseaseModle> get diseases {
    if (_diseases is EqualUnmodifiableListView) return _diseases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseases);
  }

  final List<AdModel> _ads;
  @override
  @JsonKey()
  List<AdModel> get ads {
    if (_ads is EqualUnmodifiableListView) return _ads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ads);
  }

  @override
  String toString() {
    return 'HomeState(loading: $loading, error: $error, success: $success, news: $news, diseases: $diseases, ads: $ads)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            const DeepCollectionEquality().equals(other._diseases, _diseases) &&
            const DeepCollectionEquality().equals(other._ads, _ads));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      error,
      success,
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(_diseases),
      const DeepCollectionEquality().hash(_ads));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final bool loading,
      final bool error,
      final bool success,
      final List<News> news,
      final List<DiseaseModle> diseases,
      final List<AdModel> ads}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  bool get success;
  @override
  List<News> get news;
  @override
  List<DiseaseModle> get diseases;
  @override
  List<AdModel> get ads;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
