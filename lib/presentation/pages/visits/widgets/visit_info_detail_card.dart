import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/extensions.dart';

class VisitInfoDetailCard extends StatelessWidget {
  final String? categoryName;
  final String? serviceName;
  final String? doctorName;
  final double? servicePrice;
  final String? visitDate;
  final String? visitLocation;
  final String? visitStatus;
  final String? visitTime;
  final String? visitPaymentByWhom;
  final String? paymentMethod;
  final dynamic data;
  final String? image;

  const VisitInfoDetailCard({
    super.key,
    this.visitStatus,
    this.servicePrice,
    this.categoryName,
    this.serviceName,
    this.doctorName,
    this.visitDate,
    this.visitLocation,
    this.visitPaymentByWhom,
    this.paymentMethod,
    this.data,
    this.image,
    this.visitTime,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: colors.shade0,
            border: Border.all(width: 1, color: const Color(0xFFEDEDED)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (image == null || image!.isEmpty)
                      ? icons.nonUser.svg(
                          height: 138.h, width: 118.w, color: colors.neutral500)
                      : CachedImageComponent(
                          height: 138.h, width: 118.w, imageUrl: image!),
                  8.w.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildOverflowText(
                            categoryName ?? "N/A", fonts, colors),
                        _buildOverflowTextGrey(
                            serviceName ?? "N/A", fonts, colors),
                        const CDivider(),
                        _buildOverflowText(doctorName ?? "N/A", fonts, colors),
                        _buildOverflowTextGrey(
                            servicePrice?.toString() ?? "N/A", fonts, colors),
                        const CDivider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            icons.clock.svg(width: 12.w, height: 12.h),
                            4.w.horizontalSpace,
                            Expanded(
                              child: _buildOverflowText(
                                formatVisitDate(context,
                                    visitDate?.toCapitalized() ?? "N/A"),
                                fonts,
                                colors,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            icons.location.svg(width: 12.w, height: 12.h),
                            4.w.horizontalSpace,
                            Expanded(
                              // Prevents overflow by wrapping text
                              child: _buildOverflowTextGrey(
                                visitLocation ?? "N/A",
                                fonts,
                                colors,
                              ),
                            ),
                          ],
                        ),
                        const CDivider(),
                      ],
                    ),
                  ),
                ],
              ),
              20.h.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${"status".tr()} : ",
                      style: fonts.smallLink.copyWith(
                          color: colors.primary900,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500)),
                  4.w.horizontalSpace,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.r),
                        color: visitStatus! == "paid"
                            ? const Color(0xFF0E73F6).withOpacity(0.3)
                            : const Color(0xFFFFA41B).withOpacity(0.3)),
                    child: Text(
                      visitStatus!,
                      style: fonts.xSmallMain.copyWith(
                          color: visitStatus! == "paid"
                              ? const Color(0xFF0E73F6)
                              : const Color(0xFFFFA41B)),
                    ),
                  ),
                ],
              ),
              10.h.verticalSpace,
              Text("pays_the_appoinment".tr(namedArgs: {"name": "N/A"}),
                  style: fonts.smallLink.copyWith(
                      color: colors.primary900,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500)),
              10.h.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${"payment_methods".tr()} : ",
                      style: fonts.smallLink.copyWith(
                          color: colors.primary900,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500)),
                  4.w.horizontalSpace,
                  Text(paymentMethod!,
                      style: fonts.smallLink.copyWith(
                          color: colors.primary900,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              10.h.verticalSpace,
            ],
          ),
        ),
      );
    });
  }

  Widget _buildOverflowText(String text, fonts, colors) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: fonts.smallMain.copyWith(
          color: colors.primary900,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildOverflowTextGrey(String text, fonts, colors) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: fonts.smallMain.copyWith(
          color: colors.neutral600,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

String formatVisitDate(BuildContext context, String? visitDate) {
  DateTime dateTime = DateFormat("yyyy-MM-dd, HH:mm - HH:mm").parse(visitDate!);

  final locale = Localizations.localeOf(context).toString();
  final formattedDate =
      DateFormat('EEEE, d MMMM, HH:mm', locale).format(dateTime);
  return formattedDate.toCapitalized();
}
