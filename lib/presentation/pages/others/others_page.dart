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
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "more".tr(),
                centerTitle: true,
                isBack: false,
                trailing: 24.w.horizontalSpace,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionHeader("about_the_company".tr(), fonts),
                      _sectionContent(othersData),
                      // _sectionHeader("others".tr(), fonts),
                      // _sectionContentSecond(othersDataSecond),
                      60.h.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
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

  Widget _sectionContent(List<dynamic> data) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: OthersPageComp(data: data),
    );
  }
}

Widget _sectionContentSecond(List<dynamic> data) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: SecondOthersPage(data: data),
  );
}
