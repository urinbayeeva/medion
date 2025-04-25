// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PatientInfo> _$patientInfoSerializer = new _$PatientInfoSerializer();
Serializer<VisitModel> _$visitModelSerializer = new _$VisitModelSerializer();
Serializer<PatientDocuments> _$patientDocumentsSerializer =
    new _$PatientDocumentsSerializer();
Serializer<PatientAnalysis> _$patientAnalysisSerializer =
    new _$PatientAnalysisSerializer();

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
    value = object.patientDebit;
    if (value != null) {
      result
        ..add('patient_debit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.patientDeposit;
    if (value != null) {
      result
        ..add('patient_deposit')
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
        case 'patient_debit':
          result.patientDebit = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'patient_deposit':
          result.patientDeposit = serializers.deserialize(value,
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
    final result = <Object?>[];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorFullName;
    if (value != null) {
      result
        ..add('doctor_full_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorJobName;
    if (value != null) {
      result
        ..add('doctor_job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryName;
    if (value != null) {
      result
        ..add('category_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceName;
    if (value != null) {
      result
        ..add('service_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitDate;
    if (value != null) {
      result
        ..add('visit_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitTime;
    if (value != null) {
      result
        ..add('visit_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitStatus;
    if (value != null) {
      result
        ..add('visit_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weekIndex;
    if (value != null) {
      result
        ..add('week_index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentMethod;
    if (value != null) {
      result
        ..add('payment_method')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentStatus;
    if (value != null) {
      result
        ..add('payment_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.longitude;
    if (value != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.latitude;
    if (value != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
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
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_full_name':
          result.doctorFullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_job_name':
          result.doctorJobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_date':
          result.visitDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_time':
          result.visitTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_status':
          result.visitStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'week_index':
          result.weekIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_method':
          result.paymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_status':
          result.paymentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$PatientDocumentsSerializer
    implements StructuredSerializer<PatientDocuments> {
  @override
  final Iterable<Type> types = const [PatientDocuments, _$PatientDocuments];
  @override
  final String wireName = 'PatientDocuments';

  @override
  Iterable<Object?> serialize(Serializers serializers, PatientDocuments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'emr_docs_lis',
      serializers.serialize(object.lisDocuments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PatientAnalysis)])),
      'emr_docs_fis',
      serializers.serialize(object.fisDocuments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PatientAnalysis)])),
      'emr_docs_ris',
      serializers.serialize(object.risDocuments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PatientAnalysis)])),
      'emr_docs_consultation',
      serializers.serialize(object.consultationDocuments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PatientAnalysis)])),
    ];

    return result;
  }

  @override
  PatientDocuments deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientDocumentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'emr_docs_lis':
          result.lisDocuments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientAnalysis)]))!
              as BuiltList<Object?>);
          break;
        case 'emr_docs_fis':
          result.fisDocuments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientAnalysis)]))!
              as BuiltList<Object?>);
          break;
        case 'emr_docs_ris':
          result.risDocuments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientAnalysis)]))!
              as BuiltList<Object?>);
          break;
        case 'emr_docs_consultation':
          result.consultationDocuments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientAnalysis)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PatientAnalysisSerializer
    implements StructuredSerializer<PatientAnalysis> {
  @override
  final Iterable<Type> types = const [PatientAnalysis, _$PatientAnalysis];
  @override
  final String wireName = 'PatientAnalysis';

  @override
  Iterable<Object?> serialize(Serializers serializers, PatientAnalysis object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.documentName;
    if (value != null) {
      result
        ..add('document_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.documentUrl;
    if (value != null) {
      result
        ..add('document_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PatientAnalysis deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientAnalysisBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'document_name':
          result.documentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'document_url':
          result.documentUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
  @override
  final double? patientDebit;
  @override
  final double? patientDeposit;

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
      this.patientBalance,
      this.patientDebit,
      this.patientDeposit})
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
        patientBalance == other.patientBalance &&
        patientDebit == other.patientDebit &&
        patientDeposit == other.patientDeposit;
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
    _$hash = $jc(_$hash, patientDebit.hashCode);
    _$hash = $jc(_$hash, patientDeposit.hashCode);
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
          ..add('patientBalance', patientBalance)
          ..add('patientDebit', patientDebit)
          ..add('patientDeposit', patientDeposit))
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

  double? _patientDebit;
  double? get patientDebit => _$this._patientDebit;
  set patientDebit(double? patientDebit) => _$this._patientDebit = patientDebit;

  double? _patientDeposit;
  double? get patientDeposit => _$this._patientDeposit;
  set patientDeposit(double? patientDeposit) =>
      _$this._patientDeposit = patientDeposit;

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
      _patientDebit = $v.patientDebit;
      _patientDeposit = $v.patientDeposit;
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
          patientDebit: patientDebit,
          patientDeposit: patientDeposit,
        );
    replace(_$result);
    return _$result;
  }
}

