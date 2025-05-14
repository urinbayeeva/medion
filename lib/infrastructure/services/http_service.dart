// import 'dart:convert';
// import 'package:http/http.dart' as http;// import 'package:medion/domain/models/news_model/news_model.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;// import 'package:medion/domain/models/news_model/news_model.dart';

// Future<List<News>> fetchNews() async {
//   final url = Uri.parse("https://his.uicgroup.tech/apiweb/home/news?lang=en");
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     // Decode the JSON string into a Dart object
//     final List<dynamic> data = jsonDecode(response.body);

//     // Map the JSON to a list of NewsModel objects
//     return data.map((json) => News.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load news: ${response.statusCode}');
//   }
// }

// class HttpService {
//   Future<http.Response> get(Uri url) async {
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         return response;
//       } else {
//         throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error occurred while fetching data: $e');
//     }
//   }
// }
