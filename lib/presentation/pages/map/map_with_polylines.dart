import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:medion/presentation/pages/home/yandex_on_tap.dart';
import 'package:medion/presentation/pages/map/widgets/map_polylines_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/presentation/styles/style.dart';

class MapWithPolylines extends StatefulWidget {
  final LatLng destination;
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
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  Set<Polyline> _polylines = {};
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
      await Geolocator.requestPermission();
      return;
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition();
    if (mounted) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      await _fetchRoutePolyline();
      _calculateDistanceAndTime();
    }
  }

  Future<void> _fetchRoutePolyline() async {
    if (_currentPosition == null) return;

    final origin = LatLng(41.2995, 69.2401);
    final destination =
        '${widget.destination.latitude},${widget.destination.longitude}';
    print('Origin: $origin');
    print('Destination: $destination');

    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&mode=driving&key=AIzaSyBcjnX5w8RHfWQ113YmpBM2NhRBYp1j6ws';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API body: ${response.body}');

      if (data['status'] != 'OK') {
        print('Error: ${data['error_message']}');
        return;
      }

      if (data['routes'].isEmpty) {
        print('No routes found.');
        return;
      }

      if (!data['routes'][0].containsKey('overview_polyline')) {
        print('No polyline found.');
        return;
      }

      final points = data['routes'][0]['overview_polyline']['points'];
      final List<LatLng> polylineCoordinates = _decodePolyline(points);

      setState(() {
        _polylines.clear();
        _polylines.add(Polyline(
          polylineId: const PolylineId('route'),
          color: Style.error500,
          width: 5,
          points: polylineCoordinates,
        ));
      });

      print('Polyline added with ${polylineCoordinates.length} points');

      _fitMapToPolyline(polylineCoordinates);
    } else {
      print('Failed to fetch directions: ${response.body}');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      polyline.add(LatLng(lat / 1e5, lng / 1e5));
    }

    return polyline;
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

  void _fitMapToPolyline(List<LatLng> polylinePoints) {
    if (_mapController == null || polylinePoints.isEmpty) return;

    final bounds = _createBoundsFromLatLngList(polylinePoints);
    _mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
  }

  LatLngBounds _createBoundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double x0 = list.first.latitude;
    double x1 = list.first.latitude;
    double y0 = list.first.longitude;
    double y1 = list.first.longitude;

    for (var latLng in list) {
      if (latLng.latitude > x1) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1) y1 = latLng.longitude;
      if (latLng.longitude < y0) y0 = latLng.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(x0, y0),
      northeast: LatLng(x1, y1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        body: _currentPosition == null
            ? Center(child: CircularProgressIndicator(color: colors.error500))
            : Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 14,
                    ),
                    onMapCreated: (controller) => _mapController = controller,
                    myLocationEnabled: true,
                    polylines: _polylines,
                    markers: {
                      Marker(
                        markerId: const MarkerId('current'),
                        position: _currentPosition!,
                        infoWindow: const InfoWindow(title: 'Your Location'),
                      ),
                      Marker(
                        markerId: const MarkerId('destination'),
                        position: widget.destination,
                        infoWindow: InfoWindow(title: widget.name),
                      ),
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
