import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CAppBar(
              title: "wallet".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 26.w.horizontalSpace,
            ),
            24.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 82.h,
                      padding: EdgeInsets.all(12.w),
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: colors.shade0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("balance".tr(), style: fonts.smallLink),
                          12.h.verticalSpace,
                          Row(
                            children: [
                              Text("sum".tr(args: ["50 000"]),
                                  style: fonts.regularMain),
                              8.w.horizontalSpace,
                              icons.question.svg(
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 82.h,
                      padding: EdgeInsets.all(12.w),
                      margin: EdgeInsets.only(left: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: colors.shade0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("cache".tr(), style: fonts.smallLink),
                          12.h.verticalSpace,
                          Row(
                            children: [
                              Text("sum".tr(args: ["1000"]),
                                  style: fonts.regularMain),
                              8.w.horizontalSpace,
                              icons.question.svg(
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
