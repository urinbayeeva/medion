import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_bottom_icon.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SingleBranchInfo extends StatefulWidget {
  final List<String> branchPhotos;
  final String branchName;
  final String branchAdress;
  final String branchWorkingHours;
  final String branchInfoDescription;
  final String branchOfferTitle;
  final String branchOfferSubtitle;
  final VoidCallback branchPhoneNumberButton;
  const SingleBranchInfo(
      {super.key,
      required this.branchPhotos,
      required this.branchName,
      required this.branchAdress,
      required this.branchWorkingHours,
      required this.branchInfoDescription,
      required this.branchOfferTitle,
      required this.branchOfferSubtitle,
      required this.branchPhoneNumberButton});

  @override
  State<SingleBranchInfo> createState() => _SingleBranchInfoState();
}

class _SingleBranchInfoState extends State<SingleBranchInfo> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();
    GoogleMapController? controller;

    CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(41.327405, 69.184021),
      zoom: 12,
    );

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.branchName ?? "",
                style: fonts.mediumMain
                    .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600)),
            8.h.verticalSpace,
            AnimationButtonEffect(
                onTap: () {},
                child: CButtomIcon(
                    backgroundColor: colors.neutral200,
                    textColor: colors.primary900,
                    title: widget.branchAdress ?? "",
                    onTap: () {},
                    iconPath: icons.location)),
            8.h.verticalSpace,
            AnimationButtonEffect(
                onTap: () {},
                child: CButtomIcon(
                    backgroundColor: colors.neutral200,
                    textColor: colors.primary900,
                    title: widget.branchWorkingHours,
                    onTap: () {},
                    iconPath: icons.clock)),
            12.h.verticalSpace,
            Text(widget.branchInfoDescription ?? "",
                style: fonts.smallLink
                    .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400)),
            12.h.verticalSpace,
            _buildImageSection(colors, fonts),
            24.h.verticalSpace,
            Text("Адрес филиала",
                style: fonts.regularMain
                    .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600)),
            16.h.verticalSpace,
            SizedBox(
              height: 200.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: GoogleMap(
                  // markers: markers ?? {},
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  myLocationButtonEnabled: false,
                ),
              ),
            ),
            16.h.verticalSpace,
            CButtomIcon(
              title: "Позвонить",
              onTap: () {},
              iconPath: icons.phone,
              textColor: colors.shade0,
              iconColor: colors.shade0,
            )
          ],
        ),
      );
    });
  }

  Widget _buildImageSection(colors, fonts) {
    return CarouselSlider(
      items: widget.branchPhotos.map((images) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 200.h,
          decoration: BoxDecoration(color: colors.backgroundColor),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(images,
                fit: BoxFit.cover), // `BoxFit.cover` qo'shildi
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        height: 200.h,
        enlargeCenterPage: true,
        viewportFraction: 0.9, // Ko'rsatish ulushi moslashtirildi
      ),
    );
  }
}
