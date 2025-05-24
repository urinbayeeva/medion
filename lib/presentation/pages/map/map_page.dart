import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/domain/models/location_model.dart';
import 'package:medion/domain/models/map/map_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/map/widgets/location_list.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<YandexMapController> _controller = Completer();
  final List<MapObject> mapObjects = [];
  int? selectedIndex;
  YandexMapController? mapController;
  Point? _currentCameraPosition;
  Point? _userLocation;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    context.read<HomeBloc>().add(const HomeEvent.fetchCompanyLocation());
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location permissions are permanently denied, please enable them in settings.'),
        ),
      );
      return;
    }

    try {
      var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _userLocation = Point(
          latitude: position.latitude,
          longitude: position.longitude,
        );
      });

      if (_controller.isCompleted) {
        final controller = await _controller.future;
        await controller.moveCamera(
          animation:
              const MapAnimation(type: MapAnimationType.linear, duration: 1),
          CameraUpdate.newCameraPosition(
            CameraPosition(target: _userLocation!, zoom: 14),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting location: $e')),
      );
    }
  }

  void _initializePlacemarks(List<LocationModel> locations) async {
    if (locations.isEmpty || mapObjects.isNotEmpty) return;

    final placemarks = locations.asMap().entries.map((entry) {
      final index = entry.key;
      final location = entry.value;

      return PlacemarkMapObject(
        mapId: MapObjectId('location_$index'),
        point: Point(
          latitude: location.position.latitude,
          longitude: location.position.longitude,
        ),
        opacity: 1,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image:
                BitmapDescriptor.fromAssetImage('assets/images/location.png'),
            scale: 0.5,
          ),
        ),
        onTap: (_, __) => moveToLocation(index),
      );
    }).toList();

    setState(() {
      mapObjects.addAll(placemarks);
    });
  }

  void moveToLocation(int index) async {
    if (!_controller.isCompleted) return;
    final controller = await _controller.future;
    final locations = context.read<HomeBloc>().state.companyLocations;
    if (index >= locations.length) return;

    final location = locations[index];
    await controller.moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: location.position.latitude,
            longitude: location.position.longitude,
          ),
          zoom: 15,
        ),
      ),
    );

    if (mounted) setState(() => selectedIndex = index);
  }

  Future<void> openYandexTaxi(double endLat, double endLon) async {
    final startLat =
        _currentCameraPosition?.latitude ?? _userLocation?.latitude;
    final startLon =
        _currentCameraPosition?.longitude ?? _userLocation?.longitude;

    if (startLat == null || startLon == null) {
      const defaultLat = 41.2995; // Example default latitude (Tashkent)
      const defaultLon = 69.2401; // Example default longitude (Tashkent)

      final url = Uri.parse(
        'https://3.redirect.appmetrica.yandex.com/route?'
        'start-lat=$defaultLat&start-lon=$defaultLon&'
        'end-lat=$endLat&end-lon=$endLon&'
        'appmetrica_tracking_id=1178268795219780156',
      );

      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch Yandex Taxi')),
        );
      }
      return;
    }

    final url = Uri.parse(
      'https://3.redirect.appmetrica.yandex.com/route?'
      'start-lat=$startLat&start-lon=$startLon&'
      'end-lat=$endLat&end-lon=$endLon&'
      'appmetrica_tracking_id=1178268795219780156',
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch Yandex Taxi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          _initializePlacemarks(state.companyLocations);
        },
        child: Scaffold(
          body: Stack(
            children: [
              YandexMap(
                mapObjects: mapObjects,
                onMapCreated: (controller) async {
                  _controller.complete(controller);
                  mapController = controller;
                  if (_userLocation != null) {
                    await controller.moveCamera(
                      animation: const MapAnimation(
                          type: MapAnimationType.linear, duration: 1),
                      CameraUpdate.newCameraPosition(
                        CameraPosition(target: _userLocation!, zoom: 14),
                      ),
                    );
                  }
                },
                onCameraPositionChanged: (cameraPosition, reason, finished) {
                  if (finished) {
                    _currentCameraPosition = cameraPosition.target;
                  }
                },
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.companyLocations.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: colors.shade0,
                      child: LocationList(
                        locations: state.companyLocations,
                        selectedIndex: selectedIndex,
                        onTap: moveToLocation,
                        openYandexTaxi: openYandexTaxi,
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 65,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: colors.shade0,
                  radius: 18,
                  child: AnimationButtonEffect(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: icons.cancel.svg(width: 20, height: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
}
