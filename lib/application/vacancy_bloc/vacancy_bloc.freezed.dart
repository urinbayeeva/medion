// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacancy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VacancyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchVacancies,
    required TResult Function(int? id) fetchVacancySingle,
    required TResult Function(UploadVacancyModel vacancy) uploadVacancy,
    required TResult Function(FileInfo base64Pdf) selectPdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchVacancies,
    TResult? Function(int? id)? fetchVacancySingle,
    TResult? Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult? Function(FileInfo base64Pdf)? selectPdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchVacancies,
    TResult Function(int? id)? fetchVacancySingle,
    TResult Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult Function(FileInfo base64Pdf)? selectPdf,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchVacancies value) fetchVacancies,
    required TResult Function(_FetchVacancySingle value) fetchVacancySingle,
    required TResult Function(_UploadVacancy value) uploadVacancy,
    required TResult Function(_SelectPdf value) selectPdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchVacancies value)? fetchVacancies,
    TResult? Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult? Function(_UploadVacancy value)? uploadVacancy,
    TResult? Function(_SelectPdf value)? selectPdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchVacancies value)? fetchVacancies,
    TResult Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult Function(_UploadVacancy value)? uploadVacancy,
    TResult Function(_SelectPdf value)? selectPdf,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacancyEventCopyWith<$Res> {
  factory $VacancyEventCopyWith(
          VacancyEvent value, $Res Function(VacancyEvent) then) =
      _$VacancyEventCopyWithImpl<$Res, VacancyEvent>;
}

/// @nodoc
class _$VacancyEventCopyWithImpl<$Res, $Val extends VacancyEvent>
    implements $VacancyEventCopyWith<$Res> {
  _$VacancyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchVacanciesImplCopyWith<$Res> {
  factory _$$FetchVacanciesImplCopyWith(_$FetchVacanciesImpl value,
          $Res Function(_$FetchVacanciesImpl) then) =
      __$$FetchVacanciesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchVacanciesImplCopyWithImpl<$Res>
    extends _$VacancyEventCopyWithImpl<$Res, _$FetchVacanciesImpl>
    implements _$$FetchVacanciesImplCopyWith<$Res> {
  __$$FetchVacanciesImplCopyWithImpl(
      _$FetchVacanciesImpl _value, $Res Function(_$FetchVacanciesImpl) _then)
      : super(_value, _then);

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchVacanciesImpl implements _FetchVacancies {
  const _$FetchVacanciesImpl();

  @override
  String toString() {
    return 'VacancyEvent.fetchVacancies()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchVacanciesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchVacancies,
    required TResult Function(int? id) fetchVacancySingle,
    required TResult Function(UploadVacancyModel vacancy) uploadVacancy,
    required TResult Function(FileInfo base64Pdf) selectPdf,
  }) {
    return fetchVacancies();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchVacancies,
    TResult? Function(int? id)? fetchVacancySingle,
    TResult? Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult? Function(FileInfo base64Pdf)? selectPdf,
  }) {
    return fetchVacancies?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchVacancies,
    TResult Function(int? id)? fetchVacancySingle,
    TResult Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult Function(FileInfo base64Pdf)? selectPdf,
    required TResult orElse(),
  }) {
    if (fetchVacancies != null) {
      return fetchVacancies();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchVacancies value) fetchVacancies,
    required TResult Function(_FetchVacancySingle value) fetchVacancySingle,
    required TResult Function(_UploadVacancy value) uploadVacancy,
    required TResult Function(_SelectPdf value) selectPdf,
  }) {
    return fetchVacancies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchVacancies value)? fetchVacancies,
    TResult? Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult? Function(_UploadVacancy value)? uploadVacancy,
    TResult? Function(_SelectPdf value)? selectPdf,
  }) {
    return fetchVacancies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchVacancies value)? fetchVacancies,
    TResult Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult Function(_UploadVacancy value)? uploadVacancy,
    TResult Function(_SelectPdf value)? selectPdf,
    required TResult orElse(),
  }) {
    if (fetchVacancies != null) {
      return fetchVacancies(this);
    }
    return orElse();
  }
}

abstract class _FetchVacancies implements VacancyEvent {
  const factory _FetchVacancies() = _$FetchVacanciesImpl;
}

