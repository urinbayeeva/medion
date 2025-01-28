import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/infrastructure/repository/booking_repository.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'booking_bloc.freezed.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository _repository;

  BookingBloc(this._repository) : super(const BookingState()) {
    on<_FetchBookingTypes>(_fetchBookingTypesHandler);
    on<_FetchCategoryServices>(_fetchCategoryServices);
    on<_SelectService>(_onSelectService);
    on<_RefreshServices>(_refreshServices);
    on<_SelectInnerServiceID>(_onSelectedInnerServiceID);
    // New Doctor Event Handlers

    on<_FetchHomePageServicesBooking>(_onFetchHomePageServicesBooking);
    on<_FetchHomePageServiceDoctors>(_onFetchHomePageServiceDoctors);

    //Third Service
    on<_FetchThirdBookingServices>(_onFetchThirdBookingServices);
  }

  void _onSelectedInnerServiceID(
      _SelectInnerServiceID event, Emitter<BookingState> emit) {
    emit(state.copyWith(selectedInnerServiceIds: event.ids));
    print('Updated state: ${state.selectedInnerServiceIds}');
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

  //Home Page Service Booking

  FutureOr<void> _onFetchHomePageServicesBooking(
    _FetchHomePageServicesBooking event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    EasyLoading.show();

    final res = await _repository.fetchHomePageBookingCategories();

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
          homePageBookingCategory: data,
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

  FutureOr<void> _onFetchHomePageServiceDoctors(
    _FetchHomePageServiceDoctors event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    try {
      EasyLoading.show();

      final res = await _repository.fetchHomePageBookingDoctors(event.id);

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
            medicalModel: data, // Store the single MedicalModel
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

  //Third Service

  Future<void> _onFetchThirdBookingServices(
  _FetchThirdBookingServices event,
  Emitter<BookingState> emit,
) async {
  emit(state.copyWith(loading: true, error: false, success: false));

  try {
    final result = await _repository.getDoctors(serviceIds: event.request);

    result.fold(
      (failure) {
        emit(state.copyWith(
          loading: false,
          error: true,
          errorMessage: failure.message,
          thirdBookingServices: [], // Clear the list on error
        ));
      },
      (services) {
        // Convert BuiltList to List
        final servicesList = services.toList();
        
        emit(state.copyWith(
          loading: false,
          success: true,
          error: false,
          errorMessage: '',
          thirdBookingServices: servicesList,
        ));
      },
    );
  } catch (e) {
    emit(state.copyWith(
      loading: false,
      error: true,
      errorMessage: e.toString(),
      thirdBookingServices: [], // Clear the list on error
    ));
  }
}
}
