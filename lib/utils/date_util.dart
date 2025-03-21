import 'package:flutter/material.dart'; // Needed for BuildContext
import 'package:intl/intl.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/utils/extensions.dart';

class DateUtilsEx {
  static String formatDate(BuildContext context, String dateStr) {
    DateTime date = DateTime.parse(dateStr);

    String locale = Localizations.localeOf(context).toString();
    return DateFormat('MMMM d, y', locale).format(date);
  }

  static List<String> extractAllDates(List<Service> services) {
    Set<String> uniqueDates = {};

    for (var service in services) {
      for (var company in service.companiesDoctors) {
        for (var doctor in company.doctors) {
          for (var schedule in doctor.schedules) {
            String date = schedule.keys.first;
            uniqueDates.add(date);
          }
        }
      }
    }

    return uniqueDates.toList()..sort();
  }
}