/// @nodoc
abstract class _$$FetchVacancySingleImplCopyWith<$Res> {
  factory _$$FetchVacancySingleImplCopyWith(_$FetchVacancySingleImpl value,
          $Res Function(_$FetchVacancySingleImpl) then) =
      __$$FetchVacancySingleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$FetchVacancySingleImplCopyWithImpl<$Res>
    extends _$VacancyEventCopyWithImpl<$Res, _$FetchVacancySingleImpl>
    implements _$$FetchVacancySingleImplCopyWith<$Res> {
  __$$FetchVacancySingleImplCopyWithImpl(_$FetchVacancySingleImpl _value,
      $Res Function(_$FetchVacancySingleImpl) _then)
      : super(_value, _then);

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$FetchVacancySingleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FetchVacancySingleImpl implements _FetchVacancySingle {
  const _$FetchVacancySingleImpl({this.id});

  @override
  final int? id;

  @override
  String toString() {
    return 'VacancyEvent.fetchVacancySingle(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchVacancySingleImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchVacancySingleImplCopyWith<_$FetchVacancySingleImpl> get copyWith =>
      __$$FetchVacancySingleImplCopyWithImpl<_$FetchVacancySingleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchVacancies,
    required TResult Function(int? id) fetchVacancySingle,
    required TResult Function(UploadVacancyModel vacancy) uploadVacancy,
    required TResult Function(FileInfo base64Pdf) selectPdf,
  }) {
    return fetchVacancySingle(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchVacancies,
    TResult? Function(int? id)? fetchVacancySingle,
    TResult? Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult? Function(FileInfo base64Pdf)? selectPdf,
  }) {
    return fetchVacancySingle?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchVacancies,
    TResult Function(int? id)? fetchVacancySingle,
    TResult Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult Function(FileInfo base64Pdf)? selectPdf,
    required TResult orElse(),
  }) {
    if (fetchVacancySingle != null) {
      return fetchVacancySingle(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchVacancies value) fetchVacancies,
    required TResult Function(_FetchVacancySingle value) fetchVacancySingle,
    required TResult Function(_UploadVacancy value) uploadVacancy,
    required TResult Function(_SelectPdf value) selectPdf,
  }) {
    return fetchVacancySingle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchVacancies value)? fetchVacancies,
    TResult? Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult? Function(_UploadVacancy value)? uploadVacancy,
    TResult? Function(_SelectPdf value)? selectPdf,
  }) {
    return fetchVacancySingle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchVacancies value)? fetchVacancies,
    TResult Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult Function(_UploadVacancy value)? uploadVacancy,
    TResult Function(_SelectPdf value)? selectPdf,
    required TResult orElse(),
  }) {
    if (fetchVacancySingle != null) {
      return fetchVacancySingle(this);
    }
    return orElse();
  }
}

abstract class _FetchVacancySingle implements VacancyEvent {
  const factory _FetchVacancySingle({final int? id}) = _$FetchVacancySingleImpl;

  int? get id;

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchVacancySingleImplCopyWith<_$FetchVacancySingleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadVacancyImplCopyWith<$Res> {
  factory _$$UploadVacancyImplCopyWith(
          _$UploadVacancyImpl value, $Res Function(_$UploadVacancyImpl) then) =
      __$$UploadVacancyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UploadVacancyModel vacancy});
}

/// @nodoc
class __$$UploadVacancyImplCopyWithImpl<$Res>
    extends _$VacancyEventCopyWithImpl<$Res, _$UploadVacancyImpl>
    implements _$$UploadVacancyImplCopyWith<$Res> {
  __$$UploadVacancyImplCopyWithImpl(
      _$UploadVacancyImpl _value, $Res Function(_$UploadVacancyImpl) _then)
      : super(_value, _then);

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vacancy = null,
  }) {
    return _then(_$UploadVacancyImpl(
      vacancy: null == vacancy
          ? _value.vacancy
          : vacancy // ignore: cast_nullable_to_non_nullable
              as UploadVacancyModel,
    ));
  }
}

/// @nodoc

class _$UploadVacancyImpl implements _UploadVacancy {
  const _$UploadVacancyImpl({required this.vacancy});

  @override
  final UploadVacancyModel vacancy;

