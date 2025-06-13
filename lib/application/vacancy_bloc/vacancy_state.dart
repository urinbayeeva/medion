part of 'vacancy_bloc.dart';

@freezed
class VacancyState with _$VacancyState {
  const factory VacancyState.initial() = _Initial;

  const factory VacancyState.loading() = _Loading;

  const factory VacancyState.loaded(BuiltList<VacancyModel> vacancies) = _Loaded;

  const factory VacancyState.error(String message) = _Error;
}
