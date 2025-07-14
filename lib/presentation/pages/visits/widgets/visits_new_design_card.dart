import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/visits_enum.dart';

class VisitsNewDesignCard extends StatelessWidget {
  final VisitListEnum listEnum;
  final BorderRadius radius;
  final EdgeInsetsGeometry padding;
  final String doctorName;
  final String doctorJob;
  final String doctorImage;
  final String serviceName;
  final String location;
  final String timaAndDate;
  final String visitTime;
  final String id;
  final bool paymentStatus;
  final VoidCallback? onTap;

  const VisitsNewDesignCard({
    super.key,
    this.radius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    required this.doctorName,
    required this.id,
    required this.doctorJob,
    required this.serviceName,
    required this.location,
    required this.timaAndDate,
    required this.visitTime,
    required this.paymentStatus,
    required this.doctorImage,
    required this.listEnum,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 142,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: radius, color: colors.shade0),
            margin: padding,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              spacing: 8.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: listEnum.color,
                    borderRadius: const BorderRadius.all(Radius.circular(99)),
                  ),
                  child: SizedBox(width: 3.w, height: double.infinity),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        serviceName.isNotEmpty ? serviceName : "\n",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: fonts.smallMain,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        doctorName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: fonts.xSmallText,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        doctorJob,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: fonts.xSmallText.copyWith(color: colors.neutral300),
                      ),
                    ),
                    const Spacer(),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: listEnum.color.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
                        child: Text(
                          listEnum.title.tr(),
                          style: fonts.xSmallText.copyWith(color: listEnum.color.withValues(alpha: 0.8)),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      timaAndDate,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: fonts.regularMain,
                    ),
                    Text(
                      visitTime,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: fonts.xSmallMain.copyWith(fontSize: 14),
                    ),
                    Text(
                      id,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: fonts.xSmallMain.copyWith(fontSize: 14),
                    ),
                    const Spacer(),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: paymentStatus
                            ? colors.success500.withValues(alpha: 0.08)
                            : colors.error500.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
                        child: Text(
                          paymentStatus ? "recommendations_paid".tr() : "recommendations_not_paid".tr(),
                          style: fonts.xSmallText.copyWith(
                            color: paymentStatus ? colors.success500 : colors.error500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DynamicVisitsCard extends StatelessWidget {
  const DynamicVisitsCard({
    super.key,
    required this.listEnum,
    required this.radius,
    required this.padding,
    required this.doctorName,
    required this.doctorJob,
    required this.serviceName,
    required this.visitTime,
    required this.paymentStatus,
    required this.colors,
    required this.fonts,
  });

  final VisitListEnum listEnum;
  final BorderRadius radius;
  final EdgeInsetsGeometry padding;
  final CustomColorSet colors;
  final FontSet fonts;
  final String doctorName;
  final String doctorJob;
  final String serviceName;

  final String visitTime;
  final bool paymentStatus;

  @override
  Widget build(BuildContext context) {
    final time = MyFunctions.changeTime(visitTime);
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        decoration: BoxDecoration(borderRadius: radius, color: const Color(0xffFFFFFF)),
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 3.w,
              decoration: BoxDecoration(
                color: listEnum.color,
                borderRadius: const BorderRadius.all(Radius.circular(99)),
              ),
            ),
            Flexible(
              flex: 8,
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Text(
                          serviceName.isNotEmpty ? serviceName : "\n",
                          style: fonts.smallMain,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 4,
                          children: [
                            Text(
                              time.date,
                              style: fonts.xSmallText,
                            ),
                            Text(
                              time.time,
                              style: fonts.xSmallText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    doctorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: fonts.xSmallText,
                  ),
                  Flexible(
                    child: Text(
                      doctorJob,
                      style: fonts.xSmallText.copyWith(color: colors.neutral300),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: listEnum.color.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
                          child: Text(
                            listEnum.title.tr(),
                            style: fonts.xSmallText.copyWith(color: listEnum.color.withValues(alpha: 0.8)),
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: paymentStatus
                              ? colors.success500.withValues(alpha: 0.08)
                              : colors.error500.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
                          child: Text(
                            paymentStatus ? "recommendations_paid".tr() : "recommendations_not_paid".tr(),
                            style: fonts.xSmallText.copyWith(
                              color: paymentStatus ? colors.success500 : colors.error500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
