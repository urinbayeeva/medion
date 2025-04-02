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
Serializer<BookingThirdService> _$bookingThirdServiceSerializer =
    new _$BookingThirdServiceSerializer();
Serializer<CompanyDoctor> _$companyDoctorSerializer =
    new _$CompanyDoctorSerializer();
Serializer<Doctor> _$doctorSerializer = new _$DoctorSerializer();
Serializer<Schedule> _$scheduleSerializer = new _$ScheduleSerializer();
Serializer<ScheduleTime> _$scheduleTimeSerializer =
    new _$ScheduleTimeSerializer();
Serializer<HomepageBookingCategory> _$homepageBookingCategorySerializer =
    new _$HomepageBookingCategorySerializer();
Serializer<MedicalModel> _$medicalModelSerializer =
    new _$MedicalModelSerializer();
Serializer<HomeMedicalDoctor> _$homeMedicalDoctorSerializer =
    new _$HomeMedicalDoctorSerializer();
Serializer<HomeServiceBooking> _$homeServiceBookingSerializer =
    new _$HomeServiceBookingSerializer();
Serializer<CreatePatientBookingReq> _$createPatientBookingReqSerializer =
    new _$CreatePatientBookingReqSerializer();
Serializer<CreatePatientResponse> _$createPatientResponseSerializer =
    new _$CreatePatientResponseSerializer();
Serializer<CreatePatientServiceResponse>
    _$createPatientServiceResponseSerializer =
    new _$CreatePatientServiceResponseSerializer();
