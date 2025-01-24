import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ServiceWidget extends StatelessWidget {
  final String consultInfo;
  final String consultPrice;
  const ServiceWidget(
      {super.key, required this.consultInfo, required this.consultPrice});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        consultInfo,
                        style: fonts.xSmallMain.copyWith(
                          color: colors.neutral600,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      4.h.verticalSpace,
                      Text(
                        consultPrice,
                        style: fonts.xSmallMain.copyWith(
                          color: colors.primary900,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                AnimationButtonEffect(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: colors.neutral200,
                    ),
                    child: Center(
                      child: icons.plus.svg(width: 20.w, height: 20.h),
                    ),
                  ),
                )
              ],
            ),
            Divider(color: colors.neutral400),
          ],
        ),
      );
    });
  }
}
