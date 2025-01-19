part of 'doctors_bloc.dart';

@freezed
class DoctorState with _$DoctorState {
  const DoctorState._();

  const factory DoctorState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<DoctorCategory> doctors,
  }) = _DoctorState;
}