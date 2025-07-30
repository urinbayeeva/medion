import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/component/others_page_comp.dart';
import 'package:medion/domain/sources/others_data.dart';
import 'package:medion/presentation/pages/others/component/second_other_page.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class OthersPage extends StatelessWidget {
  const OthersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            title: Text("more".tr(), style: fonts.regularMain),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 12.h),
                  child: Text("about_the_company".tr(), style: fonts.regularSemLink),
                ),
                // _sectionContent(othersData),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.h, 0, 12.h),
                  child: OthersPageComp(data: first),
                ),
                _sectionHeader("others".tr(), fonts),
                _sectionContentSecond(second),
                60.h.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sectionHeader(title, fonts) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 12.h),
      child: Text(title, style: fonts.regularSemLink),
    );
  }
}

Widget _sectionContentSecond(List<OthersPageData> data) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: SecondOthersPage(data: data),
  );
}
