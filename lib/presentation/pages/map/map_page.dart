import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:medion/domain/models/location_model.dart';
import 'package:medion/utils/helpers/map_helpers.dart';
import 'package:medion/presentation/pages/map/widgets/location_list.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:medion/domain/sources/locations_data.dart' as domainSources;
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final locations = domainSources.locations;

  YandexMapController? mapController; 
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permission is required to use the map.'),
        ),
      );
    }
  }

  Future<void> _openYandexTaxi(Location location) async {
    const startLat = 41.317405;
    const startLon = 69.245021;

    final endLat = location.latitude;
    final endLon = location.longitude;

    final url =
        'yandextaxi://order?start-lat=$startLat&start-lon=$startLon&end-lat=$endLat&end-lon=$endLon';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Yandex Taxi app is not installed.')),
      );
    }
  }

  void moveToLocation(int index) async {
    if (mapController == null) return; 

    final location = locations[index];
    await mapController!.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: location.latitude,
            longitude: location.longitude,
          ),
          zoom: 15,
        ),
      ),
    );
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            mapObjects: locations.map((location) {
              return PlacemarkMapObject(
                opacity: 1,
                mapId: MapObjectId(location.name),
                point: Point(
                    latitude: location.latitude, longitude: location.longitude),
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                        'assets/images/marker.webp'),
                    scale: 0.1,
                  ),
                ),
              );
            }).toList(),
            onMapCreated: (controller) async {
              mapController = controller; 
              final bounds = calculateBounds(locations);
              await mapController!.moveCamera(CameraUpdate.newBounds(bounds));
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LocationList(
              locations: locations,
              selectedIndex: selectedIndex,
              onTap: moveToLocation,
              openYandexTaxi: _openYandexTaxi,
            ),
          ),
        ],
      ),
    );
  }
}
