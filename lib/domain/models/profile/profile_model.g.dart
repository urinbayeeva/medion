// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PatientInfo> _$patientInfoSerializer = new _$PatientInfoSerializer();
Serializer<VisitModel> _$visitModelSerializer = new _$VisitModelSerializer();

class _$PatientInfoSerializer implements StructuredSerializer<PatientInfo> {
  @override
  final Iterable<Type> types = const [PatientInfo, _$PatientInfo];
  @override
  final String wireName = 'PatientInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, PatientInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.patientId;
    if (value != null) {
      result
        ..add('patient_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.passport;
    if (value != null) {
      result
        ..add('passport')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateOfBirth;
    if (value != null) {
      result
        ..add('date_of_birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.patientBalance;
    if (value != null) {
      result
        ..add('patient_balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  PatientInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastname':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firstname':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patient_id':
          result.patientId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'passport':
          result.passport = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_of_birth':
          result.dateOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patient_balance':
          result.patientBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$VisitModelSerializer implements StructuredSerializer<VisitModel> {
  @override
  final Iterable<Type> types = const [VisitModel, _$VisitModel];
  @override
  final String wireName = 'VisitModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisitModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'doctor_full_name',
      serializers.serialize(object.doctorFullName,
          specifiedType: const FullType(String)),
      'doctor_job_name',
      serializers.serialize(object.doctorJobName,
          specifiedType: const FullType(String)),
      'category_name',
      serializers.serialize(object.categoryName,
          specifiedType: const FullType(String)),
      'service_name',
      serializers.serialize(object.serviceName,
          specifiedType: const FullType(String)),
      'visit_date',
      serializers.serialize(object.visitDate,
          specifiedType: const FullType(String)),
      'visit_time',
      serializers.serialize(object.visitTime,
          specifiedType: const FullType(String)),
      'visit_status',
      serializers.serialize(object.visitStatus,
          specifiedType: const FullType(String)),
      'week_index',
      serializers.serialize(object.weekIndex,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  VisitModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_full_name':
          result.doctorFullName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_job_name':
          result.doctorJobName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'visit_date':
          result.visitDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'visit_time':
          result.visitTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'visit_status':
          result.visitStatus = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'week_index':
          result.weekIndex = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PatientInfo extends PatientInfo {
  @override
  final String? image;
  @override
  final String? lastName;
  @override
  final String? firstName;
  @override
  final int? patientId;
  @override
  final String? passport;
  @override
  final String? phone;
  @override
  final String? dateOfBirth;
  @override
  final String? phoneNumber;
  @override
  final double? patientBalance;

  factory _$PatientInfo([void Function(PatientInfoBuilder)? updates]) =>
      (new PatientInfoBuilder()..update(updates))._build();

  _$PatientInfo._(
      {this.image,
      this.lastName,
      this.firstName,
      this.patientId,
      this.passport,
      this.phone,
      this.dateOfBirth,
      this.phoneNumber,
      this.patientBalance})
      : super._();

  @override
  PatientInfo rebuild(void Function(PatientInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientInfoBuilder toBuilder() => new PatientInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientInfo &&
        image == other.image &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        patientId == other.patientId &&
        passport == other.passport &&
        phone == other.phone &&
        dateOfBirth == other.dateOfBirth &&
        phoneNumber == other.phoneNumber &&
        patientBalance == other.patientBalance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, passport.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, patientBalance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientInfo')
          ..add('image', image)
          ..add('lastName', lastName)
          ..add('firstName', firstName)
          ..add('patientId', patientId)
          ..add('passport', passport)
          ..add('phone', phone)
          ..add('dateOfBirth', dateOfBirth)
          ..add('phoneNumber', phoneNumber)
          ..add('patientBalance', patientBalance))
        .toString();
  }
}

class PatientInfoBuilder implements Builder<PatientInfo, PatientInfoBuilder> {
  _$PatientInfo? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  int? _patientId;
  int? get patientId => _$this._patientId;
  set patientId(int? patientId) => _$this._patientId = patientId;

  String? _passport;
  String? get passport => _$this._passport;
  set passport(String? passport) => _$this._passport = passport;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _dateOfBirth;
  String? get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(String? dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  double? _patientBalance;
  double? get patientBalance => _$this._patientBalance;
  set patientBalance(double? patientBalance) =>
      _$this._patientBalance = patientBalance;

  PatientInfoBuilder();

  PatientInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _lastName = $v.lastName;
      _firstName = $v.firstName;
      _patientId = $v.patientId;
      _passport = $v.passport;
      _phone = $v.phone;
      _dateOfBirth = $v.dateOfBirth;
      _phoneNumber = $v.phoneNumber;
      _patientBalance = $v.patientBalance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientInfo;
  }

  @override
  void update(void Function(PatientInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientInfo build() => _build();

  _$PatientInfo _build() {
    final _$result = _$v ??
        new _$PatientInfo._(
          image: image,
          lastName: lastName,
          firstName: firstName,
          patientId: patientId,
          passport: passport,
          phone: phone,
          dateOfBirth: dateOfBirth,
          phoneNumber: phoneNumber,
          patientBalance: patientBalance,
        );
    replace(_$result);
    return _$result;
  }
}

class _$VisitModel extends VisitModel {
  @override
  final String image;
  @override
  final String doctorFullName;
  @override
  final String doctorJobName;
  @override
  final String categoryName;
  @override
  final String serviceName;
  @override
  final String visitDate;
  @override
  final String visitTime;
  @override
  final String visitStatus;
  @override
  final int weekIndex;

  factory _$VisitModel([void Function(VisitModelBuilder)? updates]) =>
      (new VisitModelBuilder()..update(updates))._build();

  _$VisitModel._(
      {required this.image,
      required this.doctorFullName,
      required this.doctorJobName,
      required this.categoryName,
      required this.serviceName,
      required this.visitDate,
      required this.visitTime,
      required this.visitStatus,
      required this.weekIndex})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(image, r'VisitModel', 'image');
    BuiltValueNullFieldError.checkNotNull(
        doctorFullName, r'VisitModel', 'doctorFullName');
    BuiltValueNullFieldError.checkNotNull(
        doctorJobName, r'VisitModel', 'doctorJobName');
    BuiltValueNullFieldError.checkNotNull(
        categoryName, r'VisitModel', 'categoryName');
    BuiltValueNullFieldError.checkNotNull(
        serviceName, r'VisitModel', 'serviceName');
    BuiltValueNullFieldError.checkNotNull(
        visitDate, r'VisitModel', 'visitDate');
    BuiltValueNullFieldError.checkNotNull(
        visitTime, r'VisitModel', 'visitTime');
    BuiltValueNullFieldError.checkNotNull(
        visitStatus, r'VisitModel', 'visitStatus');
    BuiltValueNullFieldError.checkNotNull(
        weekIndex, r'VisitModel', 'weekIndex');
  }

  @override
  VisitModel rebuild(void Function(VisitModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitModelBuilder toBuilder() => new VisitModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisitModel &&
        image == other.image &&
        doctorFullName == other.doctorFullName &&
        doctorJobName == other.doctorJobName &&
        categoryName == other.categoryName &&
        serviceName == other.serviceName &&
        visitDate == other.visitDate &&
        visitTime == other.visitTime &&
        visitStatus == other.visitStatus &&
        weekIndex == other.weekIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, doctorFullName.hashCode);
    _$hash = $jc(_$hash, doctorJobName.hashCode);
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, visitDate.hashCode);
    _$hash = $jc(_$hash, visitTime.hashCode);
    _$hash = $jc(_$hash, visitStatus.hashCode);
    _$hash = $jc(_$hash, weekIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitModel')
          ..add('image', image)
          ..add('doctorFullName', doctorFullName)
          ..add('doctorJobName', doctorJobName)
          ..add('categoryName', categoryName)
          ..add('serviceName', serviceName)
          ..add('visitDate', visitDate)
          ..add('visitTime', visitTime)
          ..add('visitStatus', visitStatus)
          ..add('weekIndex', weekIndex))
        .toString();
  }
}

class VisitModelBuilder implements Builder<VisitModel, VisitModelBuilder> {
  _$VisitModel? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _doctorFullName;
  String? get doctorFullName => _$this._doctorFullName;
  set doctorFullName(String? doctorFullName) =>
      _$this._doctorFullName = doctorFullName;

  String? _doctorJobName;
  String? get doctorJobName => _$this._doctorJobName;
  set doctorJobName(String? doctorJobName) =>
      _$this._doctorJobName = doctorJobName;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _visitDate;
  String? get visitDate => _$this._visitDate;
  set visitDate(String? visitDate) => _$this._visitDate = visitDate;

  String? _visitTime;
  String? get visitTime => _$this._visitTime;
  set visitTime(String? visitTime) => _$this._visitTime = visitTime;

  String? _visitStatus;
  String? get visitStatus => _$this._visitStatus;
  set visitStatus(String? visitStatus) => _$this._visitStatus = visitStatus;

  int? _weekIndex;
  int? get weekIndex => _$this._weekIndex;
  set weekIndex(int? weekIndex) => _$this._weekIndex = weekIndex;

  VisitModelBuilder();

  VisitModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _doctorFullName = $v.doctorFullName;
      _doctorJobName = $v.doctorJobName;
      _categoryName = $v.categoryName;
      _serviceName = $v.serviceName;
      _visitDate = $v.visitDate;
      _visitTime = $v.visitTime;
      _visitStatus = $v.visitStatus;
      _weekIndex = $v.weekIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisitModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VisitModel;
  }

  @override
  void update(void Function(VisitModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisitModel build() => _build();

  _$VisitModel _build() {
    final _$result = _$v ??
        new _$VisitModel._(
          image: BuiltValueNullFieldError.checkNotNull(
              image, r'VisitModel', 'image'),
          doctorFullName: BuiltValueNullFieldError.checkNotNull(
              doctorFullName, r'VisitModel', 'doctorFullName'),
          doctorJobName: BuiltValueNullFieldError.checkNotNull(
              doctorJobName, r'VisitModel', 'doctorJobName'),
          categoryName: BuiltValueNullFieldError.checkNotNull(
              categoryName, r'VisitModel', 'categoryName'),
          serviceName: BuiltValueNullFieldError.checkNotNull(
              serviceName, r'VisitModel', 'serviceName'),
          visitDate: BuiltValueNullFieldError.checkNotNull(
              visitDate, r'VisitModel', 'visitDate'),
          visitTime: BuiltValueNullFieldError.checkNotNull(
              visitTime, r'VisitModel', 'visitTime'),
          visitStatus: BuiltValueNullFieldError.checkNotNull(
              visitStatus, r'VisitModel', 'visitStatus'),
          weekIndex: BuiltValueNullFieldError.checkNotNull(
              weekIndex, r'VisitModel', 'weekIndex'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
