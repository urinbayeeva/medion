part of 'doctors_bloc.dart';

@freezed
class DoctorState with _$DoctorState {
  const DoctorState._();

  const factory DoctorState({
    @Default(null) DoctorCategory? doctors,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus doctorSingleStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus fetchDoctors,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus fetchDoctorsJobs,

    // Doctor details specific state
    @Default(null) ModelDoctor? doctorDetails,
    @Default([]) List<String> doctorsFilterList,
    @Default([]) List<DoctorsJob> doctorsJob,
    @Default([]) List<DoctorsInfo> doctorInfoItems,
  }) = _DoctorState;
}
