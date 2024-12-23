import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VerifyAppointmentItem extends StatelessWidget {
  const VerifyAppointmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                // width: 119.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: colors.neutral200),
                child: icons.nargiza.asset(fit: BoxFit.fill),
              ),
            ),
            12.w.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text("Диагностика",
                    style: fonts.smallMain.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                Text("Гинекологическое УЗИ",
                    style: fonts.smallMain.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.neutral600)),
                const CDivider(),
                Text("Б. Наргиза Акбаровна",
                    style: fonts.smallMain.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                Text("200 000 cум",
                    style: fonts.smallMain.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.neutral600)),
                const CDivider(),
                Row(
                  children: [
                    icons.clock.svg(width: 14.w, height: 14.h),
                    4.w.horizontalSpace,
                    Text("Среда, 22 Июня, 14:30",
                        style: fonts.smallMain.copyWith(
                            fontSize: 13.sp, fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  children: [
                    icons.location.svg(width: 14.w, height: 14.h),
                    4.w.horizontalSpace,
                    Text("Шайхантахур, А. Кодирий 39",
                        style: fonts.smallMain.copyWith(
                            fontSize: 13.sp, fontWeight: FontWeight.w400)),
                  ],
                ),
                const CDivider(),
              ],
            ),
            Expanded(child: icons.cancel.svg(width: 24.w, height: 24.h)),
          ],
        ),
      );
    });
  }
}
