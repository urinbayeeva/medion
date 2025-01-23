// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_type_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingTypeModel> _$bookingTypeModelSerializer =
    new _$BookingTypeModelSerializer();
Serializer<Service> _$serviceSerializer = new _$ServiceSerializer();
Serializer<Category> _$categorySerializer = new _$CategorySerializer();
Serializer<GiveSelectedId> _$giveSelectedIdSerializer =
    new _$GiveSelectedIdSerializer();
Serializer<ServiceModel> _$serviceModelSerializer =
    new _$ServiceModelSerializer();
Serializer<CompanyDoctor> _$companyDoctorSerializer =
    new _$CompanyDoctorSerializer();
Serializer<Doctor> _$doctorSerializer = new _$DoctorSerializer();
Serializer<Schedule> _$scheduleSerializer = new _$ScheduleSerializer();
Serializer<HomepageBookingCategory> _$homepageBookingCategorySerializer =
    new _$HomepageBookingCategorySerializer();
Serializer<MedicalModel> _$medicalModelSerializer =
    new _$MedicalModelSerializer();
Serializer<HomeMedicalDoctor> _$homeMedicalDoctorSerializer =
    new _$HomeMedicalDoctorSerializer();
Serializer<HomeServiceBooking> _$homeServiceBookingSerializer =
    new _$HomeServiceBookingSerializer();

