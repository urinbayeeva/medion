import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ChoosingDoctorWidget extends StatelessWidget {
  final String image;
  final String doctorName;
  final String doctorStatus;

  const ChoosingDoctorWidget(
      {super.key,
      required this.image,
      required this.doctorName,
      required this.doctorStatus});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 74.w,
                  height: 74.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: colors.neutral200),
                  child: Image.asset(image),
                ),
                12.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctorName,
                        style: fonts.smallMain.copyWith(
                            fontSize: 15.sp, fontWeight: FontWeight.w600)),
                    4.h.verticalSpace,
                    Text(doctorStatus,
                        style: fonts.smallMain.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: colors.primary900)),
                  ],
                )
              ],
            ),
            12.h.verticalSpace,
            Text("Выберите дату",
                style: fonts.smallMain.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: colors.primary900)),
          ],
        ),
      );
    });
  }
}
