import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/abstract_repo/i_recruitment_facade.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/presentation/pages/others/career/data.dart';

part 'vacancy_bloc.freezed.dart';

part 'vacancy_event.dart';

part 'vacancy_state.dart';

class VacancyBloc extends Bloc<VacancyEvent, VacancyState> {
  final IRecruitmentFacade _recruitmentFacade;

  VacancyBloc(this._recruitmentFacade) : super(const VacancyState()) {
    on<_FetchVacancies>(_onFetchVacancies);
    on<_FetchVacancySingle>(_onFetchVacancySingle);
    on<_UploadVacancy>(_uploadVacancy);
    on<_SelectPdf>(_selectPdf);
    add(const _FetchVacancies());
  }

  Future<void> _selectPdf(_SelectPdf event, Emitter<VacancyState> emit) async {
    emit(state.copyWith(selectPdf: FormzSubmissionStatus.inProgress));
    if (event.base64Pdf.base64.isEmpty || event.base64Pdf.base64.length < 10) {
      emit(state.copyWith(selectPdf: FormzSubmissionStatus.failure));
    } else {
      emit(state.copyWith(
        selectPdf: FormzSubmissionStatus.success,
        base64Pdf: event.base64Pdf,
      ));
    }
  }

  Future<void> _uploadVacancy(_UploadVacancy event, Emitter<VacancyState> emit) async {
    emit(state.copyWith(uploadStatus: FormzSubmissionStatus.inProgress));
    final res = await _recruitmentFacade.uploadVacancy(vacancy: event.vacancy);

    res.fold(
      (failure) {
        log("Upload Failure");
        emit(state.copyWith(uploadStatus: FormzSubmissionStatus.failure));
      },
      (success) {
        log("Upload success");
        emit(state.copyWith(uploadStatus: FormzSubmissionStatus.success));
      },
    );
  }

  Future<void> _onFetchVacancySingle(_FetchVacancySingle event, Emitter<VacancyState> emit) async {
    emit(state.copyWith(vacancySingleStatus: FormzSubmissionStatus.inProgress));
    final res = await _recruitmentFacade.fetchVacancySingle(id: event.id);
    res.fold(
      (failure) => emit(state.copyWith(vacancySingleStatus: FormzSubmissionStatus.failure)),
      (result) {
        emit(state.copyWith(
          vacancySingle: result,
          vacancySingleStatus: FormzSubmissionStatus.success,
        ));
      },
    );
  }

  Future<void> _onFetchVacancies(_FetchVacancies event, Emitter<VacancyState> emit) async {
    EasyLoading.show(status: 'loading...'.tr());

    emit(state.copyWith(vacancyStatus: FormzSubmissionStatus.inProgress));

    final result = await _recruitmentFacade.fetchVacancies();

    result.fold(
      (failure) {
        EasyLoading.dismiss();
        emit(state.copyWith(vacancyStatus: FormzSubmissionStatus.failure));
      },
      (vacancies) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          vacancyStatus: FormzSubmissionStatus.success,
          vacancies: vacancies,
        ));
      },
    );
  }
}
