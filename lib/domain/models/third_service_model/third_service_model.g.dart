// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_service_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoctorsRequest> _$doctorsRequestSerializer =
    new _$DoctorsRequestSerializer();
Serializer<ThirdBookingDoctorSchedule> _$thirdBookingDoctorScheduleSerializer =
    new _$ThirdBookingDoctorScheduleSerializer();
Serializer<ScheduleDetail> _$scheduleDetailSerializer =
    new _$ScheduleDetailSerializer();
Serializer<ThirdBookingDoctor> _$thirdBookingDoctorSerializer =
    new _$ThirdBookingDoctorSerializer();
Serializer<ThirdBookingCompanyDoctor> _$thirdBookingCompanyDoctorSerializer =
    new _$ThirdBookingCompanyDoctorSerializer();
Serializer<ThirdBookingService> _$thirdBookingServiceSerializer =
    new _$ThirdBookingServiceSerializer();

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
    return result;
  }

  @override
  DoctorsRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorsRequestBuilder();

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
    final result = new ThirdBookingDoctorScheduleBuilder();

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
    final result = new ScheduleDetailBuilder();

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
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specialty;
    if (value != null) {
      result
        ..add('specialty')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.experience;
    if (value != null) {
      result
        ..add('experience')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.schedules;
    if (value != null) {
      result
        ..add('schedules')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(ThirdBookingDoctorSchedule)])));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workExperience;
    if (value != null) {
      result
        ..add('work_experience')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ThirdBookingDoctor deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThirdBookingDoctorBuilder();

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
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specialty':
          result.specialty = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'experience':
          result.experience = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'schedules':
          result.schedules.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(ThirdBookingDoctorSchedule)
              ]))! as BuiltList<Object?>);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'work_experience':
          result.workExperience = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ThirdBookingCompanyDoctorSerializer
    implements StructuredSerializer<ThirdBookingCompanyDoctor> {
  @override
  final Iterable<Type> types = const [
    ThirdBookingCompanyDoctor,
    _$ThirdBookingCompanyDoctor
  ];
  @override
  final String wireName = 'ThirdBookingCompanyDoctor';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ThirdBookingCompanyDoctor object,
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
    value = object.doctor;
    if (value != null) {
      result
        ..add('doctor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ThirdBookingDoctor)])));
    }
    return result;
  }

  @override
  ThirdBookingCompanyDoctor deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThirdBookingCompanyDoctorBuilder();

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
        case 'doctor':
          result.doctor.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ThirdBookingDoctor)]))!
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
    value = object.companiesDoctors;
    if (value != null) {
      result
        ..add('companies_doctors')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ThirdBookingCompanyDoctor)])));
    }
    return result;
  }

  @override
  ThirdBookingService deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThirdBookingServiceBuilder();

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
        case 'companies_doctors':
          result.companiesDoctors.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(ThirdBookingCompanyDoctor)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorsRequest extends DoctorsRequest {
  @override
  final BuiltList<int>? serviceIds;

  factory _$DoctorsRequest([void Function(DoctorsRequestBuilder)? updates]) =>
      (new DoctorsRequestBuilder()..update(updates))._build();

  _$DoctorsRequest._({this.serviceIds}) : super._();

  @override
  DoctorsRequest rebuild(void Function(DoctorsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorsRequestBuilder toBuilder() =>
      new DoctorsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorsRequest && serviceIds == other.serviceIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorsRequest')
          ..add('serviceIds', serviceIds))
        .toString();
  }
}

