part of 'booking_bloc.dart';

@freezed
class BookingState with _$BookingState {
  const BookingState._();

  const factory BookingState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus serviceStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus refreshServiceStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus fetchBookingTypesStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus fetchHomePageBookingCategoriesStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus fetchCategoryServicesStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus fetchHomePageBookingDoctorsStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getDoctorsStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getServicesByDoctorIdStatus,
    @Default([]) List<BookingTypeModel> bookingTypes,
    @Default([]) List<Category> categoryServices,
    @Default([]) List<int> selectedInnerServiceIds,
    @Default([]) List<ThirdBookingService> thirdBookingServices,
    @Default([]) List<HomepageBookingCategory> homePageBookingCategory,
    @Default([]) List<MedicalServiceCategory> doctorServices,
    @Default([]) List<DirectionScrollingItem> items,
    @Default([]) List<BookingInfo> services,
    @Default([]) List<AppointmentItem> appointments,
    @Default(<int, List<Service>>{}) Map<int, List<Service>> selectedServices,
    @Default('') String selectedSpecialty,
    @Default('') String errorMessage,
    @Default(false) bool hasFetchedThirdServices,
    MedicalModel? medicalModel,
    int? selectedDoctorId,
    int? selectedServiceId,
  }) = _BookingState;

  bool get hasError => errorMessage.isNotEmpty;

  int get totalSelectedCount => selectedServices.values.fold(0, (sum, list) => sum + list.length);
}
