
import 'package:equatable/equatable.dart';

class CalendarState extends Equatable {
  final DateTime selectedDate;

  const CalendarState(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}
