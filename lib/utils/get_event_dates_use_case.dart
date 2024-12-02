import 'package:medion/infrastructure/repository/calendar_repo.dart';

class GetEventDatesUseCase {
  final CalendarRepository repository;
  GetEventDatesUseCase(this.repository);

  Future<List<DateTime>> call() {
    return repository.getEventDates();
  }
}
