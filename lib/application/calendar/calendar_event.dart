import 'package:equatable/equatable.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
}

class SelectDate extends CalendarEvent {
  final DateTime selectedDate;

  const SelectDate(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}
