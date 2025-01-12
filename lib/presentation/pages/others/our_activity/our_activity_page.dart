import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/component/nav_bar/lib/persistent_tab_view.dart';
import 'package:medion/presentation/pages/others/our_activity/component/pattern_background.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class OurActivityPage extends StatefulWidget {
  const OurActivityPage({super.key});

  @override
  State<OurActivityPage> createState() => _OurActivityPageState();
}

class _OurActivityPageState extends State<OurActivityPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                bordered: true,
                title: "our_activities".tr(),
                isBack: true,
                centerTitle: true,
                trailing: 24.w.horizontalSpace,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PatternBackground(patternTitle: "medion_activity".tr()),
                    const CDivider(padding: false),
                    CustomTabbarBlack(
                      leftTab: "about_the_company".tr(),
                      rightTab: "license".tr(),
                      middleTab: "history".tr(),
                      nextMiddle: "mission".tr(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              24.h.verticalSpace,
                              Text("about_the_company".tr(),
                                  style: fonts.regularMain),
                              8.h.verticalSpace,
                              CContainer(
                                text: "about_medion".tr(),
                              ),
                              24.h.verticalSpace,
                              Text("history".tr(), style: fonts.regularMain),
                              8.h.verticalSpace,
                              CContainer(
                                text: "about_medion".tr(),
                              ),
                              24.h.verticalSpace,
                              Text("mission".tr(), style: fonts.regularMain),
                              8.h.verticalSpace,
                              CContainer(
                                text: "about_medion".tr(),
                              ),
                              24.h.verticalSpace,
                              Text("license".tr(), style: fonts.regularMain),
                              8.h.verticalSpace,
                              CContainer(
                                text: "about_medion".tr(),
                              ),
                              24.h.verticalSpace
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
