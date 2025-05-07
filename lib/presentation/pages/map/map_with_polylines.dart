import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/helpers/get_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

import '../../styles/style.dart';

class MapWithPolylines extends StatefulWidget {
  final LatLng destination;

  const MapWithPolylines({
    super.key,
    required this.destination,
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
    determinePosition();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    if (mounted) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _calculateDistanceAndTime();
        _createPolylines();
      });
    }
  }

  void _calculateDistanceAndTime() {
    if (_currentPosition == null) return;

    double distanceInMeters = Geolocator.distanceBetween(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
      widget.destination.latitude,
      widget.destination.longitude,
    );

    _distanceInKm = distanceInMeters / 1000;

    double hours = _distanceInKm / 5;
    if (hours < 1) {
      int minutes = (hours * 60).round();
      _travelTime = '$minutes min';
    } else {
      _travelTime = '${hours.toStringAsFixed(1)} h';
    }

    setState(() {});
  }

  void _createPolylines() {
    if (_currentPosition == null) return;

    _polylines.add(Polyline(
      polylineId: const PolylineId('route'),
      points: [
        _currentPosition!,
        widget.destination,
      ],
      color: Style.error500,
      width: 5,
    ));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        body: _currentPosition == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  GoogleMap(
                    compassEnabled: true,
                    buildingsEnabled: true,
                    zoomGesturesEnabled: true,
                    trafficEnabled: true,
                    mapToolbarEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 18,
                    ),
                    onMapCreated: (controller) {
                      _mapController = controller;
                      _fitMapToPolyline();
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
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
                        infoWindow: const InfoWindow(title: 'Destination'),
                      ),
                    },
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.black),
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
                            Text(
                              '${_distanceInKm.toStringAsFixed(1)} km',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _travelTime,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
      );
    });
  }

  Future<void> _fitMapToPolyline() async {
    if (_mapController == null || _currentPosition == null) return;

    final bounds = maps.LatLngBounds(
      southwest: maps.LatLng(
        _currentPosition!.latitude < widget.destination.latitude
            ? _currentPosition!.latitude
            : widget.destination.latitude,
        _currentPosition!.longitude < widget.destination.longitude
            ? _currentPosition!.longitude
            : widget.destination.longitude,
      ),
      northeast: maps.LatLng(
        _currentPosition!.latitude > widget.destination.latitude
            ? _currentPosition!.latitude
            : widget.destination.latitude,
        _currentPosition!.longitude > widget.destination.longitude
            ? _currentPosition!.longitude
            : widget.destination.longitude,
      ),
    );

    _mapController!.animateCamera(
      maps.CameraUpdate.newLatLngBounds(
        bounds,
        100, // padding
      ),
    );
  }
}
