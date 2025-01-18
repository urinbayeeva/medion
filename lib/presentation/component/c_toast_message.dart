import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CToastMessage extends StatelessWidget {
  const CToastMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Row(
          children: [
            Container(
              width: 8.w,
              decoration: BoxDecoration(
                  color: const Color(0xFF0ACE58),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r))),
            ),
            8.w.horizontalSpace,
            Text("service_added".tr(), style: fonts.smallMain),
          ],
        ),
      );
    });
  }
}
