import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/others/our_activity/component/history_page.dart';
import 'package:medion/presentation/pages/others/our_activity/component/mission.dart';
import 'package:medion/presentation/pages/others/our_activity/component/our_company.dart';
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
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
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
                      CustomTabbarBlack(tabs: ["about_the_company".tr(), "history".tr(), "mission".tr()]),
                      Expanded(
                        child: TabBarView(
                          children: [
                            OurCompany(fonts: fonts),
                            History(fonts: fonts),
                            Mission(fonts: fonts),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
