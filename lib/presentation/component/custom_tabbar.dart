import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

/// Flexible black tab bar
class CustomTabbarBlack extends StatelessWidget {
  const CustomTabbarBlack({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        height: 50.h,
        width: double.infinity,
        child: TabBar(
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          indicatorColor: colors.error500,
          tabs: tabs
              .map((title) => Tab(
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                      ),
                    ),
                  ))
              .toList(),
        ),
      );
    });
  }
}
