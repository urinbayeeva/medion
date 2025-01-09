import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class PartnersCard extends StatelessWidget {
  final String partnerImage;
  final String parnterName;
  final String partnerSubtitle;
  final VoidCallback onTap;
  const PartnersCard(
      {super.key,
      required this.partnerImage,
      required this.parnterName,
      required this.partnerSubtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: colors.shade0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(partnerImage, width: 80.w, height: 80.h),
              8.h.verticalSpace,
              Text(parnterName, style: fonts.mediumMain),
              12.h.verticalSpace,
              Text(partnerSubtitle, style: fonts.smallLink),
            ],
          ),
        ),
      );
    });
  }
}
