import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/infrastructure/repository/booking_repository.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/pages/home/directions/component/inner_pages/directions_info_page.dart';

part 'booking_bloc.freezed.dart';

part 'booking_event.dart';

part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository _repository;
  final CancelToken _cancelToken = CancelToken();

  BookingBloc(this._repository) : super(const BookingState()) {
    on<_FetchBookingTypes>(_fetchBookingTypesHandler);
    on<_FetchCategoryServices>(_fetchCategoryServices);
    on<_SelectService>(_onSelectService);
    on<_RefreshServices>(_refreshServices);
    on<_SelectInnerServiceID>(_onSelectedInnerServiceID);
    on<_FetchHomePageServicesBooking>(_onFetchHomePageServicesBooking);
    on<_FetchHomePageServiceDoctors>(_onFetchHomePageServiceDoctors);
    on<_FetchThirdBookingServices>(_onFetchThirdBookingServices);
    on<_FetchServicesByDoctorId>(_fetchServicesByDoctorIdHandler);
  }

  @override
  Future<void> close() {
    _cancelToken.cancel();
    return super.close();
  }

  void _onSelectedInnerServiceID(
    _SelectInnerServiceID event,
    Emitter<BookingState> emit,
  ) {
    emit(state.copyWith(selectedInnerServiceIds: event.ids));
    LogService.i('Updated selectedInnerServiceIds: ${event.ids}');
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
        // EasyLoading.show();

        final res = await _repository.fetchCategoryServices(
          selectedId,
        );

        if (isClosed) return; // Early exit if bloc is closed

        res.fold(
          (error) {
            LogService.e("Error refreshing category services: ${error.message}");
            emit(state.copyWith(loading: false, error: true));
            // EasyLoading.showError(error.message);
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
        if (!isClosed) {
          emit(state.copyWith(loading: false, error: true));
          EasyLoading.showError('Unexpected error occurred');
        }
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

    try {
      // EasyLoading.show();

      final res = await _repository.fetchBookingTypes();

      if (isClosed) return; // Early exit if bloc is closed

      res.fold(
        (error) {
          LogService.e("Error fetching booking types: ${error.message}");
          emit(state.copyWith(loading: false, error: true));
        },
        (data) {
          emit(state.copyWith(
            loading: false,
            success: true,
            bookingTypes: data,
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _fetchBookingTypesHandler: $e");
      if (!isClosed) {
        emit(state.copyWith(loading: false, error: true));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  FutureOr<void> _onFetchHomePageServicesBooking(
    _FetchHomePageServicesBooking event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    try {
      // EasyLoading.show();

      final res = await _repository.fetchHomePageBookingCategories();

      if (isClosed) return;

      res.fold(
        (error) {
          LogService.e("Error fetching home page services: ${error.message}");
          emit(state.copyWith(loading: false, error: true));
        },
        (data) {
          emit(state.copyWith(
            loading: false,
            success: true,
            homePageBookingCategory: data,
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _onFetchHomePageServicesBooking: $e");
      if (!isClosed) {
        emit(state.copyWith(loading: false, error: true));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  FutureOr<void> _fetchCategoryServices(
    _FetchCategoryServices event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    try {
      // EasyLoading.show();

      final res = await _repository.fetchCategoryServices(
        event.id,
      );

      if (isClosed) return; // Early exit if bloc is closed

      res.fold(
        (error) {
          LogService.e("Error fetching category services: ${error.message}");
          emit(state.copyWith(loading: false, error: true));
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
      if (!isClosed) {
        emit(state.copyWith(loading: false, error: true));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  FutureOr<void> _onFetchHomePageServiceDoctors(_FetchHomePageServiceDoctors event, Emitter<BookingState> emit) async {
    // Step 1: Emit a loading state with medicalModel cleared
    emit(state.copyWith(
      loading: true,
      error: false,
      success: false,
      medicalModel: null, // Explicitly clear previous data
    ));

    try {
      // EasyLoading.show();

      final res = await _repository.fetchHomePageBookingDoctors(event.id);

      if (isClosed) return;

      res.fold(
        (error) {
          LogService.e("Error fetching home page doctors: ${error.message}");
          emit(state.copyWith(
            loading: false,
            error: true,
            medicalModel: null, // Ensure no stale data remains
          ));
        },
        (data) {
          final items = <DirectionScrollingItem>[
            DirectionScrollingItem(
              checker: DirectionInfoEnum.info,
              title: "all_informations",
              itemKey: GlobalKey(),
              canSee: data.decodedTitle.isNotEmpty,
            ),
            DirectionScrollingItem(
              checker: DirectionInfoEnum.discounts,
              title: "discounts",
              itemKey: GlobalKey(),
              canSee: data.discount.isNotEmpty,
            ),
            DirectionScrollingItem(
              checker: DirectionInfoEnum.doctors,
              title: "doctors",
              itemKey: GlobalKey(),
              canSee: data.doctors.isNotEmpty,
            ),
            DirectionScrollingItem(
              checker: DirectionInfoEnum.services,
              title: "services",
              itemKey: GlobalKey(),
              canSee: data.services.isNotEmpty,
            ),
          ];

          emit(state.copyWith(loading: false, success: true, medicalModel: data, items: items));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _onFetchHomePageServiceDoctors: $e");
      if (!isClosed) {
        emit(state.copyWith(
          loading: false,
          error: true,
          medicalModel: null, // Clear data on error
        ));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> _onFetchThirdBookingServices(
    _FetchThirdBookingServices event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    try {
      final result = await _repository.getDoctors(
        serviceIds: event.request,
      );

      if (isClosed) return; // Early exit if bloc is closed

      result.fold(
        (failure) {
          emit(state.copyWith(
            loading: false,
            error: true,
            errorMessage: failure.message,
            thirdBookingServices: [],
          ));
        },
        (services) {
          emit(state.copyWith(
            loading: false,
            success: true,
            error: false,
            errorMessage: '',
            thirdBookingServices: services.toList(),
            hasFetchedThirdServices: true,
          ));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(
          loading: false,
          error: true,
          errorMessage: e.toString(),
          thirdBookingServices: [],
        ));
      }
    }
  }

  FutureOr<void> _fetchServicesByDoctorIdHandler(
    _FetchServicesByDoctorId event,
    Emitter<BookingState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      error: false,
      success: false,
      doctorServices: [],
      // Clear previous data
      selectedDoctorId: event.doctorId,
    ));

    try {
      // EasyLoading.show();

      final result = await _repository.getServicesByDoctorId(event.doctorId);

      if (isClosed) return;

      result.fold(
        (failure) {
          emit(state.copyWith(
            loading: false,
            error: true,
            errorMessage: failure.message,
            doctorServices: [],
          ));
          EasyLoading.showError(failure.message);
        },
        (services) {
          emit(state.copyWith(
            loading: false,
            success: true,
            doctorServices: services.toList(),
          ));
        },
      );
    } catch (e) {
      LogService.e("Error fetching doctor services: ${e.toString()}");
      if (!isClosed) {
        emit(state.copyWith(
          loading: false,
          error: true,
          errorMessage: 'Failed to load doctor services',
          doctorServices: [],
        ));
        EasyLoading.showError('Failed to load doctor services');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
