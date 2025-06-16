import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/abstract_repo/i_recruitment_facade.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';

import 'package:medion/presentation/component/easy_loading.dart';

part 'vacancy_bloc.freezed.dart';

part 'vacancy_event.dart';

part 'vacancy_state.dart';

class VacancyBloc extends Bloc<VacancyEvent, VacancyState> {
  final IRecruitmentFacade _recruitmentFacade;

  VacancyBloc(this._recruitmentFacade) : super(const VacancyState.initial()) {
    on<_FetchVacancies>(_onFetchVacancies);
  }

  Future<void> _onFetchVacancies(_FetchVacancies event, Emitter<VacancyState> emit) async {
    EasyLoading.show(status: 'loading...'.tr());

    emit(const VacancyState.loading());

    final result = await _recruitmentFacade.fetchVacancies();

    result.fold(
      (failure) {
        EasyLoading.dismiss();
        emit(VacancyState.error(failure.message));
      },
      (vacancies) {
        EasyLoading.dismiss();
        emit(VacancyState.loaded(vacancies));
      },
    );
  }
}
