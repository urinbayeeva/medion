// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBookingTypes,
    required TResult Function(int id) fetchCategoryServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBookingTypes,
    TResult? Function(int id)? fetchCategoryServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBookingTypes,
    TResult Function(int id)? fetchCategoryServices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBookingTypes value) fetchBookingTypes,
    required TResult Function(_FetchCategoryServices value)
        fetchCategoryServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBookingTypes value)? fetchBookingTypes,
    TResult? Function(_FetchCategoryServices value)? fetchCategoryServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBookingTypes value)? fetchBookingTypes,
    TResult Function(_FetchCategoryServices value)? fetchCategoryServices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingEventCopyWith<$Res> {
  factory $BookingEventCopyWith(
          BookingEvent value, $Res Function(BookingEvent) then) =
      _$BookingEventCopyWithImpl<$Res, BookingEvent>;
}

/// @nodoc
class _$BookingEventCopyWithImpl<$Res, $Val extends BookingEvent>
    implements $BookingEventCopyWith<$Res> {
  _$BookingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchBookingTypesImplCopyWith<$Res> {
  factory _$$FetchBookingTypesImplCopyWith(_$FetchBookingTypesImpl value,
          $Res Function(_$FetchBookingTypesImpl) then) =
      __$$FetchBookingTypesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchBookingTypesImplCopyWithImpl<$Res>
    extends _$BookingEventCopyWithImpl<$Res, _$FetchBookingTypesImpl>
    implements _$$FetchBookingTypesImplCopyWith<$Res> {
  __$$FetchBookingTypesImplCopyWithImpl(_$FetchBookingTypesImpl _value,
      $Res Function(_$FetchBookingTypesImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchBookingTypesImpl implements _FetchBookingTypes {
  const _$FetchBookingTypesImpl();

  @override
  String toString() {
    return 'BookingEvent.fetchBookingTypes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchBookingTypesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBookingTypes,
    required TResult Function(int id) fetchCategoryServices,
  }) {
    return fetchBookingTypes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBookingTypes,
    TResult? Function(int id)? fetchCategoryServices,
  }) {
    return fetchBookingTypes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBookingTypes,
    TResult Function(int id)? fetchCategoryServices,
    required TResult orElse(),
  }) {
    if (fetchBookingTypes != null) {
      return fetchBookingTypes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBookingTypes value) fetchBookingTypes,
    required TResult Function(_FetchCategoryServices value)
        fetchCategoryServices,
  }) {
    return fetchBookingTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBookingTypes value)? fetchBookingTypes,
    TResult? Function(_FetchCategoryServices value)? fetchCategoryServices,
  }) {
    return fetchBookingTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBookingTypes value)? fetchBookingTypes,
    TResult Function(_FetchCategoryServices value)? fetchCategoryServices,
    required TResult orElse(),
  }) {
    if (fetchBookingTypes != null) {
      return fetchBookingTypes(this);
    }
    return orElse();
  }
}

abstract class _FetchBookingTypes implements BookingEvent {
  const factory _FetchBookingTypes() = _$FetchBookingTypesImpl;
}

/// @nodoc
abstract class _$$FetchCategoryServicesImplCopyWith<$Res> {
  factory _$$FetchCategoryServicesImplCopyWith(
          _$FetchCategoryServicesImpl value,
          $Res Function(_$FetchCategoryServicesImpl) then) =
      __$$FetchCategoryServicesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchCategoryServicesImplCopyWithImpl<$Res>
    extends _$BookingEventCopyWithImpl<$Res, _$FetchCategoryServicesImpl>
    implements _$$FetchCategoryServicesImplCopyWith<$Res> {
  __$$FetchCategoryServicesImplCopyWithImpl(_$FetchCategoryServicesImpl _value,
      $Res Function(_$FetchCategoryServicesImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchCategoryServicesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchCategoryServicesImpl implements _FetchCategoryServices {
  const _$FetchCategoryServicesImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'BookingEvent.fetchCategoryServices(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCategoryServicesImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCategoryServicesImplCopyWith<_$FetchCategoryServicesImpl>
      get copyWith => __$$FetchCategoryServicesImplCopyWithImpl<
          _$FetchCategoryServicesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBookingTypes,
    required TResult Function(int id) fetchCategoryServices,
  }) {
    return fetchCategoryServices(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBookingTypes,
    TResult? Function(int id)? fetchCategoryServices,
  }) {
    return fetchCategoryServices?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBookingTypes,
    TResult Function(int id)? fetchCategoryServices,
    required TResult orElse(),
  }) {
    if (fetchCategoryServices != null) {
      return fetchCategoryServices(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBookingTypes value) fetchBookingTypes,
    required TResult Function(_FetchCategoryServices value)
        fetchCategoryServices,
  }) {
    return fetchCategoryServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBookingTypes value)? fetchBookingTypes,
    TResult? Function(_FetchCategoryServices value)? fetchCategoryServices,
  }) {
    return fetchCategoryServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBookingTypes value)? fetchBookingTypes,
    TResult Function(_FetchCategoryServices value)? fetchCategoryServices,
    required TResult orElse(),
  }) {
    if (fetchCategoryServices != null) {
      return fetchCategoryServices(this);
    }
    return orElse();
  }
}

