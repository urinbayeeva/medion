import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medion/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class MedionApiService {
  static const String _baseUrl = '${Constants.baseUrlP}/company/activity';

  Future<Map<String, dynamic>> getCompanyActivityWithContext(
      BuildContext context) async {
    final lang = context.locale.toString();
    return await getCompanyActivity(lang: lang);
  }

  Future<Map<String, dynamic>> getCompanyActivity(
      {String lang = 'en_US'}) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?lang=$lang'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        return json.decode(decodedBody) as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to load company activity. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch company activity: $e');
    }
  }
}
