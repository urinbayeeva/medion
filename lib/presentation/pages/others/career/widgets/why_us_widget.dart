import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class WhyUsWidget extends StatelessWidget {
  final String text;
  const WhyUsWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/icons/chart.svg",
              color: colors.error500,
              width: 24.w,
              height: 24.w,
            ),
            8.w.horizontalSpace,
            Expanded(
              child: Text(
                text,
                style: fonts.regularMain
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      );
    });
  }
}
