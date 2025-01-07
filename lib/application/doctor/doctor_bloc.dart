import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/repository/doctor_repository.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';

part 'doctor_bloc.freezed.dart';
part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository _repository;

  DoctorBloc(this._repository) : super(const DoctorState()) {
    on<_GetDoctors>(_getDoctorsHandler);
  }

  // Future<void> _getDoctorsHandler(
  //   _GetDoctors event,
  //   Emitter<DoctorState> emit,
  // ) async {
  //   emit(state.copyWith(isLoading: true, error: null));

  //   final result = await _repository.getDoctors();

  //   result.fold(
  //     (failure) => emit(state.copyWith(
  //       isLoading: false,
  //       error: failure.message,
  //     )),
  //     (doctors) => emit(state.copyWith(
  //       isLoading: false,
  //       doctors: doctors,
  //     )),
  //   );
  // }

  FutureOr<void> _getDoctorsHandler(
    _GetDoctors event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    EasyLoading.show();

    final res = await _repository.getDoctors();

    res.fold(
      (error) {
        LogService.e("Error in fetching booking types: $error");
        EasyLoading.showError(error.message); 
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          doctors: data,
        ));
      },
    );
  }
}
