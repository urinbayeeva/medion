import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/utils/constants.dart';

class PatientVisitsService {
  final String baseUrl = Constants.baseUrlP;
  final String token;

  PatientVisitsService({required this.token});

  Future<PatientVisitsResponse> getPatientVisits() async {
    EasyLoading.show();
    final response = await http.get(
      Uri.parse('$baseUrl/profile/patient_visits_mobile'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Visit: ${response.statusCode}');
    final decodedBody = utf8.decode(response.bodyBytes);
    print('Decoded Response Body: $decodedBody');

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      final jsonData = json.decode(decodedBody);
      return PatientVisitsResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to load patient visits: ${response.statusCode}');
    }
  }
}

class VisitWithPdf {
  final OrderVisit visit;
  final String pdfUrl;

  VisitWithPdf({
    required this.visit,
    required this.pdfUrl,
  });
}

class PatientVisitsResponse {
  final List<Order> orders;
  final List<Visit> visits;

  PatientVisitsResponse({required this.orders, required this.visits});

  factory PatientVisitsResponse.fromJson(Map<String, dynamic> json) {
    return PatientVisitsResponse(
      orders: (json['orders'] as List)
          .map((order) => Order.fromJson(order))
          .toList(),
      visits: (json['visits'] as List)
          .map((visit) => Visit.fromJson(visit))
          .toList(),
    );
  }
}

class Order {
  final String order;
  final String orderCheckPdfUrl;
  final List<OrderVisit> orderVisits;

  Order({
    required this.order,
    required this.orderCheckPdfUrl,
    required this.orderVisits,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      order: json['order'],
      orderCheckPdfUrl: json['order_check_pdf_url'],
      orderVisits: (json['order_visits'] as List)
          .map((visit) => OrderVisit.fromJson(visit))
          .toList(),
    );
  }
}

class OrderVisit {
  final String image;
  final String doctorFullName;
  final String doctorJobName;
  final String categoryName;
  final String serviceName;
  final String visitDate;
  final String visitTime;
  final String visitStatus;
  final int weekIndex;
  final String address;
  final String paymentMethod;
  final String paymentStatus;
  final double longitude;
  final double latitude;
  final String companyName;

  OrderVisit({
    required this.image,
    required this.doctorFullName,
    required this.doctorJobName,
    required this.categoryName,
    required this.serviceName,
    required this.visitDate,
    required this.visitTime,
    required this.visitStatus,
    required this.weekIndex,
    required this.address,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.longitude,
    required this.latitude,
    required this.companyName,
  });

  factory OrderVisit.fromJson(Map<String, dynamic> json) {
    return OrderVisit(
      image: json['image'] ?? '',
      doctorFullName: json['doctor_full_name'] ?? '',
      doctorJobName: json['doctor_job_name'] ?? '',
      categoryName: json['category_name'] ?? '',
      serviceName: json['service_name'] ?? '',
      visitDate: json['visit_date'],
      visitTime: json['visit_time'],
      visitStatus: json['visit_status'],
      weekIndex: json['week_index'],
      address: json['address'],
      paymentMethod: json['payment_method'] ?? '',
      paymentStatus: json['payment_status'],
      longitude: json['longitude']?.toDouble() ?? 0.0,
      latitude: json['latitude']?.toDouble() ?? 0.0,
      companyName: json['company_name'],
    );
  }
}

class Visit {
  final String image;
  final String doctorFullName;
  final String doctorJobName;
  final String categoryName;
  final String serviceName;
  final String visitDate;
  final String visitTime;
  final String visitStatus;
  final int weekIndex;
  final String address;
  final String paymentMethod;
  final String paymentStatus;
  final double longitude;
  final double latitude;
  final String companyName;

  Visit({
    required this.image,
    required this.doctorFullName,
    required this.doctorJobName,
    required this.categoryName,
    required this.serviceName,
    required this.visitDate,
    required this.visitTime,
    required this.visitStatus,
    required this.weekIndex,
    required this.address,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.longitude,
    required this.latitude,
    required this.companyName,
  });

  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
      image: json['image'] ?? '',
      doctorFullName: json['doctor_full_name'] ?? '',
      doctorJobName: json['doctor_job_name'] ?? '',
      categoryName: json['category_name'] ?? '',
      serviceName: json['service_name'] ?? '',
      visitDate: json['visit_date'],
      visitTime: json['visit_time'],
      visitStatus: json['visit_status'],
      weekIndex: json['week_index'],
      address: json['address'],
      paymentMethod: json['payment_method'] ?? '',
      paymentStatus: json['payment_status'],
      longitude: json['longitude']?.toDouble() ?? 0.0,
      latitude: json['latitude']?.toDouble() ?? 0.0,
      companyName: json['company_name'],
    );
  }
}
