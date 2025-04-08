import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/repository/visit_create_repo.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'visit_bloc.freezed.dart';
part 'visit_event.dart';
part 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  final VisitRepository _repository;

  VisitBloc(this._repository) : super(const VisitState()) {
    on<_CreateVisit>(_createVisitHandler);
  }

  Future<void> _createVisitHandler(
    _CreateVisit event,
    Emitter<VisitState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    try {
      EasyLoading.show();
      final Either<ResponseFailure, List<VisitOrder>> result =
          await _repository.createVisit(event.request);

      if (isClosed) return;

      result.fold(
        (failure) {
          LogService.e("Error creating visit: ${failure.message}");
          emit(state.copyWith(
              loading: false, error: true, errorMessage: failure.message));
          EasyLoading.showError(failure.message);
        },
        (data) {
          emit(state.copyWith(
            loading: false,
            success: true,
            visits: data,
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _createVisitHandler: $e");
      if (!isClosed) {
        emit(state.copyWith(
            loading: false,
            error: true,
            errorMessage: 'Unexpected error occurred'));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
