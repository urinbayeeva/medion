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
    required TResult Function() fetchMedicalServices,
    required TResult Function() fetchCompanyLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
    TResult? Function()? fetchMedicalServices,
    TResult? Function()? fetchCompanyLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    TResult Function()? fetchMedicalServices,
    TResult Function()? fetchCompanyLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
    required TResult Function(_FetchMedicalServices value) fetchMedicalServices,
    required TResult Function(_FetchCompanyLocation value) fetchCompanyLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
    TResult? Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult? Function(_FetchCompanyLocation value)? fetchCompanyLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    TResult Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult Function(_FetchCompanyLocation value)? fetchCompanyLocation,
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
abstract class _$$FetchNewsImplCopyWith<$Res> {
  factory _$$FetchNewsImplCopyWith(
          _$FetchNewsImpl value, $Res Function(_$FetchNewsImpl) then) =
      __$$FetchNewsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchNewsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchNewsImpl>
    implements _$$FetchNewsImplCopyWith<$Res> {
  __$$FetchNewsImplCopyWithImpl(
      _$FetchNewsImpl _value, $Res Function(_$FetchNewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchNewsImpl implements _FetchNews {
  const _$FetchNewsImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchNews()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchNewsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchDiseases,
    required TResult Function() fetchAds,
    required TResult Function() fetchMedicalServices,
    required TResult Function() fetchCompanyLocation,
  }) {
    return fetchNews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
    TResult? Function()? fetchMedicalServices,
    TResult? Function()? fetchCompanyLocation,
  }) {
    return fetchNews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    TResult Function()? fetchMedicalServices,
    TResult Function()? fetchCompanyLocation,
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
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
    required TResult Function(_FetchMedicalServices value) fetchMedicalServices,
    required TResult Function(_FetchCompanyLocation value) fetchCompanyLocation,
  }) {
    return fetchNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
    TResult? Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult? Function(_FetchCompanyLocation value)? fetchCompanyLocation,
  }) {
    return fetchNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    TResult Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult Function(_FetchCompanyLocation value)? fetchCompanyLocation,
    required TResult orElse(),
  }) {
    if (fetchNews != null) {
      return fetchNews(this);
    }
    return orElse();
  }
}

