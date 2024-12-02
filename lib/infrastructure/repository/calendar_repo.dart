abstract class CalendarRepository {
  Future<List<DateTime>> getEventDates();
  Future<void> saveSelectedDate(DateTime date);
  DateTime getSelectedDate();
}
