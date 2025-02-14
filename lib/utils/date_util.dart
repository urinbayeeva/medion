import 'package:intl/intl.dart';
import 'package:medion/domain/models/models.dart';

class DateUtilsEx {
  static String formatDate(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    return DateFormat('MMMM d, y', 'ru_RU').format(date);
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


