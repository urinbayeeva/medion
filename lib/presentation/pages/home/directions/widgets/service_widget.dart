import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ServiceWidget extends StatelessWidget {
  final String consultInfo;
  final String consultPrice;
  final bool isSelected;
  final VoidCallback onTap;
  final bool canReceiveCallBack;
  final int serviceId; // Add this field
  final Function(BuildContext, dynamic, dynamic, List<int>) onCallBackRequested;

  const ServiceWidget({
    super.key,
    required this.consultInfo,
    required this.consultPrice,
    required this.isSelected,
    required this.onTap,
    required this.canReceiveCallBack,
    required this.serviceId, // Add this parameter
    required this.onCallBackRequested,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
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
                      SizedBox(height: 4.h),
                      Text(
                        consultPrice,
                        style: fonts.xSmallMain.copyWith(
                          color: colors.primary900,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "with_vat".tr(),
                        style: fonts.xSmallMain.copyWith(
                          color: colors.neutral600,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                if (canReceiveCallBack)
                  AnimationButtonEffect(
                    onTap: () => onCallBackRequested(context, colors, fonts,
                        [serviceId]), // Use serviceId directly
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: colors.neutral200,
                      ),
                      child: Center(child: icons.phone.svg()),
                    ),
                  )
                else
                  AnimationButtonEffect(
                    onTap: onTap,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: isSelected ? colors.error500 : colors.neutral200,
                      ),
                      child: Center(
                        child: isSelected
                            ? icons.check.svg(width: 20.w, height: 20.h)
                            : icons.plus.svg(width: 20.w, height: 20.h),
                      ),
                    ),
                  ),
              ],
            ),
            Divider(color: colors.neutral400),
          ],
        ),
      );
    });
  }
}
