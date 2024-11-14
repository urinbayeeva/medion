import 'package:flutter_bloc/flutter_bloc.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState(DateTime.now())) {
    on<SelectDate>((event, emit) {
      emit(CalendarState(event.selectedDate));
    });
  }
}
