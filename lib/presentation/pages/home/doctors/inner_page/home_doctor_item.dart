import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_choose.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class HomeDoctorItem extends StatelessWidget {
  const HomeDoctorItem({
    super.key,
    this.name,
    this.profession,
    this.imagePath,
    this.experience,
    this.categoryType,
    required this.onTap,
    this.gender,
    required this.doctorID,
    required this.hasDiscount,
    required this.academicRank,
    required this.infoDescription,
  });

  final String? name;
  final String? infoDescription;
  final String? profession;
  final String? imagePath;
  final String? experience;
  final String? categoryType;
  final VoidCallback onTap;
  final String? gender;
  final int doctorID;
  final bool hasDiscount;
  final String academicRank;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controllers) {
        return Container(
          height: 300.h,
          width: 180.w,
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (imagePath == null || imagePath!.isEmpty && !imagePath!.startsWith("http")) ...{
                      20.h.verticalSpace,
                    },
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          if (imagePath != null && imagePath!.isNotEmpty && imagePath!.startsWith("http")) ...{
                            CommonImage(
                              width: double.infinity,
                              height: 149.h,
                              imageUrl: imagePath!,
                              fit: BoxFit.contain,
                              radius: BorderRadius.vertical(top: Radius.circular(12.r)),
                            )
                          } else if (gender == "female") ...{
                            icons.doctorWoman.svg(width: 133.w, height: 149.h, color: colors.neutral500)
                          } else ...{
                            icons.doctorMan.svg(color: colors.neutral500, width: 133.w, height: 149.h),
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
                            bottom: -10.h,
                            right: 8.w,
                            left: 8.w,
                            child: Center(
                              child: Container(
                                width: 120.w,
                                height: 22.h,
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
                        ],
                      ),
                    ),
                    15.h.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: fonts.headlineMain.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff00040A),
                            ),
                          ),
                          4.h.verticalSpace,
                          Text(
                            profession ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: fonts.headlineMain.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff323232),
                            ),
                          ),
                          4.h.verticalSpace,
                          Text(
                            "experience".tr(namedArgs: {"count": "$experience"}),
                            // experience ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: fonts.headlineMain.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: colors.error500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.error500,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.r)),
                ),
                child: WScaleAnimation(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => MedServiceChoose(isDoctorService: true, doctorId: doctorID),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.h,
                    child: Center(
                      child: Text(
                        "appointment_nav_bar".tr(),
                        style: fonts.smallText.copyWith(
                          color: colors.shade0,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