abstract class _FetchNews implements HomeEvent {
  const factory _FetchNews() = _$FetchNewsImpl;
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
    required TResult Function() fetchMedicalServices,
    required TResult Function() fetchCompanyLocation,
  }) {
    return fetchDiseases();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
    TResult? Function()? fetchMedicalServices,
    TResult? Function()? fetchCompanyLocation,
  }) {
    return fetchDiseases?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    TResult Function()? fetchMedicalServices,
    TResult Function()? fetchCompanyLocation,
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
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
    required TResult Function(_FetchMedicalServices value) fetchMedicalServices,
    required TResult Function(_FetchCompanyLocation value) fetchCompanyLocation,
  }) {
    return fetchDiseases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
    TResult? Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult? Function(_FetchCompanyLocation value)? fetchCompanyLocation,
  }) {
    return fetchDiseases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    TResult Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult Function(_FetchCompanyLocation value)? fetchCompanyLocation,
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
    required TResult Function() fetchMedicalServices,
    required TResult Function() fetchCompanyLocation,
  }) {
    return fetchAds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
    TResult? Function()? fetchMedicalServices,
    TResult? Function()? fetchCompanyLocation,
  }) {
    return fetchAds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    TResult Function()? fetchMedicalServices,
    TResult Function()? fetchCompanyLocation,
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
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
    required TResult Function(_FetchMedicalServices value) fetchMedicalServices,
    required TResult Function(_FetchCompanyLocation value) fetchCompanyLocation,
  }) {
    return fetchAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
    TResult? Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult? Function(_FetchCompanyLocation value)? fetchCompanyLocation,
  }) {
    return fetchAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    TResult Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult Function(_FetchCompanyLocation value)? fetchCompanyLocation,
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
abstract class _$$FetchMedicalServicesImplCopyWith<$Res> {
  factory _$$FetchMedicalServicesImplCopyWith(_$FetchMedicalServicesImpl value,
          $Res Function(_$FetchMedicalServicesImpl) then) =
      __$$FetchMedicalServicesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchMedicalServicesImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchMedicalServicesImpl>
    implements _$$FetchMedicalServicesImplCopyWith<$Res> {
  __$$FetchMedicalServicesImplCopyWithImpl(_$FetchMedicalServicesImpl _value,
      $Res Function(_$FetchMedicalServicesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchMedicalServicesImpl implements _FetchMedicalServices {
  const _$FetchMedicalServicesImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchMedicalServices()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMedicalServicesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchDiseases,
    required TResult Function() fetchAds,
    required TResult Function() fetchMedicalServices,
    required TResult Function() fetchCompanyLocation,
  }) {
    return fetchMedicalServices();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
    TResult? Function()? fetchMedicalServices,
    TResult? Function()? fetchCompanyLocation,
  }) {
    return fetchMedicalServices?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    TResult Function()? fetchMedicalServices,
    TResult Function()? fetchCompanyLocation,
    required TResult orElse(),
  }) {
    if (fetchMedicalServices != null) {
      return fetchMedicalServices();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
    required TResult Function(_FetchMedicalServices value) fetchMedicalServices,
    required TResult Function(_FetchCompanyLocation value) fetchCompanyLocation,
  }) {
    return fetchMedicalServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
    TResult? Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult? Function(_FetchCompanyLocation value)? fetchCompanyLocation,
  }) {
    return fetchMedicalServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    TResult Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult Function(_FetchCompanyLocation value)? fetchCompanyLocation,
    required TResult orElse(),
  }) {
    if (fetchMedicalServices != null) {
      return fetchMedicalServices(this);
    }
    return orElse();
  }
}

abstract class _FetchMedicalServices implements HomeEvent {
  const factory _FetchMedicalServices() = _$FetchMedicalServicesImpl;
}

/// @nodoc
abstract class _$$FetchCompanyLocationImplCopyWith<$Res> {
  factory _$$FetchCompanyLocationImplCopyWith(_$FetchCompanyLocationImpl value,
          $Res Function(_$FetchCompanyLocationImpl) then) =
      __$$FetchCompanyLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCompanyLocationImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchCompanyLocationImpl>
    implements _$$FetchCompanyLocationImplCopyWith<$Res> {
  __$$FetchCompanyLocationImplCopyWithImpl(_$FetchCompanyLocationImpl _value,
      $Res Function(_$FetchCompanyLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchCompanyLocationImpl implements _FetchCompanyLocation {
  const _$FetchCompanyLocationImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchCompanyLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCompanyLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchNews,
    required TResult Function() fetchDiseases,
    required TResult Function() fetchAds,
    required TResult Function() fetchMedicalServices,
    required TResult Function() fetchCompanyLocation,
  }) {
    return fetchCompanyLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchNews,
    TResult? Function()? fetchDiseases,
    TResult? Function()? fetchAds,
    TResult? Function()? fetchMedicalServices,
    TResult? Function()? fetchCompanyLocation,
  }) {
    return fetchCompanyLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchNews,
    TResult Function()? fetchDiseases,
    TResult Function()? fetchAds,
    TResult Function()? fetchMedicalServices,
    TResult Function()? fetchCompanyLocation,
    required TResult orElse(),
  }) {
    if (fetchCompanyLocation != null) {
      return fetchCompanyLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchNews value) fetchNews,
    required TResult Function(_FetchDiseases value) fetchDiseases,
    required TResult Function(_FetchAds value) fetchAds,
    required TResult Function(_FetchMedicalServices value) fetchMedicalServices,
    required TResult Function(_FetchCompanyLocation value) fetchCompanyLocation,
  }) {
    return fetchCompanyLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchNews value)? fetchNews,
    TResult? Function(_FetchDiseases value)? fetchDiseases,
    TResult? Function(_FetchAds value)? fetchAds,
    TResult? Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult? Function(_FetchCompanyLocation value)? fetchCompanyLocation,
  }) {
    return fetchCompanyLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchNews value)? fetchNews,
    TResult Function(_FetchDiseases value)? fetchDiseases,
    TResult Function(_FetchAds value)? fetchAds,
    TResult Function(_FetchMedicalServices value)? fetchMedicalServices,
    TResult Function(_FetchCompanyLocation value)? fetchCompanyLocation,
    required TResult orElse(),
  }) {
    if (fetchCompanyLocation != null) {
      return fetchCompanyLocation(this);
    }
    return orElse();
  }
}

