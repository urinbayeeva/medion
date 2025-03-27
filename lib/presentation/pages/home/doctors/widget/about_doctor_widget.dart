import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AboutDoctorWidget extends StatelessWidget {
  final String? name;
  final String? profession;
  final String? specialty;
  final String? image;
  const AboutDoctorWidget(
      {super.key, this.name, this.profession, this.specialty, this.image});

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
              child: SvgPicture.asset(
                image!,
                fit: BoxFit.contain,
              )),
          12.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name!, style: fonts.mediumMain),
                4.h.verticalSpace,
                Text(profession!, style: fonts.smallLink),
                4.h.verticalSpace,
                Text(specialty == "null" ? "" : specialty!,
                    style: fonts.mediumMain.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.neutral600)),
              ],
            ),
          ),
        ],
      );
    });
  }
}
