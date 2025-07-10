import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_choose.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorsItem extends StatelessWidget {
  final String? name;
  final String? profession;
  final String? status;
  final String? imagePath;
  final bool? candidateScience;
  final String? experience;
  final bool? isInnerPageUsed;
  final bool? isCategoried;
  final String? categoryType;
  final VoidCallback onTap;
  final String? gender;
  final int doctorID;
  final bool home;
  final bool hasDiscount;
  final String academicRank;

  const DoctorsItem({
    super.key,
    this.imagePath,
    this.name,
    this.profession,
    this.status,
    this.candidateScience,
    this.experience,
    this.isInnerPageUsed = false,
    this.isCategoried = false,
    this.categoryType,
    required this.onTap,
    this.gender,
    required this.doctorID,
    this.home = true,
    this.hasDiscount = false,
    required this.academicRank, // Ensure academicRank is required or handle nullability
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        if (isInnerPageUsed!) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: colors.shade0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildDoctorInfo(context),
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildDoctorInfo(context),
          );
        }
      },
    );
  }

  List<Widget> _buildDoctorInfo(BuildContext context) {
    return [
      ThemeWrapper(
        builder: (context, colors, fonts, icons, controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isCategoried == true) ...[
                SizedBox(
                  width: 164.w,
                  child: Text(
                    categoryType!,
                    style: fonts.regularSemLink.copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12.w),
                  width: 164.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: colors.shade0,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: icons.nonUser.svg(),
                  ),
                ),
              ],
              Container(
                width: 180.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.shade0,
                ),
                child: Stack(
                  children: [
                    if (imagePath != "" && imagePath!.startsWith("http")) ...{
                      CachedNetworkImage(
                        width: 180.w,
                        height: 165.h,
                        imageUrl: imagePath!,
                        fit: BoxFit.cover,
                      )
                    } else if (gender == "female") ...{
                      icons.girlNonUser.svg(width: 180.w, height: 165.h, color: colors.neutral500)
                    } else ...{
                      icons.nonUser.svg(color: colors.neutral500, width: 180.w, height: 165.h),
                    },
                    if (hasDiscount) ...{
                      Positioned(
                        top: 8.w,
                        right: 8.w,
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors.error500,
                          ),
                          child: icons.discount.svg(
                            width: 26.w,
                            height: 26.h,
                            color: colors.shade0,
                          ),
                        ),
                      ),
                    },
                    Positioned(
                      bottom: 0,
                      right: 8.w,
                      left: 8.w,
                      child: Center(
                        child: SizedBox(
                          width: 164.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                            margin: EdgeInsets.only(top: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: academicRank.toString() != 'null' && academicRank.toString().length > 3
                                  ? colors.error500
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                academicRank.toString() != 'null' && academicRank.toString().length > 3
                                    ? academicRank
                                    : '',
                                style: fonts.xSmallLink.copyWith(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: colors.shade0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      if (candidateScience ?? false) ...[
        Center(
          child: ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
            return SizedBox(
              width: 164.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                margin: EdgeInsets.only(top: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: colors.error500,
                ),
                child: Center(
                  child: Text(
                    "candidate_of_state".tr(),
                    style: fonts.xSmallLink.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: colors.shade0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
      10.h.verticalSpace,
      ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return SizedBox(
          width: 164.w,
          child: Text(
            name ?? "",
            overflow: TextOverflow.ellipsis,
            style: fonts.headlineMain.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        );
      }),
      4.h.verticalSpace,
      ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return SizedBox(
          width: 164.w,
          child: Text(
            profession ?? "",
            overflow: TextOverflow.ellipsis,
            style: fonts.headlineMain.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
        );
      }),
      4.h.verticalSpace,
      ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return SizedBox(
          width: 164.w,
          child: Text(
            status ?? "",
            overflow: TextOverflow.ellipsis,
            style: fonts.headlineMain.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: colors.neutral600,
            ),
          ),
        );
      }),
      if (experience != null) ...[
        ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
          return SizedBox(
            width: 164.w,
            child: Text(
              experience ?? "",
              overflow: TextOverflow.ellipsis,
              style: fonts.xxSmallText.copyWith(fontSize: 11.sp, fontWeight: FontWeight.w400),
            ),
          );
        }),
      ],
      if (isInnerPageUsed == true) ...[
        4.h.verticalSpace,
        ThemeWrapper(
          builder: (context, colors, fonts, icons, controller) {
            return Center(
              child: CButton(
                backgroundColor: colors.neutral200,
                textColor: colors.primary900,
                width: 164.w,
                title: "podrobno".tr(),
                onTap: onTap,
                height: 32.h,
              ),
            );
          },
        ),
        4.h.verticalSpace,
        ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
          return Center(
            child: CButton(
              width: 164.w,
              title: "appointment_nav_bar".tr(),
              onTap: () {
                context.read<BottomNavBarController>().changeNavBar(true);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedServiceChoose(
                      isDoctorService: true,
                      doctorId: doctorID,
                    ),
                  ),
                ).then((value) {}).then((_) {
                  context.read<BottomNavBarController>().changeNavBar(home == false ? true : false);
                });
              },
              height: 32.h,
            ),
          );
        }),
      ],
    ];
  }
}
