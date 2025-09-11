import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/domain/models/location_model.dart';
import 'package:medion/domain/sources/locations_data.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class MapViewPage extends StatefulWidget {
  final double latitude; // Added latitude parameter
  final double longitude; // Added longitude parameter

  const MapViewPage({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Set<Marker>? markers = {};
  int? selectedIndex;
  GoogleMapController? controller;

  // Modified to use widget parameters
  CameraPosition get _initialPosition => CameraPosition(
        target: LatLng(widget.latitude, widget.longitude),
        zoom: 16,
      );

  void moveToLocation(int index) async {
    if (!_controller.isCompleted) return;

    final GoogleMapController controller = await _controller.future;

    final Location location = locations[index];
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(location.latitude, location.longitude),
          zoom: 15,
        ),
      ),
    );

    setState(() {
      selectedIndex = index;
    });
  }

  Future<void> getUrl(double startLat, double startLon, double endLat, double endLon) async {
    final String url =
        "https://3.redirect.appmetrica.yandex.com/route?start-lat=$startLat&start-lon=$startLon&end-lat=$endLat&end-lon=$endLon";
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  void _initializeMarkers() async {
    BitmapDescriptor redMarkerIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/location.png',
    );

    markers = {
      Marker(
        markerId: const MarkerId('initial_position'),
        position: LatLng(widget.latitude, widget.longitude),
        icon: redMarkerIcon,
      )
    };

    setState(() {});
  }

  @override
  void initState() {
    _initializeMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              markers: markers ?? {},
              mapType: MapType.normal,
              initialCameraPosition: _initialPosition,
              // Updated to use dynamic position
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationButtonEnabled: false,
            ),
            Positioned(
                top: 65,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: colors.shade0,
                  radius: 18.r,
                  child: AnimationButtonEffect(
                      onTap: () {
                        context.read<BottomNavBarController>().changeNavBar(false);
                        Navigator.pop(context);
                      },
                      child: icons.cancel.svg(width: 20.w, height: 20.h)),
                )),
          ],
        ),
      );
    });
  }
}
