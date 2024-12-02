import 'package:medion/infrastructure/repository/calendar_repo.dart';

class SaveSelectedDateUseCase {
  final CalendarRepository repository;
  SaveSelectedDateUseCase(this.repository);

  Future<void> call(DateTime date) {
    return repository.saveSelectedDate(date);
  }
}
