part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.started() = _Started;

  const factory MapEvent.launchYandexTaxi(Point companyLocation) = _LaunchTaxi;

  const factory MapEvent.checkLocationPermission() = _CheckPermission;

  const factory MapEvent.makeSingleRoute(Point endLocation) = _MakeSingleRoute;

  const factory MapEvent.makeMainRoute(Point endLocation) = _MakeMainRoute;

  const factory MapEvent.calculateDistance({required Point start, required Point end}) = _CalculateDistance;

  const factory MapEvent.getUserLocation() = _GetUserLocation;
}
