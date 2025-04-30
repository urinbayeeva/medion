part of 'vacancy_bloc.dart';

@freezed
class VacancyEvent with _$VacancyEvent {
  const factory VacancyEvent.fetchVacancies() = _FetchVacancies;
}
