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
    @Default(null) int? selectedServiceId,
    @Default(null) List<int>? selectedInnerServiceIds,

    // New Doctor States
    @Default([]) List<ServiceModel> doctors,
    @Default([]) List<ServiceModel> filteredDoctors,
    @Default('') String selectedSpecialty,
    @Default(0) int maxPrice,
    @Default('') String errorMessage,

    //Home Page
       @Default([]) List<HomepageBookingCategory> homePageBookingCategory,
          MedicalModel? medicalModel,  // Changed to single MedicalModel

  }) = _BookingState;

  bool get hasError => errorMessage.isNotEmpty;
  bool get hasDoctors => doctors.isNotEmpty;
  bool get hasFilters => selectedSpecialty.isNotEmpty || maxPrice > 0;
}
