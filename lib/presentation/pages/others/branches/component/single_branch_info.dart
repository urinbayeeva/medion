import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart'; // Replaced google_maps_flutter
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_bottom_icon.dart';
import 'package:medion/presentation/pages/home/directions/component/inner_pages/image_item.dart';
import 'package:medion/presentation/pages/others/branches/widget/what_we_offer_card.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SingleBranchInfo extends StatefulWidget {
  final String branchPhotos;
  final String branchName;
  final String branchAdress;
  final String branchWorkingHours;
  final String branchInfoDescription;
  final String branchOfferTitle;
  final String branchOfferSubtitle;
  final double lang;
  final double lat;
  final VoidCallback branchPhoneNumberButton;

  const SingleBranchInfo({
    super.key,
    required this.branchPhotos,
    required this.branchName,
    required this.branchAdress,
    required this.branchWorkingHours,
    required this.branchInfoDescription,
    required this.branchOfferTitle,
    required this.branchOfferSubtitle,
    required this.branchPhoneNumberButton,
    required this.lang,
    required this.lat,
  });

  @override
  State<SingleBranchInfo> createState() => _SingleBranchInfoState();
}

class _SingleBranchInfoState extends State<SingleBranchInfo> {
  final Completer<YandexMapController> _controller =
      Completer<YandexMapController>(); // Updated to YandexMapController

  @override
  Widget build(BuildContext context) {
    final CameraPosition kYandexPlex = CameraPosition(
      target: Point(
          latitude: widget.lat, longitude: widget.lang), // Changed to Point
      zoom: 14,
    );

    final List<MapObject> _mapObjects = [
      PlacemarkMapObject(
        mapId: const MapObjectId('branchLocation'),
        point: Point(latitude: widget.lat, longitude: widget.lang),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
                'assets/branch_marker.png'), // Add your marker icon
          ),
        ),
        text: PlacemarkText(
          text: widget.branchName,
          style: const PlacemarkTextStyle(),
        ),
      ),
    ];

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CAppBar(
              title: "branch".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  Text(
                    widget.branchName,
                    style: fonts.mediumMain.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.h.verticalSpace,
                  AnimationButtonEffect(
                    onTap: () {},
                    child: CButtomIcon(
                      backgroundColor: colors.neutral200,
                      textColor: colors.primary900,
                      title: widget.branchAdress,
                      onTap: () {},
                      iconPath: icons.location,
                    ),
                  ),
                  8.h.verticalSpace,
                  AnimationButtonEffect(
                    onTap: () {},
                    child: CButtomIcon(
                      backgroundColor: colors.neutral200,
                      textColor: colors.primary900,
                      title: widget.branchWorkingHours,
                      onTap: () {},
                      iconPath: icons.clock,
                    ),
                  ),
                  12.h.verticalSpace,
                  Text(
                    widget.branchInfoDescription.isEmpty
                        ? "about_medion".tr()
                        : widget.branchInfoDescription,
                    style: fonts.smallLink.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  8.h.verticalSpace,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: widget.branchPhotos.isEmpty
                        ? Container(
                            height: 200.h,
                            color: colors.neutral200,
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported,
                                color: colors.neutral500,
                                size: 40.w,
                              ),
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: widget.branchPhotos,
                            fit: BoxFit.cover,
                            height: 200.h,
                            width: double.infinity,
                            errorWidget: (context, url, error) => Container(
                              color: colors.neutral200,
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  color: colors.error500,
                                  size: 40.w,
                                ),
                              ),
                            ),
                          ),
                  ),
                  12.h.verticalSpace,
                  Text("what_we_offer".tr(), style: fonts.regularMain),
                  12.h.verticalSpace,
                  // WhatWeOfferCard(),
                  // 12.h.verticalSpace,
                  // Text("video".tr(), style: fonts.regularMain),
                  // 12.h.verticalSpace,
                  // SvgPicture.asset(
                  //   "assets/icons/delete_folder.svg",
                  //   color: colors.neutral500,
                  //   width: double.infinity,
                  //   height: 150.h,
                  // ),
                  // 24.h.verticalSpace,
                  Text(
                    "address_branch".tr(),
                    style: fonts.regularMain.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  16.h.verticalSpace,
                  SizedBox(
                    height: 200.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: YandexMap(
                        mapObjects: _mapObjects,
                        onMapCreated: (YandexMapController controller) async {
                          _controller.complete(controller);
                          await controller.moveCamera(
                            CameraUpdate.newCameraPosition(kYandexPlex),
                          );
                        },
                        onCameraPositionChanged:
                            (position, reason, finished) {},
                      ),
                    ),
                  ),
                  16.h.verticalSpace,
                  Text(
                    widget.branchAdress,
                    style: fonts.smallLink.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  16.h.verticalSpace,
                  CButtomIcon(
                    title: "Позвонить",
                    onTap: widget.branchPhoneNumberButton,
                    iconPath: icons.phone,
                    textColor: colors.shade0,
                    iconColor: colors.shade0,
                  ),
                  40.h.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
