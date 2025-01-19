part of 'doctors_bloc.dart';

@freezed
abstract class DoctorEvent with _$DoctorEvent {
  const factory DoctorEvent.fetchDoctors() = _FetchDoctors;
}