import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/customer_review/generate_star.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ReviewCardNew extends StatelessWidget {
  const ReviewCardNew({
    super.key,
    required this.name,
    required this.clinicName,
    required this.clinicLocation,
    required this.rating,
    required this.review,
    required this.date,
    required this.clinicImage,
    required this.integratorLogoUrl,
    required this.doctorName,
    required this.doctorJob,
    required this.doctorImage,
  });

  final String name;
  final String clinicName;
  final String clinicLocation;
  final String integratorLogoUrl;
  final String clinicImage;
  final String doctorImage;
  final String doctorName;
  final String doctorJob;
  final int rating;
  final String review;
  final String date;

  @override
  Widget build(BuildContext context) {
    final dateTime = MyFunctions.format(date: date, context: context);

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, ctrl) {
        return Container(
          width: 1.sw,
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.h,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.4.sw),
                    child: Text(
                      name,
                      maxLines: 2,
                      style: fonts.smallTagSecond.copyWith(fontSize: 14.sp),
                    ),
                  ),
                  if (integratorLogoUrl.isNotEmpty) ...{
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 0.4.sw),
                      child: CommonImage(
                        height: 22.h,
                        imageUrl: integratorLogoUrl,
                      ),
                    ),
                  } else ...{
                    const SizedBox.shrink()
                  }
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.4.sw),
                    child: SizedBox(
                      height: 20,
                      child: GenerateStar(rank: rating, colors: colors, icons: icons),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.4.sw),
                    child: Text(
                      dateTime,
                      style: fonts.xSmallLink.copyWith(fontSize: 12.sp, color: const Color(0xff5F6368)),
                    ),
                  ),
                ],
              ),
              if (doctorJob.isNotEmpty || doctorName.isNotEmpty) ...{
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${"for_whom".tr()}: ",
                      style: fonts.xSmallLink.copyWith(fontSize: 12),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 36.h,
                        child: Row(
                          spacing: 12.w,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors.neutral300.withValues(alpha: 0.2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                                child: CommonImage(
                                  imageUrl: doctorImage,
                                  fit: BoxFit.contain,
                                  errorImageAsset: "assets/images/doctor_placeholder.png",
                                  height: 27,
                                  width: 27,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 0.45.sw),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    doctorName,
                                    style: fonts.xSmallLink.copyWith(fontSize: 12),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    doctorJob,
                                    style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff5F6368)),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              },
              if (clinicName.isNotEmpty || clinicLocation.isNotEmpty) ...{
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${"clinic".tr()}: ",
                      style: fonts.xSmallLink.copyWith(fontSize: 12),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 36.h,
                        child: Row(
                          spacing: 12.w,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonImage(
                              imageUrl: clinicImage,
                              fit: BoxFit.fill,
                              errorWidget: (context, i, n) => Image.asset(
                                "assets/images/medion_logo.png",
                                fit: BoxFit.contain,
                              ),
                              // errorImageAsset: "assets/images/experience.png",
                              height: 27,
                              width: 27,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 0.45.sw),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    clinicName,
                                    style: fonts.xSmallLink.copyWith(fontSize: 12),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    clinicLocation,
                                    style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff5F6368)),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              },
              Text(
                "comments".tr().replaceAll(":", ""),
                style: fonts.xxSmallestText.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                review,
                style: fonts.xxSmallestText.copyWith(fontSize: 12.sp),
              ),
              1.h.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
