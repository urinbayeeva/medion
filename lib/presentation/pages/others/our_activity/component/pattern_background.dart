import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class PatternBackground extends StatelessWidget {
  final String patternTitle;

  const PatternBackground({super.key, required this.patternTitle});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          padding: EdgeInsets.only(top: 16.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage(icons.pattern),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 10.h),
            child: Text(
              patternTitle,
              style: fonts.regularMain.copyWith(fontSize: 14.sp),
            ),
          ),
        );
      },
    );
  }
}
