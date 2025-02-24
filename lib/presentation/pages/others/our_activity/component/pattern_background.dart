import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class PatternBackground extends StatelessWidget {
  final String patternTitle;
  const PatternBackground({super.key, required this.patternTitle});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.only(top: 16.w),
        // height: 180.h,
        child: Stack(
          children: [
            icons.pattern.asset(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(patternTitle,
                  style: fonts.smallLink
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      );
    });
  }
}