  @override
  String toString() {
    return 'VacancyEvent.uploadVacancy(vacancy: $vacancy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadVacancyImpl &&
            (identical(other.vacancy, vacancy) || other.vacancy == vacancy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vacancy);

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadVacancyImplCopyWith<_$UploadVacancyImpl> get copyWith =>
      __$$UploadVacancyImplCopyWithImpl<_$UploadVacancyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchVacancies,
    required TResult Function(int? id) fetchVacancySingle,
    required TResult Function(UploadVacancyModel vacancy) uploadVacancy,
    required TResult Function(FileInfo base64Pdf) selectPdf,
  }) {
    return uploadVacancy(vacancy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchVacancies,
    TResult? Function(int? id)? fetchVacancySingle,
    TResult? Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult? Function(FileInfo base64Pdf)? selectPdf,
  }) {
    return uploadVacancy?.call(vacancy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchVacancies,
    TResult Function(int? id)? fetchVacancySingle,
    TResult Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult Function(FileInfo base64Pdf)? selectPdf,
    required TResult orElse(),
  }) {
    if (uploadVacancy != null) {
      return uploadVacancy(vacancy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchVacancies value) fetchVacancies,
    required TResult Function(_FetchVacancySingle value) fetchVacancySingle,
    required TResult Function(_UploadVacancy value) uploadVacancy,
    required TResult Function(_SelectPdf value) selectPdf,
  }) {
    return uploadVacancy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchVacancies value)? fetchVacancies,
    TResult? Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult? Function(_UploadVacancy value)? uploadVacancy,
    TResult? Function(_SelectPdf value)? selectPdf,
  }) {
    return uploadVacancy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchVacancies value)? fetchVacancies,
    TResult Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult Function(_UploadVacancy value)? uploadVacancy,
    TResult Function(_SelectPdf value)? selectPdf,
    required TResult orElse(),
  }) {
    if (uploadVacancy != null) {
      return uploadVacancy(this);
    }
    return orElse();
  }
}

abstract class _UploadVacancy implements VacancyEvent {
  const factory _UploadVacancy({required final UploadVacancyModel vacancy}) =
      _$UploadVacancyImpl;

  UploadVacancyModel get vacancy;

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadVacancyImplCopyWith<_$UploadVacancyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectPdfImplCopyWith<$Res> {
  factory _$$SelectPdfImplCopyWith(
          _$SelectPdfImpl value, $Res Function(_$SelectPdfImpl) then) =
      __$$SelectPdfImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FileInfo base64Pdf});
}

/// @nodoc
class __$$SelectPdfImplCopyWithImpl<$Res>
    extends _$VacancyEventCopyWithImpl<$Res, _$SelectPdfImpl>
    implements _$$SelectPdfImplCopyWith<$Res> {
  __$$SelectPdfImplCopyWithImpl(
      _$SelectPdfImpl _value, $Res Function(_$SelectPdfImpl) _then)
      : super(_value, _then);

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Pdf = null,
  }) {
    return _then(_$SelectPdfImpl(
      base64Pdf: null == base64Pdf
          ? _value.base64Pdf
          : base64Pdf // ignore: cast_nullable_to_non_nullable
              as FileInfo,
    ));
  }
}

/// @nodoc

class _$SelectPdfImpl implements _SelectPdf {
  const _$SelectPdfImpl({required this.base64Pdf});

  @override
  final FileInfo base64Pdf;

  @override
  String toString() {
    return 'VacancyEvent.selectPdf(base64Pdf: $base64Pdf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPdfImpl &&
            (identical(other.base64Pdf, base64Pdf) ||
                other.base64Pdf == base64Pdf));
  }

  @override
  int get hashCode => Object.hash(runtimeType, base64Pdf);

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPdfImplCopyWith<_$SelectPdfImpl> get copyWith =>
      __$$SelectPdfImplCopyWithImpl<_$SelectPdfImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchVacancies,
    required TResult Function(int? id) fetchVacancySingle,
    required TResult Function(UploadVacancyModel vacancy) uploadVacancy,
    required TResult Function(FileInfo base64Pdf) selectPdf,
  }) {
    return selectPdf(base64Pdf);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchVacancies,
    TResult? Function(int? id)? fetchVacancySingle,
    TResult? Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult? Function(FileInfo base64Pdf)? selectPdf,
  }) {
    return selectPdf?.call(base64Pdf);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchVacancies,
    TResult Function(int? id)? fetchVacancySingle,
    TResult Function(UploadVacancyModel vacancy)? uploadVacancy,
    TResult Function(FileInfo base64Pdf)? selectPdf,
    required TResult orElse(),
  }) {
    if (selectPdf != null) {
      return selectPdf(base64Pdf);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchVacancies value) fetchVacancies,
    required TResult Function(_FetchVacancySingle value) fetchVacancySingle,
    required TResult Function(_UploadVacancy value) uploadVacancy,
    required TResult Function(_SelectPdf value) selectPdf,
  }) {
    return selectPdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchVacancies value)? fetchVacancies,
    TResult? Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult? Function(_UploadVacancy value)? uploadVacancy,
    TResult? Function(_SelectPdf value)? selectPdf,
  }) {
    return selectPdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchVacancies value)? fetchVacancies,
    TResult Function(_FetchVacancySingle value)? fetchVacancySingle,
    TResult Function(_UploadVacancy value)? uploadVacancy,
    TResult Function(_SelectPdf value)? selectPdf,
    required TResult orElse(),
  }) {
    if (selectPdf != null) {
      return selectPdf(this);
    }
    return orElse();
  }
}

