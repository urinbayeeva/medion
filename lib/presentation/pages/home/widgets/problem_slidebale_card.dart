import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/domain/sources/disease_data.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ProblemSlidebaleCard extends StatelessWidget {
  const ProblemSlidebaleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(diseaseData.length, (index) {
            final data = diseaseData[index];
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: AnimationButtonEffect(
                onTap: () {},
                child: Container(
                  width: 109.w,
                  height: 120.h,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: colors.shade0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 5, 6, 0.05),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.all(8.w),
                        child: Image.asset(data['image']),
                      ),
                      8.h.verticalSpace,
                      Text(
                        data['disease_name'],
                        style: fonts.xSmallText.copyWith(
                          color: colors.primary900,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
