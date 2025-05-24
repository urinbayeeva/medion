import 'package:flutter/material.dart';

class AppointmentState {
  static final ValueNotifier<List<Map<String, String>>> selectedAppointments =
      ValueNotifier([]);

  static void addAppointment(Map<String, String> appointment) {
    final existingIndex = selectedAppointments.value
        .indexWhere((a) => a['serviceId'] == appointment['serviceId']);

    if (existingIndex != -1) {
      final newList =
          List<Map<String, String>>.from(selectedAppointments.value);
      newList[existingIndex] = appointment;
      selectedAppointments.value = newList;
    } else {
      selectedAppointments.value = [...selectedAppointments.value, appointment];
    }
  }

  static void removeAppointment(String serviceId) {
    selectedAppointments.value = selectedAppointments.value
        .where((a) => a['serviceId'] != serviceId)
        .toList();
  }

  static bool isTimeSlotTaken(
      String date, String time, String currentServiceId) {
    return selectedAppointments.value.any((appointment) =>
        appointment['date'] == date &&
        appointment['time'] == time &&
        appointment['serviceId'] != currentServiceId);
  }
}
