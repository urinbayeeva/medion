import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_event.dart';

part 'map_state.dart';

part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<_Started>(_onStart);
    on<_LaunchTaxi>(_onLaunchTaxi);
    on<_CheckPermission>(_onCheckPermission);
    on<_MakeSingleRoute>(_onMakeSingleRoute);
    on<_MakeMainRoute>(_onMakeMainRoute);
    on<_CalculateDistance>(_onCalculate);
    on<_GetUserLocation>(_onGetUserLocation);
  }

  Future<void> _onCheckPermission(_CheckPermission event, Emitter<MapState> emit) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    var permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {
      emit(state.copyWith(
        hasLocationPermission: false,
        errorMessage: 'Location service is disabled',
        permissionStatus: permission,
      ));
      return;
    }

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    final hasPermission = permission == LocationPermission.whileInUse || permission == LocationPermission.always;

    emit(state.copyWith(
      hasLocationPermission: hasPermission,
      permissionStatus: permission,
      errorMessage: hasPermission ? '' : 'Location permission denied',
    ));
  }

  Future<void> _onGetUserLocation(_GetUserLocation event, Emitter<MapState> emit) async {
    emit(state.copyWith(getLocationStatus: FormzSubmissionStatus.inProgress));

    try {
      final position = await Geolocator.getCurrentPosition();
      final userPoint = Point(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      emit(state.copyWith(
        userLocation: userPoint,
        getLocationStatus: FormzSubmissionStatus.success,
        errorMessage: '',
      ));
    } catch (e) {
      emit(state.copyWith(
        getLocationStatus: FormzSubmissionStatus.failure,
        errorMessage: 'Failed to get user location',
      ));
    }
  }

  Future<void> _onStart(_Started event, Emitter<MapState> emit) async {}

  Future<void> _onLaunchTaxi(_LaunchTaxi event, Emitter<MapState> emit) async {}

  Future<void> _onMakeSingleRoute(_MakeSingleRoute event, Emitter<MapState> emit) async {}

  Future<void> _onMakeMainRoute(_MakeMainRoute event, Emitter<MapState> emit) async {}

  Future<void> _onCalculate(_CalculateDistance event, Emitter<MapState> emit) async {}
}
