import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class UpcomingReceptionItem extends StatelessWidget {
  final String image;
  final String doctorName;
  final String address;
  final String time;

  const UpcomingReceptionItem(
      {super.key,
      required this.image,
      required this.doctorName,
      required this.address,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundColor: const Color(0xFFF2F2F3),
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 120.r,
                  height: 120.r,
                ),
              ),
            ),
            8.w.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Предстоящий приём",
                    style: fonts.xSmallMain.copyWith(
                        color: colors.neutral600,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400)),
                4.h.verticalSpace,
                Text(doctorName,
                    style: fonts.smallMain.copyWith(
                        color: const Color(0xFF00040A),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600)),
                4.h.verticalSpace,
                Row(
                  children: [
                    icons.address.svg(width: 12.w, height: 12.h),
                    4.w.horizontalSpace,
                    Text(address,
                        style: fonts.smallMain.copyWith(
                            color: const Color(0xFF00040A),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                2.h.verticalSpace,
                Row(
                  children: [
                    icons.clock.svg(width: 12.w, height: 12.h),
                    4.w.horizontalSpace,
                    Text(time,
                        style: fonts.smallMain.copyWith(
                            color: const Color(0xFF00040A),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
