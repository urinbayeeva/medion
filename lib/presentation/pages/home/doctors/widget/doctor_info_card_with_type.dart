import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

enum DoctorInfoTypeEnum {
  achievement,
  education,
  experience;

  bool get isAchieve => this == DoctorInfoTypeEnum.achievement;

  bool get isEdu => this == DoctorInfoTypeEnum.education;

  bool get isExperience => this == DoctorInfoTypeEnum.experience;
}

class DoctorInfoCardWithType extends StatelessWidget {
  const DoctorInfoCardWithType({
    super.key,
    required this.type,
    required this.date,
    required this.title,
    required this.subTitle,
    required this.image,
    this.educationDagre,
    this.certificateSeries,
  });

  final String date;
  final String title;
  final List<String> subTitle;
  final String image;
  final String? educationDagre;
  final String? certificateSeries;

  final DoctorInfoTypeEnum type;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, ctrl) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: const Color(0xffF9F9F9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8.w,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 62.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: colors.shade0,
                      boxShadow: [
                        BoxShadow(
                          color: colors.darkMode50.withValues(alpha: 0.1),
                          offset: const Offset(-1, 2.1),
                          blurRadius: 9.r,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                    child: CommonImage(
                      radius: BorderRadius.circular(10.r),
                      imageUrl: image,
                      errorImageAsset: placeHolder(type),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: fonts.xSmallText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (subTitle.isNotEmpty) ...[
                          Text(
                            <String>[...subTitle].join("\n"),
                            style: fonts.xSmallMain.copyWith(color: const Color(0xff66686C)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              10.h.verticalSpace,
              if (type.isAchieve) ...{
                10.h.verticalSpace,
                Row(
                  spacing: 6.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icons.calendar.svg(height: 17.h, width: 17.w),
                    Text(awardDate(date), style: fonts.smallMain),
                  ],
                ),
                if (certificateSeries != null && certificateSeries!.isNotEmpty) ...{
                  10.h.verticalSpace,
                  Row(
                    spacing: 6.w,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icons.listViewCircle.svg(height: 17.h, width: 17.w),
                      Text(certificateSeries ?? "", style: fonts.smallMain),
                    ],
                  ),
                }
              },
              if (type.isEdu) ...{
                if (educationDagre != null && educationDagre!.isNotEmpty && type.isEdu) ...{
                  Text(educationDagre!, style: fonts.smallMain.copyWith(color: colors.error500)),
                  10.h.verticalSpace,
                },
                Text(
                  formDate(date),
                  style: fonts.smallMain.copyWith(color: colors.error500),
                ),
              },
              if (type.isExperience) ...{
                if (educationDagre != null && educationDagre!.isNotEmpty && type.isEdu) ...{
                  Text(educationDagre!, style: fonts.smallMain.copyWith(color: colors.error500)),
                  10.h.verticalSpace,
                },
                Text(
                  formDate(date),
                  style: fonts.smallMain.copyWith(color: colors.error500),
                ),
              },
            ],
          ),
        );
      },
    );
  }

  String awardDate(String date) {
    if (date.trim().isEmpty) return "";
    final parts = date.split(" - ");
    if (parts.length == 1) {
      final startDate = DateTime.tryParse(parts[0]);
      if (startDate != null) {
        return DateFormat('d MMMM, y').format(startDate) + " ${"year".tr().toLowerCase()}";
      } else {
        return parts[0];
      }
    }

    final startDate = DateTime.tryParse(parts[0]);
    final endDateStr = parts[1].trim();
    final startFormatted = startDate != null ? DateFormat('d MMMM, y').format(startDate) : parts[0];

    if (endDateStr.toLowerCase() == "current") {
      return "${startFormatted + "year".tr().toLowerCase()} - ${"current".tr()}";
    }

    final endDate = DateTime.tryParse(endDateStr);
    final endFormatted = endDate != null ? DateFormat('d MMMM, y').format(endDate) : endDateStr;

    return "${startFormatted + "year".tr().toString()} - ${endFormatted + "year".tr().toLowerCase()}";
  }

  String formDate(String date) {
    if (date.trim().isEmpty) return "";

    final parts = date.split(" - ");

    if (parts.length == 1) {
      final startDate = DateTime.tryParse(parts[0]);
      if (startDate != null) {
        return DateFormat('d MMMM, y').format(startDate) + "y".tr().toLowerCase();
      } else {
        return parts[0];
      }
    }
    final startDate = DateTime.tryParse(parts[0]);
    final endDateStr = parts[1].trim();

    final startFormatted = startDate != null ? DateFormat('yyyy').format(startDate) : parts[0];
    if (endDateStr.toLowerCase() == "current") {
      return "${startFormatted + "y".tr()} - ${"current".tr()}";
    }

    final endDate = DateTime.tryParse(endDateStr);
    final endFormatted = endDate != null ? DateFormat('yyyy').format(endDate) : endDateStr;

    return "${startFormatted + "y".tr().toLowerCase()} - ${endFormatted + "y".tr().toLowerCase()}";
  }

  static const String eduPlaceholder = 'assets/images/education.png';
  static const String awardPlaceholder = 'assets/images/award.png';
  static const String experiencePlaceholder = 'assets/images/experience.png';

  String placeHolder(DoctorInfoTypeEnum type) {
    if (type.isExperience) return experiencePlaceholder;
    if (type.isAchieve) return awardPlaceholder;
    if (type.isEdu) return eduPlaceholder;

    return "";
  }
}
