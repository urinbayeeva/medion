part of 'doctors_bloc.dart';

@freezed
abstract class DoctorEvent with _$DoctorEvent {
  const factory DoctorEvent.fetchDoctors() = _FetchDoctors;

  const factory DoctorEvent.fetchDoctorDetails(int doctorId) = _FetchDoctorDetails;

  const factory DoctorEvent.fetchDoctorsJob() = _FetchDoctorsJob;
}
