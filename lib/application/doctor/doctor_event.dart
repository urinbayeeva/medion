

part of 'doctor_bloc.dart';

@freezed
@freezed
class DoctorEvent with _$DoctorEvent {
  const factory DoctorEvent.fetchDoctors() = _FetchDoctors;
}
