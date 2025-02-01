import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumberExtentionFormat on int {
  String formatNumber() {
    final regex = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
    return toString().replaceAllMapped(regex, (Match match) => '${match[1]} ');
  }
}

extension StringCasingExtension on String {
  bool get isUrl {
    return startsWith('http://') || startsWith('https://');
  }

  bool get isFilePath {
    return !isUrl;
  }

  String toCapitalized() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1, length)}';
    } else {
      return this;
    }
  }

  String cleanNumbers() {
    var s = "";
    for (int i = 0; i < length; i++) {
      if (!RegExp(r'^[0-9]').hasMatch(this[i])) {
        s += this[i];
      }
    }
    return s;
  }
}

//remove spaces
String formatPhoneNumber(String phoneNumber) {
  return phoneNumber.replaceAll(" ", '');
}

// add spaces
String? formatPhoneNumberAddSpaces(String? phoneNumber) {
  if (phoneNumber == null) {
    return null;
  }
  String separatedNumber = phoneNumber.replaceFirstMapped(
      RegExp(r'^(\+\d{3})(\d{2})(\d{3})(\d{2})(\d{2})$'),
      (match) =>
          '${match.group(1)} ${match.group(2)} ${match.group(3)} ${match.group(4)} ${match.group(5)}');
  return separatedNumber;
}

// Format passport serial number
// Format passport serial number
String? formatPassportSerialNumber(String? serialNumber) {
  if (serialNumber == null) {
    return null;
  }

  // Remove any extra spaces or invalid characters
  String cleanedSerial = serialNumber.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

  // Validate the input to ensure it matches the expected pattern
  if (!RegExp(r'^[a-zA-Z]{2}\d{7}\$').hasMatch(cleanedSerial)) {
    return null; // Return null for invalid input
  }

  // Format the serial number
  String formattedSerial = cleanedSerial.replaceFirstMapped(
      RegExp(r'^([a-zA-Z]{2})(\d{7})\$'),
      (match) => '${match.group(1)!.toUpperCase()} ${match.group(2)}');

  return formattedSerial;
}

Color colorValue(String? value) {
  if (value == null || value.isEmpty) {
    return Colors.transparent;
  } else {
    int colorValue = int.parse("0xFF${value.replaceAll('#', '')}");
    return Color(colorValue);
  }
}

String dateFormatValue(String? value) {
  if (value == null || value.isEmpty) {
    return "";
  } else {
    DateTime? dateTime = DateTime.tryParse(value);
    if (dateTime == null) {
      return value;
    } else {
      dateTime = dateTime.toLocal();
      String date = "";
      int day = calculateDifference(dateTime);
      dateTime = dateTime.toLocal();
      if (day == 0) {
        date = "${"today"} ${DateFormat("HH:mm").format(dateTime)}";
      } else if (day == -1) {
        date = "${"yesterday"} ${DateFormat("HH:mm").format(dateTime)}";
      } else {
        date = DateFormat("dd.MM.yyyy HH:mm").format(dateTime);
      }
      return date.toCapitalized();
    }
  }
}

String dateFullFormatValue(String? value, String locale) {
  if (value == null || value.isEmpty) {
    return "";
  } else {
    DateTime? dateTime = DateTime.tryParse(value);
    if (dateTime == null) {
      return value;
    } else {
      dateTime = dateTime.toLocal();
      String date = DateFormat("HH:mm dd MMMM yyyy", locale).format(dateTime);

      return date;
    }
  }
}

String dateDayFormatValue(String? value, String locale) {
  if (value == null || value.isEmpty) {
    return "";
  } else {
    DateTime? dateTime = DateTime.tryParse(value);
    if (dateTime == null) {
      return value;
    } else {
      dateTime = dateTime.toLocal();
      String date = DateFormat("d-MMMM", locale).format(dateTime);

      return date;
    }
  }
}

String dateHourFormatValue(String? value, String locale) {
  if (value == null || value.isEmpty) {
    return "";
  } else {
    DateTime? dateTime = DateTime.tryParse(value);
    if (dateTime == null) {
      return value;
    } else {
      dateTime = dateTime.toLocal();
      String date = DateFormat("HH:mm", locale).format(dateTime);

      return date;
    }
  }
}

String chatDateFormatValue(String? value, String locale) {
  if (value == null || value.isEmpty) {
    return "";
  } else {
    DateTime? dateTime = DateTime.tryParse(value);
    if (dateTime == null) {
      return value;
    } else {
      dateTime = dateTime.toLocal();
      String date = "";
      int day = calculateDifference(dateTime);
      if (day == 0) {
        date = "today";
      } else if (day == -1) {
        date = "yesterday";
      } else if (dateTime.year == DateTime.now().year) {
        date = DateFormat("dd MMMM", locale).format(dateTime);
      } else {
        date = DateFormat("dd MMMM yyy", locale).format(dateTime);
      }
      return date.toCapitalized();
    }
  }
}

String roomDateFormatValue(String? value, String locale) {
  if (value == null || value.isEmpty) {
    return "";
  } else {
    DateTime? dateTime = DateTime.tryParse(value);
    if (dateTime == null) {
      return value;
    } else {
      dateTime = dateTime;
      String date = "";
      int day = calculateDifference(dateTime);
      if (day == 0) {
        date = DateFormat("hh:mm", locale).format(dateTime);
      } else if (day == -1) {
        date = "yesterday";
      } else {
        date = DateFormat("dd MMMM", locale).format(dateTime);
      }
      return date.toCapitalized();
    }
  }
}

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}

extension PercentageCalculation on double {
  // Calculate the percentage increase from the current value to another value
  String percentageIncrease(double originalValue) {
    double difference = this - originalValue;
    return ((difference / originalValue) * 100).toInt().toString();
  }

  // Calculate the percentage decrease from the current value to another value
  String percentageDecrease(double originalValue) {
    double difference = originalValue - this;
    return ((difference / originalValue) * 100).toInt().toString();
  }
}

DateTime? parseDateString(String dateString) {
  DateTime? parsedDate;

  DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  parsedDate = dateFormat.tryParse(dateString);

  if (parsedDate == null) {
    DateFormat dateFormat2 = DateFormat("yyyy-MM-dd");
    parsedDate = dateFormat2.tryParse(dateString);
  }

  return parsedDate;
}


