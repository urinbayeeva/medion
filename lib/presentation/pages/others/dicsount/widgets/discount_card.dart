import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
    required this.image,
    required this.colors,
    required this.title,
    required this.date,
    required this.fonts,
    required this.onTap,
  });

  final String image;
  final String title;
  final String date;
  final CustomColorSet colors;
  final FontSet fonts;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        width: 92.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.h,
          children: [
            CommonImage(
              radius: const BorderRadius.vertical(top: Radius.circular(12)),
              height: 163.h,
              width: double.infinity,
              imageUrl: image,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: fonts.xSmallLink.copyWith(fontWeight: FontWeight.w500, color: colors.darkMode900),
                  maxLines: 3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(bottom: 6.h),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  date,
                  style: fonts.xxSmallestText.copyWith(color: const Color(0xff66686C)),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
