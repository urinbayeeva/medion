import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
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

// lib/infrastructure/models/patient_visits_model.dart

class PatientVisitsResponse {
  final List<PatientOrder> orders;
  final List<PatientVisit> visits;

  PatientVisitsResponse({required this.orders, required this.visits});

  factory PatientVisitsResponse.fromJson(Map<String, dynamic> json) {
    return PatientVisitsResponse(
      orders: (json['moves'] as List)
          .map((order) => PatientOrder.fromJson(order))
          .toList(),
      visits: (json['visits'] as List)
          .map((visit) => PatientVisit.fromJson(visit))
          .toList(),
    );
  }
}

class PatientOrder {
  final String saleOrderName;
  final String saleOrderCheckPdfUrl;
  final List<SaleOrderLine> saleOrderLines;
  final double saleOrderPrice;
  final String saleOrderPaymentStatus;
  final List<String> saleOrderPaymentUrls;

  PatientOrder({
    required this.saleOrderName,
    required this.saleOrderCheckPdfUrl,
    required this.saleOrderLines,
    required this.saleOrderPrice,
    required this.saleOrderPaymentStatus,
    required this.saleOrderPaymentUrls,
  });

  factory PatientOrder.fromJson(Map<String, dynamic> json) {
    return PatientOrder(
      saleOrderName: json['sale_order_name'] ?? '',
      saleOrderCheckPdfUrl: json['sale_order_check_pdf_url'] ?? '',
      saleOrderLines: (json['sale_order_lines'] as List)
          .map((line) => SaleOrderLine.fromJson(line))
          .toList(),
      saleOrderPrice: (json['sale_order_price'] as num?)?.toDouble() ?? 0.0,
      saleOrderPaymentStatus: json['sale_order_payment_status'] ?? '',
      saleOrderPaymentUrls:
          List<String>.from(json['sale_order_payment_urls'] ?? []),
    );
  }
}

class SaleOrderLine {
  final String service;
  final String createDate; // Format: "dd-MM-yyyy HH:mm:ss"
  final bool isDone;

  SaleOrderLine({
    required this.service,
    required this.createDate,
    required this.isDone,
  });

  factory SaleOrderLine.fromJson(Map<String, dynamic> json) {
    return SaleOrderLine(
      service: json['service'] ?? '',
      createDate: json['create_date'] ?? '',
      isDone: json['is_done'] ?? false,
    );
  }

  // Add this method to format the date nicely
  String get formattedDate {
    try {
      final dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
      final parsedDate = dateFormat.parse(createDate);
      return DateFormat('d MMMM yyyy, HH:mm').format(parsedDate);
    } catch (e) {
      print('Error formatting date: $e');
      return createDate;
    }
  }
}

class PatientVisit {
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
  final double price;

  PatientVisit({
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
    required this.price,
  });

  factory PatientVisit.fromJson(Map<String, dynamic> json) {
    return PatientVisit(
      image: json['image'] ?? '',
      doctorFullName: json['doctor_full_name'] ?? '',
      doctorJobName: json['doctor_job_name'] ?? '',
      categoryName: json['category_name'] ?? '',
      serviceName: json['service_name'] ?? '',
      visitDate: json['visit_date'] ?? '',
      visitTime: json['visit_time'] ?? '',
      visitStatus: json['visit_status'] ?? '',
      weekIndex: json['week_index'] ?? 0,
      address: json['address'] ?? '',
      paymentMethod: json['payment_method'] ?? '',
      paymentStatus: json['payment_status'] ?? '',
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      companyName: json['company_name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
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
