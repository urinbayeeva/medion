import 'package:dio/dio.dart';

import '../../domain/models/models.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Service>> fetchServices(List<int> serviceIds) async {
    final response = await _dio.post(
      'https://his.uicgroup.tech/apiweb/booking/doctors',
      data: {
        "service_ids": serviceIds,
      },
    );

    if (response.statusCode == 200) {
      // Debug: Print the raw JSON response
      print('Raw JSON Response: ${response.data}');

      List<Service> services = (response.data as List)
          .map((service) => Service.fromJson(service))
          .toList();
      return services;
    } else {
      throw Exception('Failed to load services');
    }
  }
}
