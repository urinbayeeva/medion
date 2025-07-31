// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BranchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchEventCopyWith<$Res> {
  factory $BranchEventCopyWith(
          BranchEvent value, $Res Function(BranchEvent) then) =
      _$BranchEventCopyWithImpl<$Res, BranchEvent>;
}

/// @nodoc
class _$BranchEventCopyWithImpl<$Res, $Val extends BranchEvent>
    implements $BranchEventCopyWith<$Res> {
  _$BranchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchBranchesImplCopyWith<$Res> {
  factory _$$FetchBranchesImplCopyWith(
          _$FetchBranchesImpl value, $Res Function(_$FetchBranchesImpl) then) =
      __$$FetchBranchesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchBranchesImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$FetchBranchesImpl>
    implements _$$FetchBranchesImplCopyWith<$Res> {
  __$$FetchBranchesImplCopyWithImpl(
      _$FetchBranchesImpl _value, $Res Function(_$FetchBranchesImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchBranchesImpl implements _FetchBranches {
  const _$FetchBranchesImpl();

  @override
  String toString() {
    return 'BranchEvent.fetchBranches()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchBranchesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return fetchBranches();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return fetchBranches?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchBranches != null) {
      return fetchBranches();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return fetchBranches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return fetchBranches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchBranches != null) {
      return fetchBranches(this);
    }
    return orElse();
  }
}

abstract class _FetchBranches implements BranchEvent {
  const factory _FetchBranches() = _$FetchBranchesImpl;
}

/// @nodoc
abstract class _$$FetchAwardsImplCopyWith<$Res> {
  factory _$$FetchAwardsImplCopyWith(
          _$FetchAwardsImpl value, $Res Function(_$FetchAwardsImpl) then) =
      __$$FetchAwardsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAwardsImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$FetchAwardsImpl>
    implements _$$FetchAwardsImplCopyWith<$Res> {
  __$$FetchAwardsImplCopyWithImpl(
      _$FetchAwardsImpl _value, $Res Function(_$FetchAwardsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchAwardsImpl implements _FetchAwards {
  const _$FetchAwardsImpl();

  @override
  String toString() {
    return 'BranchEvent.fetchAwards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAwardsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return fetchAwards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return fetchAwards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchAwards != null) {
      return fetchAwards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return fetchAwards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return fetchAwards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchAwards != null) {
      return fetchAwards(this);
    }
    return orElse();
  }
}

abstract class _FetchAwards implements BranchEvent {
  const factory _FetchAwards() = _$FetchAwardsImpl;
}

/// @nodoc
abstract class _$$FetchStudyImplCopyWith<$Res> {
  factory _$$FetchStudyImplCopyWith(
          _$FetchStudyImpl value, $Res Function(_$FetchStudyImpl) then) =
      __$$FetchStudyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchStudyImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$FetchStudyImpl>
    implements _$$FetchStudyImplCopyWith<$Res> {
  __$$FetchStudyImplCopyWithImpl(
      _$FetchStudyImpl _value, $Res Function(_$FetchStudyImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchStudyImpl implements _FetchStudy {
  const _$FetchStudyImpl();

  @override
  String toString() {
    return 'BranchEvent.fetchStudy()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchStudyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return fetchStudy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return fetchStudy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchStudy != null) {
      return fetchStudy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return fetchStudy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return fetchStudy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchStudy != null) {
      return fetchStudy(this);
    }
    return orElse();
  }
}

abstract class _FetchStudy implements BranchEvent {
  const factory _FetchStudy() = _$FetchStudyImpl;
}

/// @nodoc
abstract class _$$StudyLeadImplCopyWith<$Res> {
  factory _$$StudyLeadImplCopyWith(
          _$StudyLeadImpl value, $Res Function(_$StudyLeadImpl) then) =
      __$$StudyLeadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StudyLead report});
}

/// @nodoc
class __$$StudyLeadImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$StudyLeadImpl>
    implements _$$StudyLeadImplCopyWith<$Res> {
  __$$StudyLeadImplCopyWithImpl(
      _$StudyLeadImpl _value, $Res Function(_$StudyLeadImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = null,
  }) {
    return _then(_$StudyLeadImpl(
      report: null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as StudyLead,
    ));
  }
}

/// @nodoc

class _$StudyLeadImpl implements _StudyLead {
  const _$StudyLeadImpl({required this.report});

  @override
  final StudyLead report;

  @override
  String toString() {
    return 'BranchEvent.studyLead(report: $report)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudyLeadImpl &&
            (identical(other.report, report) || other.report == report));
  }

  @override
  int get hashCode => Object.hash(runtimeType, report);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudyLeadImplCopyWith<_$StudyLeadImpl> get copyWith =>
      __$$StudyLeadImplCopyWithImpl<_$StudyLeadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return studyLead(report);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return studyLead?.call(report);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (studyLead != null) {
      return studyLead(report);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return studyLead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return studyLead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (studyLead != null) {
      return studyLead(this);
    }
    return orElse();
  }
}

abstract class _StudyLead implements BranchEvent {
  const factory _StudyLead({required final StudyLead report}) = _$StudyLeadImpl;

  StudyLead get report;

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudyLeadImplCopyWith<_$StudyLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchOffertaImplCopyWith<$Res> {
  factory _$$FetchOffertaImplCopyWith(
          _$FetchOffertaImpl value, $Res Function(_$FetchOffertaImpl) then) =
      __$$FetchOffertaImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchOffertaImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$FetchOffertaImpl>
    implements _$$FetchOffertaImplCopyWith<$Res> {
  __$$FetchOffertaImplCopyWithImpl(
      _$FetchOffertaImpl _value, $Res Function(_$FetchOffertaImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchOffertaImpl implements _FetchOfferta {
  const _$FetchOffertaImpl();

  @override
  String toString() {
    return 'BranchEvent.fetchOfferta()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchOffertaImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return fetchOfferta();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return fetchOfferta?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchOfferta != null) {
      return fetchOfferta();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return fetchOfferta(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return fetchOfferta?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchOfferta != null) {
      return fetchOfferta(this);
    }
    return orElse();
  }
}

abstract class _FetchOfferta implements BranchEvent {
  const factory _FetchOfferta() = _$FetchOffertaImpl;
}

/// @nodoc
abstract class _$$FetchActivityImplCopyWith<$Res> {
  factory _$$FetchActivityImplCopyWith(
          _$FetchActivityImpl value, $Res Function(_$FetchActivityImpl) then) =
      __$$FetchActivityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchActivityImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$FetchActivityImpl>
    implements _$$FetchActivityImplCopyWith<$Res> {
  __$$FetchActivityImplCopyWithImpl(
      _$FetchActivityImpl _value, $Res Function(_$FetchActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchActivityImpl implements _FetchActivity {
  const _$FetchActivityImpl();

  @override
  String toString() {
    return 'BranchEvent.fetchActivity()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchActivityImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return fetchActivity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return fetchActivity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchActivity != null) {
      return fetchActivity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return fetchActivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return fetchActivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (fetchActivity != null) {
      return fetchActivity(this);
    }
    return orElse();
  }
}

abstract class _FetchActivity implements BranchEvent {
  const factory _FetchActivity() = _$FetchActivityImpl;
}

/// @nodoc
abstract class _$$GetReviewsImplCopyWith<$Res> {
  factory _$$GetReviewsImplCopyWith(
          _$GetReviewsImpl value, $Res Function(_$GetReviewsImpl) then) =
      __$$GetReviewsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetReviewsImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$GetReviewsImpl>
    implements _$$GetReviewsImplCopyWith<$Res> {
  __$$GetReviewsImplCopyWithImpl(
      _$GetReviewsImpl _value, $Res Function(_$GetReviewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetReviewsImpl implements _GetReviews {
  const _$GetReviewsImpl();

  @override
  String toString() {
    return 'BranchEvent.getReviews()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetReviewsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return getReviews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return getReviews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (getReviews != null) {
      return getReviews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return getReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return getReviews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (getReviews != null) {
      return getReviews(this);
    }
    return orElse();
  }
}

abstract class _GetReviews implements BranchEvent {
  const factory _GetReviews() = _$GetReviewsImpl;
}

/// @nodoc
abstract class _$$PostReviewsImplCopyWith<$Res> {
  factory _$$PostReviewsImplCopyWith(
          _$PostReviewsImpl value, $Res Function(_$PostReviewsImpl) then) =
      __$$PostReviewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostReviewModel review});
}

/// @nodoc
class __$$PostReviewsImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$PostReviewsImpl>
    implements _$$PostReviewsImplCopyWith<$Res> {
  __$$PostReviewsImplCopyWithImpl(
      _$PostReviewsImpl _value, $Res Function(_$PostReviewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
  }) {
    return _then(_$PostReviewsImpl(
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as PostReviewModel,
    ));
  }
}

/// @nodoc

class _$PostReviewsImpl implements _PostReviews {
  const _$PostReviewsImpl({required this.review});

  @override
  final PostReviewModel review;

  @override
  String toString() {
    return 'BranchEvent.postReviews(review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostReviewsImpl &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, review);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostReviewsImplCopyWith<_$PostReviewsImpl> get copyWith =>
      __$$PostReviewsImplCopyWithImpl<_$PostReviewsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return postReviews(review);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return postReviews?.call(review);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (postReviews != null) {
      return postReviews(review);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return postReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return postReviews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (postReviews != null) {
      return postReviews(this);
    }
    return orElse();
  }
}

abstract class _PostReviews implements BranchEvent {
  const factory _PostReviews({required final PostReviewModel review}) =
      _$PostReviewsImpl;

  PostReviewModel get review;

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostReviewsImplCopyWith<_$PostReviewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBranchDetailImplCopyWith<$Res> {
  factory _$$GetBranchDetailImplCopyWith(_$GetBranchDetailImpl value,
          $Res Function(_$GetBranchDetailImpl) then) =
      __$$GetBranchDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetBranchDetailImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$GetBranchDetailImpl>
    implements _$$GetBranchDetailImplCopyWith<$Res> {
  __$$GetBranchDetailImplCopyWithImpl(
      _$GetBranchDetailImpl _value, $Res Function(_$GetBranchDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetBranchDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetBranchDetailImpl implements _GetBranchDetail {
  const _$GetBranchDetailImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'BranchEvent.getBranchDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBranchDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBranchDetailImplCopyWith<_$GetBranchDetailImpl> get copyWith =>
      __$$GetBranchDetailImplCopyWithImpl<_$GetBranchDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return getBranchDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return getBranchDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (getBranchDetail != null) {
      return getBranchDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return getBranchDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return getBranchDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (getBranchDetail != null) {
      return getBranchDetail(this);
    }
    return orElse();
  }
}

abstract class _GetBranchDetail implements BranchEvent {
  const factory _GetBranchDetail({required final int id}) =
      _$GetBranchDetailImpl;

  int get id;

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBranchDetailImplCopyWith<_$GetBranchDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FillingReviewDataImplCopyWith<$Res> {
  factory _$$FillingReviewDataImplCopyWith(_$FillingReviewDataImpl value,
          $Res Function(_$FillingReviewDataImpl) then) =
      __$$FillingReviewDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int rank, int id, String branch, String comment});
}

/// @nodoc
class __$$FillingReviewDataImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$FillingReviewDataImpl>
    implements _$$FillingReviewDataImplCopyWith<$Res> {
  __$$FillingReviewDataImplCopyWithImpl(_$FillingReviewDataImpl _value,
      $Res Function(_$FillingReviewDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? id = null,
    Object? branch = null,
    Object? comment = null,
  }) {
    return _then(_$FillingReviewDataImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FillingReviewDataImpl implements _FillingReviewData {
  const _$FillingReviewDataImpl(
      {this.rank = -1, this.id = -1, this.branch = '', this.comment = ''});

  @override
  @JsonKey()
  final int rank;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String branch;
  @override
  @JsonKey()
  final String comment;

  @override
  String toString() {
    return 'BranchEvent.fillingReviewData(rank: $rank, id: $id, branch: $branch, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FillingReviewDataImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rank, id, branch, comment);

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FillingReviewDataImplCopyWith<_$FillingReviewDataImpl> get copyWith =>
      __$$FillingReviewDataImplCopyWithImpl<_$FillingReviewDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBranches,
    required TResult Function() fetchAwards,
    required TResult Function() fetchStudy,
    required TResult Function(StudyLead report) studyLead,
    required TResult Function() fetchOfferta,
    required TResult Function() fetchActivity,
    required TResult Function() getReviews,
    required TResult Function(PostReviewModel review) postReviews,
    required TResult Function(int id) getBranchDetail,
    required TResult Function(int rank, int id, String branch, String comment)
        fillingReviewData,
  }) {
    return fillingReviewData(rank, id, branch, comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBranches,
    TResult? Function()? fetchAwards,
    TResult? Function()? fetchStudy,
    TResult? Function(StudyLead report)? studyLead,
    TResult? Function()? fetchOfferta,
    TResult? Function()? fetchActivity,
    TResult? Function()? getReviews,
    TResult? Function(PostReviewModel review)? postReviews,
    TResult? Function(int id)? getBranchDetail,
    TResult? Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
  }) {
    return fillingReviewData?.call(rank, id, branch, comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBranches,
    TResult Function()? fetchAwards,
    TResult Function()? fetchStudy,
    TResult Function(StudyLead report)? studyLead,
    TResult Function()? fetchOfferta,
    TResult Function()? fetchActivity,
    TResult Function()? getReviews,
    TResult Function(PostReviewModel review)? postReviews,
    TResult Function(int id)? getBranchDetail,
    TResult Function(int rank, int id, String branch, String comment)?
        fillingReviewData,
    required TResult orElse(),
  }) {
    if (fillingReviewData != null) {
      return fillingReviewData(rank, id, branch, comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBranches value) fetchBranches,
    required TResult Function(_FetchAwards value) fetchAwards,
    required TResult Function(_FetchStudy value) fetchStudy,
    required TResult Function(_StudyLead value) studyLead,
    required TResult Function(_FetchOfferta value) fetchOfferta,
    required TResult Function(_FetchActivity value) fetchActivity,
    required TResult Function(_GetReviews value) getReviews,
    required TResult Function(_PostReviews value) postReviews,
    required TResult Function(_GetBranchDetail value) getBranchDetail,
    required TResult Function(_FillingReviewData value) fillingReviewData,
  }) {
    return fillingReviewData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBranches value)? fetchBranches,
    TResult? Function(_FetchAwards value)? fetchAwards,
    TResult? Function(_FetchStudy value)? fetchStudy,
    TResult? Function(_StudyLead value)? studyLead,
    TResult? Function(_FetchOfferta value)? fetchOfferta,
    TResult? Function(_FetchActivity value)? fetchActivity,
    TResult? Function(_GetReviews value)? getReviews,
    TResult? Function(_PostReviews value)? postReviews,
    TResult? Function(_GetBranchDetail value)? getBranchDetail,
    TResult? Function(_FillingReviewData value)? fillingReviewData,
  }) {
    return fillingReviewData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBranches value)? fetchBranches,
    TResult Function(_FetchAwards value)? fetchAwards,
    TResult Function(_FetchStudy value)? fetchStudy,
    TResult Function(_StudyLead value)? studyLead,
    TResult Function(_FetchOfferta value)? fetchOfferta,
    TResult Function(_FetchActivity value)? fetchActivity,
    TResult Function(_GetReviews value)? getReviews,
    TResult Function(_PostReviews value)? postReviews,
    TResult Function(_GetBranchDetail value)? getBranchDetail,
    TResult Function(_FillingReviewData value)? fillingReviewData,
    required TResult orElse(),
  }) {
    if (fillingReviewData != null) {
      return fillingReviewData(this);
    }
    return orElse();
  }
}

abstract class _FillingReviewData implements BranchEvent {
  const factory _FillingReviewData(
      {final int rank,
      final int id,
      final String branch,
      final String comment}) = _$FillingReviewDataImpl;

  int get rank;
  int get id;
  String get branch;
  String get comment;

  /// Create a copy of BranchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FillingReviewDataImplCopyWith<_$FillingReviewDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BranchState {
// @Default(false) bool loading,
// @Default(false) bool error,
// @Default(false) bool success,
  String get reviewBranch => throw _privateConstructorUsedError;
  String get reviewComment => throw _privateConstructorUsedError;
  int get reviewRank => throw _privateConstructorUsedError;
  int get branchId => throw _privateConstructorUsedError;
  FormzSubmissionStatus get activityStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get branchDetailStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get getReviewStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get postReviewStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get getBranchesStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get studyLeadStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get branchStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get educationStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get awardStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get offertaStatus => throw _privateConstructorUsedError;
  List<GetReviewModel> get reviews => throw _privateConstructorUsedError;
  List<BranchModel> get branches => throw _privateConstructorUsedError;
  List<AwardsModel> get awards => throw _privateConstructorUsedError;
  EducationModel? get study => throw _privateConstructorUsedError;
  BranchDetailModel? get branchDetail => throw _privateConstructorUsedError;
  OfferModel? get offerta => throw _privateConstructorUsedError;
  MedionModel? get medionActivity => throw _privateConstructorUsedError;

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchStateCopyWith<BranchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchStateCopyWith<$Res> {
  factory $BranchStateCopyWith(
          BranchState value, $Res Function(BranchState) then) =
      _$BranchStateCopyWithImpl<$Res, BranchState>;
  @useResult
  $Res call(
      {String reviewBranch,
      String reviewComment,
      int reviewRank,
      int branchId,
      FormzSubmissionStatus activityStatus,
      FormzSubmissionStatus branchDetailStatus,
      FormzSubmissionStatus getReviewStatus,
      FormzSubmissionStatus postReviewStatus,
      FormzSubmissionStatus getBranchesStatus,
      FormzSubmissionStatus studyLeadStatus,
      FormzSubmissionStatus branchStatus,
      FormzSubmissionStatus educationStatus,
      FormzSubmissionStatus awardStatus,
      FormzSubmissionStatus offertaStatus,
      List<GetReviewModel> reviews,
      List<BranchModel> branches,
      List<AwardsModel> awards,
      EducationModel? study,
      BranchDetailModel? branchDetail,
      OfferModel? offerta,
      MedionModel? medionActivity});
}

/// @nodoc
class _$BranchStateCopyWithImpl<$Res, $Val extends BranchState>
    implements $BranchStateCopyWith<$Res> {
  _$BranchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewBranch = null,
    Object? reviewComment = null,
    Object? reviewRank = null,
    Object? branchId = null,
    Object? activityStatus = null,
    Object? branchDetailStatus = null,
    Object? getReviewStatus = null,
    Object? postReviewStatus = null,
    Object? getBranchesStatus = null,
    Object? studyLeadStatus = null,
    Object? branchStatus = null,
    Object? educationStatus = null,
    Object? awardStatus = null,
    Object? offertaStatus = null,
    Object? reviews = null,
    Object? branches = null,
    Object? awards = null,
    Object? study = freezed,
    Object? branchDetail = freezed,
    Object? offerta = freezed,
    Object? medionActivity = freezed,
  }) {
    return _then(_value.copyWith(
      reviewBranch: null == reviewBranch
          ? _value.reviewBranch
          : reviewBranch // ignore: cast_nullable_to_non_nullable
              as String,
      reviewComment: null == reviewComment
          ? _value.reviewComment
          : reviewComment // ignore: cast_nullable_to_non_nullable
              as String,
      reviewRank: null == reviewRank
          ? _value.reviewRank
          : reviewRank // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int,
      activityStatus: null == activityStatus
          ? _value.activityStatus
          : activityStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      branchDetailStatus: null == branchDetailStatus
          ? _value.branchDetailStatus
          : branchDetailStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      getReviewStatus: null == getReviewStatus
          ? _value.getReviewStatus
          : getReviewStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      postReviewStatus: null == postReviewStatus
          ? _value.postReviewStatus
          : postReviewStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      getBranchesStatus: null == getBranchesStatus
          ? _value.getBranchesStatus
          : getBranchesStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      studyLeadStatus: null == studyLeadStatus
          ? _value.studyLeadStatus
          : studyLeadStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      branchStatus: null == branchStatus
          ? _value.branchStatus
          : branchStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      educationStatus: null == educationStatus
          ? _value.educationStatus
          : educationStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      awardStatus: null == awardStatus
          ? _value.awardStatus
          : awardStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      offertaStatus: null == offertaStatus
          ? _value.offertaStatus
          : offertaStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<GetReviewModel>,
      branches: null == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<BranchModel>,
      awards: null == awards
          ? _value.awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<AwardsModel>,
      study: freezed == study
          ? _value.study
          : study // ignore: cast_nullable_to_non_nullable
              as EducationModel?,
      branchDetail: freezed == branchDetail
          ? _value.branchDetail
          : branchDetail // ignore: cast_nullable_to_non_nullable
              as BranchDetailModel?,
      offerta: freezed == offerta
          ? _value.offerta
          : offerta // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
      medionActivity: freezed == medionActivity
          ? _value.medionActivity
          : medionActivity // ignore: cast_nullable_to_non_nullable
              as MedionModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchStateImplCopyWith<$Res>
    implements $BranchStateCopyWith<$Res> {
  factory _$$BranchStateImplCopyWith(
          _$BranchStateImpl value, $Res Function(_$BranchStateImpl) then) =
      __$$BranchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reviewBranch,
      String reviewComment,
      int reviewRank,
      int branchId,
      FormzSubmissionStatus activityStatus,
      FormzSubmissionStatus branchDetailStatus,
      FormzSubmissionStatus getReviewStatus,
      FormzSubmissionStatus postReviewStatus,
      FormzSubmissionStatus getBranchesStatus,
      FormzSubmissionStatus studyLeadStatus,
      FormzSubmissionStatus branchStatus,
      FormzSubmissionStatus educationStatus,
      FormzSubmissionStatus awardStatus,
      FormzSubmissionStatus offertaStatus,
      List<GetReviewModel> reviews,
      List<BranchModel> branches,
      List<AwardsModel> awards,
      EducationModel? study,
      BranchDetailModel? branchDetail,
      OfferModel? offerta,
      MedionModel? medionActivity});
}

/// @nodoc
class __$$BranchStateImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchStateImpl>
    implements _$$BranchStateImplCopyWith<$Res> {
  __$$BranchStateImplCopyWithImpl(
      _$BranchStateImpl _value, $Res Function(_$BranchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewBranch = null,
    Object? reviewComment = null,
    Object? reviewRank = null,
    Object? branchId = null,
    Object? activityStatus = null,
    Object? branchDetailStatus = null,
    Object? getReviewStatus = null,
    Object? postReviewStatus = null,
    Object? getBranchesStatus = null,
    Object? studyLeadStatus = null,
    Object? branchStatus = null,
    Object? educationStatus = null,
    Object? awardStatus = null,
    Object? offertaStatus = null,
    Object? reviews = null,
    Object? branches = null,
    Object? awards = null,
    Object? study = freezed,
    Object? branchDetail = freezed,
    Object? offerta = freezed,
    Object? medionActivity = freezed,
  }) {
    return _then(_$BranchStateImpl(
      reviewBranch: null == reviewBranch
          ? _value.reviewBranch
          : reviewBranch // ignore: cast_nullable_to_non_nullable
              as String,
      reviewComment: null == reviewComment
          ? _value.reviewComment
          : reviewComment // ignore: cast_nullable_to_non_nullable
              as String,
      reviewRank: null == reviewRank
          ? _value.reviewRank
          : reviewRank // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int,
      activityStatus: null == activityStatus
          ? _value.activityStatus
          : activityStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      branchDetailStatus: null == branchDetailStatus
          ? _value.branchDetailStatus
          : branchDetailStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      getReviewStatus: null == getReviewStatus
          ? _value.getReviewStatus
          : getReviewStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      postReviewStatus: null == postReviewStatus
          ? _value.postReviewStatus
          : postReviewStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      getBranchesStatus: null == getBranchesStatus
          ? _value.getBranchesStatus
          : getBranchesStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      studyLeadStatus: null == studyLeadStatus
          ? _value.studyLeadStatus
          : studyLeadStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      branchStatus: null == branchStatus
          ? _value.branchStatus
          : branchStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      educationStatus: null == educationStatus
          ? _value.educationStatus
          : educationStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      awardStatus: null == awardStatus
          ? _value.awardStatus
          : awardStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      offertaStatus: null == offertaStatus
          ? _value.offertaStatus
          : offertaStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<GetReviewModel>,
      branches: null == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<BranchModel>,
      awards: null == awards
          ? _value._awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<AwardsModel>,
      study: freezed == study
          ? _value.study
          : study // ignore: cast_nullable_to_non_nullable
              as EducationModel?,
      branchDetail: freezed == branchDetail
          ? _value.branchDetail
          : branchDetail // ignore: cast_nullable_to_non_nullable
              as BranchDetailModel?,
      offerta: freezed == offerta
          ? _value.offerta
          : offerta // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
      medionActivity: freezed == medionActivity
          ? _value.medionActivity
          : medionActivity // ignore: cast_nullable_to_non_nullable
              as MedionModel?,
    ));
  }
}

/// @nodoc

class _$BranchStateImpl extends _BranchState {
  const _$BranchStateImpl(
      {this.reviewBranch = '',
      this.reviewComment = '',
      this.reviewRank = -1,
      this.branchId = -1,
      this.activityStatus = FormzSubmissionStatus.initial,
      this.branchDetailStatus = FormzSubmissionStatus.initial,
      this.getReviewStatus = FormzSubmissionStatus.initial,
      this.postReviewStatus = FormzSubmissionStatus.initial,
      this.getBranchesStatus = FormzSubmissionStatus.initial,
      this.studyLeadStatus = FormzSubmissionStatus.initial,
      this.branchStatus = FormzSubmissionStatus.initial,
      this.educationStatus = FormzSubmissionStatus.initial,
      this.awardStatus = FormzSubmissionStatus.initial,
      this.offertaStatus = FormzSubmissionStatus.initial,
      final List<GetReviewModel> reviews = const [],
      final List<BranchModel> branches = const [],
      final List<AwardsModel> awards = const [],
      this.study = null,
      this.branchDetail = null,
      this.offerta = null,
      this.medionActivity = null})
      : _reviews = reviews,
        _branches = branches,
        _awards = awards,
        super._();

// @Default(false) bool loading,
// @Default(false) bool error,
// @Default(false) bool success,
  @override
  @JsonKey()
  final String reviewBranch;
  @override
  @JsonKey()
  final String reviewComment;
  @override
  @JsonKey()
  final int reviewRank;
  @override
  @JsonKey()
  final int branchId;
  @override
  @JsonKey()
  final FormzSubmissionStatus activityStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus branchDetailStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus getReviewStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus postReviewStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus getBranchesStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus studyLeadStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus branchStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus educationStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus awardStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus offertaStatus;
  final List<GetReviewModel> _reviews;
  @override
  @JsonKey()
  List<GetReviewModel> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  final List<BranchModel> _branches;
  @override
  @JsonKey()
  List<BranchModel> get branches {
    if (_branches is EqualUnmodifiableListView) return _branches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branches);
  }

  final List<AwardsModel> _awards;
  @override
  @JsonKey()
  List<AwardsModel> get awards {
    if (_awards is EqualUnmodifiableListView) return _awards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_awards);
  }

  @override
  @JsonKey()
  final EducationModel? study;
  @override
  @JsonKey()
  final BranchDetailModel? branchDetail;
  @override
  @JsonKey()
  final OfferModel? offerta;
  @override
  @JsonKey()
  final MedionModel? medionActivity;

  @override
  String toString() {
    return 'BranchState(reviewBranch: $reviewBranch, reviewComment: $reviewComment, reviewRank: $reviewRank, branchId: $branchId, activityStatus: $activityStatus, branchDetailStatus: $branchDetailStatus, getReviewStatus: $getReviewStatus, postReviewStatus: $postReviewStatus, getBranchesStatus: $getBranchesStatus, studyLeadStatus: $studyLeadStatus, branchStatus: $branchStatus, educationStatus: $educationStatus, awardStatus: $awardStatus, offertaStatus: $offertaStatus, reviews: $reviews, branches: $branches, awards: $awards, study: $study, branchDetail: $branchDetail, offerta: $offerta, medionActivity: $medionActivity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchStateImpl &&
            (identical(other.reviewBranch, reviewBranch) ||
                other.reviewBranch == reviewBranch) &&
            (identical(other.reviewComment, reviewComment) ||
                other.reviewComment == reviewComment) &&
            (identical(other.reviewRank, reviewRank) ||
                other.reviewRank == reviewRank) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.activityStatus, activityStatus) ||
                other.activityStatus == activityStatus) &&
            (identical(other.branchDetailStatus, branchDetailStatus) ||
                other.branchDetailStatus == branchDetailStatus) &&
            (identical(other.getReviewStatus, getReviewStatus) ||
                other.getReviewStatus == getReviewStatus) &&
            (identical(other.postReviewStatus, postReviewStatus) ||
                other.postReviewStatus == postReviewStatus) &&
            (identical(other.getBranchesStatus, getBranchesStatus) ||
                other.getBranchesStatus == getBranchesStatus) &&
            (identical(other.studyLeadStatus, studyLeadStatus) ||
                other.studyLeadStatus == studyLeadStatus) &&
            (identical(other.branchStatus, branchStatus) ||
                other.branchStatus == branchStatus) &&
            (identical(other.educationStatus, educationStatus) ||
                other.educationStatus == educationStatus) &&
            (identical(other.awardStatus, awardStatus) ||
                other.awardStatus == awardStatus) &&
            (identical(other.offertaStatus, offertaStatus) ||
                other.offertaStatus == offertaStatus) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality().equals(other._branches, _branches) &&
            const DeepCollectionEquality().equals(other._awards, _awards) &&
            (identical(other.study, study) || other.study == study) &&
            (identical(other.branchDetail, branchDetail) ||
                other.branchDetail == branchDetail) &&
            (identical(other.offerta, offerta) || other.offerta == offerta) &&
            (identical(other.medionActivity, medionActivity) ||
                other.medionActivity == medionActivity));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reviewBranch,
        reviewComment,
        reviewRank,
        branchId,
        activityStatus,
        branchDetailStatus,
        getReviewStatus,
        postReviewStatus,
        getBranchesStatus,
        studyLeadStatus,
        branchStatus,
        educationStatus,
        awardStatus,
        offertaStatus,
        const DeepCollectionEquality().hash(_reviews),
        const DeepCollectionEquality().hash(_branches),
        const DeepCollectionEquality().hash(_awards),
        study,
        branchDetail,
        offerta,
        medionActivity
      ]);

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchStateImplCopyWith<_$BranchStateImpl> get copyWith =>
      __$$BranchStateImplCopyWithImpl<_$BranchStateImpl>(this, _$identity);
}

abstract class _BranchState extends BranchState {
  const factory _BranchState(
      {final String reviewBranch,
      final String reviewComment,
      final int reviewRank,
      final int branchId,
      final FormzSubmissionStatus activityStatus,
      final FormzSubmissionStatus branchDetailStatus,
      final FormzSubmissionStatus getReviewStatus,
      final FormzSubmissionStatus postReviewStatus,
      final FormzSubmissionStatus getBranchesStatus,
      final FormzSubmissionStatus studyLeadStatus,
      final FormzSubmissionStatus branchStatus,
      final FormzSubmissionStatus educationStatus,
      final FormzSubmissionStatus awardStatus,
      final FormzSubmissionStatus offertaStatus,
      final List<GetReviewModel> reviews,
      final List<BranchModel> branches,
      final List<AwardsModel> awards,
      final EducationModel? study,
      final BranchDetailModel? branchDetail,
      final OfferModel? offerta,
      final MedionModel? medionActivity}) = _$BranchStateImpl;
  const _BranchState._() : super._();

// @Default(false) bool loading,
// @Default(false) bool error,
// @Default(false) bool success,
  @override
  String get reviewBranch;
  @override
  String get reviewComment;
  @override
  int get reviewRank;
  @override
  int get branchId;
  @override
  FormzSubmissionStatus get activityStatus;
  @override
  FormzSubmissionStatus get branchDetailStatus;
  @override
  FormzSubmissionStatus get getReviewStatus;
  @override
  FormzSubmissionStatus get postReviewStatus;
  @override
  FormzSubmissionStatus get getBranchesStatus;
  @override
  FormzSubmissionStatus get studyLeadStatus;
  @override
  FormzSubmissionStatus get branchStatus;
  @override
  FormzSubmissionStatus get educationStatus;
  @override
  FormzSubmissionStatus get awardStatus;
  @override
  FormzSubmissionStatus get offertaStatus;
  @override
  List<GetReviewModel> get reviews;
  @override
  List<BranchModel> get branches;
  @override
  List<AwardsModel> get awards;
  @override
  EducationModel? get study;
  @override
  BranchDetailModel? get branchDetail;
  @override
  OfferModel? get offerta;
  @override
  MedionModel? get medionActivity;

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchStateImplCopyWith<_$BranchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
