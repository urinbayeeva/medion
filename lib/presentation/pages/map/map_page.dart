import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/domain/models/location_model.dart';
import 'package:medion/domain/models/map/map_model.dart';
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
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  int? selectedIndex;
  GoogleMapController? mapController;
  CameraPosition? _currentCameraPosition;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeEvent.fetchCompanyLocation());
  }

  void _initializeMarkers(List<LocationModel> locations) async {
    if (locations.isEmpty || markers.isNotEmpty) return;

    final BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/location.png',
    );

    markers = locations.asMap().entries.map((entry) {
      final index = entry.key;
      final location = entry.value;

      return Marker(
        markerId: MarkerId('location_$index'),
        position:
            LatLng(location.position.latitude, location.position.longitude),
        infoWindow: InfoWindow(
          title: location.fullName.toString() ?? 'Medion Location',
        ),
        icon: markerIcon,
        onTap: () => moveToLocation(index),
      );
    }).toSet();

    if (mounted) setState(() {});
  }

  void moveToLocation(int index) async {
    if (!_controller.isCompleted) return;
    final controller = await _controller.future;
    final locations = context.read<HomeBloc>().state.companyLocations;
    if (index >= locations.length) return;

    final location = locations[index];
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target:
              LatLng(location.position.latitude, location.position.longitude),
          zoom: 15,
        ),
      ),
    );

    if (mounted) setState(() => selectedIndex = index);
  }

  Future<void> openYandexTaxi(double endLat, double endLon) async {
    // Get current camera position which should be near user's location
    final startLat = _currentCameraPosition?.target.latitude;
    final startLon = _currentCameraPosition?.target.longitude;

    if (startLat == null || startLon == null) {
      // Fallback to a default location if current position isn't available
      final defaultLat = 41.2995; // Example default latitude (Tashkent)
      final defaultLon = 69.2401; // Example default longitude (Tashkent)

      // Construct Yandex Taxi URL
      final url = Uri.parse(
        'https://3.redirect.appmetrica.yandex.com/route?'
        'start-lat=$defaultLat&start-lon=$defaultLon&'
        'end-lat=$endLat&end-lon=$endLon&'
        'appmetrica_tracking_id=1178268795219780156', // Your tracking ID if needed
      );

      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch Yandex Taxi')),
        );
      }
      return;
    }

    // Construct Yandex Taxi URL with current location
    final url = Uri.parse(
      'https://3.redirect.appmetrica.yandex.com/route?'
      'start-lat=$startLat&start-lon=$startLon&'
      'end-lat=$endLat&end-lon=$endLon&'
      'appmetrica_tracking_id=1178268795219780156', // Your tracking ID if needed
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
          _initializeMarkers(state.companyLocations);
        },
        child: Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                markers: markers,
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (controller) {
                  _controller.complete(controller);
                  mapController = controller;
                },
                onCameraMove: (position) {
                  _currentCameraPosition = position;
                },
                myLocationButtonEnabled: false,
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
                      padding: EdgeInsets.all(8),
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
}