class _$VisitModel extends VisitModel {
  @override
  final String? image;
  @override
  final String? doctorFullName;
  @override
  final String? doctorJobName;
  @override
  final String? categoryName;
  @override
  final String? serviceName;
  @override
  final String? visitDate;
  @override
  final String? visitTime;
  @override
  final String? visitStatus;
  @override
  final int? weekIndex;
  @override
  final String? address;
  @override
  final String? paymentMethod;
  @override
  final String? paymentStatus;
  @override
  final double? longitude;
  @override
  final double? latitude;

  factory _$VisitModel([void Function(VisitModelBuilder)? updates]) =>
      (new VisitModelBuilder()..update(updates))._build();

  _$VisitModel._(
      {this.image,
      this.doctorFullName,
      this.doctorJobName,
      this.categoryName,
      this.serviceName,
      this.visitDate,
      this.visitTime,
      this.visitStatus,
      this.weekIndex,
      this.address,
      this.paymentMethod,
      this.paymentStatus,
      this.longitude,
      this.latitude})
      : super._();

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
        weekIndex == other.weekIndex &&
        address == other.address &&
        paymentMethod == other.paymentMethod &&
        paymentStatus == other.paymentStatus &&
        longitude == other.longitude &&
        latitude == other.latitude;
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
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
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
          ..add('weekIndex', weekIndex)
          ..add('address', address)
          ..add('paymentMethod', paymentMethod)
          ..add('paymentStatus', paymentStatus)
          ..add('longitude', longitude)
          ..add('latitude', latitude))
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

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

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
      _address = $v.address;
      _paymentMethod = $v.paymentMethod;
      _paymentStatus = $v.paymentStatus;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
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
          image: image,
          doctorFullName: doctorFullName,
          doctorJobName: doctorJobName,
          categoryName: categoryName,
          serviceName: serviceName,
          visitDate: visitDate,
          visitTime: visitTime,
          visitStatus: visitStatus,
          weekIndex: weekIndex,
          address: address,
          paymentMethod: paymentMethod,
          paymentStatus: paymentStatus,
          longitude: longitude,
          latitude: latitude,
        );
    replace(_$result);
    return _$result;
  }
}

class _$PatientDocuments extends PatientDocuments {
  @override
  final BuiltList<PatientAnalysis> lisDocuments;
  @override
  final BuiltList<PatientAnalysis> fisDocuments;
  @override
  final BuiltList<PatientAnalysis> risDocuments;
  @override
  final BuiltList<PatientAnalysis> consultationDocuments;

  factory _$PatientDocuments(
          [void Function(PatientDocumentsBuilder)? updates]) =>
      (new PatientDocumentsBuilder()..update(updates))._build();

  _$PatientDocuments._(
      {required this.lisDocuments,
      required this.fisDocuments,
      required this.risDocuments,
      required this.consultationDocuments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        lisDocuments, r'PatientDocuments', 'lisDocuments');
    BuiltValueNullFieldError.checkNotNull(
        fisDocuments, r'PatientDocuments', 'fisDocuments');
    BuiltValueNullFieldError.checkNotNull(
        risDocuments, r'PatientDocuments', 'risDocuments');
    BuiltValueNullFieldError.checkNotNull(
        consultationDocuments, r'PatientDocuments', 'consultationDocuments');
  }

  @override
  PatientDocuments rebuild(void Function(PatientDocumentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientDocumentsBuilder toBuilder() =>
      new PatientDocumentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientDocuments &&
        lisDocuments == other.lisDocuments &&
        fisDocuments == other.fisDocuments &&
        risDocuments == other.risDocuments &&
        consultationDocuments == other.consultationDocuments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, lisDocuments.hashCode);
    _$hash = $jc(_$hash, fisDocuments.hashCode);
    _$hash = $jc(_$hash, risDocuments.hashCode);
    _$hash = $jc(_$hash, consultationDocuments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientDocuments')
          ..add('lisDocuments', lisDocuments)
          ..add('fisDocuments', fisDocuments)
          ..add('risDocuments', risDocuments)
          ..add('consultationDocuments', consultationDocuments))
        .toString();
  }
}

