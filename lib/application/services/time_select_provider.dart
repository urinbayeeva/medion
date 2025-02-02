import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSelectionProvider with ChangeNotifier {
  // This will store all selected times globally
  final Set<String> _selectedTimes = {};

  Set<String> get selectedTimes => _selectedTimes;

  // Check if the time is selectable
  bool isTimeSelectable(String time) {
    DateTime selectedDateTime = DateFormat('HH:mm').parse(time);
    DateTime nextHalfHour = selectedDateTime.add(const Duration(minutes: 30));
    String nextTime = DateFormat('HH:mm').format(nextHalfHour);

    // Time is selectable if neither it nor the next half hour is selected
    return !_selectedTimes.contains(time) && !_selectedTimes.contains(nextTime);
  }

  // Add a selected time
  void selectTime(String time) {
    if (isTimeSelectable(time)) {
      _selectedTimes.add(time);
      notifyListeners();
    }
  }

  // Deselect a time
  void deselectTime(String time) {
    _selectedTimes.remove(time);
    notifyListeners();
  }
}
