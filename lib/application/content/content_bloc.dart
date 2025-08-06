import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/team/team_model.dart';
import 'package:medion/infrastructure/repository/company_service.dart';
import 'package:medion/infrastructure/repository/content_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';

part 'content_bloc.freezed.dart';

part 'content_event.dart';

part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentServiceRepo _repository;
  final CompanyServiceRepo _companyService;

  ContentBloc(this._repository, this._companyService) : super(const ContentState()) {
    on<_FetchContent>(_fetchContent);
    on<_GetSingleContent>(_fetchSingleContent);
    on<_GetTeams>(_getTeams);
  }

  FutureOr<void> _getTeams(_GetTeams event, Emitter<ContentState> emit) async {
    emit(state.copyWith(teamStatus: FormzSubmissionStatus.inProgress));
    final result = await _companyService.getTeams(type: event.type);
    result.fold(
      (failure) {
        emit(state.copyWith(teamStatus: FormzSubmissionStatus.failure));
      },
      (result) {
        final jobTypes = result.map((e) => e.type).toSet().toList();

        emit(state.copyWith(
          teamStatus: FormzSubmissionStatus.success,
          team: result,
          jobTypes: jobTypes,
        ));
      },
    );
  }

  FutureOr<void> _fetchSingleContent(_GetSingleContent event, Emitter<ContentState> emit) async {
    emit(state.copyWith(singleContentStatus: FormzSubmissionStatus.inProgress));
    final res = await _repository.fetchSingleContents(pk: event.id, type: event.type);

    res.fold(
      (error) {
        emit(state.copyWith(
          singleContentStatus: FormzSubmissionStatus.failure,
        ));
      },
      (success) {
        emit(state.copyWith(
          singleContent: success,
          singleContentStatus: FormzSubmissionStatus.success,
        ));
      },
    );
  }

  FutureOr<void> _fetchContent(_FetchContent event, Emitter<ContentState> emit) async {
    emit(state.copyWith(fetchContentStatus: FormzSubmissionStatus.inProgress));

    final res = await _repository.fetchContents(type: event.type);
    res.fold(
      (error) {
        LogService.e("Error in fetching content: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(fetchContentStatus: FormzSubmissionStatus.failure));
      },
      (data) {
        EasyLoading.dismiss();
        // Create a new map with the existing content
        final updatedContent = Map<String, List<ContentModel>>.from(state.contentByType);
        updatedContent[event.type] = data;
        emit(state.copyWith(fetchContentStatus: FormzSubmissionStatus.success, contentByType: updatedContent));
      },
    );
  }
}
