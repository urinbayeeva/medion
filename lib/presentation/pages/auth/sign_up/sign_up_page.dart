import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.shade0,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text("sign_in_to_get_started".tr(),
                  style:
                      fonts.displaySecond.copyWith(color: colors.primary900)),
              8.h.verticalSpace,
              Text("by_continuing_you_agree".tr(),
                  style: fonts.xSmallText.copyWith(
                      color: colors.neutral600,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400)),
              32.h.verticalSpace,
              _buildListTile(
                  imagePath: icons.medicalHistoryFirst,
                  title: "make_an_appoinment_doctor_online".tr(),
                  description: "destination and their services".tr()),
              14.h.verticalSpace,
              _buildListTile(
                  imagePath: icons.calendarFirst,
                  title: "keep_tracks_of_your_visits".tr(),
                  description: "your_upcomings_and_visits".tr()),
              14.h.verticalSpace,
              _buildListTile(
                  imagePath: icons.folderFirst,
                  title: "get_your_analyze_easy".tr(),
                  description: "your_doctors_reports_and_test".tr()),
              const Spacer(),
              CButton(
                iconPath: icons.phoneTwo,
                title: "continue_with_phone_number".tr(),
                onTap: () {
                  Navigator.push(context, AppRoutes.getSignUpWithPhone());
                },
              ),
              12.h.verticalSpace,
              CButton(
                backgroundColor: colors.neutral200,
                textColor: colors.primary900,
                // hasBorderRadius: true,
                iconPath: icons.mail,
                title: "continue_with_email".tr(),
                onTap: () =>
                    Navigator.push(context, AppRoutes.getSignUpPageWithEmail()),
              ),
              27.h.verticalSpace,
            ],
          ),
        ),
      );
    });
  }

  Widget _buildListTile(
      {required String imagePath,
      required String title,
      required String description}) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(imagePath, width: 32.w, height: 32.h),
          title: Text(
            title,
            style: fonts.smallText.copyWith(
                color: colors.primary900,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            description,
            style: fonts.xSmallText.copyWith(
                color: colors.neutral600,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400),
          ));
    });
  }
}
