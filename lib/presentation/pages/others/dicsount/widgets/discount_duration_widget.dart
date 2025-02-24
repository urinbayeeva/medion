import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DiscountDurationWidget extends StatelessWidget {
  final String discountAddress;
  final String discountDuration;
  final String phoneShortNumber;
  final String phoneNumber;

  const DiscountDurationWidget({
    super.key,
    required this.discountAddress,
    required this.discountDuration,
    required this.phoneShortNumber,
    required this.phoneNumber,
  });
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: const Color(0xFFF9F9F9)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("dicsount_location".tr(), style: fonts.smallLink),
            2.h.verticalSpace,
            Text(discountAddress, style: fonts.regularMain),
            12.h.verticalSpace,
            Text("discount_duration".tr(), style: fonts.smallLink),
            2.h.verticalSpace,
            Text(discountDuration, style: fonts.regularMain),
            12.h.verticalSpace,
            Text("number_call_center".tr(), style: fonts.smallLink),
            2.h.verticalSpace,
            Text(phoneShortNumber, style: fonts.regularMain),
            12.h.verticalSpace,
            Text("discount_phone_number".tr(), style: fonts.smallLink),
            2.h.verticalSpace,
            Text(phoneNumber, style: fonts.regularMain),
            12.h.verticalSpace,
          ],
        ),
      );
    });
  }
}
