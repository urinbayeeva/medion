// // lib/infrastructure/offerta/offerta_repository.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:html_unescape/html_unescape.dart';
//
// class OffertaRepository {
//   final String baseUrl;
//
//   OffertaRepository({required this.baseUrl});
//
//   Future<Map<String, String>> getOfferta() async {
//     final response = await http.get(Uri.parse('$baseUrl/company/offerta'));
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       var unescape = HtmlUnescape();
//
//       return {
//         'company': unescape.convert(data['company'] ?? ''),
//         'offerta': unescape.convert(data['offerta'] ?? ''),
//       };
//     } else {
//       throw Exception('Failed to load offerta');
//     }
//   }
// }
