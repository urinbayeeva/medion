import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
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
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: onTap,
        child: isInnerPageUsed!
            ? Container(
                // padding: EdgeInsets.all(12.w),
                // margin: EdgeInsets.only(right: 12.w),
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
              ),
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
              Text(
                categoryType! ?? "",
                style: fonts.regularSemLink
                    .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
              // 12.h.verticalSpace,
            ],
            Container(
              margin: EdgeInsets.only(right: 12.w),
              width: 164.w,
              height: 182.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.shade0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(imagePath ?? "", fit: BoxFit.cover)),
            ),
          ],
        );
      }),
      if (candidateScience ?? false) ...[
        ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4),
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
          );
        }),
      ],
      10.h.verticalSpace,
      ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return Text(name ?? "",
            style: fonts.headlineMain
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500));
      }),
      4.h.verticalSpace,
      ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return Text(profession ?? "",
            style: fonts.headlineMain
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400));
      }),
      4.h.verticalSpace,
      ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return SizedBox(
          width: 164.w,
          child: Text(status ?? "",
              overflow: TextOverflow.clip,
              style: fonts.headlineMain.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: colors.neutral600)),
        );
      }),
      if (experience != null) ...[
        ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
          return Text(experience ?? "",
              style: fonts.xxSmallText
                  .copyWith(fontSize: 11.sp, fontWeight: FontWeight.w400));
        }),
      ]
    ];
  }
}
