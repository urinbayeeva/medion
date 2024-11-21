import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                      radius: 60.r, backgroundColor: colors.neutral400),
                  Positioned(
                      bottom: -20,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: colors.error500,
                        child: icons.edit.svg(width: 16.w, height: 16.h),
                      )),
                ],
              ),
              24.h.verticalSpace,
              Text("User Name",
                  style: fonts.mediumText.copyWith(fontSize: 16.sp)),
              24.h.verticalSpace,
              const NavListWidget(),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    "Version: Test",
                    style: fonts.regularLink.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: colors.primary900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
