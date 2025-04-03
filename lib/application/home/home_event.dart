part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchNews() = _FetchNews;
  const factory HomeEvent.fetchDiseases() = _FetchDiseases;
  const factory HomeEvent.fetchAds() = _FetchAds;
  const factory HomeEvent.fetchMedicalServices() = _FetchMedicalServices;
  const factory HomeEvent.fetchCompanyLocation() = _FetchCompanyLocation;
  // const factory HomeEvent.fetchServices({required int id}) = _FetchServices;
}
