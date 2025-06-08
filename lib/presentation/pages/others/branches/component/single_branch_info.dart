import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/utils/helpers/decode_html.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_bottom_icon.dart';
import 'package:medion/presentation/pages/others/branches/widget/what_we_offer_card.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SingleBranchInfo extends StatefulWidget {
  final String? branchPhotos;
  final String? branchName;
  final String? branchAdress;
  final String? branchWorkingHours;
  final String? branchInfoDescription;
  final String? branchOfferTitle;
  final String? branchOfferSubtitle;
  final double? lang;
  final double? lat;
  final VoidCallback? branchPhoneNumberButton;
  final List<String>? branchLicense;

  const SingleBranchInfo({
    super.key,
    this.branchPhotos,
    this.branchName,
    this.branchAdress,
    this.branchWorkingHours,
    this.branchInfoDescription,
    this.branchOfferTitle,
    this.branchOfferSubtitle,
    this.branchPhoneNumberButton,
    this.lang,
    this.lat,
    this.branchLicense,
  });

  @override
  State<SingleBranchInfo> createState() => _SingleBranchInfoState();
}

class _SingleBranchInfoState extends State<SingleBranchInfo> {
  final Completer<YandexMapController> _controller =
      Completer<YandexMapController>();

  bool get _hasValidCoordinates => widget.lat != null && widget.lang != null;

  bool get _hasValidImageUrl =>
      widget.branchPhotos != null &&
      widget.branchPhotos!.isNotEmpty &&
      Uri.tryParse(widget.branchPhotos!)?.isAbsolute == true;

  bool get _hasLicense =>
      widget.branchLicense != null &&
      widget.branchLicense!.isNotEmpty &&
      Uri.tryParse(widget.branchLicense!.first)?.isAbsolute == true;

  @override
  Widget build(BuildContext context) {
    final CameraPosition? kYandexPlex = _hasValidCoordinates
        ? CameraPosition(
            target: Point(latitude: widget.lat!, longitude: widget.lang!),
            zoom: 14,
          )
        : null;

    final List<MapObject> _mapObjects = _hasValidCoordinates
        ? [
            PlacemarkMapObject(
              mapId: const MapObjectId('branchLocation'),
              point: Point(latitude: widget.lat!, longitude: widget.lang!),
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromAssetImage(
                      'assets/branch_marker.png'),
                ),
              ),
              text: PlacemarkText(
                text: widget.branchName ?? 'Branch',
                style: const PlacemarkTextStyle(),
              ),
            ),
          ]
        : [];

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
                    widget.branchName ?? 'branch_name_not_available'.tr(),
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
                      title:
                          widget.branchAdress ?? 'address_not_available'.tr(),
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
                      title: widget.branchWorkingHours ??
                          'working_hours_not_available'.tr(),
                      onTap: () {},
                      iconPath: icons.clock,
                    ),
                  ),
                  12.h.verticalSpace,
                  Text(
                    widget.branchInfoDescription?.isEmpty ?? true
                        ? "about_medion".tr()
                        : widget.branchInfoDescription!,
                    style: fonts.smallLink.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  8.h.verticalSpace,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: _hasValidImageUrl
                        ? CachedNetworkImage(
                            imageUrl: widget.branchPhotos ?? "",
                            fit: BoxFit.cover,
                            height: 200.h,
                            width: double.infinity,
                            errorWidget: (context, url, error) =>
                                _buildImagePlaceholder(colors),
                          )
                        : _buildImagePlaceholder(colors),
                  ),
                  if (widget.branchOfferTitle?.isNotEmpty ?? false) ...[
                    12.h.verticalSpace,
                    Text("what_we_offer".tr(), style: fonts.regularMain),
                    12.h.verticalSpace,
                    WhatWeOfferCard(
                      title: widget.branchOfferTitle ?? "",
                      desc: decodeHtml(widget.branchOfferSubtitle ?? ''),
                    ),
                  ],
                  12.h.verticalSpace,
                  Text(
                    "license".tr(),
                    style: fonts.regularMain.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.h.verticalSpace,
                  _hasLicense
                      ? Row(
                          children: widget.branchLicense!.map((licenseUrl) {
                            return Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: CachedNetworkImage(
                                imageUrl: licenseUrl,
                                width: 150.w,
                                errorWidget: (context, url, error) =>
                                    _buildLicensePlaceholder(colors, fonts),
                              ),
                            );
                          }).toList(),
                        )
                      : _buildLicensePlaceholder(colors, fonts),
                  24.h.verticalSpace,
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
                      child: kYandexPlex != null
                          ? YandexMap(
                              mapObjects: _mapObjects,
                              onMapCreated:
                                  (YandexMapController controller) async {
                                _controller.complete(controller);
                                await controller.moveCamera(
                                  CameraUpdate.newCameraPosition(kYandexPlex),
                                );
                              },
                              onCameraPositionChanged:
                                  (position, reason, finished) {},
                            )
                          : _buildMapPlaceholder(colors),
                    ),
                  ),
                  16.h.verticalSpace,
                  Text(
                    widget.branchAdress ?? 'address_not_available'.tr(),
                    style: fonts.smallLink.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  16.h.verticalSpace,
                  CButtomIcon(
                    title: "call".tr(),
                    onTap: widget.branchPhoneNumberButton ?? () {},
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

  Widget _buildImagePlaceholder(colors) {
    return Container(
      height: 200.h,
      color: colors.neutral200,
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          color: colors.neutral500,
          size: 40.w,
        ),
      ),
    );
  }

  Widget _buildLicensePlaceholder(colors, fonts) {
    return Container(
      width: 150.w,
      height: 100.h,
      color: colors.neutral200,
      child: Center(
        child: Text(
          "no_result_found".tr(),
          style: fonts.smallLink,
        ),
      ),
    );
  }

  Widget _buildMapPlaceholder(colors) {
    return Container(
      color: colors.neutral200,
      child: Center(
        child: Icon(
          Icons.map_outlined,
          color: colors.neutral500,
          size: 40.w,
        ),
      ),
    );
  }
}
