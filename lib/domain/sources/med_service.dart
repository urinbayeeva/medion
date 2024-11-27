import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/domain/sources/med_service_data.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedService extends StatelessWidget {
  const MedService({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SizedBox(
        height: 150.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: containerData.length,
          itemBuilder: (context, item) {
            var data = containerData[item];

            return Stack(
              clipBehavior: Clip.none,
              children: [
                AnimationButtonEffect(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 135.w,
                    height: 120.h,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: data['color'],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Positioned(
                        //   bottom: -60,
                        //   right: -20,
                        //   child: Container(
                        //     width: 110.w,
                        //     // height: 110.w,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       gradient: RadialGradient(
                        //         colors: [
                        //           (data['avatarColor'] ?? Colors.grey)
                        //               .withOpacity(0.2),
                        //           (data['avatarColor'] ?? Colors.grey)
                        //               .withOpacity(0.5),
                        //           (data['avatarColor'] ?? Colors.grey)
                        //               .withOpacity(0.8),
                        //         ],
                        //         radius: 0.7,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          right: -34,
                          bottom: -34,
                          child: Image.asset(data['image'],
                              width: 140.w, height: 140.h),
                        ),
                        Text(
                          data['text'],
                          style: fonts.xSmallLink.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: colors.primary900),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
