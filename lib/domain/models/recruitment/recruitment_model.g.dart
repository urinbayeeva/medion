// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VacancyModel> _$vacancyModelSerializer = _$VacancyModelSerializer();
Serializer<VacancyDetailModel> _$vacancyDetailModelSerializer =
    _$VacancyDetailModelSerializer();
Serializer<RequirementsModel> _$requirementsModelSerializer =
    _$RequirementsModelSerializer();
Serializer<JobApplicationModel> _$jobApplicationModelSerializer =
    _$JobApplicationModelSerializer();
Serializer<UploadVacancyModel> _$uploadVacancyModelSerializer =
    _$UploadVacancyModelSerializer();
Serializer<ResultVacancyModel> _$resultVacancyModelSerializer =
    _$ResultVacancyModelSerializer();

class _$VacancyModelSerializer implements StructuredSerializer<VacancyModel> {
  @override
  final Iterable<Type> types = const [VacancyModel, _$VacancyModel];
  @override
  final String wireName = 'VacancyModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, VacancyModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'company_name',
      serializers.serialize(object.companyName,
          specifiedType: const FullType(String)),
      'office_vacancies',
      serializers.serialize(object.officeVacancies,
          specifiedType: const FullType(
              BuiltList, const [const FullType(VacancyDetailModel)])),
      'medicine_vacancies',
      serializers.serialize(object.medicineVacancies,
          specifiedType: const FullType(
              BuiltList, const [const FullType(VacancyDetailModel)])),
      'requirements',
      serializers.serialize(object.requirements,
          specifiedType: const FullType(
              BuiltList, const [const FullType(RequirementsModel)])),
    ];

    return result;
  }

  @override
  VacancyModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = VacancyModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'office_vacancies':
          result.officeVacancies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VacancyDetailModel)]))!
              as BuiltList<Object?>);
          break;
        case 'medicine_vacancies':
          result.medicineVacancies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VacancyDetailModel)]))!
              as BuiltList<Object?>);
          break;
        case 'requirements':
          result.requirements.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RequirementsModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VacancyDetailModelSerializer
    implements StructuredSerializer<VacancyDetailModel> {
  @override
  final Iterable<Type> types = const [VacancyDetailModel, _$VacancyDetailModel];
  @override
  final String wireName = 'VacancyDetailModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VacancyDetailModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VacancyDetailModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = VacancyDetailModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RequirementsModelSerializer
    implements StructuredSerializer<RequirementsModel> {
  @override
  final Iterable<Type> types = const [RequirementsModel, _$RequirementsModel];
  @override
  final String wireName = 'RequirementsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, RequirementsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  RequirementsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RequirementsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$JobApplicationModelSerializer
    implements StructuredSerializer<JobApplicationModel> {
  @override
  final Iterable<Type> types = const [
    JobApplicationModel,
    _$JobApplicationModel
  ];
  @override
  final String wireName = 'JobApplicationModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, JobApplicationModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'required_experience_year',
      serializers.serialize(object.requiredExperienceYear,
          specifiedType: const FullType(int)),
      'latitude',
      serializers.serialize(object.latitude,
          specifiedType: const FullType(double)),
      'longitude',
      serializers.serialize(object.longitude,
          specifiedType: const FullType(double)),
      'salary',
      serializers.serialize(object.salary,
          specifiedType: const FullType(double)),
      'requirements',
      serializers.serialize(object.requirements,
          specifiedType: const FullType(String)),
      'our_offer',
      serializers.serialize(object.ourOffer,
          specifiedType: const FullType(String)),
      'currency',
      serializers.serialize(object.currency,
          specifiedType: const FullType(String)),
      'responsibilities',
      serializers.serialize(object.responsibilities,
          specifiedType: const FullType(String)),
      'work_type',
      serializers.serialize(object.workType,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'skills',
      serializers.serialize(object.skills,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  JobApplicationModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = JobApplicationModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'required_experience_year':
          result.requiredExperienceYear = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'salary':
          result.salary = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'requirements':
          result.requirements = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'our_offer':
          result.ourOffer = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'responsibilities':
          result.responsibilities = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'work_type':
          result.workType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'skills':
          result.skills.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UploadVacancyModelSerializer
    implements StructuredSerializer<UploadVacancyModel> {
  @override
  final Iterable<Type> types = const [UploadVacancyModel, _$UploadVacancyModel];
  @override
  final String wireName = 'UploadVacancyModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UploadVacancyModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'job_id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
      'firstname',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'lastname',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'resume',
      serializers.serialize(object.resume,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UploadVacancyModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UploadVacancyModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'job_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'firstname':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastname':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'resume':
          result.resume = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResultVacancyModelSerializer
    implements StructuredSerializer<ResultVacancyModel> {
  @override
  final Iterable<Type> types = const [ResultVacancyModel, _$ResultVacancyModel];
  @override
  final String wireName = 'ResultVacancyModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResultVacancyModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ResultVacancyModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ResultVacancyModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$VacancyModel extends VacancyModel {
  @override
  final String companyName;
  @override
  final BuiltList<VacancyDetailModel> officeVacancies;
  @override
  final BuiltList<VacancyDetailModel> medicineVacancies;
  @override
  final BuiltList<RequirementsModel> requirements;

  factory _$VacancyModel([void Function(VacancyModelBuilder)? updates]) =>
      (VacancyModelBuilder()..update(updates))._build();

  _$VacancyModel._(
      {required this.companyName,
      required this.officeVacancies,
      required this.medicineVacancies,
      required this.requirements})
      : super._();
  @override
  VacancyModel rebuild(void Function(VacancyModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VacancyModelBuilder toBuilder() => VacancyModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VacancyModel &&
        companyName == other.companyName &&
        officeVacancies == other.officeVacancies &&
        medicineVacancies == other.medicineVacancies &&
        requirements == other.requirements;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, officeVacancies.hashCode);
    _$hash = $jc(_$hash, medicineVacancies.hashCode);
    _$hash = $jc(_$hash, requirements.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VacancyModel')
          ..add('companyName', companyName)
          ..add('officeVacancies', officeVacancies)
          ..add('medicineVacancies', medicineVacancies)
          ..add('requirements', requirements))
        .toString();
  }
}

class VacancyModelBuilder
    implements Builder<VacancyModel, VacancyModelBuilder> {
  _$VacancyModel? _$v;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  ListBuilder<VacancyDetailModel>? _officeVacancies;
  ListBuilder<VacancyDetailModel> get officeVacancies =>
      _$this._officeVacancies ??= ListBuilder<VacancyDetailModel>();
  set officeVacancies(ListBuilder<VacancyDetailModel>? officeVacancies) =>
      _$this._officeVacancies = officeVacancies;

  ListBuilder<VacancyDetailModel>? _medicineVacancies;
  ListBuilder<VacancyDetailModel> get medicineVacancies =>
      _$this._medicineVacancies ??= ListBuilder<VacancyDetailModel>();
  set medicineVacancies(ListBuilder<VacancyDetailModel>? medicineVacancies) =>
      _$this._medicineVacancies = medicineVacancies;

  ListBuilder<RequirementsModel>? _requirements;
  ListBuilder<RequirementsModel> get requirements =>
      _$this._requirements ??= ListBuilder<RequirementsModel>();
  set requirements(ListBuilder<RequirementsModel>? requirements) =>
      _$this._requirements = requirements;

  VacancyModelBuilder();

  VacancyModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyName = $v.companyName;
      _officeVacancies = $v.officeVacancies.toBuilder();
      _medicineVacancies = $v.medicineVacancies.toBuilder();
      _requirements = $v.requirements.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VacancyModel other) {
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
          _$VacancyModel._(
            companyName: BuiltValueNullFieldError.checkNotNull(
                companyName, r'VacancyModel', 'companyName'),
            officeVacancies: officeVacancies.build(),
            medicineVacancies: medicineVacancies.build(),
            requirements: requirements.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'officeVacancies';
        officeVacancies.build();
        _$failedField = 'medicineVacancies';
        medicineVacancies.build();
        _$failedField = 'requirements';
        requirements.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VacancyModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VacancyDetailModel extends VacancyDetailModel {
  @override
  final int id;
  @override
  final int companyId;
  @override
  final String name;
  @override
  final String description;

  factory _$VacancyDetailModel(
          [void Function(VacancyDetailModelBuilder)? updates]) =>
      (VacancyDetailModelBuilder()..update(updates))._build();

  _$VacancyDetailModel._(
      {required this.id,
      required this.companyId,
      required this.name,
      required this.description})
      : super._();
  @override
  VacancyDetailModel rebuild(
          void Function(VacancyDetailModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VacancyDetailModelBuilder toBuilder() =>
      VacancyDetailModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VacancyDetailModel &&
        id == other.id &&
        companyId == other.companyId &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VacancyDetailModel')
          ..add('id', id)
          ..add('companyId', companyId)
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class VacancyDetailModelBuilder
    implements Builder<VacancyDetailModel, VacancyDetailModelBuilder> {
  _$VacancyDetailModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  VacancyDetailModelBuilder();

  VacancyDetailModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _companyId = $v.companyId;
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VacancyDetailModel other) {
    _$v = other as _$VacancyDetailModel;
  }

  @override
  void update(void Function(VacancyDetailModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VacancyDetailModel build() => _build();

  _$VacancyDetailModel _build() {
    final _$result = _$v ??
        _$VacancyDetailModel._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'VacancyDetailModel', 'id'),
          companyId: BuiltValueNullFieldError.checkNotNull(
              companyId, r'VacancyDetailModel', 'companyId'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'VacancyDetailModel', 'name'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'VacancyDetailModel', 'description'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$RequirementsModel extends RequirementsModel {
  @override
  final String title;
  @override
  final String icon;

  factory _$RequirementsModel(
          [void Function(RequirementsModelBuilder)? updates]) =>
      (RequirementsModelBuilder()..update(updates))._build();

  _$RequirementsModel._({required this.title, required this.icon}) : super._();
  @override
  RequirementsModel rebuild(void Function(RequirementsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequirementsModelBuilder toBuilder() =>
      RequirementsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequirementsModel &&
        title == other.title &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RequirementsModel')
          ..add('title', title)
          ..add('icon', icon))
        .toString();
  }
}

class RequirementsModelBuilder
    implements Builder<RequirementsModel, RequirementsModelBuilder> {
  _$RequirementsModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  RequirementsModelBuilder();

  RequirementsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequirementsModel other) {
    _$v = other as _$RequirementsModel;
  }

  @override
  void update(void Function(RequirementsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RequirementsModel build() => _build();

  _$RequirementsModel _build() {
    final _$result = _$v ??
        _$RequirementsModel._(
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'RequirementsModel', 'title'),
          icon: BuiltValueNullFieldError.checkNotNull(
              icon, r'RequirementsModel', 'icon'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$JobApplicationModel extends JobApplicationModel {
  @override
  final int companyId;
  @override
  final int id;
  @override
  final int requiredExperienceYear;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double salary;
  @override
  final String requirements;
  @override
  final String ourOffer;
  @override
  final String currency;
  @override
  final String responsibilities;
  @override
  final String workType;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;
  @override
  final BuiltList<String> skills;

  factory _$JobApplicationModel(
          [void Function(JobApplicationModelBuilder)? updates]) =>
      (JobApplicationModelBuilder()..update(updates))._build();

  _$JobApplicationModel._(
      {required this.companyId,
      required this.id,
      required this.requiredExperienceYear,
      required this.latitude,
      required this.longitude,
      required this.salary,
      required this.requirements,
      required this.ourOffer,
      required this.currency,
      required this.responsibilities,
      required this.workType,
      required this.name,
      required this.phone,
      required this.email,
      required this.skills})
      : super._();
  @override
  JobApplicationModel rebuild(
          void Function(JobApplicationModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobApplicationModelBuilder toBuilder() =>
      JobApplicationModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobApplicationModel &&
        companyId == other.companyId &&
        id == other.id &&
        requiredExperienceYear == other.requiredExperienceYear &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        salary == other.salary &&
        requirements == other.requirements &&
        ourOffer == other.ourOffer &&
        currency == other.currency &&
        responsibilities == other.responsibilities &&
        workType == other.workType &&
        name == other.name &&
        phone == other.phone &&
        email == other.email &&
        skills == other.skills;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, requiredExperienceYear.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, salary.hashCode);
    _$hash = $jc(_$hash, requirements.hashCode);
    _$hash = $jc(_$hash, ourOffer.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, responsibilities.hashCode);
    _$hash = $jc(_$hash, workType.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, skills.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobApplicationModel')
          ..add('companyId', companyId)
          ..add('id', id)
          ..add('requiredExperienceYear', requiredExperienceYear)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('salary', salary)
          ..add('requirements', requirements)
          ..add('ourOffer', ourOffer)
          ..add('currency', currency)
          ..add('responsibilities', responsibilities)
          ..add('workType', workType)
          ..add('name', name)
          ..add('phone', phone)
          ..add('email', email)
          ..add('skills', skills))
        .toString();
  }
}

class JobApplicationModelBuilder
    implements Builder<JobApplicationModel, JobApplicationModelBuilder> {
  _$JobApplicationModel? _$v;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _requiredExperienceYear;
  int? get requiredExperienceYear => _$this._requiredExperienceYear;
  set requiredExperienceYear(int? requiredExperienceYear) =>
      _$this._requiredExperienceYear = requiredExperienceYear;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _salary;
  double? get salary => _$this._salary;
  set salary(double? salary) => _$this._salary = salary;

  String? _requirements;
  String? get requirements => _$this._requirements;
  set requirements(String? requirements) => _$this._requirements = requirements;

  String? _ourOffer;
  String? get ourOffer => _$this._ourOffer;
  set ourOffer(String? ourOffer) => _$this._ourOffer = ourOffer;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  String? _responsibilities;
  String? get responsibilities => _$this._responsibilities;
  set responsibilities(String? responsibilities) =>
      _$this._responsibilities = responsibilities;

  String? _workType;
  String? get workType => _$this._workType;
  set workType(String? workType) => _$this._workType = workType;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  ListBuilder<String>? _skills;
  ListBuilder<String> get skills => _$this._skills ??= ListBuilder<String>();
  set skills(ListBuilder<String>? skills) => _$this._skills = skills;

  JobApplicationModelBuilder();

  JobApplicationModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyId = $v.companyId;
      _id = $v.id;
      _requiredExperienceYear = $v.requiredExperienceYear;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _salary = $v.salary;
      _requirements = $v.requirements;
      _ourOffer = $v.ourOffer;
      _currency = $v.currency;
      _responsibilities = $v.responsibilities;
      _workType = $v.workType;
      _name = $v.name;
      _phone = $v.phone;
      _email = $v.email;
      _skills = $v.skills.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobApplicationModel other) {
    _$v = other as _$JobApplicationModel;
  }

  @override
  void update(void Function(JobApplicationModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobApplicationModel build() => _build();

  _$JobApplicationModel _build() {
    _$JobApplicationModel _$result;
    try {
      _$result = _$v ??
          _$JobApplicationModel._(
            companyId: BuiltValueNullFieldError.checkNotNull(
                companyId, r'JobApplicationModel', 'companyId'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'JobApplicationModel', 'id'),
            requiredExperienceYear: BuiltValueNullFieldError.checkNotNull(
                requiredExperienceYear,
                r'JobApplicationModel',
                'requiredExperienceYear'),
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, r'JobApplicationModel', 'latitude'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, r'JobApplicationModel', 'longitude'),
            salary: BuiltValueNullFieldError.checkNotNull(
                salary, r'JobApplicationModel', 'salary'),
            requirements: BuiltValueNullFieldError.checkNotNull(
                requirements, r'JobApplicationModel', 'requirements'),
            ourOffer: BuiltValueNullFieldError.checkNotNull(
                ourOffer, r'JobApplicationModel', 'ourOffer'),
            currency: BuiltValueNullFieldError.checkNotNull(
                currency, r'JobApplicationModel', 'currency'),
            responsibilities: BuiltValueNullFieldError.checkNotNull(
                responsibilities, r'JobApplicationModel', 'responsibilities'),
            workType: BuiltValueNullFieldError.checkNotNull(
                workType, r'JobApplicationModel', 'workType'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'JobApplicationModel', 'name'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'JobApplicationModel', 'phone'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'JobApplicationModel', 'email'),
            skills: skills.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skills';
        skills.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'JobApplicationModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UploadVacancyModel extends UploadVacancyModel {
  @override
  final int id;
  @override
  final int companyId;
  @override
  final String name;
  @override
  final String lastName;
  @override
  final String resume;
  @override
  final String phone;

  factory _$UploadVacancyModel(
          [void Function(UploadVacancyModelBuilder)? updates]) =>
      (UploadVacancyModelBuilder()..update(updates))._build();

  _$UploadVacancyModel._(
      {required this.id,
      required this.companyId,
      required this.name,
      required this.lastName,
      required this.resume,
      required this.phone})
      : super._();
  @override
  UploadVacancyModel rebuild(
          void Function(UploadVacancyModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadVacancyModelBuilder toBuilder() =>
      UploadVacancyModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadVacancyModel &&
        id == other.id &&
        companyId == other.companyId &&
        name == other.name &&
        lastName == other.lastName &&
        resume == other.resume &&
        phone == other.phone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, resume.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadVacancyModel')
          ..add('id', id)
          ..add('companyId', companyId)
          ..add('name', name)
          ..add('lastName', lastName)
          ..add('resume', resume)
          ..add('phone', phone))
        .toString();
  }
}

class UploadVacancyModelBuilder
    implements Builder<UploadVacancyModel, UploadVacancyModelBuilder> {
  _$UploadVacancyModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _resume;
  String? get resume => _$this._resume;
  set resume(String? resume) => _$this._resume = resume;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  UploadVacancyModelBuilder();

  UploadVacancyModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _companyId = $v.companyId;
      _name = $v.name;
      _lastName = $v.lastName;
      _resume = $v.resume;
      _phone = $v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadVacancyModel other) {
    _$v = other as _$UploadVacancyModel;
  }

  @override
  void update(void Function(UploadVacancyModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadVacancyModel build() => _build();

  _$UploadVacancyModel _build() {
    final _$result = _$v ??
        _$UploadVacancyModel._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'UploadVacancyModel', 'id'),
          companyId: BuiltValueNullFieldError.checkNotNull(
              companyId, r'UploadVacancyModel', 'companyId'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'UploadVacancyModel', 'name'),
          lastName: BuiltValueNullFieldError.checkNotNull(
              lastName, r'UploadVacancyModel', 'lastName'),
          resume: BuiltValueNullFieldError.checkNotNull(
              resume, r'UploadVacancyModel', 'resume'),
          phone: BuiltValueNullFieldError.checkNotNull(
              phone, r'UploadVacancyModel', 'phone'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ResultVacancyModel extends ResultVacancyModel {
  @override
  final String? status;
  @override
  final String? message;

  factory _$ResultVacancyModel(
          [void Function(ResultVacancyModelBuilder)? updates]) =>
      (ResultVacancyModelBuilder()..update(updates))._build();

  _$ResultVacancyModel._({this.status, this.message}) : super._();
  @override
  ResultVacancyModel rebuild(
          void Function(ResultVacancyModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultVacancyModelBuilder toBuilder() =>
      ResultVacancyModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResultVacancyModel &&
        status == other.status &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResultVacancyModel')
          ..add('status', status)
          ..add('message', message))
        .toString();
  }
}

class ResultVacancyModelBuilder
    implements Builder<ResultVacancyModel, ResultVacancyModelBuilder> {
  _$ResultVacancyModel? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ResultVacancyModelBuilder();

  ResultVacancyModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResultVacancyModel other) {
    _$v = other as _$ResultVacancyModel;
  }

  @override
  void update(void Function(ResultVacancyModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResultVacancyModel build() => _build();

  _$ResultVacancyModel _build() {
    final _$result = _$v ??
        _$ResultVacancyModel._(
          status: status,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
