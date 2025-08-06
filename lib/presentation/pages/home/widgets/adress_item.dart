import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/map/map_model.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';

class HomeLocationCard extends StatelessWidget {
  const HomeLocationCard({
    super.key,
    required this.location,
    required this.colors,
    required this.onTap,
    required this.fonts,
  });

  final LocationModel location;
  final CustomColorSet colors;
  final FontSet fonts;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        height: 64.h,
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          spacing: 2.w,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0.w, bottom: 4.h, top: 4.h, right: 6.w),
              child: CommonImage(
                width: 60.w,
                height: 64.h,
                imageUrl: location.icon,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: 1.w,
              color: colors.neutral400,
            ),
            3.horizontalSpace,
            Expanded(child: Text(location.address, style: fonts.smallLink))
          ],
        ),
      ),
    );
  }
}
