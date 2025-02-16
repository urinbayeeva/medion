import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:medion/domain/serializers/serializer.dart';

part 'booking_type_model.g.dart';

abstract class BookingTypeModel
    implements Built<BookingTypeModel, BookingTypeModelBuilder> {
  int get id;
  String get name;
  String? get icon;

  BookingTypeModel._();
  factory BookingTypeModel([void Function(BookingTypeModelBuilder) updates]) =
      _$BookingTypeModel;

  static Serializer<BookingTypeModel> get serializer =>
      _$bookingTypeModelSerializer;
}

abstract class Service implements Built<Service, ServiceBuilder> {
  Service._();

  factory Service([Function(ServiceBuilder b) updates]) = _$Service;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'doctor_price_start_uzs')
  double get priceUzs;

  @BuiltValueField(wireName: 'doctor_price_start_usd')
  double get priceUsd;

  @BuiltValueField(wireName: 'age')
  String get age;

  String toJson() {
    return json.encode(serializers.serializeWith(Service.serializer, this));
  }

  static Service? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Service.serializer, json.decode(jsonString));
  }

  static Serializer<Service> get serializer => _$serviceSerializer;
}

abstract class Category implements Built<Category, CategoryBuilder> {
  Category._();

  factory Category([Function(CategoryBuilder b) updates]) = _$Category;

  @BuiltValueField(wireName: 'category_name')
  JsonObject get name;

  @BuiltValueField(wireName: 'services')
  BuiltList<Service> get services;

  String toJson() {
    return json.encode(serializers.serializeWith(Category.serializer, this));
  }

  static Category? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Category.serializer, json.decode(jsonString));
  }

  static Serializer<Category> get serializer => _$categorySerializer;
}

abstract class GiveSelectedId
    implements Built<GiveSelectedId, GiveSelectedIdBuilder> {
  BuiltList<int> get serviceIds;

  GiveSelectedId._();

  factory GiveSelectedId([void Function(GiveSelectedIdBuilder) updates]) =
      _$GiveSelectedId;

  static Serializer<GiveSelectedId> get serializer =>
      _$giveSelectedIdSerializer;
}

///BOOKING THIRD PAGE

/// Top-level Service model
abstract class BookingThirdService
    implements Built<BookingThirdService, BookingThirdServiceBuilder> {
  @BuiltValueField(wireName: "service_id")
  int? get serviceId;

  @BuiltValueField(wireName: "service_name")
  String? get serviceName;

  @BuiltValueField(wireName: "companies_doctors")
  BuiltList<CompanyDoctor> get companiesDoctors;

  BookingThirdService._();
  factory BookingThirdService(
          [void Function(BookingThirdServiceBuilder) updates]) =
      _$BookingThirdService;

  static Serializer<BookingThirdService> get serializer =>
      _$bookingThirdServiceSerializer;
}

/// CompanyDoctor model
abstract class CompanyDoctor
    implements Built<CompanyDoctor, CompanyDoctorBuilder> {
  @BuiltValueField(wireName: "company_id")
  int? get companyId;

  @BuiltValueField(wireName: "company_name")
  String? get companyName;

  BuiltList<Doctor> get doctor;

  CompanyDoctor._();
  factory CompanyDoctor([void Function(CompanyDoctorBuilder) updates]) =
      _$CompanyDoctor;

  static Serializer<CompanyDoctor> get serializer => _$companyDoctorSerializer;
}

/// Doctor model
abstract class Doctor implements Built<Doctor, DoctorBuilder> {
  @BuiltValueField(wireName: "id")
  int? get id;

  @BuiltValueField(wireName: "name")
  String? get name;

  @BuiltValueField(wireName: "gender")
  String? get gender;

  @BuiltValueField(wireName: "image")
  String? get image;

  @BuiltValueField(wireName: "specialty")
  String? get specialty;

  @BuiltValueField(wireName: "experience")
  String? get experience;

  @BuiltValueField(wireName: "schedules")
  BuiltList<Schedule> get schedules;

  @BuiltValueField(wireName: "price")
  int? get price;

  @BuiltValueField(wireName: "location")
  String? get location;

  @BuiltValueField(wireName: "work_experience")
  int? get workExperience;

  Doctor._();
  factory Doctor([void Function(DoctorBuilder) updates]) = _$Doctor;