abstract class _FetchCompanyLocation implements HomeEvent {
  const factory _FetchCompanyLocation() = _$FetchCompanyLocationImpl;
}

/// @nodoc
mixin _$HomeState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  List<News> get news => throw _privateConstructorUsedError;
  List<DiseaseModle> get diseases => throw _privateConstructorUsedError;
  List<AdModel> get ads => throw _privateConstructorUsedError;
  List<DiagnosticsModel> get medicalServices =>
      throw _privateConstructorUsedError;
  List<LocationModel> get companyLocations =>
      throw _privateConstructorUsedError;

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
      List<AdModel> ads,
      List<DiagnosticsModel> medicalServices,
      List<LocationModel> companyLocations});
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
    Object? medicalServices = null,
    Object? companyLocations = null,
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
      medicalServices: null == medicalServices
          ? _value.medicalServices
          : medicalServices // ignore: cast_nullable_to_non_nullable
              as List<DiagnosticsModel>,
      companyLocations: null == companyLocations
          ? _value.companyLocations
          : companyLocations // ignore: cast_nullable_to_non_nullable
              as List<LocationModel>,
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
      List<AdModel> ads,
      List<DiagnosticsModel> medicalServices,
      List<LocationModel> companyLocations});
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
    Object? medicalServices = null,
    Object? companyLocations = null,
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
      medicalServices: null == medicalServices
          ? _value._medicalServices
          : medicalServices // ignore: cast_nullable_to_non_nullable
              as List<DiagnosticsModel>,
      companyLocations: null == companyLocations
          ? _value._companyLocations
          : companyLocations // ignore: cast_nullable_to_non_nullable
              as List<LocationModel>,
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
      final List<AdModel> ads = const [],
      final List<DiagnosticsModel> medicalServices = const [],
      final List<LocationModel> companyLocations = const []})
      : _news = news,
        _diseases = diseases,
        _ads = ads,
        _medicalServices = medicalServices,
        _companyLocations = companyLocations,
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

  final List<DiagnosticsModel> _medicalServices;
  @override
  @JsonKey()
  List<DiagnosticsModel> get medicalServices {
    if (_medicalServices is EqualUnmodifiableListView) return _medicalServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicalServices);
  }

  final List<LocationModel> _companyLocations;
  @override
  @JsonKey()
  List<LocationModel> get companyLocations {
    if (_companyLocations is EqualUnmodifiableListView)
      return _companyLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companyLocations);
  }

  @override
  String toString() {
    return 'HomeState(loading: $loading, error: $error, success: $success, news: $news, diseases: $diseases, ads: $ads, medicalServices: $medicalServices, companyLocations: $companyLocations)';
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
            const DeepCollectionEquality().equals(other._ads, _ads) &&
            const DeepCollectionEquality()
                .equals(other._medicalServices, _medicalServices) &&
            const DeepCollectionEquality()
                .equals(other._companyLocations, _companyLocations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      error,
      success,
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(_diseases),
      const DeepCollectionEquality().hash(_ads),
      const DeepCollectionEquality().hash(_medicalServices),
      const DeepCollectionEquality().hash(_companyLocations));

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
      final List<AdModel> ads,
      final List<DiagnosticsModel> medicalServices,
      final List<LocationModel> companyLocations}) = _$HomeStateImpl;
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
  @override
  List<DiagnosticsModel> get medicalServices;
  @override
  List<LocationModel> get companyLocations;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