abstract class _SelectPdf implements VacancyEvent {
  const factory _SelectPdf({required final FileInfo base64Pdf}) =
      _$SelectPdfImpl;

  FileInfo get base64Pdf;

  /// Create a copy of VacancyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectPdfImplCopyWith<_$SelectPdfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VacancyState {
  FormzSubmissionStatus get vacancyStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get vacancySingleStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get uploadStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get selectPdf => throw _privateConstructorUsedError;
  FileInfo get base64Pdf => throw _privateConstructorUsedError;
  VacancyModel? get vacancies => throw _privateConstructorUsedError;
  JobApplicationModel? get vacancySingle => throw _privateConstructorUsedError;

  /// Create a copy of VacancyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VacancyStateCopyWith<VacancyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacancyStateCopyWith<$Res> {
  factory $VacancyStateCopyWith(
          VacancyState value, $Res Function(VacancyState) then) =
      _$VacancyStateCopyWithImpl<$Res, VacancyState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus vacancyStatus,
      FormzSubmissionStatus vacancySingleStatus,
      FormzSubmissionStatus uploadStatus,
      FormzSubmissionStatus selectPdf,
      FileInfo base64Pdf,
      VacancyModel? vacancies,
      JobApplicationModel? vacancySingle});
}

