part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchNews() = _FetchNew;

  // const factory HomeEvent.fetchServices({required int id}) = _FetchServices;
}
