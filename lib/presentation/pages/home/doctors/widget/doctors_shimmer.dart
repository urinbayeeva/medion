import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AboutDoctorShimmer extends StatelessWidget {
  const AboutDoctorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controllers) {
        return ShimmerView(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerContainer(
                  width: 150.w,
                  height: 20.h,
                  borderRadius: 4.r,
                  margin: EdgeInsets.only(bottom: 8.h),
                ),
                ShimmerContainer(
                  width: double.infinity,
                  height: 90.h,
                  borderRadius: 8.r,
                  margin: EdgeInsets.only(bottom: 16.h),
                ),
                Column(
                  children: List.generate(
                    2,
                    (index) => ShimmerContainer(
                      width: double.infinity,
                      height: 78.h,
                      borderRadius: 8.r,
                      margin: EdgeInsets.only(bottom: 8.h),
                    ),
                  ),
                ),
                ShimmerContainer(
                  width: double.infinity,
                  height: 100.h,
                  borderRadius: 8.r,
                  margin: EdgeInsets.only(bottom: 16.h),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
