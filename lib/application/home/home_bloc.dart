import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/map/map_model.dart';
import 'package:medion/domain/models/medical_services/medical_services.dart';
import 'package:medion/infrastructure/repository/home_repo.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeState()) {
    on<_FetchDiseases>(_fetchDiseases);
    on<_FetchAds>(_fetchAds);
    on<_FetchMedicalServices>(_fetchMedicalServices);
    on<_FetchCompanyLocation>(_fetchCompanyLocation);
  }

  FutureOr<void> _fetchCompanyLocation(_FetchCompanyLocation event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    // EasyLoading.show();

    final res = await _repository.getCompanyLocation();

    res.fold(
      (error) {
        LogService.e("Error in fetching company locations: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          companyLocations: data,
        ));
      },
    );
  }

  FutureOr<void> _fetchDiseases(_FetchDiseases event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    final res = await _repository.getDiseases();

    res.fold(
      (error) {
        LogService.e("Error in fetching diseases: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        LogService.i("Fetched diseases: ${data.length} items"); // Log the data
        emit(state.copyWith(
          loading: false,
          success: true,
          diseases: data,
        ));
      },
    );
  }

  FutureOr<void> _fetchAds(_FetchAds event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    // EasyLoading.show();

    final res = await _repository.getAds();

    res.fold(
      (error) {
        LogService.e("Error in fetching ads: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          ads: data,
        ));
      },
    );
  }

  FutureOr<void> _fetchMedicalServices(_FetchMedicalServices event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    // EasyLoading.show();

    final res = await _repository.getDiagnosis();

    res.fold(
      (error) {
        LogService.e("Error in fetching medical services: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          medicalServices: data,
        ));
      },
    );
  }
}
