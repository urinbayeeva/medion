import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CareerContainer extends StatelessWidget {
  final String? careerTitle;
  final String? careerDescription;
  final String? careerSalary;
  final String? careerStatus;
  final String? careerSuggest;
  final String? careerRequires;
  final String? careerAddrees;
  final String? careerEmail;
  final String? careerCallCenter;
  final String? careerPhoneNumber;
  final String? careerLink;
  const CareerContainer({
    super.key,
    this.careerTitle,
    this.careerDescription,
    this.careerSalary,
    this.careerStatus,
    this.careerSuggest,
    this.careerRequires,
    this.careerAddrees,
    this.careerEmail,
    this.careerCallCenter,
    this.careerPhoneNumber,
    this.careerLink,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Column(
          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              careerTitle!,
              style: fonts.mediumMain.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              careerDescription!,
              style: fonts.mediumMain.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            AnimationButtonEffect(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                padding: EdgeInsets.all(16.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colors.neutral200,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                    child: Text(
                  "get_know".tr(),
                  style: fonts.smallMain,
                )),
              ),
            ),
            8.h.verticalSpace
          ],
        ),
      );
    });
  }
}
