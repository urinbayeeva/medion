import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AboutDoctorWidget extends StatelessWidget {
  const AboutDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 112.w,
              height: 124.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.neutral200),
              child: Image.asset(
                "assets/images/artem_aka.png",
                fit: BoxFit.contain,
              )),
          12.w.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Батманов Артём\nЛеонидович", style: fonts.mediumMain),
              4.h.verticalSpace,
              Text("Дерматолог", style: fonts.smallLink),
              4.h.verticalSpace,
              Text(
                  "Заместитель директора институ\nпо Онкологии, Профессор \nРадиологии",
                  style: fonts.mediumMain.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: colors.neutral600)),
            ],
          ),
        ],
      );
    });
  }
}
