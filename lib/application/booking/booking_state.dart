part of 'booking_bloc.dart';

@freezed
class BookingState with _$BookingState {
  const BookingState._();

  const factory BookingState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<BookingTypeModel> bookingTypes,
    @Default([]) List<Category> categoryServices,
    int? selectedServiceId,
    @Default([]) List<int> selectedInnerServiceIds,
    @Default('') String selectedSpecialty,
    @Default('') String errorMessage,
    @Default([]) List<ThirdBookingService> thirdBookingServices,
    @Default(false) bool hasFetchedThirdServices,    
      @Default([]) List<HomepageBookingCategory> homePageBookingCategory,
    MedicalModel? medicalModel, 
        // @Default([]) List<CreatePatientResponse> patientVisits,

  }) = _BookingState;

  bool get hasError => errorMessage.isNotEmpty;
}
