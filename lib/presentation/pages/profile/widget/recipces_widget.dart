import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class RecipcesWidget extends StatelessWidget {
  final String title;
  final String days;
  final String repeat;
  final String date;
  const RecipcesWidget(
      {super.key,
      required this.title,
      required this.days,
      required this.repeat,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: fonts.regularMain
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8.w),
                child: Row(
                  children: [
                    icons.calendar.svg(
                        width: 14.w, height: 14.h, color: colors.neutral800),
                    4.w.horizontalSpace,
                    Text(
                      days,
                      style: fonts.regularMain.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colors.neutral800),
                    ),
                    8.w.horizontalSpace,
                    icons.clock.svg(
                        width: 14.w, height: 14.h, color: colors.neutral800),
                    4.w.horizontalSpace,
                    Text(
                      repeat,
                      style: fonts.regularMain.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colors.neutral800),
                    ),
                  ],
                ),
              ),
              trailing: Text(date,
                  style: fonts.regularMain
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600)),
            )
          ],
        ),
      );
    });
  }
}
