import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedicalDirectionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final VoidCallback onTap;

  const MedicalDirectionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
              color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
          child: ListTile(
            leading: Container(
              width: 46.w,
              height: 46.h,
              padding: EdgeInsets.all(6.0.w),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 5, 6, 0.05),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgPicture.asset(iconPath, width: 32.w, height: 32.h),
            ),
            title: Text(title,
                style: fonts.smallSemLink
                    .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600)),
            subtitle: Text(subtitle,
                style: fonts.xSmallText.copyWith(
                    color: colors.neutral600,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      );
    });
  }
}
