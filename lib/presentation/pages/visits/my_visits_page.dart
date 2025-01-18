import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MyVisitsPage extends StatefulWidget {
  const MyVisitsPage({super.key});

  @override
  State<MyVisitsPage> createState() => _MyVisitsPageState();
}

class _MyVisitsPageState extends State<MyVisitsPage> {
  bool isOnline = true;
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
                padding: EdgeInsets.zero,
                bottom: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomToggle(
                          iconList: [
                            Text(
                              'online'.tr(),
                              style: fonts.xSmallLink.copyWith(
                                color: isOnline
                                    ? colors.shade0
                                    : colors.primary900,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'offline'.tr(),
                              style: fonts.xSmallLink.copyWith(
                                color: !isOnline
                                    ? colors.shade0
                                    : colors.primary900,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              isOnline = value;
                            });
                          },
                          current: isOnline,
                          values: const [true, false],
                        ),
                      ),
                    ),
                  ],
                ),
                bordered: true,
                isBack: false,
                title: "my_visits".tr(),
                centerTitle: true,
                trailing: icons.calendar.svg(width: 24.w, height: 24.h)),
            8.h.verticalSpace,
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              icons.bigCalendar.svg(width: 72.w, height: 75.h),
                              12.h.verticalSpace,
                              Text(
                                "you_have_no_visits".tr(),
                                style: fonts.smallLink.copyWith(
                                  color: colors.neutral600,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
