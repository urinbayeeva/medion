// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      serviceId: (json['service_id'] as num?)?.toInt(),
      serviceName: json['service_name'] as String?,
      companiesDoctors: (json['companies_doctors'] as List<dynamic>?)
          ?.map((e) => CompanyDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'service_id': instance.serviceId,
      'service_name': instance.serviceName,
      'companies_doctors': instance.companiesDoctors,
    };

CompanyDoctor _$CompanyDoctorFromJson(Map<String, dynamic> json) =>
    CompanyDoctor(
      companyId: (json['company_id'] as num?)?.toInt(),
      companyName: json['company_name'] as String?,
      doctor: (json['doctor'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyDoctorToJson(CompanyDoctor instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'company_name': instance.companyName,
      'doctor': instance.doctor,
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      gender: json['gender'],
      image: json['image'] as String?,
      specialty: json['specialty'] as String?,
      experience: json['experience'] as String?,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toInt(),
      location: json['location'] as String?,
      workExperience: (json['work_experience'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'image': instance.image,
      'specialty': instance.specialty,
      'experience': instance.experience,
      'schedules': instance.schedules,
      'price': instance.price,
      'location': instance.location,
      'work_experience': instance.workExperience,
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      date: json['date'] as String?,
      timeSlots: (json['time_slots'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'date': instance.date,
      'time_slots': instance.timeSlots,
    };

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) => TimeSlot(
      time: json['time'] as String?,
      active: json['active'] as bool?,
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TimeSlotToJson(TimeSlot instance) => <String, dynamic>{
      'time': instance.time,
      'active': instance.active,
      'duration': instance.duration,
    };
