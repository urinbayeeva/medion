import 'package:built_value/json_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Service {
  @JsonKey(name: 'service_id')
  int? serviceId;

  @JsonKey(name: 'service_name')
  String? serviceName;

  @JsonKey(name: 'companies_doctors')
  List<CompanyDoctor>? companiesDoctors;

  Service({
    this.serviceId,
    this.serviceName,
    this.companiesDoctors,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

@JsonSerializable()
class CompanyDoctor {
  @JsonKey(name: 'company_id')
  int? companyId;

  @JsonKey(name: 'company_name')
  String? companyName;

  List<Doctor>? doctor;

  CompanyDoctor({
    this.companyId,
    this.companyName,
    this.doctor,
  });

  factory CompanyDoctor.fromJson(Map<String, dynamic> json) =>
      _$CompanyDoctorFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyDoctorToJson(this);
}

@JsonSerializable()
class Doctor {
  int? id;
  String? name;
  Object? gender;
  String? image;
  String? specialty;
  String? experience;
  List<Schedule>? schedules;
  int? price;
  String? location;

  @JsonKey(name: 'work_experience')
  int? workExperience;

  Doctor({
    this.id,
    this.name,
    this.gender,
    this.image,
    this.specialty,
    this.experience,
    this.schedules,
    this.price,
    this.location,
    this.workExperience,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class Schedule {
  String? date;

  @JsonKey(name: 'time_slots')
  List<TimeSlot>? timeSlots;

  Schedule({
    this.date,
    this.timeSlots,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@JsonSerializable()
class TimeSlot {
  String? time;
  bool? active;
  int? duration;

  TimeSlot({
    this.time,
    this.active,
    this.duration,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSlotToJson(this);
}
