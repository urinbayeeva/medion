import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/infrastructure/repository/booking_repository.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/presentation/pages/appointment/verify_appointment.dart';
import 'package:medion/presentation/pages/booking/booking_second_page.dart';
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
    on<_AddService>(_addService);
    on<_RemoveService>(_removeService);
    on<_RemoveAllService>(_removeAllService);
  }

  @override
  Future<void> close() {
    _cancelToken.cancel();
    return super.close();
  }

  void _onSelectedInnerServiceID(_SelectInnerServiceID event, Emitter<BookingState> emit) {
    emit(state.copyWith(selectedInnerServiceIds: event.ids));
    LogService.i('Updated selectedInnerServiceIds: ${event.ids}');
  }

  void _onSelectService(_SelectService event, Emitter<BookingState> emit) {
    emit(state.copyWith(selectedServiceId: event.id));
  }

  FutureOr<void> _addService(_AddService event, Emitter<BookingState> emit) async {
    final updated = List<BookingInfo>.from(state.services);

    if (!updated.any((e) => e.service.id == event.service.id)) {
      BookingInfo s = BookingInfo(serviceId: event.id, serviceName: event.name, service: event.service);
      updated.add(s);
    }

    emit(state.copyWith(services: updated));
  }

  FutureOr<void> _removeService(_RemoveService event, Emitter<BookingState> emit) async {
    final updated = List<BookingInfo>.from(state.services)..removeWhere((e) => e.service.id == event.service.id);

    emit(state.copyWith(services: updated));
  }

  FutureOr<void> _removeAllService(_RemoveAllService event, Emitter<BookingState> emit) async {
    emit(state.copyWith(selectedServices: const {}, services: const []));
  }

  FutureOr<void> _refreshServices(_RefreshServices event, Emitter<BookingState> emit) async {
    final selectedId = state.selectedServiceId;
    if (selectedId != null) {
      emit(state.copyWith(refreshServiceStatus: FormzSubmissionStatus.inProgress));

      try {
        final res = await _repository.fetchCategoryServices(selectedId);

        if (isClosed) return; // Early exit if bloc is closed

        res.fold(
          (error) {
            LogService.e("Error refreshing category services: ${error.message}");
            emit(state.copyWith(refreshServiceStatus: FormzSubmissionStatus.failure));
            // EasyLoading.showError(error.message);
          },
          (data) {
            emit(state.copyWith(
              refreshServiceStatus: FormzSubmissionStatus.success,
              categoryServices: data.toList(),
            ));
          },
        );
      } catch (e) {
        LogService.e("Unexpected error in _refreshServices: $e");
        if (!isClosed) {
          emit(state.copyWith(refreshServiceStatus: FormzSubmissionStatus.failure));
          EasyLoading.showError('Unexpected error occurred');
        }
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  FutureOr<void> _fetchBookingTypesHandler(_FetchBookingTypes event, Emitter<BookingState> emit) async {
    emit(state.copyWith(fetchBookingTypesStatus: FormzSubmissionStatus.inProgress));

    try {
      // EasyLoading.show();

      final res = await _repository.fetchBookingTypes();

      if (isClosed) return; // Early exit if bloc is closed

      res.fold(
        (error) {
          LogService.e("Error fetching booking types: ${error.message}");
          emit(state.copyWith(fetchBookingTypesStatus: FormzSubmissionStatus.failure));
        },
        (data) {
          emit(state.copyWith(
            fetchBookingTypesStatus: FormzSubmissionStatus.success,
            bookingTypes: data,
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _fetchBookingTypesHandler: $e");
      if (!isClosed) {
        emit(state.copyWith(fetchBookingTypesStatus: FormzSubmissionStatus.failure));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  FutureOr<void> _onFetchHomePageServicesBooking(
      _FetchHomePageServicesBooking event, Emitter<BookingState> emit) async {
    emit(state.copyWith(fetchBookingTypesStatus: FormzSubmissionStatus.inProgress));

    try {
      // EasyLoading.show();

      final res = await _repository.fetchHomePageBookingCategories();

      if (isClosed) return;

      res.fold(
        (error) {
          LogService.e("Error fetching home page services: ${error.message}");
          emit(state.copyWith(fetchHomePageBookingCategoriesStatus: FormzSubmissionStatus.failure));
        },
        (data) {
          emit(state.copyWith(
            fetchHomePageBookingCategoriesStatus: FormzSubmissionStatus.success,
            homePageBookingCategory: data,
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _onFetchHomePageServicesBooking: $e");
      if (!isClosed) {
        emit(state.copyWith(fetchHomePageBookingCategoriesStatus: FormzSubmissionStatus.failure));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  FutureOr<void> _fetchCategoryServices(_FetchCategoryServices event, Emitter<BookingState> emit) async {
    emit(state.copyWith(fetchCategoryServicesStatus: FormzSubmissionStatus.inProgress));

    try {
      // EasyLoading.show();

      final res = await _repository.fetchCategoryServices(event.id);

      if (isClosed) return; // Early exit if bloc is closed

      res.fold(
        (error) {
          LogService.e("Error fetching category services: ${error.message}");
          emit(state.copyWith(fetchCategoryServicesStatus: FormzSubmissionStatus.failure));
        },
        (data) {
          emit(state.copyWith(
            fetchCategoryServicesStatus: FormzSubmissionStatus.success,
            categoryServices: data.toList(),
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _fetchCategoryServices: $e");
      if (!isClosed) {
        emit(state.copyWith(fetchCategoryServicesStatus: FormzSubmissionStatus.failure));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  FutureOr<void> _onFetchHomePageServiceDoctors(_FetchHomePageServiceDoctors event, Emitter<BookingState> emit) async {
    // Step 1: Emit a loading state with medicalModel cleared
    emit(state.copyWith(
      fetchHomePageBookingDoctorsStatus: FormzSubmissionStatus.inProgress,
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
            fetchHomePageBookingDoctorsStatus: FormzSubmissionStatus.failure,
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

          emit(state.copyWith(
            fetchHomePageBookingDoctorsStatus: FormzSubmissionStatus.success,
            medicalModel: data,
            items: items,
          ));
        },
      );
    } catch (e) {
      LogService.e("Unexpected error in _onFetchHomePageServiceDoctors: $e");
      if (!isClosed) {
        emit(state.copyWith(
          fetchHomePageBookingDoctorsStatus: FormzSubmissionStatus.failure,
          medicalModel: null, // Clear data on error
        ));
        EasyLoading.showError('Unexpected error occurred');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> _onFetchThirdBookingServices(_FetchThirdBookingServices event, Emitter<BookingState> emit) async {
    emit(state.copyWith(getDoctorsStatus: FormzSubmissionStatus.inProgress));

    try {
      final result = await _repository.getDoctors(serviceIds: event.request);

      if (isClosed) return; // Early exit if bloc is closed

      result.fold(
        (failure) {
          emit(state.copyWith(
            getDoctorsStatus: FormzSubmissionStatus.failure,
            errorMessage: failure.message,
            thirdBookingServices: [],
          ));
        },
        (services) {
          emit(state.copyWith(
            getDoctorsStatus: FormzSubmissionStatus.success,
            errorMessage: '',
            thirdBookingServices: services.toList(),
            hasFetchedThirdServices: true,
          ));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(
          getDoctorsStatus: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
          thirdBookingServices: [],
        ));
      }
    }
  }

  FutureOr<void> _fetchServicesByDoctorIdHandler(_FetchServicesByDoctorId event, Emitter<BookingState> emit) async {
    emit(state.copyWith(
      getServicesByDoctorIdStatus: FormzSubmissionStatus.inProgress,
      doctorServices: [],
      selectedDoctorId: event.doctorId,
    ));

    try {
      // EasyLoading.show();

      final result = await _repository.getServicesByDoctorId(event.doctorId);

      if (isClosed) return;

      result.fold(
        (failure) {
          emit(state.copyWith(
            getServicesByDoctorIdStatus: FormzSubmissionStatus.failure,
            errorMessage: failure.message,
            doctorServices: [],
          ));
          EasyLoading.showError(failure.message);
        },
        (services) {
          emit(state.copyWith(
            getServicesByDoctorIdStatus: FormzSubmissionStatus.success,
            doctorServices: services.toList(),
          ));
        },
      );
    } catch (e) {
      LogService.e("Error fetching doctor services: ${e.toString()}");
      if (!isClosed) {
        emit(state.copyWith(
          getServicesByDoctorIdStatus: FormzSubmissionStatus.failure,
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
