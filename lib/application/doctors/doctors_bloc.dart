import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/repository/doctor_repository.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'doctors_bloc.freezed.dart';
part 'doctors_event.dart';
part 'doctors_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository _repository;

  DoctorBloc(this._repository) : super(const DoctorState()) {
    on<_FetchDoctors>(_fetchDoctors);
    on<_FetchDoctorDetails>(_fetchDoctorDetails);
  }

  FutureOr<void> _fetchDoctors(
    _FetchDoctors event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      error: false,
      success: false,
      doctorDetailsLoading: false,
    ));
    // EasyLoading.show();

    final res = await _repository.fetchDoctors();
    res.fold(
      (error) {
        LogService.e("Error in fetching doctors: $error");
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

  FutureOr<void> _fetchDoctorDetails(
    _FetchDoctorDetails event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(
      doctorDetailsLoading: true,
      doctorDetailsError: false,
      doctorDetailsSuccess: false,
      doctorDetails: null,
    ));

    final res = await _repository.getDoctorDetailInfo(event.doctorId);

    res.fold(
      (error) {
        emit(state.copyWith(
          doctorDetailsLoading: false,
          doctorDetailsError: true,
        ));
      },
      (doctor) {
        emit(state.copyWith(
          doctorDetailsLoading: false,
          doctorDetailsSuccess: true,
          doctorDetails: doctor,
        ));
      },
    );
  }
}
