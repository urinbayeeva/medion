import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/infrastructure/repository/booking_repository.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'booking_bloc.freezed.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository _repository;

  BookingBloc(this._repository) : super(BookingState()) {
    on<_FetchBookingTypes>(_fetchBookingTypesHandler);
    on<_FetchCategoryServices>(_fetchCategoryServices);
    on<_SelectService>(_onSelectService);
    on<_RefreshServices>(_refreshServices);
    on<_SelectInnerServiceID>(_onSelectedInnerServiceID);
    // New Doctor Event Handlers
    on<_GetDoctorsTime>(_onGetDoctorsTime);
    on<_FilterDoctorsBySpecialty>(_onFilterDoctorsBySpecialty);
    on<_FilterDoctorsByPrice>(_onFilterDoctorsByPrice);
  }

  void _onSelectedInnerServiceID(
      _SelectInnerServiceID event, Emitter<BookingState> emit) {
    emit(state.copyWith(selectedInnerServiceIds: event.ids));
  }

  void _onSelectService(_SelectService event, Emitter<BookingState> emit) {
    emit(state.copyWith(selectedServiceId: event.id));
  }

  FutureOr<void> _refreshServices(
    _RefreshServices event,
    Emitter<BookingState> emit,
  ) async {
    final selectedId = state.selectedServiceId;
    if (selectedId != null) {
      emit(state.copyWith(loading: true, error: false, success: false));

      try {
        EasyLoading.show();

        final res = await _repository.fetchCategoryServices(selectedId);

        res.fold(
          (error) {
            LogService.e(
                "Error in refreshing category services: ${error.message}");
            emit(state.copyWith(loading: false, error: true));
            EasyLoading.showError(error.message);
          },
          (data) {
            emit(state.copyWith(
              loading: false,
              success: true,
              categoryServices: data.toList(),
            ));
          },
        );
      } catch (e) {
        LogService.e("Unexpected error in _refreshServices: $e");
        emit(state.copyWith(loading: false, error: true));
        EasyLoading.showError('Unexpected error occurred');
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  FutureOr<void> _fetchBookingTypesHandler(
    _FetchBookingTypes event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    EasyLoading.show();

    final res = await _repository.fetchBookingTypes();

    res.fold(
      (error) {
        LogService.e("Error in fetching booking types: $error");
        EasyLoading.showError(error.message); // Show error message
        emit(state.copyWith(loading: false, error: true)); // Update state
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          bookingTypes: data,
        ));
      },
    );
  }

  FutureOr<void> _fetchCategoryServices(
    _FetchCategoryServices event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    try {
      EasyLoading.show();

      final res = await _repository.fetchCategoryServices(event.id);

      res.fold(
        (error) {
          LogService.e("Error in fetching category services: ${error.message}");
          emit(state.copyWith(loading: false, error: true));
          EasyLoading.showError(error.message);
        },
        (data) {
          emit(state.copyWith(
            loading: false,
            success: true,
            categoryServices: data.toList(),
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _fetchCategoryServices: $e");
      emit(state.copyWith(loading: false, error: true));
      EasyLoading.showError('Unexpected error occurred');
    } finally {
      EasyLoading.dismiss();
    }
  }

   Future<void> _onGetDoctorsTime(
    _GetDoctorsTime event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(loading: true, errorMessage: ''));

    try {
      EasyLoading.show();

      final result = await _repository.getDoctorsTimeSlots(
        serviceIds: BuiltList<int>.from(event.serviceIds),
        days: event.days,
      );

      result.fold(
        (failure) {
          LogService.e("Error in fetching doctors: ${failure.message}");
          emit(state.copyWith(
            loading: false,
            errorMessage: failure.message,
          ));
          EasyLoading.showError(failure.message);
        },
        (doctors) {
          emit(state.copyWith(
            loading: false,
            doctors: doctors.toList(),
            filteredDoctors: doctors.toList(),
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _onGetDoctorsTime: $e");
      emit(state.copyWith(
        loading: false,
        errorMessage: 'Unexpected error occurred',
      ));
      EasyLoading.showError('Unexpected error occurred');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void _onFilterDoctorsBySpecialty(
    _FilterDoctorsBySpecialty event,
    Emitter<BookingState> emit,
  ) {
    final filteredDoctors = state.doctors.map((service) {
      return ServiceModel((b) => b
        ..serviceId = service.serviceId
        ..serviceName = service.serviceName
        ..companiesDoctors = BuiltList<CompanyDoctor>.from(
          service.companiesDoctors.map((company) {
            return CompanyDoctor((b) => b
              ..companyId = company.companyId
              ..companyName = company.companyName
              ..doctor = BuiltList<Doctor>.from(
                company.doctor.where(
                  (doctor) => event.specialty.isEmpty || 
                    doctor.specialty == event.specialty,
                ),
              ).toBuilder());
          }).where((company) => company.doctor.isNotEmpty),
        ).toBuilder());
    }).where((service) => 
      service.companiesDoctors.isNotEmpty
    ).toList();

    emit(state.copyWith(
      selectedSpecialty: event.specialty,
      filteredDoctors: filteredDoctors,
    ));
  }

  void _onFilterDoctorsByPrice(
    _FilterDoctorsByPrice event,
    Emitter<BookingState> emit,
  ) {
    final filteredDoctors = state.doctors.map((service) {
      return ServiceModel((b) => b
        ..serviceId = service.serviceId
        ..serviceName = service.serviceName
        ..companiesDoctors = BuiltList<CompanyDoctor>.from(
          service.companiesDoctors.map((company) {
            return CompanyDoctor((b) => b
              ..companyId = company.companyId
              ..companyName = company.companyName
              ..doctor = BuiltList<Doctor>.from(
                company.doctor.where(
                  (doctor) => event.maxPrice == 0 || 
                    doctor.price <= event.maxPrice,
                ),
              ).toBuilder());
          }).where((company) => company.doctor.isNotEmpty),
        ).toBuilder());
    }).where((service) => 
      service.companiesDoctors.isNotEmpty
    ).toList();

    emit(state.copyWith(
      maxPrice: event.maxPrice,
      filteredDoctors: filteredDoctors,
    ));
  }
}
