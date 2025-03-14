import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/component/nav_bar/lib/persistent_tab_view.dart';
import 'package:medion/presentation/pages/others/career/widgets/career_container.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                  bordered: true,
                  title: "career".tr(),
                  centerTitle: true,
                  isBack: true,
                  trailing: 24.w.horizontalSpace),
              Container(
                color: colors.shade0,
                child: TabBar(
                  indicatorWeight: 3,
                  overlayColor: WidgetStatePropertyAll(colors.shade0),
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  indicatorColor: colors.error500,
                  tabs: [
                    Tab(
                      child: Center(
                        child: Text(
                          "med".tr(),
                          textAlign: TextAlign.center,
                          style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                        ),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text(
                          "office".tr(),
                          textAlign: TextAlign.center,
                          style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  12.h.verticalSpace,
                  CareerContainer(
                    careerTitle: "",
                    careerDescription: "",
                  )
                ],
              ))
            ],
          ),
        ),
      );
    });
  }
}
