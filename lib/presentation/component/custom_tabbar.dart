import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

/// black tab bar
class CustomTabbarBlack extends StatelessWidget {
  const CustomTabbarBlack({
    super.key,
    required this.leftTab,
    required this.rightTab,
    required this.middleTab,
    required this.nextMiddle,
  });

  final String leftTab;
  final String rightTab;
  final String middleTab;
  final String nextMiddle;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: TabBar(
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          indicatorColor: colors.error500,
          tabs: [
            Tab(
              child: Center(
                child: Text(
                  leftTab,
                  textAlign: TextAlign.center,
                  style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text(
                  middleTab,
                  textAlign: TextAlign.center,
                  style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text(
                  nextMiddle,
                  textAlign: TextAlign.center,
                  style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text(
                  rightTab,
                  textAlign: TextAlign.center,
                  style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
