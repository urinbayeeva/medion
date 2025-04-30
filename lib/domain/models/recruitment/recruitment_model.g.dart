// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VacancyModel extends VacancyModel {
  @override
  final String companyName;
  @override
  final BuiltList<String> officeVacancies;
  @override
  final BuiltList<String> medicineVacancies;

  factory _$VacancyModel([void Function(VacancyModelBuilder)? updates]) =>
      (new VacancyModelBuilder()..update(updates))._build();

  _$VacancyModel._(
      {required this.companyName,
      required this.officeVacancies,
      required this.medicineVacancies})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        companyName, r'VacancyModel', 'companyName');
    BuiltValueNullFieldError.checkNotNull(
        officeVacancies, r'VacancyModel', 'officeVacancies');
    BuiltValueNullFieldError.checkNotNull(
        medicineVacancies, r'VacancyModel', 'medicineVacancies');
  }

  @override
  VacancyModel rebuild(void Function(VacancyModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VacancyModelBuilder toBuilder() => new VacancyModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VacancyModel &&
        companyName == other.companyName &&
        officeVacancies == other.officeVacancies &&
        medicineVacancies == other.medicineVacancies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, officeVacancies.hashCode);
    _$hash = $jc(_$hash, medicineVacancies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VacancyModel')
          ..add('companyName', companyName)
          ..add('officeVacancies', officeVacancies)
          ..add('medicineVacancies', medicineVacancies))
        .toString();
  }
}

class VacancyModelBuilder
    implements Builder<VacancyModel, VacancyModelBuilder> {
  _$VacancyModel? _$v;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  ListBuilder<String>? _officeVacancies;
  ListBuilder<String> get officeVacancies =>
      _$this._officeVacancies ??= new ListBuilder<String>();
  set officeVacancies(ListBuilder<String>? officeVacancies) =>
      _$this._officeVacancies = officeVacancies;

  ListBuilder<String>? _medicineVacancies;
  ListBuilder<String> get medicineVacancies =>
      _$this._medicineVacancies ??= new ListBuilder<String>();
  set medicineVacancies(ListBuilder<String>? medicineVacancies) =>
      _$this._medicineVacancies = medicineVacancies;

  VacancyModelBuilder();

  VacancyModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyName = $v.companyName;
      _officeVacancies = $v.officeVacancies.toBuilder();
      _medicineVacancies = $v.medicineVacancies.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VacancyModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VacancyModel;
  }

  @override
  void update(void Function(VacancyModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VacancyModel build() => _build();

  _$VacancyModel _build() {
    _$VacancyModel _$result;
    try {
      _$result = _$v ??
          new _$VacancyModel._(
            companyName: BuiltValueNullFieldError.checkNotNull(
                companyName, r'VacancyModel', 'companyName'),
            officeVacancies: officeVacancies.build(),
            medicineVacancies: medicineVacancies.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'officeVacancies';
        officeVacancies.build();
        _$failedField = 'medicineVacancies';
        medicineVacancies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VacancyModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$JobApplicationModel extends JobApplicationModel {
  @override
  final int jodId;
  @override
  final int companyId;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String resume;

  factory _$JobApplicationModel(
          [void Function(JobApplicationModelBuilder)? updates]) =>
      (new JobApplicationModelBuilder()..update(updates))._build();

  _$JobApplicationModel._(
      {required this.jodId,
      required this.companyId,
      required this.firstname,
      required this.lastname,
      required this.resume})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        jodId, r'JobApplicationModel', 'jodId');
    BuiltValueNullFieldError.checkNotNull(
        companyId, r'JobApplicationModel', 'companyId');
    BuiltValueNullFieldError.checkNotNull(
        firstname, r'JobApplicationModel', 'firstname');
    BuiltValueNullFieldError.checkNotNull(
        lastname, r'JobApplicationModel', 'lastname');
    BuiltValueNullFieldError.checkNotNull(
        resume, r'JobApplicationModel', 'resume');
  }

  @override
  JobApplicationModel rebuild(
          void Function(JobApplicationModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobApplicationModelBuilder toBuilder() =>
      new JobApplicationModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobApplicationModel &&
        jodId == other.jodId &&
        companyId == other.companyId &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        resume == other.resume;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, jodId.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, firstname.hashCode);
    _$hash = $jc(_$hash, lastname.hashCode);
    _$hash = $jc(_$hash, resume.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobApplicationModel')
          ..add('jodId', jodId)
          ..add('companyId', companyId)
          ..add('firstname', firstname)
          ..add('lastname', lastname)
          ..add('resume', resume))
        .toString();
  }
}

class JobApplicationModelBuilder
    implements Builder<JobApplicationModel, JobApplicationModelBuilder> {
  _$JobApplicationModel? _$v;

  int? _jodId;
  int? get jodId => _$this._jodId;
  set jodId(int? jodId) => _$this._jodId = jodId;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  String? _firstname;
  String? get firstname => _$this._firstname;
  set firstname(String? firstname) => _$this._firstname = firstname;

  String? _lastname;
  String? get lastname => _$this._lastname;
  set lastname(String? lastname) => _$this._lastname = lastname;

  String? _resume;
  String? get resume => _$this._resume;
  set resume(String? resume) => _$this._resume = resume;

  JobApplicationModelBuilder();

  JobApplicationModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jodId = $v.jodId;
      _companyId = $v.companyId;
      _firstname = $v.firstname;
      _lastname = $v.lastname;
      _resume = $v.resume;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobApplicationModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobApplicationModel;
  }

  @override
  void update(void Function(JobApplicationModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobApplicationModel build() => _build();

  _$JobApplicationModel _build() {
    final _$result = _$v ??
        new _$JobApplicationModel._(
          jodId: BuiltValueNullFieldError.checkNotNull(
              jodId, r'JobApplicationModel', 'jodId'),
          companyId: BuiltValueNullFieldError.checkNotNull(
              companyId, r'JobApplicationModel', 'companyId'),
          firstname: BuiltValueNullFieldError.checkNotNull(
              firstname, r'JobApplicationModel', 'firstname'),
          lastname: BuiltValueNullFieldError.checkNotNull(
              lastname, r'JobApplicationModel', 'lastname'),
          resume: BuiltValueNullFieldError.checkNotNull(
              resume, r'JobApplicationModel', 'resume'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
