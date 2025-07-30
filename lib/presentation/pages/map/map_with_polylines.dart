import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/map/widgets/map_polylines_widget.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWithPolylines extends StatefulWidget {
  final Point destination;
  final String name;
  final String workingHours;
  final String image;

  const MapWithPolylines({
    super.key,
    required this.destination,
    required this.name,
    required this.workingHours,
    required this.image,
  });

  @override
  State<MapWithPolylines> createState() => _MapWithPolylinesState();
}

class _MapWithPolylinesState extends State<MapWithPolylines> {
  final ValueNotifier<int> _notifier = ValueNotifier(0);
  final Completer<YandexMapController> _controller = Completer();
  late final YandexMapController _mapController;
  Point? _currentPosition;
  final List<MapObject> _mapObjects = [];
  double _distanceInKm = 0;
  String _travelTime = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((value) {});
    _addCompanyIcon();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location services are disabled'.tr())),
      );
      await Geolocator.requestPermission();
      return;
    }

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          useRootNavigator: true,
          useSafeArea: true,
          enableDrag: false,
          builder: (ctx) {
            return OpenSettingBottomSheet(
              onTap: () async => await openAppSettings().then((value) {
                _getCurrentLocation();
                if (ctx.mounted) Navigator.of(ctx).pop();
              }),
            );
          },
        );
        return;
      }
    }
    final position = await Geolocator.getCurrentPosition();

    if (mounted) {
      setState(() {
        _currentPosition = Point(
          latitude: position.latitude,
          longitude: position.longitude,
        );
      });

      if (_controller.isCompleted) {
        final controller = await _controller.future;
        await controller.moveCamera(
          animation: const MapAnimation(type: MapAnimationType.linear, duration: 2),
          CameraUpdate.newCameraPosition(
            CameraPosition(target: _currentPosition!, zoom: 14),
          ),
        );
      }

      await _fetchRoutePolyline();
      _calculateDistanceAndTime();
    }
  }

  void move() async {
    final controller = await _controller.future;
    await controller.moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 2),
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentPosition!, zoom: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        if (_currentPosition == null) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  top: 60,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        context.read<BottomNavBarController>().changeNavBar(false);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                if (_distanceInKm > 0) ...{
                  Positioned(
                    top: 60,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_distanceInKm.toStringAsFixed(1)} km',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text(_travelTime, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                },
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: MapPolylinesWidget(
                    yandexTap: () async {
                      await openYandexTaxi(widget.destination.latitude, widget.destination.longitude);
                    },
                    name: widget.name,
                    workingHours: widget.workingHours,
                    image: widget.image,
                    distanceKm: _distanceInKm,
                    travelTime: _travelTime,
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          body: Stack(
            children: [
              ValueListenableBuilder<int>(
                valueListenable: _notifier,
                builder: (context, value, child) {
                  if (value == 1) move();

                  return YandexMap(
                    onMapCreated: (controller) async {
                      _mapController = controller;
                      if (!_controller.isCompleted) {
                        _controller.complete(controller);
                        if (_currentPosition != null) {
                          _notifier.value = 1;
                        }
                      }
                      await controller.toggleUserLayer(visible: true, autoZoomEnabled: true);
                    },
                    mapObjects: _mapObjects,
                    onCameraPositionChanged: (position, reason, finished) {},
                  );
                },
              ),
              Positioned(
                top: 60,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      context.read<BottomNavBarController>().changeNavBar(false);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              if (_distanceInKm > 0) ...{
                Positioned(
                  top: 60,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_distanceInKm.toStringAsFixed(1)} km',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(_travelTime, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              },
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: MapPolylinesWidget(
                  yandexTap: () async {
                    await openYandexTaxi(widget.destination.latitude, widget.destination.longitude);
                  },
                  name: widget.name,
                  workingHours: widget.workingHours,
                  image: widget.image,
                  distanceKm: _distanceInKm,
                  travelTime: _travelTime,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addCompanyIcon() {
    final placeMark = PlacemarkMapObject(
        mapId: const MapObjectId("company-location"),
        point: Point(latitude: widget.destination.latitude, longitude: widget.destination.longitude),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage("assets/images/location.png")),
        ));

    _mapObjects.add(placeMark);
  }

  Future<void> openYandexTaxi(double endLat, double endLon) async {
    final startLat = _currentPosition?.latitude;
    final startLon = _currentPosition?.longitude;

    if (startLat == null || startLon == null) {
      const defaultLat = 41.2995;
      const defaultLon = 69.2401;

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

  Future<void> _fetchRoutePolyline() async {
    if (_currentPosition != null) {
      final session = YandexDriving.requestRoutes(
        points: [
          RequestPoint(point: widget.destination, requestPointType: RequestPointType.wayPoint),
          RequestPoint(point: _currentPosition!, requestPointType: RequestPointType.wayPoint),
        ],
        drivingOptions: const DrivingOptions(),
      );

      final result = await session.result;
      if (result.routes != null && result.routes!.isNotEmpty) {
        final route = result.routes!.first;

        final polyLine = PolylineMapObject(
          mapId: const MapObjectId("single-branch-line"),
          polyline: Polyline(points: route.geometry),
          strokeColor: Colors.red,
          strokeWidth: 4,
        );

        _mapObjects.add(polyLine);
      }
    }
  }

  void _calculateDistanceAndTime() {
    if (_currentPosition == null) return;

    final meters = Geolocator.distanceBetween(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
      widget.destination.latitude,
      widget.destination.longitude,
    );

    _distanceInKm = meters / 1000;

    final hours = _distanceInKm / 5;
    _travelTime = hours < 1
        ? tr('minutes', args: [(hours * 60).round().toString()])
        : tr('hours', args: [hours.toStringAsFixed(1)]);

    setState(() {});
  }
}

class OpenSettingBottomSheet extends StatelessWidget {
  const OpenSettingBottomSheet({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: Text(
              'Location permission denied'.tr(),
              style: const TextStyle(color: Color(0xff000000), fontSize: 15, fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffFFFFFF),
            actions: [
              WScaleAnimation(onTap: () => Navigator.of(context).pop(), child: const Icon(Icons.clear)),
            ],
          ),
          CButton(
            title: "Open phone Setting",
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
