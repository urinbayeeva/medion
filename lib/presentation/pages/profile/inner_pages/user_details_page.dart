import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medion/infrastructure/services/image_service/image_service.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/profile/widget/user_info_input.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "Личные данные",
              isBack: true,
              centerTitle: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    24.h.verticalSpace,
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                            radius: 60.r, backgroundColor: colors.neutral400),
                        Positioned(
                          bottom: -20,
                          left: 10,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              // ImageService.showPicker(context);
                            },
                            child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: colors.error500,
                              child: icons.edit.svg(width: 16.w, height: 16.h),
                            ),
                          ),
                        ),
                      ],
                    ),
                    30.h.verticalSpace,
                    const UserInfoInput(),
                    80.h.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
