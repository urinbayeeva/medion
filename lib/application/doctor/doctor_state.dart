

part of 'doctor_bloc.dart';

@freezed
class DoctorState with _$DoctorState {
  const factory DoctorState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default(null) BuiltList<DoctorCategory>? doctors,
  }) = _DoctorState;
}