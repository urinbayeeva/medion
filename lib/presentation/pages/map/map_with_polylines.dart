import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:medion/presentation/pages/home/yandex_on_tap.dart';
import 'package:medion/presentation/pages/map/widgets/map_polylines_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/style.dart';

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
  YandexMapController? _mapController;
  Point? _currentPosition;
  List<MapObject> _mapObjects = [];
  double _distanceInKm = 0;
  String _travelTime = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permission denied'.tr())),
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
      await _fetchRoutePolyline();
      _calculateDistanceAndTime();
    }
  }

  Future<void> _fetchRoutePolyline() async {
    if (_currentPosition == null) return;

    final origin = _currentPosition!;
    final destination = widget.destination;

    final url =
        'https://api.routing.yandex.net/v2/route?waypoints=${origin.latitude},${origin.longitude}|${destination.latitude},${destination.longitude}&apikey=3f886df1-7552-4a91-8dc7-3511e772780d';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API body: ${response.body}');

      if (data['status'] != 'success') {
        print('Error: ${data['error']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to fetch route: ${data['error']}'.tr())),
        );
        return;
      }

      if (data['routes'].isEmpty) {
        print('No routes found.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No routes found'.tr())),
        );
        return;
      }

      final route = data['routes'][0];
      final List<Point> polylinePoints = route['geometry']['coordinates']
          .map<Point>((coord) => Point(latitude: coord[1], longitude: coord[0]))
          .toList();

      setState(() {
        _mapObjects.clear();
        _mapObjects.add(PolylineMapObject(
          mapId: const MapObjectId('route'),
          polyline: Polyline(points: polylinePoints),
          strokeColor: Style.error500,
          strokeWidth: 5.0,
        ));

        _mapObjects.add(PlacemarkMapObject(
          mapId: const MapObjectId('current'),
          point: _currentPosition!,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage('assets/current.png'),
            ),
          ),
          text: const PlacemarkText(
            text: 'Your Location',
            style: PlacemarkTextStyle(),
          ),
        ));

        _mapObjects.add(PlacemarkMapObject(
          mapId: const MapObjectId('destination'),
          point: destination,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage('assets/destination.png'),
            ),
          ),
          text: PlacemarkText(text: widget.name, style: PlacemarkTextStyle()),
        ));
      });

      print('Polyline added with ${polylinePoints.length} points');
      _fitMapToPolyline(polylinePoints);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch route'.tr())),
      );
      print('Failed to fetch directions: ${response.body}');
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

  void _fitMapToPolyline(List<Point> polylinePoints) {
    if (_mapController == null || polylinePoints.isEmpty) return;

    final bounds = _createBoundsFromPointList(polylinePoints);
    _mapController!.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: bounds.target,
          zoom: 14,
        ),
      ),
    );
  }

  CameraPosition _createBoundsFromPointList(List<Point> list) {
    assert(list.isNotEmpty);
    double x0 = list.first.latitude;
    double x1 = list.first.latitude;
    double y0 = list.first.longitude;
    double y1 = list.first.longitude;

    for (var point in list) {
      if (point.latitude > x1) x1 = point.latitude;
      if (point.latitude < x0) x0 = point.latitude;
      if (point.longitude > y1) y1 = point.longitude;
      if (point.longitude < y0) y0 = point.longitude;
    }

    final center = Point(
      latitude: (x0 + x1) / 2,
      longitude: (y0 + y1) / 2,
    );

    return CameraPosition(target: center, zoom: 14);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        body: _currentPosition == null
            ? Center(child: CircularProgressIndicator(color: colors.error500))
            : Stack(
                children: [
                  YandexMap(
                    onMapCreated: (controller) async {
                      _mapController = controller;
                      await controller.toggleUserLayer(
                        visible: true,
                        autoZoomEnabled: true,
                      );
                    },
                    mapObjects: _mapObjects,
                    onCameraPositionChanged: (position, reason, finished) {},
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.black),
                        onPressed: () {
                          context
                              .read<BottomNavBarController>()
                              .changeNavBar(false);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  if (_distanceInKm > 0)
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
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${_distanceInKm.toStringAsFixed(1)} km',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text(_travelTime,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: MapPolylinesWidget(
                      yandexTap: () {
                        print(
                            "Yandex Tap triggered for destination: ${widget.destination}");
                        launchYandexTaxi(
                          context,
                          widget.destination.latitude,
                          widget.destination.longitude,
                        );
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
    });
  }
}
