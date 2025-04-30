import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
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
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: onTap,
        child: Column(
          children: [
            7.h.verticalSpace,
            Container(
              decoration: BoxDecoration(
                  color: colors.shade0,
                  borderRadius: BorderRadius.circular(8.r)),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: iconPath!,
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(title ?? "Unknown Service",
                    style: fonts.smallSemLink.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                subtitle: Text(subtitle == "null" ? "" : subtitle!,
                    style: fonts.xSmallText.copyWith(
                        color: colors.neutral600,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      );
    });
  }
}
