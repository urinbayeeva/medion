import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medion/domain/models/models.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/utils/constants.dart';

class ApiService {
  static Future<List<Service>> fetchServices({
    List<int>? serviceIds,
    int? doctorId,
    int days = 5,
  }) async {
    final dbService = await DBService.create;
    final token = dbService.token;

    if (token.accessToken == null || token.accessToken!.isEmpty) {
      throw Exception('No authentication token found');
    }
    if (dbService.isTokenExpired(token.accessToken!)) {
      throw Exception('Token has expired');
    }

    // Use the /booking/doctors endpoint (update if /booking/doctor/day is correct)
    final uri = Uri.parse('${Constants.baseUrlP}/booking/doctors')
        .replace(queryParameters: {'days': days.toString()});

    // Construct the request body to match the API
    final Map<String, dynamic> requestBody = {
      'service_ids': serviceIds?.isNotEmpty == true ? serviceIds : [0],
      'doctor_id': doctorId ?? 0,
    };

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${token.tokenType} ${token.accessToken}',
        'requires-token': 'true',
        'accept': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes);
      final responseData = jsonDecode(decodedResponse);

      // Handle different response formats
      if (responseData is List) {
        return responseData.map((json) => Service.fromJson(json)).toList();
      } else if (responseData is Map<String, dynamic>) {
        // Wrap single object in a list
        return [Service.fromJson(responseData)];
      } else {
        throw Exception('Unexpected response format: $responseData');
      }
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}, Response: ${response.body}');
    }
  }
}
