import 'package:flutter/foundation.dart';

class Service {
  final int serviceId;
  final String serviceName;
  final List<CompanyDoctor> companiesDoctors;

  Service({
    required this.serviceId,
    required this.serviceName,
    required this.companiesDoctors,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceId: json['service_id'],
      serviceName: json['service_name'],
      companiesDoctors: (json['companies_doctors'] as List).map((cd) => CompanyDoctor.fromJson(cd)).toList(),
    );
  }
}

class CompanyDoctor {
  final int companyId;
  final String companyName;
  final List<Doctor> doctors;

  CompanyDoctor({
    required this.companyId,
    required this.companyName,
    required this.doctors,
  });

  factory CompanyDoctor.fromJson(Map<String, dynamic> json) {
    return CompanyDoctor(
      companyId: json['company_id'],
      companyName: json['company_name'],
      doctors: (json['doctor'] as List).map((d) => Doctor.fromJson(d)).toList(),
    );
  }
}

class Doctor {
  final int id;
  final String name;
  final String gender;
  final String specialty;
  final double price;
  final String location;
  final int workExperience;
  final String image;
  final List<Map<String, List<Schedule>>> schedules;

  Doctor({
    required this.id,
    required this.name,
    required this.gender,
    required this.specialty,
    required this.price,
    required this.location,
    required this.workExperience,
    required this.schedules,
    required this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    final rawSchedules = json['schedules'] as List<dynamic>? ?? [];

    final parsedSchedules = rawSchedules.map<Map<String, List<Schedule>>>((dayMap) {
      final dayKey = dayMap.keys.first;
      final rawList = dayMap[dayKey] as List;
      final scheduleList = rawList.map((item) => Schedule.fromJson(item)).toList();

      return {dayKey: scheduleList};
    }).toList();
    return Doctor(
      id: json['id'],
      name: json['name'],
      gender: json['gender'].toString(),
      specialty: json['specialty'],
      image: json['image'],
      price: json['price'],
      location: json['location'],
      workExperience: json['work_experience'],
      schedules: parsedSchedules,
    );
  }
}

class Schedule {
  final String time;
  final int duration;
  final bool active;

  Schedule({this.time = '', this.duration = -1, this.active = false});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'] ?? '',
      duration: json['duration'] ?? 0,
      active: json['active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'time': time, 'duration': duration, 'active': active};
  }
}
