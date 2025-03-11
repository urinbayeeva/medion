import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medion/domain/models/models.dart';

class ApiService {

  static Future<List<Service>> fetchServices(List<int> serviceIds) async {
    final response = await http.post(
      Uri.parse('https://his.uicgroup.tech/apiweb/booking/doctors'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'service_ids': serviceIds}),
    );

    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes);
      List<dynamic> servicesJson = jsonDecode(decodedResponse);
      return servicesJson.map((json) => Service.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data. Status code: \${response.statusCode}');
    }
  }
}