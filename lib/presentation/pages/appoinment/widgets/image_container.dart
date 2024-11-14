import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;
  const ImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.only(left: 8.w),
        width: 74.w,
        height: 74.h,
        decoration: BoxDecoration(
            color: colors.neutral200, borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      );
    });
  }
}