class _$BookingTypeModelSerializer
    implements StructuredSerializer<BookingTypeModel> {
  @override
  final Iterable<Type> types = const [BookingTypeModel, _$BookingTypeModel];
  @override
  final String wireName = 'BookingTypeModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookingTypeModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BookingTypeModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingTypeModelBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ServiceSerializer implements StructuredSerializer<Service> {
  @override
  final Iterable<Type> types = const [Service, _$Service];
  @override
  final String wireName = 'Service';

  @override
  Iterable<Object?> serialize(Serializers serializers, Service object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'doctor_price_start_uzs',
      serializers.serialize(object.priceUzs,
          specifiedType: const FullType(double)),
      'doctor_price_start_usd',
      serializers.serialize(object.priceUsd,
          specifiedType: const FullType(double)),
      'age',
      serializers.serialize(object.age, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Service deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_price_start_uzs':
          result.priceUzs = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'doctor_price_start_usd':
          result.priceUsd = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CategorySerializer implements StructuredSerializer<Category> {
  @override
  final Iterable<Type> types = const [Category, _$Category];
  @override
  final String wireName = 'Category';

  @override
  Iterable<Object?> serialize(Serializers serializers, Category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'category_name',
      serializers.serialize(object.name,
          specifiedType: const FullType(JsonObject)),
      'services',
      serializers.serialize(object.services,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Service)])),
    ];

    return result;
  }

  @override
  Category deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category_name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Service)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GiveSelectedIdSerializer
    implements StructuredSerializer<GiveSelectedId> {
  @override
  final Iterable<Type> types = const [GiveSelectedId, _$GiveSelectedId];
  @override
  final String wireName = 'GiveSelectedId';

  @override
  Iterable<Object?> serialize(Serializers serializers, GiveSelectedId object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'serviceIds',
      serializers.serialize(object.serviceIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  GiveSelectedId deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GiveSelectedIdBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'serviceIds':
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

class _$ServiceModelSerializer implements StructuredSerializer<ServiceModel> {
  @override
  final Iterable<Type> types = const [ServiceModel, _$ServiceModel];
  @override
  final String wireName = 'ServiceModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServiceModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'service_id',
      serializers.serialize(object.serviceId,
          specifiedType: const FullType(int)),
      'service_name',
      serializers.serialize(object.serviceName,
          specifiedType: const FullType(String)),
      'companies_doctors',
      serializers.serialize(object.companiesDoctors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CompanyDoctor)])),
    ];

    return result;
  }

  @override
  ServiceModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'service_id':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'companies_doctors':
          result.companiesDoctors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CompanyDoctor)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CompanyDoctorSerializer implements StructuredSerializer<CompanyDoctor> {
  @override
  final Iterable<Type> types = const [CompanyDoctor, _$CompanyDoctor];
  @override
  final String wireName = 'CompanyDoctor';

  @override
  Iterable<Object?> serialize(Serializers serializers, CompanyDoctor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
      'company_name',
      serializers.serialize(object.companyName,
          specifiedType: const FullType(String)),
      'doctor',
      serializers.serialize(object.doctor,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Doctor)])),
    ];

    return result;
  }

  @override
  CompanyDoctor deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompanyDoctorBuilder();

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
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor':
          result.doctor.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Doctor)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorSerializer implements StructuredSerializer<Doctor> {
  @override
  final Iterable<Type> types = const [Doctor, _$Doctor];
  @override
  final String wireName = 'Doctor';

  @override
  Iterable<Object?> serialize(Serializers serializers, Doctor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'specialty',
      serializers.serialize(object.specialty,
          specifiedType: const FullType(String)),
      'experience',
      serializers.serialize(object.experience,
          specifiedType: const FullType(String)),
      'schedules',
      serializers.serialize(object.schedules,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(BuiltList, const [const FullType(Schedule)])
          ])),
      'price',
      serializers.serialize(object.price, specifiedType: const FullType(int)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(String)),
      'work_experience',
      serializers.serialize(object.workExperience,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Doctor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'specialty':
          result.specialty = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'experience':
          result.experience = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'schedules':
          result.schedules.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BuiltList, const [const FullType(Schedule)])
              ]))!);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'work_experience':
          result.workExperience = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ScheduleSerializer implements StructuredSerializer<Schedule> {
  @override
  final Iterable<Type> types = const [Schedule, _$Schedule];
  @override
  final String wireName = 'Schedule';

  @override
  Iterable<Object?> serialize(Serializers serializers, Schedule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(String)),
      'active',
      serializers.serialize(object.active, specifiedType: const FullType(bool)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Schedule deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$HomepageBookingCategorySerializer
    implements StructuredSerializer<HomepageBookingCategory> {
  @override
  final Iterable<Type> types = const [
    HomepageBookingCategory,
    _$HomepageBookingCategory
  ];
  @override
  final String wireName = 'HomepageBookingCategory';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HomepageBookingCategory object,
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
    value = object.icon;
    if (value != null) {
      result
        ..add('icond')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  HomepageBookingCategory deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HomepageBookingCategoryBuilder();

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
        case 'icond':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MedicalModelSerializer implements StructuredSerializer<MedicalModel> {
  @override
  final Iterable<Type> types = const [MedicalModel, _$MedicalModel];
  @override
  final String wireName = 'MedicalModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MedicalModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'doctors',
      serializers.serialize(object.doctors,
          specifiedType: const FullType(
              BuiltList, const [const FullType(HomeMedicalDoctor)])),
      'services',
      serializers.serialize(object.services,
          specifiedType: const FullType(
              BuiltList, const [const FullType(HomeServiceBooking)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MedicalModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedicalModelBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctors':
          result.doctors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HomeMedicalDoctor)]))!
              as BuiltList<Object?>);
          break;
        case 'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HomeServiceBooking)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$HomeMedicalDoctorSerializer
    implements StructuredSerializer<HomeMedicalDoctor> {
  @override
  final Iterable<Type> types = const [HomeMedicalDoctor, _$HomeMedicalDoctor];
  @override
  final String wireName = 'HomeMedicalDoctor';

  @override
  Iterable<Object?> serialize(Serializers serializers, HomeMedicalDoctor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobName;
    if (value != null) {
      result
        ..add('jobName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.experienceYears;
    if (value != null) {
      result
        ..add('experienceYears')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  HomeMedicalDoctor deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HomeMedicalDoctorBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jobName':
          result.jobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'experienceYears':
          result.experienceYears = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$HomeServiceBookingSerializer
    implements StructuredSerializer<HomeServiceBooking> {
  @override
  final Iterable<Type> types = const [HomeServiceBooking, _$HomeServiceBooking];
  @override
  final String wireName = 'HomeServiceBooking';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HomeServiceBooking object,
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
    value = object.priceUzs;
    if (value != null) {
      result
        ..add('priceUzs')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.priceUzd;
    if (value != null) {
      result
        ..add('priceUzd')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  HomeServiceBooking deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HomeServiceBookingBuilder();

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
        case 'priceUzs':
          result.priceUzs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'priceUzd':
          result.priceUzd = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$BookingTypeModel extends BookingTypeModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? icon;

  factory _$BookingTypeModel(
          [void Function(BookingTypeModelBuilder)? updates]) =>
      (new BookingTypeModelBuilder()..update(updates))._build();

  _$BookingTypeModel._({required this.id, required this.name, this.icon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'BookingTypeModel', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'BookingTypeModel', 'name');
  }

  @override
  BookingTypeModel rebuild(void Function(BookingTypeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingTypeModelBuilder toBuilder() =>
      new BookingTypeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingTypeModel &&
        id == other.id &&
        name == other.name &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookingTypeModel')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon))
        .toString();
  }
}

class BookingTypeModelBuilder
    implements Builder<BookingTypeModel, BookingTypeModelBuilder> {
  _$BookingTypeModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  BookingTypeModelBuilder();

  BookingTypeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookingTypeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingTypeModel;
  }

  @override
  void update(void Function(BookingTypeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookingTypeModel build() => _build();

  _$BookingTypeModel _build() {
    final _$result = _$v ??
        new _$BookingTypeModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'BookingTypeModel', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'BookingTypeModel', 'name'),
            icon: icon);
    replace(_$result);
    return _$result;
  }
}

class _$Service extends Service {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final double priceUzs;
  @override
  final double priceUsd;
  @override
  final String age;

  factory _$Service([void Function(ServiceBuilder)? updates]) =>
      (new ServiceBuilder()..update(updates))._build();

  _$Service._(
      {required this.id,
      required this.name,
      this.description,
      required this.priceUzs,
      required this.priceUsd,
      required this.age})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Service', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Service', 'name');
    BuiltValueNullFieldError.checkNotNull(priceUzs, r'Service', 'priceUzs');
    BuiltValueNullFieldError.checkNotNull(priceUsd, r'Service', 'priceUsd');
    BuiltValueNullFieldError.checkNotNull(age, r'Service', 'age');
  }

  @override
  Service rebuild(void Function(ServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceBuilder toBuilder() => new ServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Service &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        priceUzs == other.priceUzs &&
        priceUsd == other.priceUsd &&
        age == other.age;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, priceUzs.hashCode);
    _$hash = $jc(_$hash, priceUsd.hashCode);
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Service')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('priceUzs', priceUzs)
          ..add('priceUsd', priceUsd)
          ..add('age', age))
        .toString();
  }
}

class ServiceBuilder implements Builder<Service, ServiceBuilder> {
  _$Service? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _priceUzs;
  double? get priceUzs => _$this._priceUzs;
  set priceUzs(double? priceUzs) => _$this._priceUzs = priceUzs;

  double? _priceUsd;
  double? get priceUsd => _$this._priceUsd;
  set priceUsd(double? priceUsd) => _$this._priceUsd = priceUsd;

  String? _age;
  String? get age => _$this._age;
  set age(String? age) => _$this._age = age;

  ServiceBuilder();

  ServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _priceUzs = $v.priceUzs;
      _priceUsd = $v.priceUsd;
      _age = $v.age;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Service other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Service;
  }

  @override
  void update(void Function(ServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Service build() => _build();

  _$Service _build() {
    final _$result = _$v ??
        new _$Service._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Service', 'id'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Service', 'name'),
            description: description,
            priceUzs: BuiltValueNullFieldError.checkNotNull(
                priceUzs, r'Service', 'priceUzs'),
            priceUsd: BuiltValueNullFieldError.checkNotNull(
                priceUsd, r'Service', 'priceUsd'),
            age: BuiltValueNullFieldError.checkNotNull(age, r'Service', 'age'));
    replace(_$result);
    return _$result;
  }
}

class _$Category extends Category {
  @override
  final JsonObject name;
  @override
  final BuiltList<Service> services;

  factory _$Category([void Function(CategoryBuilder)? updates]) =>
      (new CategoryBuilder()..update(updates))._build();

  _$Category._({required this.name, required this.services}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Category', 'name');
    BuiltValueNullFieldError.checkNotNull(services, r'Category', 'services');
  }

  @override
  Category rebuild(void Function(CategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryBuilder toBuilder() => new CategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category &&
        name == other.name &&
        services == other.services;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Category')
          ..add('name', name)
          ..add('services', services))
        .toString();
  }
}

class CategoryBuilder implements Builder<Category, CategoryBuilder> {
  _$Category? _$v;

  JsonObject? _name;
  JsonObject? get name => _$this._name;
  set name(JsonObject? name) => _$this._name = name;

  ListBuilder<Service>? _services;
  ListBuilder<Service> get services =>
      _$this._services ??= new ListBuilder<Service>();
  set services(ListBuilder<Service>? services) => _$this._services = services;

  CategoryBuilder();

  CategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _services = $v.services.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Category other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Category;
  }

  @override
  void update(void Function(CategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Category build() => _build();

  _$Category _build() {
    _$Category _$result;
    try {
      _$result = _$v ??
          new _$Category._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Category', 'name'),
              services: services.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        services.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Category', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GiveSelectedId extends GiveSelectedId {
  @override
  final BuiltList<int> serviceIds;

  factory _$GiveSelectedId([void Function(GiveSelectedIdBuilder)? updates]) =>
      (new GiveSelectedIdBuilder()..update(updates))._build();

  _$GiveSelectedId._({required this.serviceIds}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        serviceIds, r'GiveSelectedId', 'serviceIds');
  }

  @override
  GiveSelectedId rebuild(void Function(GiveSelectedIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveSelectedIdBuilder toBuilder() =>
      new GiveSelectedIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveSelectedId && serviceIds == other.serviceIds;
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
    return (newBuiltValueToStringHelper(r'GiveSelectedId')
          ..add('serviceIds', serviceIds))
        .toString();
  }
}

class GiveSelectedIdBuilder
    implements Builder<GiveSelectedId, GiveSelectedIdBuilder> {
  _$GiveSelectedId? _$v;

  ListBuilder<int>? _serviceIds;
  ListBuilder<int> get serviceIds =>
      _$this._serviceIds ??= new ListBuilder<int>();
  set serviceIds(ListBuilder<int>? serviceIds) =>
      _$this._serviceIds = serviceIds;

  GiveSelectedIdBuilder();

  GiveSelectedIdBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceIds = $v.serviceIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveSelectedId other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GiveSelectedId;
  }

  @override
  void update(void Function(GiveSelectedIdBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveSelectedId build() => _build();

  _$GiveSelectedId _build() {
    _$GiveSelectedId _$result;
    try {
      _$result = _$v ?? new _$GiveSelectedId._(serviceIds: serviceIds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'serviceIds';
        serviceIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GiveSelectedId', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceModel extends ServiceModel {
  @override
  final int serviceId;
  @override
  final String serviceName;
  @override
  final BuiltList<CompanyDoctor> companiesDoctors;

  factory _$ServiceModel([void Function(ServiceModelBuilder)? updates]) =>
      (new ServiceModelBuilder()..update(updates))._build();

  _$ServiceModel._(
      {required this.serviceId,
      required this.serviceName,
      required this.companiesDoctors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        serviceId, r'ServiceModel', 'serviceId');
    BuiltValueNullFieldError.checkNotNull(
        serviceName, r'ServiceModel', 'serviceName');
    BuiltValueNullFieldError.checkNotNull(
        companiesDoctors, r'ServiceModel', 'companiesDoctors');
  }

  @override
  ServiceModel rebuild(void Function(ServiceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceModelBuilder toBuilder() => new ServiceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceModel &&
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
    return (newBuiltValueToStringHelper(r'ServiceModel')
          ..add('serviceId', serviceId)
          ..add('serviceName', serviceName)
          ..add('companiesDoctors', companiesDoctors))
        .toString();
  }
}

class ServiceModelBuilder
    implements Builder<ServiceModel, ServiceModelBuilder> {
  _$ServiceModel? _$v;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  ListBuilder<CompanyDoctor>? _companiesDoctors;
  ListBuilder<CompanyDoctor> get companiesDoctors =>
      _$this._companiesDoctors ??= new ListBuilder<CompanyDoctor>();
  set companiesDoctors(ListBuilder<CompanyDoctor>? companiesDoctors) =>
      _$this._companiesDoctors = companiesDoctors;

  ServiceModelBuilder();

  ServiceModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _serviceName = $v.serviceName;
      _companiesDoctors = $v.companiesDoctors.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceModel;
  }

  @override
  void update(void Function(ServiceModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceModel build() => _build();

  _$ServiceModel _build() {
    _$ServiceModel _$result;
    try {
      _$result = _$v ??
          new _$ServiceModel._(
              serviceId: BuiltValueNullFieldError.checkNotNull(
                  serviceId, r'ServiceModel', 'serviceId'),
              serviceName: BuiltValueNullFieldError.checkNotNull(
                  serviceName, r'ServiceModel', 'serviceName'),
              companiesDoctors: companiesDoctors.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'companiesDoctors';
        companiesDoctors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompanyDoctor extends CompanyDoctor {
  @override
  final int companyId;
  @override
  final String companyName;
  @override
  final BuiltList<Doctor> doctor;

  factory _$CompanyDoctor([void Function(CompanyDoctorBuilder)? updates]) =>
      (new CompanyDoctorBuilder()..update(updates))._build();

  _$CompanyDoctor._(
      {required this.companyId,
      required this.companyName,
      required this.doctor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        companyId, r'CompanyDoctor', 'companyId');
    BuiltValueNullFieldError.checkNotNull(
        companyName, r'CompanyDoctor', 'companyName');
    BuiltValueNullFieldError.checkNotNull(doctor, r'CompanyDoctor', 'doctor');
  }

  @override
  CompanyDoctor rebuild(void Function(CompanyDoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyDoctorBuilder toBuilder() => new CompanyDoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyDoctor &&
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
    return (newBuiltValueToStringHelper(r'CompanyDoctor')
          ..add('companyId', companyId)
          ..add('companyName', companyName)
          ..add('doctor', doctor))
        .toString();
  }
}

class CompanyDoctorBuilder
    implements Builder<CompanyDoctor, CompanyDoctorBuilder> {
  _$CompanyDoctor? _$v;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  ListBuilder<Doctor>? _doctor;
  ListBuilder<Doctor> get doctor =>
      _$this._doctor ??= new ListBuilder<Doctor>();
  set doctor(ListBuilder<Doctor>? doctor) => _$this._doctor = doctor;

  CompanyDoctorBuilder();

  CompanyDoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyId = $v.companyId;
      _companyName = $v.companyName;
      _doctor = $v.doctor.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyDoctor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompanyDoctor;
  }

  @override
  void update(void Function(CompanyDoctorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompanyDoctor build() => _build();

  _$CompanyDoctor _build() {
    _$CompanyDoctor _$result;
    try {
      _$result = _$v ??
          new _$CompanyDoctor._(
              companyId: BuiltValueNullFieldError.checkNotNull(
                  companyId, r'CompanyDoctor', 'companyId'),
              companyName: BuiltValueNullFieldError.checkNotNull(
                  companyName, r'CompanyDoctor', 'companyName'),
              doctor: doctor.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctor';
        doctor.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompanyDoctor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Doctor extends Doctor {
  @override
  final int id;
  @override
  final String name;
  @override
  final String gender;
  @override
  final String image;
  @override
  final String specialty;
  @override
  final String experience;
  @override
  final BuiltMap<String, BuiltList<Schedule>> schedules;
  @override
  final int price;
  @override
  final String location;
  @override
  final int workExperience;

  factory _$Doctor([void Function(DoctorBuilder)? updates]) =>
      (new DoctorBuilder()..update(updates))._build();

  _$Doctor._(
      {required this.id,
      required this.name,
      required this.gender,
      required this.image,
      required this.specialty,
      required this.experience,
      required this.schedules,
      required this.price,
      required this.location,
      required this.workExperience})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Doctor', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Doctor', 'name');
    BuiltValueNullFieldError.checkNotNull(gender, r'Doctor', 'gender');
    BuiltValueNullFieldError.checkNotNull(image, r'Doctor', 'image');
    BuiltValueNullFieldError.checkNotNull(specialty, r'Doctor', 'specialty');
    BuiltValueNullFieldError.checkNotNull(experience, r'Doctor', 'experience');
    BuiltValueNullFieldError.checkNotNull(schedules, r'Doctor', 'schedules');
    BuiltValueNullFieldError.checkNotNull(price, r'Doctor', 'price');
    BuiltValueNullFieldError.checkNotNull(location, r'Doctor', 'location');
    BuiltValueNullFieldError.checkNotNull(
        workExperience, r'Doctor', 'workExperience');
  }

  @override
  Doctor rebuild(void Function(DoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorBuilder toBuilder() => new DoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Doctor &&
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
    return (newBuiltValueToStringHelper(r'Doctor')
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

class DoctorBuilder implements Builder<Doctor, DoctorBuilder> {
  _$Doctor? _$v;

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

  MapBuilder<String, BuiltList<Schedule>>? _schedules;
  MapBuilder<String, BuiltList<Schedule>> get schedules =>
      _$this._schedules ??= new MapBuilder<String, BuiltList<Schedule>>();
  set schedules(MapBuilder<String, BuiltList<Schedule>>? schedules) =>
      _$this._schedules = schedules;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  int? _workExperience;
  int? get workExperience => _$this._workExperience;
  set workExperience(int? workExperience) =>
      _$this._workExperience = workExperience;

  DoctorBuilder();

  DoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _gender = $v.gender;
      _image = $v.image;
      _specialty = $v.specialty;
      _experience = $v.experience;
      _schedules = $v.schedules.toBuilder();
      _price = $v.price;
      _location = $v.location;
      _workExperience = $v.workExperience;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Doctor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Doctor;
  }

  @override
  void update(void Function(DoctorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Doctor build() => _build();

  _$Doctor _build() {
    _$Doctor _$result;
    try {
      _$result = _$v ??
          new _$Doctor._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Doctor', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Doctor', 'name'),
              gender: BuiltValueNullFieldError.checkNotNull(
                  gender, r'Doctor', 'gender'),
              image: BuiltValueNullFieldError.checkNotNull(
                  image, r'Doctor', 'image'),
              specialty: BuiltValueNullFieldError.checkNotNull(
                  specialty, r'Doctor', 'specialty'),
              experience: BuiltValueNullFieldError.checkNotNull(
                  experience, r'Doctor', 'experience'),
              schedules: schedules.build(),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'Doctor', 'price'),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'Doctor', 'location'),
              workExperience: BuiltValueNullFieldError.checkNotNull(
                  workExperience, r'Doctor', 'workExperience'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schedules';
        schedules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Doctor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Schedule extends Schedule {
  @override
  final String time;
  @override
  final bool active;
  @override
  final int duration;

  factory _$Schedule([void Function(ScheduleBuilder)? updates]) =>
      (new ScheduleBuilder()..update(updates))._build();

  _$Schedule._(
      {required this.time, required this.active, required this.duration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(time, r'Schedule', 'time');
    BuiltValueNullFieldError.checkNotNull(active, r'Schedule', 'active');
    BuiltValueNullFieldError.checkNotNull(duration, r'Schedule', 'duration');
  }

  @override
  Schedule rebuild(void Function(ScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleBuilder toBuilder() => new ScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schedule &&
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
    return (newBuiltValueToStringHelper(r'Schedule')
          ..add('time', time)
          ..add('active', active)
          ..add('duration', duration))
        .toString();
  }
}

class ScheduleBuilder implements Builder<Schedule, ScheduleBuilder> {
  _$Schedule? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  ScheduleBuilder();

  ScheduleBuilder get _$this {
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
  void replace(Schedule other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Schedule;
  }

  @override
  void update(void Function(ScheduleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Schedule build() => _build();

  _$Schedule _build() {
    final _$result = _$v ??
        new _$Schedule._(
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'Schedule', 'time'),
            active: BuiltValueNullFieldError.checkNotNull(
                active, r'Schedule', 'active'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'Schedule', 'duration'));
    replace(_$result);
    return _$result;
  }
}

class _$HomepageBookingCategory extends HomepageBookingCategory {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;

  factory _$HomepageBookingCategory(
          [void Function(HomepageBookingCategoryBuilder)? updates]) =>
      (new HomepageBookingCategoryBuilder()..update(updates))._build();

  _$HomepageBookingCategory._({this.id, this.name, this.icon}) : super._();

  @override
  HomepageBookingCategory rebuild(
          void Function(HomepageBookingCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomepageBookingCategoryBuilder toBuilder() =>
      new HomepageBookingCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomepageBookingCategory &&
        id == other.id &&
        name == other.name &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomepageBookingCategory')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon))
        .toString();
  }
}

class HomepageBookingCategoryBuilder
    implements
        Builder<HomepageBookingCategory, HomepageBookingCategoryBuilder> {
  _$HomepageBookingCategory? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  HomepageBookingCategoryBuilder();

  HomepageBookingCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomepageBookingCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomepageBookingCategory;
  }

  @override
  void update(void Function(HomepageBookingCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomepageBookingCategory build() => _build();

  _$HomepageBookingCategory _build() {
    final _$result =
        _$v ?? new _$HomepageBookingCategory._(id: id, name: name, icon: icon);
    replace(_$result);
    return _$result;
  }
}

class _$MedicalModel extends MedicalModel {
  @override
  final int? id;
  @override
  final String? description;
  @override
  final BuiltList<HomeMedicalDoctor> doctors;
  @override
  final BuiltList<HomeServiceBooking> services;

  factory _$MedicalModel([void Function(MedicalModelBuilder)? updates]) =>
      (new MedicalModelBuilder()..update(updates))._build();

  _$MedicalModel._(
      {this.id,
      this.description,
      required this.doctors,
      required this.services})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(doctors, r'MedicalModel', 'doctors');
    BuiltValueNullFieldError.checkNotNull(
        services, r'MedicalModel', 'services');
  }

  @override
  MedicalModel rebuild(void Function(MedicalModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicalModelBuilder toBuilder() => new MedicalModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicalModel &&
        id == other.id &&
        description == other.description &&
        doctors == other.doctors &&
        services == other.services;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, doctors.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedicalModel')
          ..add('id', id)
          ..add('description', description)
          ..add('doctors', doctors)
          ..add('services', services))
        .toString();
  }
}

class MedicalModelBuilder
    implements Builder<MedicalModel, MedicalModelBuilder> {
  _$MedicalModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<HomeMedicalDoctor>? _doctors;
  ListBuilder<HomeMedicalDoctor> get doctors =>
      _$this._doctors ??= new ListBuilder<HomeMedicalDoctor>();
  set doctors(ListBuilder<HomeMedicalDoctor>? doctors) =>
      _$this._doctors = doctors;

  ListBuilder<HomeServiceBooking>? _services;
  ListBuilder<HomeServiceBooking> get services =>
      _$this._services ??= new ListBuilder<HomeServiceBooking>();
  set services(ListBuilder<HomeServiceBooking>? services) =>
      _$this._services = services;

  MedicalModelBuilder();

  MedicalModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _description = $v.description;
      _doctors = $v.doctors.toBuilder();
      _services = $v.services.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicalModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MedicalModel;
  }

  @override
  void update(void Function(MedicalModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedicalModel build() => _build();

  _$MedicalModel _build() {
    _$MedicalModel _$result;
    try {
      _$result = _$v ??
          new _$MedicalModel._(
              id: id,
              description: description,
              doctors: doctors.build(),
              services: services.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctors';
        doctors.build();
        _$failedField = 'services';
        services.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MedicalModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$HomeMedicalDoctor extends HomeMedicalDoctor {
  @override
  final int? id;
  @override
  final String? image;
  @override
  final String? name;
  @override
  final String? jobName;
  @override
  final int? experienceYears;

  factory _$HomeMedicalDoctor(
          [void Function(HomeMedicalDoctorBuilder)? updates]) =>
      (new HomeMedicalDoctorBuilder()..update(updates))._build();

  _$HomeMedicalDoctor._(
      {this.id, this.image, this.name, this.jobName, this.experienceYears})
      : super._();

  @override
  HomeMedicalDoctor rebuild(void Function(HomeMedicalDoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeMedicalDoctorBuilder toBuilder() =>
      new HomeMedicalDoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeMedicalDoctor &&
        id == other.id &&
        image == other.image &&
        name == other.name &&
        jobName == other.jobName &&
        experienceYears == other.experienceYears;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, jobName.hashCode);
    _$hash = $jc(_$hash, experienceYears.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeMedicalDoctor')
          ..add('id', id)
          ..add('image', image)
          ..add('name', name)
          ..add('jobName', jobName)
          ..add('experienceYears', experienceYears))
        .toString();
  }
}

class HomeMedicalDoctorBuilder
    implements Builder<HomeMedicalDoctor, HomeMedicalDoctorBuilder> {
  _$HomeMedicalDoctor? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _jobName;
  String? get jobName => _$this._jobName;
  set jobName(String? jobName) => _$this._jobName = jobName;

  int? _experienceYears;
  int? get experienceYears => _$this._experienceYears;
  set experienceYears(int? experienceYears) =>
      _$this._experienceYears = experienceYears;

  HomeMedicalDoctorBuilder();

  HomeMedicalDoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _image = $v.image;
      _name = $v.name;
      _jobName = $v.jobName;
      _experienceYears = $v.experienceYears;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeMedicalDoctor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeMedicalDoctor;
  }

  @override
  void update(void Function(HomeMedicalDoctorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeMedicalDoctor build() => _build();

  _$HomeMedicalDoctor _build() {
    final _$result = _$v ??
        new _$HomeMedicalDoctor._(
            id: id,
            image: image,
            name: name,
            jobName: jobName,
            experienceYears: experienceYears);
    replace(_$result);
    return _$result;
  }
}

class _$HomeServiceBooking extends HomeServiceBooking {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? priceUzs;
  @override
  final int? priceUzd;

  factory _$HomeServiceBooking(
          [void Function(HomeServiceBookingBuilder)? updates]) =>
      (new HomeServiceBookingBuilder()..update(updates))._build();

  _$HomeServiceBooking._({this.id, this.name, this.priceUzs, this.priceUzd})
      : super._();

  @override
  HomeServiceBooking rebuild(
          void Function(HomeServiceBookingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeServiceBookingBuilder toBuilder() =>
      new HomeServiceBookingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeServiceBooking &&
        id == other.id &&
        name == other.name &&
        priceUzs == other.priceUzs &&
        priceUzd == other.priceUzd;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, priceUzs.hashCode);
    _$hash = $jc(_$hash, priceUzd.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeServiceBooking')
          ..add('id', id)
          ..add('name', name)
          ..add('priceUzs', priceUzs)
          ..add('priceUzd', priceUzd))
        .toString();
  }
}

class HomeServiceBookingBuilder
    implements Builder<HomeServiceBooking, HomeServiceBookingBuilder> {
  _$HomeServiceBooking? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _priceUzs;
  int? get priceUzs => _$this._priceUzs;
  set priceUzs(int? priceUzs) => _$this._priceUzs = priceUzs;

  int? _priceUzd;
  int? get priceUzd => _$this._priceUzd;
  set priceUzd(int? priceUzd) => _$this._priceUzd = priceUzd;

  HomeServiceBookingBuilder();

  HomeServiceBookingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _priceUzs = $v.priceUzs;
      _priceUzd = $v.priceUzd;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeServiceBooking other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeServiceBooking;
  }

  @override
  void update(void Function(HomeServiceBookingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeServiceBooking build() => _build();

  _$HomeServiceBooking _build() {
    final _$result = _$v ??
        new _$HomeServiceBooking._(
            id: id, name: name, priceUzs: priceUzs, priceUzd: priceUzd);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
