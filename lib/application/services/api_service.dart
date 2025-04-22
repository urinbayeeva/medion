import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medion/domain/models/models.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';

class ApiService {
  static Future<List<Service>> fetchServices(
    List<int> serviceIds, {
    int days = 10, // 👈 Make it optional with default value
  }) async {
    final dbService = await DBService.create;
    final token = dbService.token;

    if (token.accessToken == null || token.accessToken!.isEmpty) {
      throw Exception('No authentication token found');
    }
    if (dbService.isTokenExpired(token.accessToken!)) {
      throw Exception('Token has expired');
    }

    final uri = Uri.parse('https://his.uicgroup.tech/apiweb/booking/doctors')
        .replace(queryParameters: {'days': days.toString()});

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${token.tokenType} ${token.accessToken}',
        'requires-token': 'true',
      },
      body: jsonEncode({'service_ids': serviceIds}),
    );

    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes);
      List<dynamic> servicesJson = jsonDecode(decodedResponse);
      return servicesJson.map((json) => Service.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
