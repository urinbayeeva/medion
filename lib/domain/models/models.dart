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
      companiesDoctors: (json['companies_doctors'] as List)
          .map((cd) => CompanyDoctor.fromJson(cd))
          .toList(),
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
  final List<Map<String, dynamic>> schedules;

  Doctor({
    required this.id,
    required this.name,
    required this.gender,
    required this.specialty,
    required this.price,
    required this.location,
    required this.workExperience,
    required this.schedules,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      gender: json['gender'].toString(),
      specialty: json['specialty'],
      price: json['price'],
      location: json['location'],
      workExperience: json['work_experience'],
      schedules: (json['schedules'] as List).cast<Map<String, dynamic>>(),
    );
  }
}