  static Serializer<Doctor> get serializer => _$doctorSerializer;
}

/// Schedule model
abstract class Schedule implements Built<Schedule, ScheduleBuilder> {
  @BuiltValueField(wireName: "date")
  String? get date;

  @BuiltValueField(wireName: "times")
  BuiltList<ScheduleTime> get times;

  Schedule._();
  factory Schedule([void Function(ScheduleBuilder) updates]) = _$Schedule;

  static Serializer<Schedule> get serializer => _$scheduleSerializer;
}

/// ScheduleTime model
abstract class ScheduleTime
    implements Built<ScheduleTime, ScheduleTimeBuilder> {
  @BuiltValueField(wireName: "time")
  String? get time;

  @BuiltValueField(wireName: "active")
  bool? get active;

  @BuiltValueField(wireName: "duration")
  int? get duration;

  ScheduleTime._();
  factory ScheduleTime([void Function(ScheduleTimeBuilder) updates]) =
      _$ScheduleTime;

  static Serializer<ScheduleTime> get serializer => _$scheduleTimeSerializer;
}

//HOME PAGE BOOKING GASTROENTROLOGIYA

abstract class HomepageBookingCategory
    implements Built<HomepageBookingCategory, HomepageBookingCategoryBuilder> {
  @BuiltValueField(wireName: "id")
  int? get id;

  @BuiltValueField(wireName: "name")
  String? get name;

  @BuiltValueField(wireName: "icond")
  String? get icon;

  // Serializer
  static Serializer<HomepageBookingCategory> get serializer =>
      _$homepageBookingCategorySerializer;

  // Factory Constructor
  factory HomepageBookingCategory(
          [void Function(HomepageBookingCategoryBuilder) updates]) =
      _$HomepageBookingCategory;

  HomepageBookingCategory._();
}

//HOME PAGE BOOKING GASTROENTROLOGIYA GET DOCTORS

abstract class MedicalModel
    implements Built<MedicalModel, MedicalModelBuilder> {
  int? get id;
  String? get description;
  BuiltList<HomeMedicalDoctor> get doctors;
  BuiltList<HomeServiceBooking> get services;

  MedicalModel._();
  factory MedicalModel([void Function(MedicalModelBuilder) updates]) =
      _$MedicalModel;

  static Serializer<MedicalModel> get serializer => _$medicalModelSerializer;
}

abstract class HomeMedicalDoctor
    implements Built<HomeMedicalDoctor, HomeMedicalDoctorBuilder> {
  int? get id;
  String? get image;
  String? get name;
  String? get jobName;
  int? get experienceYears;

  HomeMedicalDoctor._();
  factory HomeMedicalDoctor([void Function(HomeMedicalDoctorBuilder) updates]) =
      _$HomeMedicalDoctor;

  static Serializer<HomeMedicalDoctor> get serializer =>
      _$homeMedicalDoctorSerializer;
}

abstract class HomeServiceBooking
    implements Built<HomeServiceBooking, HomeServiceBookingBuilder> {
  int? get id;
  String? get name;
  int? get priceUzs;
  int? get priceUzd;

  HomeServiceBooking._();
  factory HomeServiceBooking(
          [void Function(HomeServiceBookingBuilder) updates]) =
      _$HomeServiceBooking;

  static Serializer<HomeServiceBooking> get serializer =>
      _$homeServiceBookingSerializer;
}

abstract class CreatePatientBookingReq implements Built<CreatePatientBookingReq, CreatePatientBookingReqBuilder> {

  @BuiltValueField(wireName: 'service_id')
  int get serviceId;

  @BuiltValueField(wireName: 'company_id')
  int get companyId;

  @BuiltValueField(wireName: 'doctor_id')
  int get doctorId;

  @BuiltValueField(wireName: 'start_time')
  String get startTime;

  @BuiltValueField(wireName: 'end_time')
  String get endTime;

  @BuiltValueField(wireName: 'date')
  String get date;

  CreatePatientBookingReq._();

  static Serializer<CreatePatientBookingReq> get serializer => _$createPatientBookingReqSerializer;

  factory CreatePatientBookingReq([void Function(CreatePatientBookingReqBuilder) updates]) = _$CreatePatientBookingReq;
}

