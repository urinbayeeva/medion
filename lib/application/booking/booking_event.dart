part of 'booking_bloc.dart';

@freezed
abstract class BookingEvent with _$BookingEvent {
  const factory BookingEvent.fetchBookingTypes() = _FetchBookingTypes;
  const factory BookingEvent.fetchCategoryServices({
    required int id,
  }) = _FetchCategoryServices;
}
