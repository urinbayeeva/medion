import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_bottom_icon.dart';
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
    final Completer<GoogleMapController> controller0 =
        Completer<GoogleMapController>();
    // ignore: unused_local_variable
    GoogleMapController? controller;

    CameraPosition kGooglePlex = const CameraPosition(
      target: LatLng(41.327405, 69.184021),
      zoom: 12,
    );

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
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
                Text(widget.branchName,
                    style: fonts.mediumMain.copyWith(
                        fontSize: 18.sp, fontWeight: FontWeight.w600)),
                8.h.verticalSpace,
                AnimationButtonEffect(
                    onTap: () {},
                    child: CButtomIcon(
                        backgroundColor: colors.neutral200,
                        textColor: colors.primary900,
                        title: widget.branchAdress,
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
                Text(
                    widget.branchInfoDescription.isEmpty
                        ? "about_medion".tr()
                        : widget.branchInfoDescription,
                    style: fonts.smallLink.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w400)),
                12.h.verticalSpace,
                Text("what_we_offer".tr(), style: fonts.regularMain),
                12.h.verticalSpace,
                WhatWeOfferCard(),
                12.h.verticalSpace,
                Text("video".tr(), style: fonts.regularMain),
                12.h.verticalSpace,
                SvgPicture.asset(
                  "assets/icons/delete_folder.svg",
                  color: colors.neutral500,
                  width: double.infinity,
                  height: 150.h,
                  // height: 148.h,
                ),
                24.h.verticalSpace,
                Text("address_branch".tr(),
                    style: fonts.regularMain.copyWith(
                        fontSize: 17.sp, fontWeight: FontWeight.w600)),
                16.h.verticalSpace,
                SizedBox(
                  height: 200.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: GoogleMap(
                      // markers: markers ?? {},
                      mapType: MapType.normal,
                      initialCameraPosition: kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        controller0.complete(controller);
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
                ),
                40.h.verticalSpace,
              ],
            ),
          )
        ],
      );
    });
  }
}
