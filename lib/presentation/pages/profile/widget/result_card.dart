import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.service,
    required this.doctorName,
    required this.doctorImage,
    required this.clinicImage,
    required this.clinicName,
    required this.date,
    required this.url,
    required this.download,
    required this.share,
  });

  final String service;
  final String doctorName;
  final String doctorImage;
  final String clinicImage;
  final String clinicName;
  final String date;
  final String url;
  final VoidCallback download;
  final VoidCallback share;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        width: 1.sw,
        height: 195.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rowWidget(
              title: "${"service".tr()}: ",
              action: Text(
                service,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: fonts.xSmallLink.copyWith(fontSize: 12),
              ),
              fonts: fonts,
            ),
            rowWidget(
              title: "${"doctor".tr()}: ",
              action: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4.w,
                children: [
                  Text(
                    doctorName,
                    maxLines: 2,
                    style: fonts.xSmallLink.copyWith(fontSize: 12),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.neutral200.withValues(alpha: 0.2),
                    ),
                    child: CommonImage(
                      radius: BorderRadius.circular(99.r),
                      fit: BoxFit.contain,
                      height: 28.h,
                      width: 28.w,
                      imageUrl: doctorImage,
                    ),
                  ),
                ],
              ),
              fonts: fonts,
            ),
            if (clinicName.isNotEmpty) ...{
              rowWidget(
                title: "${"clinic".tr()}: ",
                action: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4.w,
                  children: [
                    Text(
                      clinicName,
                      maxLines: 2,
                      style: fonts.xSmallLink.copyWith(fontSize: 12),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.neutral200.withValues(alpha: 0.2),
                      ),
                      child: CommonImage(
                        radius: BorderRadius.circular(99.r),
                        height: 28.h,
                        width: 28.w,
                        fit: BoxFit.contain,
                        imageUrl: clinicImage,
                      ),
                    ),
                  ],
                ),
                fonts: fonts,
              ),
            },
            rowWidget(
              title: "${"date_and_time".tr()}: ",
              action: Text(
                date,
                maxLines: 1,
                style: fonts.xSmallLink.copyWith(fontSize: 12),
              ),
              fonts: fonts,
            ),
            Row(
              spacing: 12.w,
              children: [
                Expanded(
                  child: CButton(
                    height: 36.h,
                    backgroundColor: const Color(0xffF2F2F3),
                    title: '',
                    onTap: download,
                    child: Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [icons.download.svg(), Text("download_pdf".tr(), style: fonts.xSmallLink)],
                    ),
                  ),
                ),
                Expanded(
                  child: CButton(
                    height: 36.h,
                    backgroundColor: const Color(0xffF2F2F3),
                    title: '',
                    onTap: share,
                    child: Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [icons.share.svg(), Text("share".tr(), style: fonts.xSmallLink)],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  Widget rowWidget({
    required String title,
    required Widget action,
    required FontSet fonts,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        spacing: 12.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff80868B)),
          ),
          Flexible(child: action)
        ],
      ),
    );
  }
}
