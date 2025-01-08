import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/repository/doctor_repository.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';

part 'doctor_bloc.freezed.dart';
part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorService apiService;

  DoctorBloc(this.apiService) : super(const DoctorState()) {
    on<_FetchDoctors>(_fetchDoctors);
  }

  Future<void> _fetchDoctors(
    _FetchDoctors event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    try {
      final response = await apiService.getDoctorsInfo();
      if (response.isSuccessful) {
        // print(response);
        emit(state.copyWith(
          loading: false,
          success: true,
          doctors: response.body!,
        ));
      } else {
        emit(state.copyWith(loading: false, error: true));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, error: true));
    }
  }
}
