part of 'vacancy_bloc.dart';

@freezed
class VacancyState with _$VacancyState {
  const VacancyState._();

  const factory VacancyState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus vacancyStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus vacancySingleStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus uploadStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus selectPdf,
    @Default(FileInfo()) FileInfo base64Pdf,
    @Default(null) VacancyModel? vacancies,
    @Default(null) JobApplicationModel? vacancySingle,
  }) = _VacansyState;
}
