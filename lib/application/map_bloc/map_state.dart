part of 'map_bloc.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getLocationStatus,
    @Default(LocationPermission.whileInUse) LocationPermission permissionStatus,
    @Default([]) List<MapObject> singleMapObjects,
    @Default([]) List<MapObject> mainMapObjects,
    @Default(0) double distanceInKm,
    @Default('') String travelTime,
    @Default(false) bool hasLocationPermission,
    Point? userLocation,
    @Default('') String errorMessage,
  }) = _MapState;

  const MapState._();
}
