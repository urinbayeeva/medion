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
  final String? experience;
  final bool? isInnerPageUsed;
  final bool? isCategoried;
  final String? categoryType;
  final VoidCallback onTap;
  final String? gender;
  final int doctorID;
  final bool home;
  final bool hasDiscount;
  final String? academicRank;

  const DoctorsItem({
    super.key,
    this.imagePath,
    this.name,
    this.profession,
    this.status,
    this.experience,
    this.isInnerPageUsed = false,
    this.isCategoried = false,
    this.categoryType,
    required this.onTap,
    this.gender,
    required this.doctorID,
    this.home = true,
    this.hasDiscount = false,
    this.academicRank,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return isInnerPageUsed!
          ? Container(
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
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildDoctorInfo(context),
            );
    });
  }

  List<Widget> _buildDoctorInfo(BuildContext context) {
    return [
      ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isCategoried == true) ...[
              SizedBox(
                width: 164.w,
                child: Text(
                  categoryType!,
                  style: fonts.regularSemLink
                      .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12.w),
                width: 164.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: colors.shade0),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: icons.nonUser.svg()),
              ),
            ],
            Container(
              margin: EdgeInsets.only(right: 12.w),
              width: 164.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: colors.shade0,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  imagePath != "" && imagePath!.startsWith("http")
                      ? CachedNetworkImage(
                          width: 175.w,
                          height: 165.h,
                          imageUrl: imagePath!,
                          fit: BoxFit.cover,
                        )
                      : gender == "female"
                          ? icons.nonUser.svg(width: 175.w, height: 175.h)
                          : icons.nonUser.svg(
                              color: colors.neutral500,
                              width: 175.w,
                              height: 165.h,
                            ),
                  if (hasDiscount)
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
                  if (academicRank != null && academicRank!.isNotEmpty)
                    Positioned(
                      bottom: -12.h,
                      left: (164.w - 100.w) / 3, // Center the container
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: colors.error500,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          academicRank!,
                          style: fonts.headlineMain.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: colors.shade0,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }),
      10.h.verticalSpace,
      ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return SizedBox(
          width: 164.w,
          child: Text(
            name ?? "",
            overflow: TextOverflow.ellipsis,
            style: fonts.headlineMain
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
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
            style: fonts.headlineMain
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
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
              style: fonts.xxSmallText
                  .copyWith(fontSize: 11.sp, fontWeight: FontWeight.w400),
            ),
          );
        }),
      ],
      if (isInnerPageUsed == true) ...[
        8.h.verticalSpace,
        ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
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
        }),
        8.h.verticalSpace,
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
                  context
                      .read<BottomNavBarController>()
                      .changeNavBar(home == false ? true : false);
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
