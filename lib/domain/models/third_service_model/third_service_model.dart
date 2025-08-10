import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'third_service_model.g.dart';

abstract class DoctorsRequest implements Built<DoctorsRequest, DoctorsRequestBuilder> {
  @BuiltValueField(wireName: 'service_ids')
  BuiltList<int>? get serviceIds; // Changed from List<int>? to BuiltList<int>?

  DoctorsRequest._();

  factory DoctorsRequest([void Function(DoctorsRequestBuilder) updates]) = _$DoctorsRequest;

  static Serializer<DoctorsRequest> get serializer => _$doctorsRequestSerializer;
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

abstract class ThirdBookingDoctor implements Built<ThirdBookingDoctor, ThirdBookingDoctorBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'gender')
  String? get gender;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'specialty')
  String? get specialty;

  @BuiltValueField(wireName: 'experience')
  String? get experience;

  @BuiltValueField(wireName: 'schedules')
  BuiltList<ThirdBookingDoctorSchedule>? get schedules;

  @BuiltValueField(wireName: 'price')
  double? get price;

  @BuiltValueField(wireName: 'location')
  String? get location;

  @BuiltValueField(wireName: 'work_experience')
  int? get workExperience;

  ThirdBookingDoctor._();

  factory ThirdBookingDoctor([void Function(ThirdBookingDoctorBuilder) updates]) = _$ThirdBookingDoctor;

  static Serializer<ThirdBookingDoctor> get serializer => _$thirdBookingDoctorSerializer;
}

abstract class ThirdBookingCompanyDoctor implements Built<ThirdBookingCompanyDoctor, ThirdBookingCompanyDoctorBuilder> {
  @BuiltValueField(wireName: 'company_id')
  int? get companyId;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'doctor')
  BuiltList<ThirdBookingDoctor>? get doctor;

  ThirdBookingCompanyDoctor._();

  factory ThirdBookingCompanyDoctor([void Function(ThirdBookingCompanyDoctorBuilder) updates]) =
      _$ThirdBookingCompanyDoctor;

  static Serializer<ThirdBookingCompanyDoctor> get serializer => _$thirdBookingCompanyDoctorSerializer;
}

abstract class ThirdBookingService implements Built<ThirdBookingService, ThirdBookingServiceBuilder> {
  @BuiltValueField(wireName: 'service_id')
  int? get serviceId;

  @BuiltValueField(wireName: 'service_name')
  String? get serviceName;

  @BuiltValueField(wireName: 'companies_doctors')
  BuiltList<ThirdBookingCompanyDoctor>? get companiesDoctors;

  ThirdBookingService._();

  factory ThirdBookingService([void Function(ThirdBookingServiceBuilder) updates]) = _$ThirdBookingService;

  static Serializer<ThirdBookingService> get serializer => _$thirdBookingServiceSerializer;
}
