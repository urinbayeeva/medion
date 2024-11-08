import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorsItem extends StatelessWidget {
  final String name;
  final String profession;
  final String status;
  final String imagePath;
  final bool candidateScience;

  const DoctorsItem(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.profession,
      required this.status,
      required this.candidateScience});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 12.w),
              width: 164.w,
              height: 182.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.shade0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(imagePath, fit: BoxFit.contain)),
            ),
            if (candidateScience) ...[
              Container(
                width: 164.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: colors.error500),
                child: Text(
                  "Кандидат наук",
                  style: fonts.xSmallLink.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: colors.shade0),
                ),
              ),
            ],
            10.h.verticalSpace,
            Text(name,
                style: fonts.headlineMain
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500)),
            4.h.verticalSpace,
            Text(profession,
                // overflow: TextOverflow.clip,
                style: fonts.headlineMain
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400)),
            4.h.verticalSpace,
            SizedBox(
              width: 164.w,
              child: Text(status,
                  overflow: TextOverflow.clip,
                  style: fonts.headlineMain.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: colors.neutral600)),
            ),
          ],
        ),
      );
    });
  }
}
