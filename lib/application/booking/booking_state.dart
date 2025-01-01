part of 'booking_bloc.dart';

@immutable
@freezed
class BookingState with _$BookingState {
  const BookingState._();

  const factory BookingState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<BookingTypeModel> bookingTypes,
  }) = _BookingState;
}
