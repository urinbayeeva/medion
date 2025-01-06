import 'dart:convert';
import "package:http/http.dart" as http;

class ApiService {
  Future<List<Map<String, dynamic>>> fetchCategoryServices(
      int serviceTypeId) async {
    // Use the provided 'serviceTypeId' dynamically in the URL
    final String url =
        'https://his.uicgroup.tech/apiweb/booking/category_services/$serviceTypeId?lang=en_US';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decode with UTF-8 to handle special characters
        final decodedBody = utf8.decode(response.bodyBytes);

        // Parse JSON response
        final data = json.decode(decodedBody) as List<dynamic>;

        // Flatten the structure to match Swagger format
        final List<Map<String, dynamic>> services = [];
        for (var category in data) {
          // Extract category key (e.g., "Anesthesiology") and its values
          final categoryName = category.keys.first;
          final categoryServices = category[categoryName];

          // Map each service and add the category name
          for (var service in categoryServices) {
            services.add({
              'id': service['id'],
              'name': service['name'],
              'description': service['description'],
              'doctor_price_start_uzs': service['doctor_price_start_uzs'],
              'doctor_price_start_usd': service['doctor_price_start_usd'],
              'age': service['age'],
              'category': categoryName, // Add category name for context
            });
          }
        }

        // Return the flattened list of services
        return services;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
