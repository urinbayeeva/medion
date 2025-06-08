part of 'doctors_bloc.dart';

@freezed
class DoctorState with _$DoctorState {
  const DoctorState._();

  const factory DoctorState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default(null) DoctorCategory? doctors,

    // Doctor details specific state
    @Default(false) bool doctorDetailsLoading,
    @Default(false) bool doctorDetailsError,
    @Default(false) bool doctorDetailsSuccess,
    @Default(null) ModelDoctor? doctorDetails,
    @Default([]) List<DoctorsJob> doctorsJob,
  }) = _DoctorState;
}
