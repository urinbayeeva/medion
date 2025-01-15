import 'dart:async';

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
  }

   void _onSelectService(_SelectService event, Emitter<BookingState> emit) {
    emit(state.copyWith(selectedServiceId: event.id));
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
}