/// @nodoc
class _$VacancyStateCopyWithImpl<$Res, $Val extends VacancyState>
    implements $VacancyStateCopyWith<$Res> {
  _$VacancyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VacancyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vacancyStatus = null,
    Object? vacancySingleStatus = null,
    Object? uploadStatus = null,
    Object? selectPdf = null,
    Object? base64Pdf = null,
    Object? vacancies = freezed,
    Object? vacancySingle = freezed,
  }) {
    return _then(_value.copyWith(
      vacancyStatus: null == vacancyStatus
          ? _value.vacancyStatus
          : vacancyStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      vacancySingleStatus: null == vacancySingleStatus
          ? _value.vacancySingleStatus
          : vacancySingleStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      uploadStatus: null == uploadStatus
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      selectPdf: null == selectPdf
          ? _value.selectPdf
          : selectPdf // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      base64Pdf: null == base64Pdf
          ? _value.base64Pdf
          : base64Pdf // ignore: cast_nullable_to_non_nullable
              as FileInfo,
      vacancies: freezed == vacancies
          ? _value.vacancies
          : vacancies // ignore: cast_nullable_to_non_nullable
              as VacancyModel?,
      vacancySingle: freezed == vacancySingle
          ? _value.vacancySingle
          : vacancySingle // ignore: cast_nullable_to_non_nullable
              as JobApplicationModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VacansyStateImplCopyWith<$Res>
    implements $VacancyStateCopyWith<$Res> {
  factory _$$VacansyStateImplCopyWith(
          _$VacansyStateImpl value, $Res Function(_$VacansyStateImpl) then) =
      __$$VacansyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus vacancyStatus,
      FormzSubmissionStatus vacancySingleStatus,
      FormzSubmissionStatus uploadStatus,
      FormzSubmissionStatus selectPdf,
      FileInfo base64Pdf,
      VacancyModel? vacancies,
      JobApplicationModel? vacancySingle});
}

/// @nodoc
class __$$VacansyStateImplCopyWithImpl<$Res>
    extends _$VacancyStateCopyWithImpl<$Res, _$VacansyStateImpl>
    implements _$$VacansyStateImplCopyWith<$Res> {
  __$$VacansyStateImplCopyWithImpl(
      _$VacansyStateImpl _value, $Res Function(_$VacansyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VacancyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vacancyStatus = null,
    Object? vacancySingleStatus = null,
    Object? uploadStatus = null,
    Object? selectPdf = null,
    Object? base64Pdf = null,
    Object? vacancies = freezed,
    Object? vacancySingle = freezed,
  }) {
    return _then(_$VacansyStateImpl(
      vacancyStatus: null == vacancyStatus
          ? _value.vacancyStatus
          : vacancyStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      vacancySingleStatus: null == vacancySingleStatus
          ? _value.vacancySingleStatus
          : vacancySingleStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      uploadStatus: null == uploadStatus
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      selectPdf: null == selectPdf
          ? _value.selectPdf
          : selectPdf // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      base64Pdf: null == base64Pdf
          ? _value.base64Pdf
          : base64Pdf // ignore: cast_nullable_to_non_nullable
              as FileInfo,
      vacancies: freezed == vacancies
          ? _value.vacancies
          : vacancies // ignore: cast_nullable_to_non_nullable
              as VacancyModel?,
      vacancySingle: freezed == vacancySingle
          ? _value.vacancySingle
          : vacancySingle // ignore: cast_nullable_to_non_nullable
              as JobApplicationModel?,
    ));
  }
}

/// @nodoc

class _$VacansyStateImpl extends _VacansyState {
  const _$VacansyStateImpl(
      {this.vacancyStatus = FormzSubmissionStatus.initial,
      this.vacancySingleStatus = FormzSubmissionStatus.initial,
      this.uploadStatus = FormzSubmissionStatus.initial,
      this.selectPdf = FormzSubmissionStatus.initial,
      this.base64Pdf = const FileInfo(),
      this.vacancies = null,
      this.vacancySingle = null})
      : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus vacancyStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus vacancySingleStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus uploadStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus selectPdf;
  @override
  @JsonKey()
  final FileInfo base64Pdf;
  @override
  @JsonKey()
  final VacancyModel? vacancies;
  @override
  @JsonKey()
  final JobApplicationModel? vacancySingle;

  @override
  String toString() {
    return 'VacancyState(vacancyStatus: $vacancyStatus, vacancySingleStatus: $vacancySingleStatus, uploadStatus: $uploadStatus, selectPdf: $selectPdf, base64Pdf: $base64Pdf, vacancies: $vacancies, vacancySingle: $vacancySingle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VacansyStateImpl &&
            (identical(other.vacancyStatus, vacancyStatus) ||
                other.vacancyStatus == vacancyStatus) &&
            (identical(other.vacancySingleStatus, vacancySingleStatus) ||
                other.vacancySingleStatus == vacancySingleStatus) &&
            (identical(other.uploadStatus, uploadStatus) ||
                other.uploadStatus == uploadStatus) &&
            (identical(other.selectPdf, selectPdf) ||
                other.selectPdf == selectPdf) &&
            (identical(other.base64Pdf, base64Pdf) ||
                other.base64Pdf == base64Pdf) &&
            (identical(other.vacancies, vacancies) ||
                other.vacancies == vacancies) &&
            (identical(other.vacancySingle, vacancySingle) ||
                other.vacancySingle == vacancySingle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      vacancyStatus,
      vacancySingleStatus,
      uploadStatus,
      selectPdf,
      base64Pdf,
      vacancies,
      vacancySingle);

  /// Create a copy of VacancyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VacansyStateImplCopyWith<_$VacansyStateImpl> get copyWith =>
      __$$VacansyStateImplCopyWithImpl<_$VacansyStateImpl>(this, _$identity);
}

abstract class _VacansyState extends VacancyState {
  const factory _VacansyState(
      {final FormzSubmissionStatus vacancyStatus,
      final FormzSubmissionStatus vacancySingleStatus,
      final FormzSubmissionStatus uploadStatus,
      final FormzSubmissionStatus selectPdf,
      final FileInfo base64Pdf,
      final VacancyModel? vacancies,
      final JobApplicationModel? vacancySingle}) = _$VacansyStateImpl;
  const _VacansyState._() : super._();

  @override
  FormzSubmissionStatus get vacancyStatus;
  @override
  FormzSubmissionStatus get vacancySingleStatus;
  @override
  FormzSubmissionStatus get uploadStatus;
  @override
  FormzSubmissionStatus get selectPdf;
  @override
  FileInfo get base64Pdf;
  @override
  VacancyModel? get vacancies;
  @override
  JobApplicationModel? get vacancySingle;

  /// Create a copy of VacancyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VacansyStateImplCopyWith<_$VacansyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
