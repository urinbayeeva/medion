import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/repository/visit_create_repo.dart';
import 'package:medion/presentation/component/easy_loading.dart';

part 'visit_bloc.freezed.dart';

part 'visit_event.dart';

part 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  final VisitRepository _repository;

  VisitBloc(this._repository) : super(const VisitState()) {
    on<_CreateVisit>(_createVisitHandler);
  }

  Future<void> _createVisitHandler(_CreateVisit event, Emitter<VisitState> emit) async {
    emit(state.copyWith(createVisitStatus: FormzSubmissionStatus.inProgress));

    final result = await _repository.createVisit(event.request);

    result.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.message, createVisitStatus: FormzSubmissionStatus.failure));
        EasyLoading.showError(failure.message);
      },
      (success) {
        emit(state.copyWith(
          createVisitStatus: FormzSubmissionStatus.success,
          visits: success,
        ));
      },
    );
  }
}
