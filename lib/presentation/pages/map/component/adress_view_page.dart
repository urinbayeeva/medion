import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/domain/models/location_model.dart';
import 'package:medion/domain/sources/locations_data.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_icon_button.dart';
import 'package:medion/presentation/component/custom_pagination.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class AdressViewPage extends StatefulWidget {
  const AdressViewPage({super.key});

  @override
  State<AdressViewPage> createState() => _AdressViewPageState();
}

class _AdressViewPageState extends State<AdressViewPage> {
  // final RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  late ScrollController scrollController;
  late String currency;

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

  Future<void> getUrl(
      double startLat, double startLon, double endLat, double endLon) async {
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

  bool isLoading = true;

  @override
  void initState() {
    _initializeMarkers();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 24.h.verticalSpace,
          SizedBox(
            height: 240.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: GoogleMap(
                myLocationEnabled: true,
                markers: markers ?? {},
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationButtonEnabled: false,
              ),
            ),
          ),
          24.h.verticalSpace,
          ListTile(
            leading: Image.asset("assets/images/medion_logo.png",
                width: 40, height: 40),
            title: Text("Medion Innovation",
                style:
                    fonts.mediumMain.copyWith(color: const Color(0xFF2C3D52))),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              // ignore: sort_child_properties_last
              child: Text(
                "Yopiq",
                style: fonts.smallLink.copyWith(color: colors.shade0),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: colors.error500),
            ),
          ),
          12.h.verticalSpace,

          // 24.h.verticalSpace,
          // ListTile(
          //   leading: Image.asset("assets/images/medion_logo.png",
          //       width: 40, height: 40),
          //   title: Text("Medion Innovation",
          //       style:
          //           fonts.mediumMain.copyWith(color: const Color(0xFF2C3D52))),
          // ),
        ],
      );
    });
  }
}
