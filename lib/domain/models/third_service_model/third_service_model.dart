import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'third_service_model.g.dart';

abstract class DoctorsRequest implements Built<DoctorsRequest, DoctorsRequestBuilder> {
  @BuiltValueField(wireName: 'service_ids')
  BuiltList<int>? get serviceIds;

  @BuiltValueField(wireName: 'doctor_id')
  int? get doctorId;

  @BuiltValueField(wireName: 'is_mobile')
  bool? get isMobile;

  DoctorsRequest._();

  factory DoctorsRequest([void Function(DoctorsRequestBuilder) updates]) = _$DoctorsRequest;

  static Serializer<DoctorsRequest> get serializer => _$doctorsRequestSerializer;
}

abstract class ThirdBookingServiceModel implements Built<ThirdBookingServiceModel, ThirdBookingServiceModelBuilder> {
  @BuiltValueField(wireName: 'services')
  BuiltList<ThirdBookingService>? get services;

  ThirdBookingServiceModel._();

  factory ThirdBookingServiceModel([void Function(ThirdBookingServiceModelBuilder) updates]) =
      _$ThirdBookingServiceModel;

  static Serializer<ThirdBookingServiceModel> get serializer => _$thirdBookingServiceModelSerializer;
}

abstract class ThirdBookingService implements Built<ThirdBookingService, ThirdBookingServiceBuilder> {
  @BuiltValueField(wireName: 'service_id')
  int? get serviceId;

  @BuiltValueField(wireName: 'service_name')
  String? get serviceName;

  @BuiltValueField(wireName: 'service_type')
  String? get serviceType;

  @BuiltValueField(wireName: 'companies')
  BuiltList<ThirdBookingCompany>? get companies;

  @BuiltValueField(wireName: 'service_names')
  BuiltList<ServiceNameDetail>? get serviceNames;

  ThirdBookingService._();

  factory ThirdBookingService([void Function(ThirdBookingServiceBuilder) updates]) = _$ThirdBookingService;

  static Serializer<ThirdBookingService> get serializer => _$thirdBookingServiceSerializer;
}

abstract class ServiceNameDetail implements Built<ServiceNameDetail, ServiceNameDetailBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  ServiceNameDetail._();

  factory ServiceNameDetail([void Function(ServiceNameDetailBuilder) updates]) = _$ServiceNameDetail;

  static Serializer<ServiceNameDetail> get serializer => _$serviceNameDetailSerializer;
}

abstract class ThirdBookingCompany implements Built<ThirdBookingCompany, ThirdBookingCompanyBuilder> {
  /// {
  //           "company_id": 1,
  //           "company_name": "Medion Innovation",
  //           "company_location": "г. Ташкент, Шайхантахурский р-н, ул. Хадра, 39",
  //           "doctors": [
  //             {
  //               "doctor_id": 322,
  //               "doctor_name": "Абубакирова Ольга Александровна",
  //               "doctor_gender": "female",
  //               "doctor_image": "http://localhost/apiweb/image/15688",
  //               "doctor_specialty": "Кардиолог",
  //               "doctor_experience": 4,
  //               "doctor_price": 60000,
  //               "doctor_location": "г. Ташкент, Шайхантахурский р-н, ул. Хадра, 39",
  //               "schedules": [
  //                 {
  //                   "date": "2025-09-04",
  //                   "schedule": [
  //                     {
  //                       "time": "12:30",
  //                       "active": true,
  //                       "duration": 10
  //                     },
  //                   ],
  //                 }
  //               ]
  //             }
  //           ]
  //         }
  @BuiltValueField(wireName: 'company_id')
  int? get companyId;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'company_location')
  String? get companyLocation;

  @BuiltValueField(wireName: 'doctors')
  BuiltList<ThirdBookingDoctor>? get doctors;

  ThirdBookingCompany._();

  factory ThirdBookingCompany([void Function(ThirdBookingCompanyBuilder) updates]) = _$ThirdBookingCompany;

  static Serializer<ThirdBookingCompany> get serializer => _$thirdBookingCompanySerializer;
}

abstract class ThirdBookingDoctor implements Built<ThirdBookingDoctor, ThirdBookingDoctorBuilder> {
  @BuiltValueField(wireName: 'doctor_id')
  int? get doctorId;

  @BuiltValueField(wireName: 'doctor_name')
  String? get doctorName;

  @BuiltValueField(wireName: 'doctor_gender')
  String? get doctorGender;

  @BuiltValueField(wireName: 'doctor_image')
  String? get doctorImage;

  @BuiltValueField(wireName: 'doctor_specialty')
  String? get doctorSpecialty;

  @BuiltValueField(wireName: 'doctor_location')
  String? get doctorLocation;

  @BuiltValueField(wireName: 'doctor_experience')
  double? get doctorExperience;

  @BuiltValueField(wireName: 'doctor_price')
  double? get doctorPrice;

  @BuiltValueField(wireName: 'schedules')
  BuiltList<ThirdBookingDoctorSchedule>? get schedules;

  ThirdBookingDoctor._();

  factory ThirdBookingDoctor([void Function(ThirdBookingDoctorBuilder) updates]) = _$ThirdBookingDoctor;

  static Serializer<ThirdBookingDoctor> get serializer => _$thirdBookingDoctorSerializer;
}

abstract class ThirdBookingDoctorSchedule
    implements Built<ThirdBookingDoctorSchedule, ThirdBookingDoctorScheduleBuilder> {
  @BuiltValueField(wireName: 'date')
  String? get date;

  @BuiltValueField(wireName: 'schedule')
  BuiltList<ScheduleDetail>? get scheduleList;

  ThirdBookingDoctorSchedule._();

  factory ThirdBookingDoctorSchedule([void Function(ThirdBookingDoctorScheduleBuilder) updates]) =
      _$ThirdBookingDoctorSchedule;

  static Serializer<ThirdBookingDoctorSchedule> get serializer => _$thirdBookingDoctorScheduleSerializer;
}

abstract class ScheduleDetail implements Built<ScheduleDetail, ScheduleDetailBuilder> {
  @BuiltValueField(wireName: 'time')
  String? get time;

  @BuiltValueField(wireName: 'active')
  bool? get active;

  @BuiltValueField(wireName: 'duration')
  double? get duration;

  ScheduleDetail._();

  factory ScheduleDetail([void Function(ScheduleDetailBuilder) updates]) = _$ScheduleDetail;

  static Serializer<ScheduleDetail> get serializer => _$scheduleDetailSerializer;
}