abstract class _FetchCategoryServices implements BookingEvent {
  const factory _FetchCategoryServices({required final int id}) =
      _$FetchCategoryServicesImpl;

  int get id;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchCategoryServicesImplCopyWith<_$FetchCategoryServicesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  List<BookingTypeModel> get bookingTypes => throw _privateConstructorUsedError;
  List<CategorySeviceModelID> get categoryServices =>
      throw _privateConstructorUsedError;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingStateCopyWith<BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) then) =
      _$BookingStateCopyWithImpl<$Res, BookingState>;
  @useResult
  $Res call(
      {bool loading,
      bool error,
      bool success,
      List<BookingTypeModel> bookingTypes,
      List<CategorySeviceModelID> categoryServices});
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res, $Val extends BookingState>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? bookingTypes = null,
    Object? categoryServices = null,
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
      bookingTypes: null == bookingTypes
          ? _value.bookingTypes
          : bookingTypes // ignore: cast_nullable_to_non_nullable
              as List<BookingTypeModel>,
      categoryServices: null == categoryServices
          ? _value.categoryServices
          : categoryServices // ignore: cast_nullable_to_non_nullable
              as List<CategorySeviceModelID>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingStateImplCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$$BookingStateImplCopyWith(
          _$BookingStateImpl value, $Res Function(_$BookingStateImpl) then) =
      __$$BookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool error,
      bool success,
      List<BookingTypeModel> bookingTypes,
      List<CategorySeviceModelID> categoryServices});
}

/// @nodoc
class __$$BookingStateImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$BookingStateImpl>
    implements _$$BookingStateImplCopyWith<$Res> {
  __$$BookingStateImplCopyWithImpl(
      _$BookingStateImpl _value, $Res Function(_$BookingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? success = null,
    Object? bookingTypes = null,
    Object? categoryServices = null,
  }) {
    return _then(_$BookingStateImpl(
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
      bookingTypes: null == bookingTypes
          ? _value._bookingTypes
          : bookingTypes // ignore: cast_nullable_to_non_nullable
              as List<BookingTypeModel>,
      categoryServices: null == categoryServices
          ? _value._categoryServices
          : categoryServices // ignore: cast_nullable_to_non_nullable
              as List<CategorySeviceModelID>,
    ));
  }
}

/// @nodoc

class _$BookingStateImpl extends _BookingState {
  const _$BookingStateImpl(
      {this.loading = false,
      this.error = false,
      this.success = false,
      final List<BookingTypeModel> bookingTypes = const [],
      final List<CategorySeviceModelID> categoryServices = const []})
      : _bookingTypes = bookingTypes,
        _categoryServices = categoryServices,
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
  final List<BookingTypeModel> _bookingTypes;
  @override
  @JsonKey()
  List<BookingTypeModel> get bookingTypes {
    if (_bookingTypes is EqualUnmodifiableListView) return _bookingTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookingTypes);
  }

  final List<CategorySeviceModelID> _categoryServices;
  @override
  @JsonKey()
  List<CategorySeviceModelID> get categoryServices {
    if (_categoryServices is EqualUnmodifiableListView)
      return _categoryServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryServices);
  }

  @override
  String toString() {
    return 'BookingState(loading: $loading, error: $error, success: $success, bookingTypes: $bookingTypes, categoryServices: $categoryServices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other._bookingTypes, _bookingTypes) &&
            const DeepCollectionEquality()
                .equals(other._categoryServices, _categoryServices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      error,
      success,
      const DeepCollectionEquality().hash(_bookingTypes),
      const DeepCollectionEquality().hash(_categoryServices));

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingStateImplCopyWith<_$BookingStateImpl> get copyWith =>
      __$$BookingStateImplCopyWithImpl<_$BookingStateImpl>(this, _$identity);
}

abstract class _BookingState extends BookingState {
  const factory _BookingState(
      {final bool loading,
      final bool error,
      final bool success,
      final List<BookingTypeModel> bookingTypes,
      final List<CategorySeviceModelID> categoryServices}) = _$BookingStateImpl;
  const _BookingState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  bool get success;
  @override
  List<BookingTypeModel> get bookingTypes;
  @override
  List<CategorySeviceModelID> get categoryServices;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingStateImplCopyWith<_$BookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
