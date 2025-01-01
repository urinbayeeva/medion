part of 'booking_bloc.dart';

@freezed
abstract class BookingEvent with _$BookingEvent {
  /// Fetch booking types
  const factory BookingEvent.fetchBookingTypes() = _FetchBookingTypes;
}
