import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ConditionOfDiscountWidget extends StatelessWidget {
  const ConditionOfDiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: const Color(0xFFF9F9F9)),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: icons.alertIcon.svg(),
              title: Text(
                "condition_discount".tr(),
                style: fonts.smallMain.copyWith(color: colors.error500),
              ),
            ),
            4.h.verticalSpace,
            Text("condition_discount_desc".tr(), style: fonts.smallLink),
          ],
        ),
      );
    });
  }
}
