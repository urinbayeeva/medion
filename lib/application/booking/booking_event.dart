part of 'booking_bloc.dart';

@freezed
abstract class BookingEvent with _$BookingEvent {
  const factory BookingEvent.fetchBookingTypes() = _FetchBookingTypes;
  const factory BookingEvent.selectService({required int id}) =
      _SelectService; // New Event
  const factory BookingEvent.refreshServices() = _RefreshServices;
  const factory BookingEvent.selectInnerServiceID({required List<int> ids}) =
      _SelectInnerServiceID;

  const factory BookingEvent.fetchCategoryServices({
    required int id,
  }) = _FetchCategoryServices;

  factory BookingEvent.getDoctorsTime({
    required List<int> id,
  }) = _GetDoctorsTime;

  const factory BookingEvent.filterDoctorsBySpecialty({
    required String specialty,
  }) = _FilterDoctorsBySpecialty;

  const factory BookingEvent.filterDoctorsByPrice({
    required int maxPrice,
  }) = _FilterDoctorsByPrice;

    const factory BookingEvent.fetchThirdBookingServices({
    required List<int> request,
  }) = _FetchThirdBookingServices;

    const factory BookingEvent.fetchHomePageServicesBooking() = _FetchHomePageServicesBooking;

  const factory BookingEvent.fetchHomePageServiceDoctors({required int id}) = _FetchHomePageServiceDoctors;

const factory BookingEvent.getCreatePatientVisit({
  required List<CreatePatientRequest> request,
}) = _GetCreatePatientVisit;

}