Serializer<CreatePatientRequest> _$createPatientRequestSerializer =
    new _$CreatePatientRequestSerializer();

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
      'categories',
      serializers.serialize(object.categories,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
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
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.priceUzs;
    if (value != null) {
      result
        ..add('doctor_price_start_uzs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.priceUsd;
    if (value != null) {
      result
        ..add('doctor_price_start_usd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
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
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_price_start_uzs':
          result.priceUzs = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'doctor_price_start_usd':
          result.priceUsd = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$BookingThirdServiceSerializer
    implements StructuredSerializer<BookingThirdService> {
  @override
  final Iterable<Type> types = const [
    BookingThirdService,
    _$BookingThirdService
  ];
  @override
  final String wireName = 'BookingThirdService';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BookingThirdService object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'companies_doctors',
      serializers.serialize(object.companiesDoctors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CompanyDoctor)])),
    ];
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
    return result;
  }

  @override
  BookingThirdService deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingThirdServiceBuilder();

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
      'doctor',
      serializers.serialize(object.doctor,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Doctor)])),
    ];
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
              specifiedType: const FullType(int)) as int?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
      'schedules',
      serializers.serialize(object.schedules,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Schedule)])),
    ];
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
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Schedule)]))!
              as BuiltList<Object?>);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ScheduleSerializer implements StructuredSerializer<Schedule> {
  @override
  final Iterable<Type> types = const [Schedule, _$Schedule];
  @override
  final String wireName = 'Schedule';

  @override
  Iterable<Object?> serialize(Serializers serializers, Schedule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'times',
      serializers.serialize(object.times,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ScheduleTime)])),
    ];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'times':
          result.times.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleTime)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ScheduleTimeSerializer implements StructuredSerializer<ScheduleTime> {
  @override
  final Iterable<Type> types = const [ScheduleTime, _$ScheduleTime];
  @override
  final String wireName = 'ScheduleTime';

  @override
  Iterable<Object?> serialize(Serializers serializers, ScheduleTime object,
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
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ScheduleTime deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleTimeBuilder();

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
              specifiedType: const FullType(int)) as int?;
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
        ..add('job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.experienceYears;
    if (value != null) {
      result
        ..add('experience_years')
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
        case 'job_name':
          result.jobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'experience_years':
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
        ..add('price_uzs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.priceUzd;
    if (value != null) {
      result
        ..add('price_uzd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
        case 'price_uzs':
          result.priceUzs = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'price_uzd':
          result.priceUzd = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$CreatePatientBookingReqSerializer
    implements StructuredSerializer<CreatePatientBookingReq> {
  @override
  final Iterable<Type> types = const [
    CreatePatientBookingReq,
    _$CreatePatientBookingReq
  ];
  @override
  final String wireName = 'CreatePatientBookingReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreatePatientBookingReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'service_id',
      serializers.serialize(object.serviceId,
          specifiedType: const FullType(int)),
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
      'doctor_id',
      serializers.serialize(object.doctorId,
          specifiedType: const FullType(int)),
      'start_time',
      serializers.serialize(object.startTime,
          specifiedType: const FullType(String)),
      'end_time',
      serializers.serialize(object.endTime,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CreatePatientBookingReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreatePatientBookingReqBuilder();

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
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'end_time':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CreatePatientResponseSerializer
    implements StructuredSerializer<CreatePatientResponse> {
  @override
  final Iterable<Type> types = const [
    CreatePatientResponse,
    _$CreatePatientResponse
  ];
  @override
  final String wireName = 'CreatePatientResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreatePatientResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.services;
    if (value != null) {
      result
        ..add('services')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Service)])));
    }
    value = object.paymeUrl;
    if (value != null) {
      result
        ..add('payme_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clickUrl;
    if (value != null) {
      result
        ..add('click_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.multicardUrl;
    if (value != null) {
      result
        ..add('multicard_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CreatePatientResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreatePatientResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Service)]))!
              as BuiltList<Object?>);
          break;
        case 'payme_url':
          result.paymeUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'click_url':
          result.clickUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'multicard_url':
          result.multicardUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CreatePatientServiceResponseSerializer
    implements StructuredSerializer<CreatePatientServiceResponse> {
  @override
  final Iterable<Type> types = const [
    CreatePatientServiceResponse,
    _$CreatePatientServiceResponse
  ];
  @override
  final String wireName = 'CreatePatientServiceResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreatePatientServiceResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.doctorId;
    if (value != null) {
      result
        ..add('doctor_id')
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
    value = object.companyId;
    if (value != null) {
      result
        ..add('company_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mainServiceId;
    if (value != null) {
      result
        ..add('main_service_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productType;
    if (value != null) {
      result
        ..add('product_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorFirstVisitPriceUzs;
    if (value != null) {
      result
        ..add('doctor_first_visit_price_uzs')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.doctorFirstVisitPriceUzd;
    if (value != null) {
      result
        ..add('doctor_first_visit_price_uzd')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.doctorRevisitPriceUzs;
    if (value != null) {
      result
        ..add('doctor_revisit_price_uzs')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.doctorRevisitPriceUzd;
    if (value != null) {
      result
        ..add('doctor_revisit_price_uzd')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startTime;
    if (value != null) {
      result
        ..add('start_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CreatePatientServiceResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreatePatientServiceResponseBuilder();

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
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'main_service_id':
          result.mainServiceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_type':
          result.productType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_first_visit_price_uzs':
          result.doctorFirstVisitPriceUzs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'doctor_first_visit_price_uzd':
          result.doctorFirstVisitPriceUzd = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'doctor_revisit_price_uzs':
          result.doctorRevisitPriceUzs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'doctor_revisit_price_uzd':
          result.doctorRevisitPriceUzd = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CreatePatientRequestSerializer
    implements StructuredSerializer<CreatePatientRequest> {
  @override
  final Iterable<Type> types = const [
    CreatePatientRequest,
    _$CreatePatientRequest
  ];
  @override
  final String wireName = 'CreatePatientRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreatePatientRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'service_id',
      serializers.serialize(object.serviceId,
          specifiedType: const FullType(int)),
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
      'doctor_id',
      serializers.serialize(object.doctorId,
          specifiedType: const FullType(int)),
      'start_time',
      serializers.serialize(object.startTime,
          specifiedType: const FullType(String)),
      'end_time',
      serializers.serialize(object.endTime,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CreatePatientRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreatePatientRequestBuilder();

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
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'end_time':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
  @override
  final BuiltList<String> categories;

  factory _$BookingTypeModel(
          [void Function(BookingTypeModelBuilder)? updates]) =>
      (new BookingTypeModelBuilder()..update(updates))._build();

  _$BookingTypeModel._(
      {required this.id,
      required this.name,
      this.icon,
      required this.categories})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'BookingTypeModel', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'BookingTypeModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        categories, r'BookingTypeModel', 'categories');
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
        icon == other.icon &&
        categories == other.categories;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookingTypeModel')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon)
          ..add('categories', categories))
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

  ListBuilder<String>? _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String>? categories) =>
      _$this._categories = categories;

  BookingTypeModelBuilder();

  BookingTypeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _icon = $v.icon;
      _categories = $v.categories.toBuilder();
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
    _$BookingTypeModel _$result;
    try {
      _$result = _$v ??
          new _$BookingTypeModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'BookingTypeModel', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'BookingTypeModel', 'name'),
            icon: icon,
            categories: categories.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        categories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BookingTypeModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Service extends Service {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? priceUzs;
  @override
  final double? priceUsd;
  @override
  final String? age;

  factory _$Service([void Function(ServiceBuilder)? updates]) =>
      (new ServiceBuilder()..update(updates))._build();

  _$Service._(
      {this.id,
      this.name,
      this.description,
      this.priceUzs,
      this.priceUsd,
      this.age})
      : super._();

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
          id: id,
          name: name,
          description: description,
          priceUzs: priceUzs,
          priceUsd: priceUsd,
          age: age,
        );
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
            services: services.build(),
          );
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
      _$result = _$v ??
          new _$GiveSelectedId._(
            serviceIds: serviceIds.build(),
          );
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

class _$BookingThirdService extends BookingThirdService {
  @override
  final int? serviceId;
  @override
  final String? serviceName;
  @override
  final BuiltList<CompanyDoctor> companiesDoctors;

  factory _$BookingThirdService(
          [void Function(BookingThirdServiceBuilder)? updates]) =>
      (new BookingThirdServiceBuilder()..update(updates))._build();

  _$BookingThirdService._(
      {this.serviceId, this.serviceName, required this.companiesDoctors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        companiesDoctors, r'BookingThirdService', 'companiesDoctors');
  }

  @override
  BookingThirdService rebuild(
          void Function(BookingThirdServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingThirdServiceBuilder toBuilder() =>
      new BookingThirdServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingThirdService &&
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
    return (newBuiltValueToStringHelper(r'BookingThirdService')
          ..add('serviceId', serviceId)
          ..add('serviceName', serviceName)
          ..add('companiesDoctors', companiesDoctors))
        .toString();
  }
}

class BookingThirdServiceBuilder
    implements Builder<BookingThirdService, BookingThirdServiceBuilder> {
  _$BookingThirdService? _$v;

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

  BookingThirdServiceBuilder();

  BookingThirdServiceBuilder get _$this {
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
  void replace(BookingThirdService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingThirdService;
  }

  @override
  void update(void Function(BookingThirdServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookingThirdService build() => _build();

  _$BookingThirdService _build() {
    _$BookingThirdService _$result;
    try {
      _$result = _$v ??
          new _$BookingThirdService._(
            serviceId: serviceId,
            serviceName: serviceName,
            companiesDoctors: companiesDoctors.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'companiesDoctors';
        companiesDoctors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BookingThirdService', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompanyDoctor extends CompanyDoctor {
  @override
  final int? companyId;
  @override
  final String? companyName;
  @override
  final BuiltList<Doctor> doctor;

  factory _$CompanyDoctor([void Function(CompanyDoctorBuilder)? updates]) =>
      (new CompanyDoctorBuilder()..update(updates))._build();

  _$CompanyDoctor._({this.companyId, this.companyName, required this.doctor})
      : super._() {
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
            companyId: companyId,
            companyName: companyName,
            doctor: doctor.build(),
          );
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
  final BuiltList<Schedule> schedules;
  @override
  final int? price;
  @override
  final String? location;
  @override
  final int? workExperience;

  factory _$Doctor([void Function(DoctorBuilder)? updates]) =>
      (new DoctorBuilder()..update(updates))._build();

  _$Doctor._(
      {this.id,
      this.name,
      this.gender,
      this.image,
      this.specialty,
      this.experience,
      required this.schedules,
      this.price,
      this.location,
      this.workExperience})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(schedules, r'Doctor', 'schedules');
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

  ListBuilder<Schedule>? _schedules;
  ListBuilder<Schedule> get schedules =>
      _$this._schedules ??= new ListBuilder<Schedule>();
  set schedules(ListBuilder<Schedule>? schedules) =>
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
            id: id,
            name: name,
            gender: gender,
            image: image,
            specialty: specialty,
            experience: experience,
            schedules: schedules.build(),
            price: price,
            location: location,
            workExperience: workExperience,
          );
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
  final String? date;
  @override
  final BuiltList<ScheduleTime> times;

  factory _$Schedule([void Function(ScheduleBuilder)? updates]) =>
      (new ScheduleBuilder()..update(updates))._build();

  _$Schedule._({this.date, required this.times}) : super._() {
    BuiltValueNullFieldError.checkNotNull(times, r'Schedule', 'times');
  }

  @override
  Schedule rebuild(void Function(ScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleBuilder toBuilder() => new ScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schedule && date == other.date && times == other.times;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, times.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Schedule')
          ..add('date', date)
          ..add('times', times))
        .toString();
  }
}

class ScheduleBuilder implements Builder<Schedule, ScheduleBuilder> {
  _$Schedule? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  ListBuilder<ScheduleTime>? _times;
  ListBuilder<ScheduleTime> get times =>
      _$this._times ??= new ListBuilder<ScheduleTime>();
  set times(ListBuilder<ScheduleTime>? times) => _$this._times = times;

  ScheduleBuilder();

  ScheduleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _times = $v.times.toBuilder();
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
    _$Schedule _$result;
    try {
      _$result = _$v ??
          new _$Schedule._(
            date: date,
            times: times.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'times';
        times.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Schedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ScheduleTime extends ScheduleTime {
  @override
  final String? time;
  @override
  final bool? active;
  @override
  final int? duration;

  factory _$ScheduleTime([void Function(ScheduleTimeBuilder)? updates]) =>
      (new ScheduleTimeBuilder()..update(updates))._build();

  _$ScheduleTime._({this.time, this.active, this.duration}) : super._();

  @override
  ScheduleTime rebuild(void Function(ScheduleTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleTimeBuilder toBuilder() => new ScheduleTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleTime &&
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
    return (newBuiltValueToStringHelper(r'ScheduleTime')
          ..add('time', time)
          ..add('active', active)
          ..add('duration', duration))
        .toString();
  }
}

class ScheduleTimeBuilder
    implements Builder<ScheduleTime, ScheduleTimeBuilder> {
  _$ScheduleTime? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  ScheduleTimeBuilder();

  ScheduleTimeBuilder get _$this {
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
  void replace(ScheduleTime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScheduleTime;
  }

  @override
  void update(void Function(ScheduleTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScheduleTime build() => _build();

  _$ScheduleTime _build() {
    final _$result = _$v ??
        new _$ScheduleTime._(
          time: time,
          active: active,
          duration: duration,
        );
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
    final _$result = _$v ??
        new _$HomepageBookingCategory._(
          id: id,
          name: name,
          icon: icon,
        );
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
            services: services.build(),
          );
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
          experienceYears: experienceYears,
        );
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
  final double? priceUzs;
  @override
  final double? priceUzd;

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

  double? _priceUzs;
  double? get priceUzs => _$this._priceUzs;
  set priceUzs(double? priceUzs) => _$this._priceUzs = priceUzs;

  double? _priceUzd;
  double? get priceUzd => _$this._priceUzd;
  set priceUzd(double? priceUzd) => _$this._priceUzd = priceUzd;

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
          id: id,
          name: name,
          priceUzs: priceUzs,
          priceUzd: priceUzd,
        );
    replace(_$result);
    return _$result;
  }
}

class _$CreatePatientBookingReq extends CreatePatientBookingReq {
  @override
  final int serviceId;
  @override
  final int companyId;
  @override
  final int doctorId;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String date;

  factory _$CreatePatientBookingReq(
          [void Function(CreatePatientBookingReqBuilder)? updates]) =>
      (new CreatePatientBookingReqBuilder()..update(updates))._build();

  _$CreatePatientBookingReq._(
      {required this.serviceId,
      required this.companyId,
      required this.doctorId,
      required this.startTime,
      required this.endTime,
      required this.date})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        serviceId, r'CreatePatientBookingReq', 'serviceId');
    BuiltValueNullFieldError.checkNotNull(
        companyId, r'CreatePatientBookingReq', 'companyId');
    BuiltValueNullFieldError.checkNotNull(
        doctorId, r'CreatePatientBookingReq', 'doctorId');
    BuiltValueNullFieldError.checkNotNull(
        startTime, r'CreatePatientBookingReq', 'startTime');
    BuiltValueNullFieldError.checkNotNull(
        endTime, r'CreatePatientBookingReq', 'endTime');
    BuiltValueNullFieldError.checkNotNull(
        date, r'CreatePatientBookingReq', 'date');
  }

  @override
  CreatePatientBookingReq rebuild(
          void Function(CreatePatientBookingReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePatientBookingReqBuilder toBuilder() =>
      new CreatePatientBookingReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePatientBookingReq &&
        serviceId == other.serviceId &&
        companyId == other.companyId &&
        doctorId == other.doctorId &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePatientBookingReq')
          ..add('serviceId', serviceId)
          ..add('companyId', companyId)
          ..add('doctorId', doctorId)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('date', date))
        .toString();
  }
}

class CreatePatientBookingReqBuilder
    implements
        Builder<CreatePatientBookingReq, CreatePatientBookingReqBuilder> {
  _$CreatePatientBookingReq? _$v;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  CreatePatientBookingReqBuilder();

  CreatePatientBookingReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _companyId = $v.companyId;
      _doctorId = $v.doctorId;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePatientBookingReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatePatientBookingReq;
  }

  @override
  void update(void Function(CreatePatientBookingReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePatientBookingReq build() => _build();

  _$CreatePatientBookingReq _build() {
    final _$result = _$v ??
        new _$CreatePatientBookingReq._(
          serviceId: BuiltValueNullFieldError.checkNotNull(
              serviceId, r'CreatePatientBookingReq', 'serviceId'),
          companyId: BuiltValueNullFieldError.checkNotNull(
              companyId, r'CreatePatientBookingReq', 'companyId'),
          doctorId: BuiltValueNullFieldError.checkNotNull(
              doctorId, r'CreatePatientBookingReq', 'doctorId'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'CreatePatientBookingReq', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'CreatePatientBookingReq', 'endTime'),
          date: BuiltValueNullFieldError.checkNotNull(
              date, r'CreatePatientBookingReq', 'date'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$CreatePatientResponse extends CreatePatientResponse {
  @override
  final BuiltList<Service>? services;
  @override
  final String? paymeUrl;
  @override
  final String? clickUrl;
  @override
  final String? multicardUrl;

  factory _$CreatePatientResponse(
          [void Function(CreatePatientResponseBuilder)? updates]) =>
      (new CreatePatientResponseBuilder()..update(updates))._build();

  _$CreatePatientResponse._(
      {this.services, this.paymeUrl, this.clickUrl, this.multicardUrl})
      : super._();

  @override
  CreatePatientResponse rebuild(
          void Function(CreatePatientResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePatientResponseBuilder toBuilder() =>
      new CreatePatientResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePatientResponse &&
        services == other.services &&
        paymeUrl == other.paymeUrl &&
        clickUrl == other.clickUrl &&
        multicardUrl == other.multicardUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, paymeUrl.hashCode);
    _$hash = $jc(_$hash, clickUrl.hashCode);
    _$hash = $jc(_$hash, multicardUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePatientResponse')
          ..add('services', services)
          ..add('paymeUrl', paymeUrl)
          ..add('clickUrl', clickUrl)
          ..add('multicardUrl', multicardUrl))
        .toString();
  }
}

class CreatePatientResponseBuilder
    implements Builder<CreatePatientResponse, CreatePatientResponseBuilder> {
  _$CreatePatientResponse? _$v;

  ListBuilder<Service>? _services;
  ListBuilder<Service> get services =>
      _$this._services ??= new ListBuilder<Service>();
  set services(ListBuilder<Service>? services) => _$this._services = services;

  String? _paymeUrl;
  String? get paymeUrl => _$this._paymeUrl;
  set paymeUrl(String? paymeUrl) => _$this._paymeUrl = paymeUrl;

  String? _clickUrl;
  String? get clickUrl => _$this._clickUrl;
  set clickUrl(String? clickUrl) => _$this._clickUrl = clickUrl;

  String? _multicardUrl;
  String? get multicardUrl => _$this._multicardUrl;
  set multicardUrl(String? multicardUrl) => _$this._multicardUrl = multicardUrl;

  CreatePatientResponseBuilder();

  CreatePatientResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _services = $v.services?.toBuilder();
      _paymeUrl = $v.paymeUrl;
      _clickUrl = $v.clickUrl;
      _multicardUrl = $v.multicardUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePatientResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatePatientResponse;
  }

  @override
  void update(void Function(CreatePatientResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePatientResponse build() => _build();

  _$CreatePatientResponse _build() {
    _$CreatePatientResponse _$result;
    try {
      _$result = _$v ??
          new _$CreatePatientResponse._(
            services: _services?.build(),
            paymeUrl: paymeUrl,
            clickUrl: clickUrl,
            multicardUrl: multicardUrl,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        _services?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreatePatientResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CreatePatientServiceResponse extends CreatePatientServiceResponse {
  @override
  final int? id;
  @override
  final String? doctorId;
  @override
  final String? image;
  @override
  final String? companyId;
  @override
  final String? mainServiceId;
  @override
  final String? productType;
  @override
  final int? doctorFirstVisitPriceUzs;
  @override
  final int? doctorFirstVisitPriceUzd;
  @override
  final int? doctorRevisitPriceUzs;
  @override
  final int? doctorRevisitPriceUzd;
  @override
  final String? date;
  @override
  final String? startTime;

  factory _$CreatePatientServiceResponse(
          [void Function(CreatePatientServiceResponseBuilder)? updates]) =>
      (new CreatePatientServiceResponseBuilder()..update(updates))._build();

  _$CreatePatientServiceResponse._(
      {this.id,
      this.doctorId,
      this.image,
      this.companyId,
      this.mainServiceId,
      this.productType,
      this.doctorFirstVisitPriceUzs,
      this.doctorFirstVisitPriceUzd,
      this.doctorRevisitPriceUzs,
      this.doctorRevisitPriceUzd,
      this.date,
      this.startTime})
      : super._();

  @override
  CreatePatientServiceResponse rebuild(
          void Function(CreatePatientServiceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePatientServiceResponseBuilder toBuilder() =>
      new CreatePatientServiceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePatientServiceResponse &&
        id == other.id &&
        doctorId == other.doctorId &&
        image == other.image &&
        companyId == other.companyId &&
        mainServiceId == other.mainServiceId &&
        productType == other.productType &&
        doctorFirstVisitPriceUzs == other.doctorFirstVisitPriceUzs &&
        doctorFirstVisitPriceUzd == other.doctorFirstVisitPriceUzd &&
        doctorRevisitPriceUzs == other.doctorRevisitPriceUzs &&
        doctorRevisitPriceUzd == other.doctorRevisitPriceUzd &&
        date == other.date &&
        startTime == other.startTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, mainServiceId.hashCode);
    _$hash = $jc(_$hash, productType.hashCode);
    _$hash = $jc(_$hash, doctorFirstVisitPriceUzs.hashCode);
    _$hash = $jc(_$hash, doctorFirstVisitPriceUzd.hashCode);
    _$hash = $jc(_$hash, doctorRevisitPriceUzs.hashCode);
    _$hash = $jc(_$hash, doctorRevisitPriceUzd.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePatientServiceResponse')
          ..add('id', id)
          ..add('doctorId', doctorId)
          ..add('image', image)
          ..add('companyId', companyId)
          ..add('mainServiceId', mainServiceId)
          ..add('productType', productType)
          ..add('doctorFirstVisitPriceUzs', doctorFirstVisitPriceUzs)
          ..add('doctorFirstVisitPriceUzd', doctorFirstVisitPriceUzd)
          ..add('doctorRevisitPriceUzs', doctorRevisitPriceUzs)
          ..add('doctorRevisitPriceUzd', doctorRevisitPriceUzd)
          ..add('date', date)
          ..add('startTime', startTime))
        .toString();
  }
}

class CreatePatientServiceResponseBuilder
    implements
        Builder<CreatePatientServiceResponse,
            CreatePatientServiceResponseBuilder> {
  _$CreatePatientServiceResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(String? doctorId) => _$this._doctorId = doctorId;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _companyId;
  String? get companyId => _$this._companyId;
  set companyId(String? companyId) => _$this._companyId = companyId;

  String? _mainServiceId;
  String? get mainServiceId => _$this._mainServiceId;
  set mainServiceId(String? mainServiceId) =>
      _$this._mainServiceId = mainServiceId;

  String? _productType;
  String? get productType => _$this._productType;
  set productType(String? productType) => _$this._productType = productType;

  int? _doctorFirstVisitPriceUzs;
  int? get doctorFirstVisitPriceUzs => _$this._doctorFirstVisitPriceUzs;
  set doctorFirstVisitPriceUzs(int? doctorFirstVisitPriceUzs) =>
      _$this._doctorFirstVisitPriceUzs = doctorFirstVisitPriceUzs;

  int? _doctorFirstVisitPriceUzd;
  int? get doctorFirstVisitPriceUzd => _$this._doctorFirstVisitPriceUzd;
  set doctorFirstVisitPriceUzd(int? doctorFirstVisitPriceUzd) =>
      _$this._doctorFirstVisitPriceUzd = doctorFirstVisitPriceUzd;

  int? _doctorRevisitPriceUzs;
  int? get doctorRevisitPriceUzs => _$this._doctorRevisitPriceUzs;
  set doctorRevisitPriceUzs(int? doctorRevisitPriceUzs) =>
      _$this._doctorRevisitPriceUzs = doctorRevisitPriceUzs;

  int? _doctorRevisitPriceUzd;
  int? get doctorRevisitPriceUzd => _$this._doctorRevisitPriceUzd;
  set doctorRevisitPriceUzd(int? doctorRevisitPriceUzd) =>
      _$this._doctorRevisitPriceUzd = doctorRevisitPriceUzd;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  CreatePatientServiceResponseBuilder();

  CreatePatientServiceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _doctorId = $v.doctorId;
      _image = $v.image;
      _companyId = $v.companyId;
      _mainServiceId = $v.mainServiceId;
      _productType = $v.productType;
      _doctorFirstVisitPriceUzs = $v.doctorFirstVisitPriceUzs;
      _doctorFirstVisitPriceUzd = $v.doctorFirstVisitPriceUzd;
      _doctorRevisitPriceUzs = $v.doctorRevisitPriceUzs;
      _doctorRevisitPriceUzd = $v.doctorRevisitPriceUzd;
      _date = $v.date;
      _startTime = $v.startTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePatientServiceResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatePatientServiceResponse;
  }

  @override
  void update(void Function(CreatePatientServiceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePatientServiceResponse build() => _build();

  _$CreatePatientServiceResponse _build() {
    final _$result = _$v ??
        new _$CreatePatientServiceResponse._(
          id: id,
          doctorId: doctorId,
          image: image,
          companyId: companyId,
          mainServiceId: mainServiceId,
          productType: productType,
          doctorFirstVisitPriceUzs: doctorFirstVisitPriceUzs,
          doctorFirstVisitPriceUzd: doctorFirstVisitPriceUzd,
          doctorRevisitPriceUzs: doctorRevisitPriceUzs,
          doctorRevisitPriceUzd: doctorRevisitPriceUzd,
          date: date,
          startTime: startTime,
        );
    replace(_$result);
    return _$result;
  }
}

class _$CreatePatientRequest extends CreatePatientRequest {
  @override
  final int serviceId;
  @override
  final int companyId;
  @override
  final int doctorId;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String date;

  factory _$CreatePatientRequest(
          [void Function(CreatePatientRequestBuilder)? updates]) =>
      (new CreatePatientRequestBuilder()..update(updates))._build();

  _$CreatePatientRequest._(
      {required this.serviceId,
      required this.companyId,
      required this.doctorId,
      required this.startTime,
      required this.endTime,
      required this.date})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        serviceId, r'CreatePatientRequest', 'serviceId');
    BuiltValueNullFieldError.checkNotNull(
        companyId, r'CreatePatientRequest', 'companyId');
    BuiltValueNullFieldError.checkNotNull(
        doctorId, r'CreatePatientRequest', 'doctorId');
    BuiltValueNullFieldError.checkNotNull(
        startTime, r'CreatePatientRequest', 'startTime');
    BuiltValueNullFieldError.checkNotNull(
        endTime, r'CreatePatientRequest', 'endTime');
    BuiltValueNullFieldError.checkNotNull(
        date, r'CreatePatientRequest', 'date');
  }

  @override
  CreatePatientRequest rebuild(
          void Function(CreatePatientRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePatientRequestBuilder toBuilder() =>
      new CreatePatientRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePatientRequest &&
        serviceId == other.serviceId &&
        companyId == other.companyId &&
        doctorId == other.doctorId &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePatientRequest')
          ..add('serviceId', serviceId)
          ..add('companyId', companyId)
          ..add('doctorId', doctorId)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('date', date))
        .toString();
  }
}

class CreatePatientRequestBuilder
    implements Builder<CreatePatientRequest, CreatePatientRequestBuilder> {
  _$CreatePatientRequest? _$v;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  CreatePatientRequestBuilder();

  CreatePatientRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _companyId = $v.companyId;
      _doctorId = $v.doctorId;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePatientRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatePatientRequest;
  }

  @override
  void update(void Function(CreatePatientRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePatientRequest build() => _build();

  _$CreatePatientRequest _build() {
    final _$result = _$v ??
        new _$CreatePatientRequest._(
          serviceId: BuiltValueNullFieldError.checkNotNull(
              serviceId, r'CreatePatientRequest', 'serviceId'),
          companyId: BuiltValueNullFieldError.checkNotNull(
              companyId, r'CreatePatientRequest', 'companyId'),
          doctorId: BuiltValueNullFieldError.checkNotNull(
              doctorId, r'CreatePatientRequest', 'doctorId'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'CreatePatientRequest', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'CreatePatientRequest', 'endTime'),
          date: BuiltValueNullFieldError.checkNotNull(
              date, r'CreatePatientRequest', 'date'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$MedicalServiceCategory extends MedicalServiceCategory {
  @override
  final String categoryName;
  @override
  final BuiltList<MedicalService> services;

  factory _$MedicalServiceCategory(
          [void Function(MedicalServiceCategoryBuilder)? updates]) =>
      (new MedicalServiceCategoryBuilder()..update(updates))._build();

  _$MedicalServiceCategory._(
      {required this.categoryName, required this.services})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryName, r'MedicalServiceCategory', 'categoryName');
    BuiltValueNullFieldError.checkNotNull(
        services, r'MedicalServiceCategory', 'services');
  }

  @override
  MedicalServiceCategory rebuild(
          void Function(MedicalServiceCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicalServiceCategoryBuilder toBuilder() =>
      new MedicalServiceCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicalServiceCategory &&
        categoryName == other.categoryName &&
        services == other.services;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedicalServiceCategory')
          ..add('categoryName', categoryName)
          ..add('services', services))
        .toString();
  }
}

class MedicalServiceCategoryBuilder
    implements Builder<MedicalServiceCategory, MedicalServiceCategoryBuilder> {
  _$MedicalServiceCategory? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  ListBuilder<MedicalService>? _services;
  ListBuilder<MedicalService> get services =>
      _$this._services ??= new ListBuilder<MedicalService>();
  set services(ListBuilder<MedicalService>? services) =>
      _$this._services = services;

  MedicalServiceCategoryBuilder();

  MedicalServiceCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _services = $v.services.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicalServiceCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MedicalServiceCategory;
  }

  @override
  void update(void Function(MedicalServiceCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedicalServiceCategory build() => _build();

  _$MedicalServiceCategory _build() {
    _$MedicalServiceCategory _$result;
    try {
      _$result = _$v ??
          new _$MedicalServiceCategory._(
            categoryName: BuiltValueNullFieldError.checkNotNull(
                categoryName, r'MedicalServiceCategory', 'categoryName'),
            services: services.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        services.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MedicalServiceCategory', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MedicalService extends MedicalService {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool description;
  @override
  final int doctorPriceStartUzs;
  @override
  final int doctorPriceStartUsd;
  @override
  final bool isChild;

  factory _$MedicalService([void Function(MedicalServiceBuilder)? updates]) =>
      (new MedicalServiceBuilder()..update(updates))._build();

  _$MedicalService._(
      {required this.id,
      required this.name,
      required this.description,
      required this.doctorPriceStartUzs,
      required this.doctorPriceStartUsd,
      required this.isChild})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'MedicalService', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'MedicalService', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, r'MedicalService', 'description');
    BuiltValueNullFieldError.checkNotNull(
        doctorPriceStartUzs, r'MedicalService', 'doctorPriceStartUzs');
    BuiltValueNullFieldError.checkNotNull(
        doctorPriceStartUsd, r'MedicalService', 'doctorPriceStartUsd');
    BuiltValueNullFieldError.checkNotNull(
        isChild, r'MedicalService', 'isChild');
  }

  @override
  MedicalService rebuild(void Function(MedicalServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicalServiceBuilder toBuilder() =>
      new MedicalServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicalService &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        doctorPriceStartUzs == other.doctorPriceStartUzs &&
        doctorPriceStartUsd == other.doctorPriceStartUsd &&
        isChild == other.isChild;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, doctorPriceStartUzs.hashCode);
    _$hash = $jc(_$hash, doctorPriceStartUsd.hashCode);
    _$hash = $jc(_$hash, isChild.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedicalService')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('doctorPriceStartUzs', doctorPriceStartUzs)
          ..add('doctorPriceStartUsd', doctorPriceStartUsd)
          ..add('isChild', isChild))
        .toString();
  }
}

class MedicalServiceBuilder
    implements Builder<MedicalService, MedicalServiceBuilder> {
  _$MedicalService? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _description;
  bool? get description => _$this._description;
  set description(bool? description) => _$this._description = description;

  int? _doctorPriceStartUzs;
  int? get doctorPriceStartUzs => _$this._doctorPriceStartUzs;
  set doctorPriceStartUzs(int? doctorPriceStartUzs) =>
      _$this._doctorPriceStartUzs = doctorPriceStartUzs;

  int? _doctorPriceStartUsd;
  int? get doctorPriceStartUsd => _$this._doctorPriceStartUsd;
  set doctorPriceStartUsd(int? doctorPriceStartUsd) =>
      _$this._doctorPriceStartUsd = doctorPriceStartUsd;

  bool? _isChild;
  bool? get isChild => _$this._isChild;
  set isChild(bool? isChild) => _$this._isChild = isChild;

  MedicalServiceBuilder();

  MedicalServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _doctorPriceStartUzs = $v.doctorPriceStartUzs;
      _doctorPriceStartUsd = $v.doctorPriceStartUsd;
      _isChild = $v.isChild;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicalService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MedicalService;
  }

  @override
  void update(void Function(MedicalServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedicalService build() => _build();

  _$MedicalService _build() {
    final _$result = _$v ??
        new _$MedicalService._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'MedicalService', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'MedicalService', 'name'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'MedicalService', 'description'),
          doctorPriceStartUzs: BuiltValueNullFieldError.checkNotNull(
              doctorPriceStartUzs, r'MedicalService', 'doctorPriceStartUzs'),
          doctorPriceStartUsd: BuiltValueNullFieldError.checkNotNull(
              doctorPriceStartUsd, r'MedicalService', 'doctorPriceStartUsd'),
          isChild: BuiltValueNullFieldError.checkNotNull(
              isChild, r'MedicalService', 'isChild'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
