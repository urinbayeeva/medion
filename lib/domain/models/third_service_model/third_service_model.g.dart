// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_service_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoctorsRequest> _$doctorsRequestSerializer =
    _$DoctorsRequestSerializer();
Serializer<ThirdBookingServiceModel> _$thirdBookingServiceModelSerializer =
    _$ThirdBookingServiceModelSerializer();
Serializer<ThirdBookingService> _$thirdBookingServiceSerializer =
    _$ThirdBookingServiceSerializer();
Serializer<ServiceNameDetail> _$serviceNameDetailSerializer =
    _$ServiceNameDetailSerializer();
Serializer<ThirdBookingCompany> _$thirdBookingCompanySerializer =
    _$ThirdBookingCompanySerializer();
Serializer<ThirdBookingDoctor> _$thirdBookingDoctorSerializer =
    _$ThirdBookingDoctorSerializer();
Serializer<ThirdBookingDoctorSchedule> _$thirdBookingDoctorScheduleSerializer =
    _$ThirdBookingDoctorScheduleSerializer();
Serializer<ScheduleDetail> _$scheduleDetailSerializer =
    _$ScheduleDetailSerializer();

class _$DoctorsRequestSerializer
    implements StructuredSerializer<DoctorsRequest> {
  @override
  final Iterable<Type> types = const [DoctorsRequest, _$DoctorsRequest];
  @override
  final String wireName = 'DoctorsRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorsRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.serviceIds;
    if (value != null) {
      result
        ..add('service_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.doctorId;
    if (value != null) {
      result
        ..add('doctor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isMobile;
    if (value != null) {
      result
        ..add('is_mobile')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  DoctorsRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorsRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'service_ids':
          result.serviceIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_mobile':
          result.isMobile = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$ThirdBookingServiceModelSerializer
    implements StructuredSerializer<ThirdBookingServiceModel> {
  @override
  final Iterable<Type> types = const [
    ThirdBookingServiceModel,
    _$ThirdBookingServiceModel
  ];
  @override
  final String wireName = 'ThirdBookingServiceModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ThirdBookingServiceModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.services;
    if (value != null) {
      result
        ..add('services')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ThirdBookingService)])));
    }
    return result;
  }

  @override
  ThirdBookingServiceModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThirdBookingServiceModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ThirdBookingService)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ThirdBookingServiceSerializer
    implements StructuredSerializer<ThirdBookingService> {
  @override
  final Iterable<Type> types = const [
    ThirdBookingService,
    _$ThirdBookingService
  ];
  @override
  final String wireName = 'ThirdBookingService';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ThirdBookingService object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.serviceId;
    if (value != null) {
      result
        ..add('service_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.serviceName;
    if (value != null) {
      result
        ..add('service_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceType;
    if (value != null) {
      result
        ..add('service_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companies;
    if (value != null) {
      result
        ..add('companies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ThirdBookingCompany)])));
    }
    value = object.serviceNames;
    if (value != null) {
      result
        ..add('service_names')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ServiceNameDetail)])));
    }
    return result;
  }

  @override
  ThirdBookingService deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThirdBookingServiceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'service_id':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_type':
          result.serviceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'companies':
          result.companies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ThirdBookingCompany)]))!
              as BuiltList<Object?>);
          break;
        case 'service_names':
          result.serviceNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ServiceNameDetail)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ServiceNameDetailSerializer
    implements StructuredSerializer<ServiceNameDetail> {
  @override
  final Iterable<Type> types = const [ServiceNameDetail, _$ServiceNameDetail];
  @override
  final String wireName = 'ServiceNameDetail';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServiceNameDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ServiceNameDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ServiceNameDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ThirdBookingCompanySerializer
    implements StructuredSerializer<ThirdBookingCompany> {
  @override
  final Iterable<Type> types = const [
    ThirdBookingCompany,
    _$ThirdBookingCompany
  ];
  @override
  final String wireName = 'ThirdBookingCompany';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ThirdBookingCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.companyId;
    if (value != null) {
      result
        ..add('company_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyLocation;
    if (value != null) {
      result
        ..add('company_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctors;
    if (value != null) {
      result
        ..add('doctors')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ThirdBookingDoctor)])));
    }
    return result;
  }

  @override
  ThirdBookingCompany deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThirdBookingCompanyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_location':
          result.companyLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctors':
          result.doctors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ThirdBookingDoctor)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ThirdBookingDoctorSerializer
    implements StructuredSerializer<ThirdBookingDoctor> {
  @override
  final Iterable<Type> types = const [ThirdBookingDoctor, _$ThirdBookingDoctor];
  @override
  final String wireName = 'ThirdBookingDoctor';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ThirdBookingDoctor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.doctorId;
    if (value != null) {
      result
        ..add('doctor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.doctorName;
    if (value != null) {
      result
        ..add('doctor_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorGender;
    if (value != null) {
      result
        ..add('doctor_gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorImage;
    if (value != null) {
      result
        ..add('doctor_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorSpecialty;
    if (value != null) {
      result
        ..add('doctor_specialty')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorLocation;
    if (value != null) {
      result
        ..add('doctor_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorExperience;
    if (value != null) {
      result
        ..add('doctor_experience')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.doctorPrice;
    if (value != null) {
      result
        ..add('doctor_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.schedules;
    if (value != null) {
      result
        ..add('schedules')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(ThirdBookingDoctorSchedule)])));
    }
    return result;
  }

  @override
  ThirdBookingDoctor deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThirdBookingDoctorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'doctor_name':
          result.doctorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_gender':
          result.doctorGender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_image':
          result.doctorImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_specialty':
          result.doctorSpecialty = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_location':
          result.doctorLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_experience':
          result.doctorExperience = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'doctor_price':
          result.doctorPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'schedules':
          result.schedules.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(ThirdBookingDoctorSchedule)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ThirdBookingDoctorScheduleSerializer
    implements StructuredSerializer<ThirdBookingDoctorSchedule> {
  @override
  final Iterable<Type> types = const [
    ThirdBookingDoctorSchedule,
    _$ThirdBookingDoctorSchedule
  ];
  @override
  final String wireName = 'ThirdBookingDoctorSchedule';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ThirdBookingDoctorSchedule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.scheduleList;
    if (value != null) {
      result
        ..add('schedule')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ScheduleDetail)])));
    }
    return result;
  }

  @override
  ThirdBookingDoctorSchedule deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThirdBookingDoctorScheduleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'schedule':
          result.scheduleList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleDetail)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ScheduleDetailSerializer
    implements StructuredSerializer<ScheduleDetail> {
  @override
  final Iterable<Type> types = const [ScheduleDetail, _$ScheduleDetail];
  @override
  final String wireName = 'ScheduleDetail';

  @override
  Iterable<Object?> serialize(Serializers serializers, ScheduleDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  ScheduleDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ScheduleDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorsRequest extends DoctorsRequest {
  @override
  final BuiltList<int>? serviceIds;
  @override
  final int? doctorId;
  @override
  final bool? isMobile;

  factory _$DoctorsRequest([void Function(DoctorsRequestBuilder)? updates]) =>
      (DoctorsRequestBuilder()..update(updates))._build();

  _$DoctorsRequest._({this.serviceIds, this.doctorId, this.isMobile})
      : super._();
  @override
  DoctorsRequest rebuild(void Function(DoctorsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorsRequestBuilder toBuilder() => DoctorsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorsRequest &&
        serviceIds == other.serviceIds &&
        doctorId == other.doctorId &&
        isMobile == other.isMobile;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceIds.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, isMobile.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorsRequest')
          ..add('serviceIds', serviceIds)
          ..add('doctorId', doctorId)
          ..add('isMobile', isMobile))
        .toString();
  }
}

class DoctorsRequestBuilder
    implements Builder<DoctorsRequest, DoctorsRequestBuilder> {
  _$DoctorsRequest? _$v;

  ListBuilder<int>? _serviceIds;
  ListBuilder<int> get serviceIds => _$this._serviceIds ??= ListBuilder<int>();
  set serviceIds(ListBuilder<int>? serviceIds) =>
      _$this._serviceIds = serviceIds;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  bool? _isMobile;
  bool? get isMobile => _$this._isMobile;
  set isMobile(bool? isMobile) => _$this._isMobile = isMobile;

  DoctorsRequestBuilder();

  DoctorsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceIds = $v.serviceIds?.toBuilder();
      _doctorId = $v.doctorId;
      _isMobile = $v.isMobile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorsRequest other) {
    _$v = other as _$DoctorsRequest;
  }

  @override
  void update(void Function(DoctorsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorsRequest build() => _build();

  _$DoctorsRequest _build() {
    _$DoctorsRequest _$result;
    try {
      _$result = _$v ??
          _$DoctorsRequest._(
            serviceIds: _serviceIds?.build(),
            doctorId: doctorId,
            isMobile: isMobile,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'serviceIds';
        _serviceIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DoctorsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThirdBookingServiceModel extends ThirdBookingServiceModel {
  @override
  final BuiltList<ThirdBookingService>? services;

  factory _$ThirdBookingServiceModel(
          [void Function(ThirdBookingServiceModelBuilder)? updates]) =>
      (ThirdBookingServiceModelBuilder()..update(updates))._build();

  _$ThirdBookingServiceModel._({this.services}) : super._();
  @override
  ThirdBookingServiceModel rebuild(
          void Function(ThirdBookingServiceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingServiceModelBuilder toBuilder() =>
      ThirdBookingServiceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdBookingServiceModel && services == other.services;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdBookingServiceModel')
          ..add('services', services))
        .toString();
  }
}

class ThirdBookingServiceModelBuilder
    implements
        Builder<ThirdBookingServiceModel, ThirdBookingServiceModelBuilder> {
  _$ThirdBookingServiceModel? _$v;

  ListBuilder<ThirdBookingService>? _services;
  ListBuilder<ThirdBookingService> get services =>
      _$this._services ??= ListBuilder<ThirdBookingService>();
  set services(ListBuilder<ThirdBookingService>? services) =>
      _$this._services = services;

  ThirdBookingServiceModelBuilder();

  ThirdBookingServiceModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _services = $v.services?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdBookingServiceModel other) {
    _$v = other as _$ThirdBookingServiceModel;
  }

  @override
  void update(void Function(ThirdBookingServiceModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThirdBookingServiceModel build() => _build();

  _$ThirdBookingServiceModel _build() {
    _$ThirdBookingServiceModel _$result;
    try {
      _$result = _$v ??
          _$ThirdBookingServiceModel._(
            services: _services?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        _services?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThirdBookingServiceModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThirdBookingService extends ThirdBookingService {
  @override
  final int? serviceId;
  @override
  final String? serviceName;
  @override
  final String? serviceType;
  @override
  final BuiltList<ThirdBookingCompany>? companies;
  @override
  final BuiltList<ServiceNameDetail>? serviceNames;

  factory _$ThirdBookingService(
          [void Function(ThirdBookingServiceBuilder)? updates]) =>
      (ThirdBookingServiceBuilder()..update(updates))._build();

  _$ThirdBookingService._(
      {this.serviceId,
      this.serviceName,
      this.serviceType,
      this.companies,
      this.serviceNames})
      : super._();
  @override
  ThirdBookingService rebuild(
          void Function(ThirdBookingServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingServiceBuilder toBuilder() =>
      ThirdBookingServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdBookingService &&
        serviceId == other.serviceId &&
        serviceName == other.serviceName &&
        serviceType == other.serviceType &&
        companies == other.companies &&
        serviceNames == other.serviceNames;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, serviceType.hashCode);
    _$hash = $jc(_$hash, companies.hashCode);
    _$hash = $jc(_$hash, serviceNames.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdBookingService')
          ..add('serviceId', serviceId)
          ..add('serviceName', serviceName)
          ..add('serviceType', serviceType)
          ..add('companies', companies)
          ..add('serviceNames', serviceNames))
        .toString();
  }
}

class ThirdBookingServiceBuilder
    implements Builder<ThirdBookingService, ThirdBookingServiceBuilder> {
  _$ThirdBookingService? _$v;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _serviceType;
  String? get serviceType => _$this._serviceType;
  set serviceType(String? serviceType) => _$this._serviceType = serviceType;

  ListBuilder<ThirdBookingCompany>? _companies;
  ListBuilder<ThirdBookingCompany> get companies =>
      _$this._companies ??= ListBuilder<ThirdBookingCompany>();
  set companies(ListBuilder<ThirdBookingCompany>? companies) =>
      _$this._companies = companies;

  ListBuilder<ServiceNameDetail>? _serviceNames;
  ListBuilder<ServiceNameDetail> get serviceNames =>
      _$this._serviceNames ??= ListBuilder<ServiceNameDetail>();
  set serviceNames(ListBuilder<ServiceNameDetail>? serviceNames) =>
      _$this._serviceNames = serviceNames;

  ThirdBookingServiceBuilder();

  ThirdBookingServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _serviceName = $v.serviceName;
      _serviceType = $v.serviceType;
      _companies = $v.companies?.toBuilder();
      _serviceNames = $v.serviceNames?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdBookingService other) {
    _$v = other as _$ThirdBookingService;
  }

  @override
  void update(void Function(ThirdBookingServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThirdBookingService build() => _build();

  _$ThirdBookingService _build() {
    _$ThirdBookingService _$result;
    try {
      _$result = _$v ??
          _$ThirdBookingService._(
            serviceId: serviceId,
            serviceName: serviceName,
            serviceType: serviceType,
            companies: _companies?.build(),
            serviceNames: _serviceNames?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'companies';
        _companies?.build();
        _$failedField = 'serviceNames';
        _serviceNames?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThirdBookingService', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceNameDetail extends ServiceNameDetail {
  @override
  final int? id;
  @override
  final String? name;

  factory _$ServiceNameDetail(
          [void Function(ServiceNameDetailBuilder)? updates]) =>
      (ServiceNameDetailBuilder()..update(updates))._build();

  _$ServiceNameDetail._({this.id, this.name}) : super._();
  @override
  ServiceNameDetail rebuild(void Function(ServiceNameDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceNameDetailBuilder toBuilder() =>
      ServiceNameDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceNameDetail && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceNameDetail')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class ServiceNameDetailBuilder
    implements Builder<ServiceNameDetail, ServiceNameDetailBuilder> {
  _$ServiceNameDetail? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ServiceNameDetailBuilder();

  ServiceNameDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceNameDetail other) {
    _$v = other as _$ServiceNameDetail;
  }

  @override
  void update(void Function(ServiceNameDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceNameDetail build() => _build();

  _$ServiceNameDetail _build() {
    final _$result = _$v ??
        _$ServiceNameDetail._(
          id: id,
          name: name,
        );
    replace(_$result);
    return _$result;
  }
}

class _$ThirdBookingCompany extends ThirdBookingCompany {
  @override
  final int? companyId;
  @override
  final String? companyName;
  @override
  final String? companyLocation;
  @override
  final BuiltList<ThirdBookingDoctor>? doctors;

  factory _$ThirdBookingCompany(
          [void Function(ThirdBookingCompanyBuilder)? updates]) =>
      (ThirdBookingCompanyBuilder()..update(updates))._build();

  _$ThirdBookingCompany._(
      {this.companyId, this.companyName, this.companyLocation, this.doctors})
      : super._();
  @override
  ThirdBookingCompany rebuild(
          void Function(ThirdBookingCompanyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingCompanyBuilder toBuilder() =>
      ThirdBookingCompanyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdBookingCompany &&
        companyId == other.companyId &&
        companyName == other.companyName &&
        companyLocation == other.companyLocation &&
        doctors == other.doctors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, companyLocation.hashCode);
    _$hash = $jc(_$hash, doctors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdBookingCompany')
          ..add('companyId', companyId)
          ..add('companyName', companyName)
          ..add('companyLocation', companyLocation)
          ..add('doctors', doctors))
        .toString();
  }
}

class ThirdBookingCompanyBuilder
    implements Builder<ThirdBookingCompany, ThirdBookingCompanyBuilder> {
  _$ThirdBookingCompany? _$v;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _companyLocation;
  String? get companyLocation => _$this._companyLocation;
  set companyLocation(String? companyLocation) =>
      _$this._companyLocation = companyLocation;

  ListBuilder<ThirdBookingDoctor>? _doctors;
  ListBuilder<ThirdBookingDoctor> get doctors =>
      _$this._doctors ??= ListBuilder<ThirdBookingDoctor>();
  set doctors(ListBuilder<ThirdBookingDoctor>? doctors) =>
      _$this._doctors = doctors;

  ThirdBookingCompanyBuilder();

  ThirdBookingCompanyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyId = $v.companyId;
      _companyName = $v.companyName;
      _companyLocation = $v.companyLocation;
      _doctors = $v.doctors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdBookingCompany other) {
    _$v = other as _$ThirdBookingCompany;
  }

  @override
  void update(void Function(ThirdBookingCompanyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThirdBookingCompany build() => _build();

  _$ThirdBookingCompany _build() {
    _$ThirdBookingCompany _$result;
    try {
      _$result = _$v ??
          _$ThirdBookingCompany._(
            companyId: companyId,
            companyName: companyName,
            companyLocation: companyLocation,
            doctors: _doctors?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctors';
        _doctors?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThirdBookingCompany', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThirdBookingDoctor extends ThirdBookingDoctor {
  @override
  final int? doctorId;
  @override
  final String? doctorName;
  @override
  final String? doctorGender;
  @override
  final String? doctorImage;
  @override
  final String? doctorSpecialty;
  @override
  final String? doctorLocation;
  @override
  final double? doctorExperience;
  @override
  final double? doctorPrice;
  @override
  final BuiltList<ThirdBookingDoctorSchedule>? schedules;

  factory _$ThirdBookingDoctor(
          [void Function(ThirdBookingDoctorBuilder)? updates]) =>
      (ThirdBookingDoctorBuilder()..update(updates))._build();

  _$ThirdBookingDoctor._(
      {this.doctorId,
      this.doctorName,
      this.doctorGender,
      this.doctorImage,
      this.doctorSpecialty,
      this.doctorLocation,
      this.doctorExperience,
      this.doctorPrice,
      this.schedules})
      : super._();
  @override
  ThirdBookingDoctor rebuild(
          void Function(ThirdBookingDoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingDoctorBuilder toBuilder() =>
      ThirdBookingDoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdBookingDoctor &&
        doctorId == other.doctorId &&
        doctorName == other.doctorName &&
        doctorGender == other.doctorGender &&
        doctorImage == other.doctorImage &&
        doctorSpecialty == other.doctorSpecialty &&
        doctorLocation == other.doctorLocation &&
        doctorExperience == other.doctorExperience &&
        doctorPrice == other.doctorPrice &&
        schedules == other.schedules;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, doctorName.hashCode);
    _$hash = $jc(_$hash, doctorGender.hashCode);
    _$hash = $jc(_$hash, doctorImage.hashCode);
    _$hash = $jc(_$hash, doctorSpecialty.hashCode);
    _$hash = $jc(_$hash, doctorLocation.hashCode);
    _$hash = $jc(_$hash, doctorExperience.hashCode);
    _$hash = $jc(_$hash, doctorPrice.hashCode);
    _$hash = $jc(_$hash, schedules.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdBookingDoctor')
          ..add('doctorId', doctorId)
          ..add('doctorName', doctorName)
          ..add('doctorGender', doctorGender)
          ..add('doctorImage', doctorImage)
          ..add('doctorSpecialty', doctorSpecialty)
          ..add('doctorLocation', doctorLocation)
          ..add('doctorExperience', doctorExperience)
          ..add('doctorPrice', doctorPrice)
          ..add('schedules', schedules))
        .toString();
  }
}

class ThirdBookingDoctorBuilder
    implements Builder<ThirdBookingDoctor, ThirdBookingDoctorBuilder> {
  _$ThirdBookingDoctor? _$v;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  String? _doctorName;
  String? get doctorName => _$this._doctorName;
  set doctorName(String? doctorName) => _$this._doctorName = doctorName;

  String? _doctorGender;
  String? get doctorGender => _$this._doctorGender;
  set doctorGender(String? doctorGender) => _$this._doctorGender = doctorGender;

  String? _doctorImage;
  String? get doctorImage => _$this._doctorImage;
  set doctorImage(String? doctorImage) => _$this._doctorImage = doctorImage;

  String? _doctorSpecialty;
  String? get doctorSpecialty => _$this._doctorSpecialty;
  set doctorSpecialty(String? doctorSpecialty) =>
      _$this._doctorSpecialty = doctorSpecialty;

  String? _doctorLocation;
  String? get doctorLocation => _$this._doctorLocation;
  set doctorLocation(String? doctorLocation) =>
      _$this._doctorLocation = doctorLocation;

  double? _doctorExperience;
  double? get doctorExperience => _$this._doctorExperience;
  set doctorExperience(double? doctorExperience) =>
      _$this._doctorExperience = doctorExperience;

  double? _doctorPrice;
  double? get doctorPrice => _$this._doctorPrice;
  set doctorPrice(double? doctorPrice) => _$this._doctorPrice = doctorPrice;

  ListBuilder<ThirdBookingDoctorSchedule>? _schedules;
  ListBuilder<ThirdBookingDoctorSchedule> get schedules =>
      _$this._schedules ??= ListBuilder<ThirdBookingDoctorSchedule>();
  set schedules(ListBuilder<ThirdBookingDoctorSchedule>? schedules) =>
      _$this._schedules = schedules;

  ThirdBookingDoctorBuilder();

  ThirdBookingDoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctorId = $v.doctorId;
      _doctorName = $v.doctorName;
      _doctorGender = $v.doctorGender;
      _doctorImage = $v.doctorImage;
      _doctorSpecialty = $v.doctorSpecialty;
      _doctorLocation = $v.doctorLocation;
      _doctorExperience = $v.doctorExperience;
      _doctorPrice = $v.doctorPrice;
      _schedules = $v.schedules?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdBookingDoctor other) {
    _$v = other as _$ThirdBookingDoctor;
  }

  @override
  void update(void Function(ThirdBookingDoctorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThirdBookingDoctor build() => _build();

  _$ThirdBookingDoctor _build() {
    _$ThirdBookingDoctor _$result;
    try {
      _$result = _$v ??
          _$ThirdBookingDoctor._(
            doctorId: doctorId,
            doctorName: doctorName,
            doctorGender: doctorGender,
            doctorImage: doctorImage,
            doctorSpecialty: doctorSpecialty,
            doctorLocation: doctorLocation,
            doctorExperience: doctorExperience,
            doctorPrice: doctorPrice,
            schedules: _schedules?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schedules';
        _schedules?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThirdBookingDoctor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThirdBookingDoctorSchedule extends ThirdBookingDoctorSchedule {
  @override
  final String? date;
  @override
  final BuiltList<ScheduleDetail>? scheduleList;

  factory _$ThirdBookingDoctorSchedule(
          [void Function(ThirdBookingDoctorScheduleBuilder)? updates]) =>
      (ThirdBookingDoctorScheduleBuilder()..update(updates))._build();

  _$ThirdBookingDoctorSchedule._({this.date, this.scheduleList}) : super._();
  @override
  ThirdBookingDoctorSchedule rebuild(
          void Function(ThirdBookingDoctorScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingDoctorScheduleBuilder toBuilder() =>
      ThirdBookingDoctorScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdBookingDoctorSchedule &&
        date == other.date &&
        scheduleList == other.scheduleList;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, scheduleList.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdBookingDoctorSchedule')
          ..add('date', date)
          ..add('scheduleList', scheduleList))
        .toString();
  }
}

class ThirdBookingDoctorScheduleBuilder
    implements
        Builder<ThirdBookingDoctorSchedule, ThirdBookingDoctorScheduleBuilder> {
  _$ThirdBookingDoctorSchedule? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  ListBuilder<ScheduleDetail>? _scheduleList;
  ListBuilder<ScheduleDetail> get scheduleList =>
      _$this._scheduleList ??= ListBuilder<ScheduleDetail>();
  set scheduleList(ListBuilder<ScheduleDetail>? scheduleList) =>
      _$this._scheduleList = scheduleList;

  ThirdBookingDoctorScheduleBuilder();

  ThirdBookingDoctorScheduleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _scheduleList = $v.scheduleList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdBookingDoctorSchedule other) {
    _$v = other as _$ThirdBookingDoctorSchedule;
  }

  @override
  void update(void Function(ThirdBookingDoctorScheduleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThirdBookingDoctorSchedule build() => _build();

  _$ThirdBookingDoctorSchedule _build() {
    _$ThirdBookingDoctorSchedule _$result;
    try {
      _$result = _$v ??
          _$ThirdBookingDoctorSchedule._(
            date: date,
            scheduleList: _scheduleList?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scheduleList';
        _scheduleList?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThirdBookingDoctorSchedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ScheduleDetail extends ScheduleDetail {
  @override
  final String? time;
  @override
  final bool? active;
  @override
  final double? duration;

  factory _$ScheduleDetail([void Function(ScheduleDetailBuilder)? updates]) =>
      (ScheduleDetailBuilder()..update(updates))._build();

  _$ScheduleDetail._({this.time, this.active, this.duration}) : super._();
  @override
  ScheduleDetail rebuild(void Function(ScheduleDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleDetailBuilder toBuilder() => ScheduleDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleDetail &&
        time == other.time &&
        active == other.active &&
        duration == other.duration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScheduleDetail')
          ..add('time', time)
          ..add('active', active)
          ..add('duration', duration))
        .toString();
  }
}

class ScheduleDetailBuilder
    implements Builder<ScheduleDetail, ScheduleDetailBuilder> {
  _$ScheduleDetail? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  double? _duration;
  double? get duration => _$this._duration;
  set duration(double? duration) => _$this._duration = duration;

  ScheduleDetailBuilder();

  ScheduleDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _active = $v.active;
      _duration = $v.duration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleDetail other) {
    _$v = other as _$ScheduleDetail;
  }

  @override
  void update(void Function(ScheduleDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScheduleDetail build() => _build();

  _$ScheduleDetail _build() {
    final _$result = _$v ??
        _$ScheduleDetail._(
          time: time,
          active: active,
          duration: duration,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
