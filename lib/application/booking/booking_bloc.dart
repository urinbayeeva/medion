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

  BookingBloc(
    this._repository,
  ) : super(const BookingState()) {
    on<_FetchBookingTypes>(_fetchBookingTypesHandler);
  }

  /// Fetch Booking Types
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
        EasyLoading.dismiss(); // Dismiss loading indicator
        emit(state.copyWith(
          loading: false,
          success: true,
          bookingTypes: data, // Update with fetched data
        ));
      },
    );
  }
}
