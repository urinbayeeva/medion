import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VisitsNewDesignCard extends StatefulWidget {
  final String doctorName;
  final String doctorJob;
  final String doctorImage;
  final String serviceName;
  final String location;
  final String timaAndDate;
  final String paymentStatus;
  final VoidCallback onTap;

  const VisitsNewDesignCard({
    super.key,
    required this.doctorName,
    required this.doctorJob,
    required this.serviceName,
    required this.location,
    required this.timaAndDate,
    required this.paymentStatus,
    required this.doctorImage,
    required this.onTap,
  });

  @override
  State<VisitsNewDesignCard> createState() => _VisitsNewDesignCardState();
}

class _VisitsNewDesignCardState extends State<VisitsNewDesignCard> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
          boxShadow: colors.shadowSSSS,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                widget.doctorImage.isEmpty
                    ? CircleAvatar(
                        radius: 38.r,
                        backgroundColor: colors.neutral400,
                        child: icons.nonUser.svg(),
                      )
                    : ClipOval(
                        child: CachedImageComponent(
                          fit: BoxFit.cover,
                          height: 76.h,
                          width: 76.w,
                          imageUrl: widget.doctorImage,
                        ),
                      ),
                8.w.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorName,
                        style: fonts.regularMain.copyWith(fontSize: 14.5.sp),
                      ),
                      Text(
                        widget.doctorJob,
                        style:
                            fonts.smallLink.copyWith(color: colors.neutral600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icons.document
                    .svg(color: colors.primary900, width: 24.w, height: 24.h),
                4.w.horizontalSpace,
                Expanded(
                  child: Text(
                    widget.serviceName,
                    style: fonts.regularMain
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
            6.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icons.location
                    .svg(color: colors.primary900, width: 22.w, height: 22.h),
                4.w.horizontalSpace,
                Expanded(
                  child: Text(
                    widget.location,
                    style: fonts.regularMain
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
            10.h.verticalSpace,
            const CDivider(),
            4.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.timaAndDate,
                    style: fonts.regularMain
                        .copyWith(color: colors.neutral600, fontSize: 14.sp),
                  ),
                ),
                AnimationButtonEffect(
                  onTap: widget.onTap,
                  child: Text(
                    "Подробнее",
                    style: fonts.regularMain
                        .copyWith(color: colors.error500, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
            10.h.verticalSpace
          ],
        ),
      );
    });
  }
}