class PatientDocumentsBuilder
    implements Builder<PatientDocuments, PatientDocumentsBuilder> {
  _$PatientDocuments? _$v;

  ListBuilder<PatientAnalysis>? _lisDocuments;
  ListBuilder<PatientAnalysis> get lisDocuments =>
      _$this._lisDocuments ??= new ListBuilder<PatientAnalysis>();
  set lisDocuments(ListBuilder<PatientAnalysis>? lisDocuments) =>
      _$this._lisDocuments = lisDocuments;

  ListBuilder<PatientAnalysis>? _fisDocuments;
  ListBuilder<PatientAnalysis> get fisDocuments =>
      _$this._fisDocuments ??= new ListBuilder<PatientAnalysis>();
  set fisDocuments(ListBuilder<PatientAnalysis>? fisDocuments) =>
      _$this._fisDocuments = fisDocuments;

  ListBuilder<PatientAnalysis>? _risDocuments;
  ListBuilder<PatientAnalysis> get risDocuments =>
      _$this._risDocuments ??= new ListBuilder<PatientAnalysis>();
  set risDocuments(ListBuilder<PatientAnalysis>? risDocuments) =>
      _$this._risDocuments = risDocuments;

  ListBuilder<PatientAnalysis>? _consultationDocuments;
  ListBuilder<PatientAnalysis> get consultationDocuments =>
      _$this._consultationDocuments ??= new ListBuilder<PatientAnalysis>();
  set consultationDocuments(
          ListBuilder<PatientAnalysis>? consultationDocuments) =>
      _$this._consultationDocuments = consultationDocuments;

  PatientDocumentsBuilder();

  PatientDocumentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lisDocuments = $v.lisDocuments.toBuilder();
      _fisDocuments = $v.fisDocuments.toBuilder();
      _risDocuments = $v.risDocuments.toBuilder();
      _consultationDocuments = $v.consultationDocuments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientDocuments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientDocuments;
  }

  @override
  void update(void Function(PatientDocumentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientDocuments build() => _build();

  _$PatientDocuments _build() {
    _$PatientDocuments _$result;
    try {
      _$result = _$v ??
          new _$PatientDocuments._(
            lisDocuments: lisDocuments.build(),
            fisDocuments: fisDocuments.build(),
            risDocuments: risDocuments.build(),
            consultationDocuments: consultationDocuments.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'lisDocuments';
        lisDocuments.build();
        _$failedField = 'fisDocuments';
        fisDocuments.build();
        _$failedField = 'risDocuments';
        risDocuments.build();
        _$failedField = 'consultationDocuments';
        consultationDocuments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PatientDocuments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PatientAnalysis extends PatientAnalysis {
  @override
  final String? documentName;
  @override
  final String? date;
  @override
  final String? documentUrl;

  factory _$PatientAnalysis([void Function(PatientAnalysisBuilder)? updates]) =>
      (new PatientAnalysisBuilder()..update(updates))._build();

  _$PatientAnalysis._({this.documentName, this.date, this.documentUrl})
      : super._();

  @override
  PatientAnalysis rebuild(void Function(PatientAnalysisBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientAnalysisBuilder toBuilder() =>
      new PatientAnalysisBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientAnalysis &&
        documentName == other.documentName &&
        date == other.date &&
        documentUrl == other.documentUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, documentName.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, documentUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientAnalysis')
          ..add('documentName', documentName)
          ..add('date', date)
          ..add('documentUrl', documentUrl))
        .toString();
  }
}

class PatientAnalysisBuilder
    implements Builder<PatientAnalysis, PatientAnalysisBuilder> {
  _$PatientAnalysis? _$v;

  String? _documentName;
  String? get documentName => _$this._documentName;
  set documentName(String? documentName) => _$this._documentName = documentName;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _documentUrl;
  String? get documentUrl => _$this._documentUrl;
  set documentUrl(String? documentUrl) => _$this._documentUrl = documentUrl;

  PatientAnalysisBuilder();

  PatientAnalysisBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _documentName = $v.documentName;
      _date = $v.date;
      _documentUrl = $v.documentUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientAnalysis other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientAnalysis;
  }

  @override
  void update(void Function(PatientAnalysisBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientAnalysis build() => _build();

  _$PatientAnalysis _build() {
    final _$result = _$v ??
        new _$PatientAnalysis._(
          documentName: documentName,
          date: date,
          documentUrl: documentUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
