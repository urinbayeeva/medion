part of 'vacancy_bloc.dart';

@freezed
class VacancyEvent with _$VacancyEvent {
  const factory VacancyEvent.fetchVacancies() = _FetchVacancies;

  const factory VacancyEvent.fetchVacancySingle({int? id}) = _FetchVacancySingle;

  const factory VacancyEvent.uploadVacancy({required UploadVacancyModel vacancy}) = _UploadVacancy;

  const factory VacancyEvent.selectPdf({required FileInfo base64Pdf}) = _SelectPdf;
}