class DoctorsRequestBuilder
    implements Builder<DoctorsRequest, DoctorsRequestBuilder> {
  _$DoctorsRequest? _$v;

  ListBuilder<int>? _serviceIds;
  ListBuilder<int> get serviceIds =>
      _$this._serviceIds ??= new ListBuilder<int>();
  set serviceIds(ListBuilder<int>? serviceIds) =>
      _$this._serviceIds = serviceIds;

  DoctorsRequestBuilder();

  DoctorsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceIds = $v.serviceIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
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
          new _$DoctorsRequest._(
            serviceIds: _serviceIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'serviceIds';
        _serviceIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DoctorsRequest', _$failedField, e.toString());
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
      (new ThirdBookingDoctorScheduleBuilder()..update(updates))._build();

  _$ThirdBookingDoctorSchedule._({this.date, this.scheduleList}) : super._();

  @override
  ThirdBookingDoctorSchedule rebuild(
          void Function(ThirdBookingDoctorScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingDoctorScheduleBuilder toBuilder() =>
      new ThirdBookingDoctorScheduleBuilder()..replace(this);

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
      _$this._scheduleList ??= new ListBuilder<ScheduleDetail>();
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
    ArgumentError.checkNotNull(other, 'other');
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
          new _$ThirdBookingDoctorSchedule._(
            date: date,
            scheduleList: _scheduleList?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scheduleList';
        _scheduleList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
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
      (new ScheduleDetailBuilder()..update(updates))._build();

  _$ScheduleDetail._({this.time, this.active, this.duration}) : super._();

  @override
  ScheduleDetail rebuild(void Function(ScheduleDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleDetailBuilder toBuilder() =>
      new ScheduleDetailBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$ScheduleDetail._(
          time: time,
          active: active,
          duration: duration,
        );
    replace(_$result);
    return _$result;
  }
}

class _$ThirdBookingDoctor extends ThirdBookingDoctor {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? gender;
  @override
  final String? image;
  @override
  final String? specialty;
  @override
  final String? experience;
  @override
  final BuiltList<ThirdBookingDoctorSchedule>? schedules;
  @override
  final double? price;
  @override
  final String? location;
  @override
  final int? workExperience;

  factory _$ThirdBookingDoctor(
          [void Function(ThirdBookingDoctorBuilder)? updates]) =>
      (new ThirdBookingDoctorBuilder()..update(updates))._build();

  _$ThirdBookingDoctor._(
      {this.id,
      this.name,
      this.gender,
      this.image,
      this.specialty,
      this.experience,
      this.schedules,
      this.price,
      this.location,
      this.workExperience})
      : super._();

  @override
  ThirdBookingDoctor rebuild(
          void Function(ThirdBookingDoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingDoctorBuilder toBuilder() =>
      new ThirdBookingDoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdBookingDoctor &&
        id == other.id &&
        name == other.name &&
        gender == other.gender &&
        image == other.image &&
        specialty == other.specialty &&
        experience == other.experience &&
        schedules == other.schedules &&
        price == other.price &&
        location == other.location &&
        workExperience == other.workExperience;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, specialty.hashCode);
    _$hash = $jc(_$hash, experience.hashCode);
    _$hash = $jc(_$hash, schedules.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, workExperience.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdBookingDoctor')
          ..add('id', id)
          ..add('name', name)
          ..add('gender', gender)
          ..add('image', image)
          ..add('specialty', specialty)
          ..add('experience', experience)
          ..add('schedules', schedules)
          ..add('price', price)
          ..add('location', location)
          ..add('workExperience', workExperience))
        .toString();
  }
}

class ThirdBookingDoctorBuilder
    implements Builder<ThirdBookingDoctor, ThirdBookingDoctorBuilder> {
  _$ThirdBookingDoctor? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _specialty;
  String? get specialty => _$this._specialty;
  set specialty(String? specialty) => _$this._specialty = specialty;

  String? _experience;
  String? get experience => _$this._experience;
  set experience(String? experience) => _$this._experience = experience;

  ListBuilder<ThirdBookingDoctorSchedule>? _schedules;
  ListBuilder<ThirdBookingDoctorSchedule> get schedules =>
      _$this._schedules ??= new ListBuilder<ThirdBookingDoctorSchedule>();
  set schedules(ListBuilder<ThirdBookingDoctorSchedule>? schedules) =>
      _$this._schedules = schedules;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  int? _workExperience;
  int? get workExperience => _$this._workExperience;
  set workExperience(int? workExperience) =>
      _$this._workExperience = workExperience;

  ThirdBookingDoctorBuilder();

  ThirdBookingDoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _gender = $v.gender;
      _image = $v.image;
      _specialty = $v.specialty;
      _experience = $v.experience;
      _schedules = $v.schedules?.toBuilder();
      _price = $v.price;
      _location = $v.location;
      _workExperience = $v.workExperience;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdBookingDoctor other) {
    ArgumentError.checkNotNull(other, 'other');
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
          new _$ThirdBookingDoctor._(
            id: id,
            name: name,
            gender: gender,
            image: image,
            specialty: specialty,
            experience: experience,
            schedules: _schedules?.build(),
            price: price,
            location: location,
            workExperience: workExperience,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schedules';
        _schedules?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ThirdBookingDoctor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThirdBookingCompanyDoctor extends ThirdBookingCompanyDoctor {
  @override
  final int? companyId;
  @override
  final String? companyName;
  @override
  final BuiltList<ThirdBookingDoctor>? doctor;

  factory _$ThirdBookingCompanyDoctor(
          [void Function(ThirdBookingCompanyDoctorBuilder)? updates]) =>
      (new ThirdBookingCompanyDoctorBuilder()..update(updates))._build();

  _$ThirdBookingCompanyDoctor._({this.companyId, this.companyName, this.doctor})
      : super._();

  @override
  ThirdBookingCompanyDoctor rebuild(
          void Function(ThirdBookingCompanyDoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingCompanyDoctorBuilder toBuilder() =>
      new ThirdBookingCompanyDoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdBookingCompanyDoctor &&
        companyId == other.companyId &&
        companyName == other.companyName &&
        doctor == other.doctor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, doctor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdBookingCompanyDoctor')
          ..add('companyId', companyId)
          ..add('companyName', companyName)
          ..add('doctor', doctor))
        .toString();
  }
}

class ThirdBookingCompanyDoctorBuilder
    implements
        Builder<ThirdBookingCompanyDoctor, ThirdBookingCompanyDoctorBuilder> {
  _$ThirdBookingCompanyDoctor? _$v;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  ListBuilder<ThirdBookingDoctor>? _doctor;
  ListBuilder<ThirdBookingDoctor> get doctor =>
      _$this._doctor ??= new ListBuilder<ThirdBookingDoctor>();
  set doctor(ListBuilder<ThirdBookingDoctor>? doctor) =>
      _$this._doctor = doctor;

  ThirdBookingCompanyDoctorBuilder();

  ThirdBookingCompanyDoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyId = $v.companyId;
      _companyName = $v.companyName;
      _doctor = $v.doctor?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdBookingCompanyDoctor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThirdBookingCompanyDoctor;
  }

  @override
  void update(void Function(ThirdBookingCompanyDoctorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThirdBookingCompanyDoctor build() => _build();

  _$ThirdBookingCompanyDoctor _build() {
    _$ThirdBookingCompanyDoctor _$result;
    try {
      _$result = _$v ??
          new _$ThirdBookingCompanyDoctor._(
            companyId: companyId,
            companyName: companyName,
            doctor: _doctor?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctor';
        _doctor?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ThirdBookingCompanyDoctor', _$failedField, e.toString());
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
  final BuiltList<ThirdBookingCompanyDoctor>? companiesDoctors;

  factory _$ThirdBookingService(
          [void Function(ThirdBookingServiceBuilder)? updates]) =>
      (new ThirdBookingServiceBuilder()..update(updates))._build();

  _$ThirdBookingService._(
      {this.serviceId, this.serviceName, this.companiesDoctors})
      : super._();

  @override
  ThirdBookingService rebuild(
          void Function(ThirdBookingServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdBookingServiceBuilder toBuilder() =>
      new ThirdBookingServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdBookingService &&
        serviceId == other.serviceId &&
        serviceName == other.serviceName &&
        companiesDoctors == other.companiesDoctors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, companiesDoctors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdBookingService')
          ..add('serviceId', serviceId)
          ..add('serviceName', serviceName)
          ..add('companiesDoctors', companiesDoctors))
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

  ListBuilder<ThirdBookingCompanyDoctor>? _companiesDoctors;
  ListBuilder<ThirdBookingCompanyDoctor> get companiesDoctors =>
      _$this._companiesDoctors ??= new ListBuilder<ThirdBookingCompanyDoctor>();
  set companiesDoctors(
          ListBuilder<ThirdBookingCompanyDoctor>? companiesDoctors) =>
      _$this._companiesDoctors = companiesDoctors;

  ThirdBookingServiceBuilder();

  ThirdBookingServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _serviceName = $v.serviceName;
      _companiesDoctors = $v.companiesDoctors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdBookingService other) {
    ArgumentError.checkNotNull(other, 'other');
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
          new _$ThirdBookingService._(
            serviceId: serviceId,
            serviceName: serviceName,
            companiesDoctors: _companiesDoctors?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'companiesDoctors';
        _companiesDoctors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ThirdBookingService', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
