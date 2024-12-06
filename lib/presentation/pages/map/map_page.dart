import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/domain/sources/locations_data.dart';
import 'package:medion/domain/models/location_model.dart';
import 'package:medion/domain/sources/upcoming_reception_data.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/map/widgets/location_list.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker>? markers = {};
  int? selectedIndex;
  GoogleMapController? controller;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.327405, 69.184021),
    zoom: 12,
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
    final String url = "https://3.redirect.appmetrica.yandex.com/route?start-lat=$startLat&start-lon=$startLon&end-lat=$endLat&end-lon=$endLon";
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
        markerId: const MarkerId('Medion Clinics'),
        position: const LatLng(41.329388, 69.258434),
        infoWindow: const InfoWindow(
          title: 'Medion Clinics, Aesthetic & SPA',
        ),
        icon: redMarkerIcon,
      ),
      Marker(
        markerId: const MarkerId('Medion Family Hospital'),
        position: const LatLng(41.327405, 69.184021),
        infoWindow: const InfoWindow(
          title: 'Medion Family Hospital',
        ),
        icon: redMarkerIcon,
      ),
      Marker(
        markerId: const MarkerId('Medion Innovation'),
        position: const LatLng(41.326456, 69.249044),
        infoWindow: const InfoWindow(
          title: 'Medion Innovation',
        ),
        icon: redMarkerIcon,
      ),
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
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationButtonEnabled: false,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: LocationList(
                locations: locations,
                selectedIndex: selectedIndex,
                onTap: moveToLocation,
                // Pass the getUrl callback here
                openYandexTaxi: (startLat, startLon, endLat, endLon) {
                  getUrl(startLat, startLon, endLat, endLon);
                },
              ),
            ),
            Positioned(
                top: 65,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: colors.shade0,
                  radius: 18.r,
                  child: AnimationButtonEffect(
                      onTap: () {
                        getUrl(
                            41.327405,  // Example starting coordinates
                            69.184021,  // Example starting coordinates
                            69.184021,  // Example ending coordinates
                            69.184021); // Example ending coordinates
                      },
                      child: icons.cancel.svg(width: 20.w, height: 20.h)),
                )),
          ],
        ),
      );
    });
  }
}
