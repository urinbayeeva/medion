part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default(false) bool success,
    @Default([]) List<News> news,
    @Default([]) List<DiseaseModle> diseases,
    @Default([]) List<AdModel> ads,
    @Default([]) List<DiagnosticsModel> medicalServices,
    @Default([])
    List<LocationModel>
        companyLocations, // Changed from mapPosition to companyLocations
  }) = _HomeState;
}
