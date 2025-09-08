import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_choose.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AboutDoctorWidget extends StatelessWidget {
  final String? name;
  final String? profession;
  final String? specialty;
  final String? image;
  final int? doctorID;
  final int? experience;

  const AboutDoctorWidget({
    super.key,
    this.name,
    this.profession,
    this.specialty,
    this.image,
    this.doctorID,
    this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 12.w),
              width: 112.w,
              height: 124.h,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: colors.neutral400),
                borderRadius: BorderRadius.circular(8.r),
                color: colors.shade0,
              ),
              child: image != "" && image!.startsWith("http")
                  ? CachedNetworkImage(
                      imageUrl: image!,
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: colors.error500,
                      ),
                    )
                  : icons.nonUser.svg(color: colors.neutral500),
            ),
            12.w.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name ?? '', style: fonts.smallTagSecond.copyWith(fontSize: 14.sp)),
                  4.h.verticalSpace,
                  Text(
                    profession ?? "",
                    style: fonts.xSmallText.copyWith(fontSize: 12.sp, color: const Color(0xff323232)),
                  ),
                  4.h.verticalSpace,
                  Text.rich(
                    TextSpan(
                      text: "${"working_experience".tr()}: ",
                      style: fonts.xSmallMain.copyWith(fontSize: 12, color: const Color(0xff66686C)),
                      children: [
                        TextSpan(
                          text: "${experience ?? ""} ${"year".tr()}",
                          style: fonts.xSmallMain.copyWith(fontSize: 12, color: colors.error500),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    specialty == "null" ? "" : specialty!,
                    maxLines: 2,
                    style: fonts.mediumMain.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: colors.neutral600,
                    ),
                  ),
                  12.h.verticalSpace,
                  // CButton(
                  //   width: 164,
                  //   title: "appointment_nav_bar".tr(),
                  //   onTap: () {
                  //     Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  //       builder: (context) => MedServiceChoose(
                  //         serviceTypeId: 0,
                  //         isDoctorService: true,
                  //         doctorId: doctorID,
                  //       ),
                  //     ));
                  //   },
                  //   height: 38.h,
                  // ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
