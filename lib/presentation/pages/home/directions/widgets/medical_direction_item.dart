import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedicalDirectionItem extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? iconPath;
  final VoidCallback onTap;

  const MedicalDirectionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            width: 1.sw,
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
            margin: EdgeInsets.fromLTRB(0.w, 8.h, 0.w, 0.h),
            child: Row(
              spacing: 8.w,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (iconPath == null || iconPath == "") ...{
                  Container(
                    height: 46.h,
                    width: 46.w,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: colors.error500.withValues(alpha: 0.05),
                    ),
                    child: icons.stethoscope.svg(color: colors.error500, width: 50.w, height: 50.h),
                  )
                } else ...{
                  Container(
                    height: 46.h,
                    width: 46.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: colors.error500.withValues(alpha: 0.05),
                      border: Border.all(color: colors.neutral300),
                    ),
                    child: CommonImage(
                      radius: BorderRadius.circular(8.r),
                      imageUrl: iconPath!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                },
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0.72.sw,
                      child: Text(
                        title ?? "Unknown Service",
                        maxLines: 1,
                        style: fonts.smallSemLink.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 0.72.sw,
                      child: Text(
                        subtitle == "null" ? "" : subtitle!,
                        style: fonts.xSmallText.copyWith(
                          color: colors.neutral600,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
