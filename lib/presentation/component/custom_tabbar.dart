import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

/// Flexible black tab bar
class CustomTabbarBlack extends StatelessWidget {
  const CustomTabbarBlack({
    super.key,
    required this.tabs,
    this.isScrollable = true,
  });

  final List<String> tabs;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return SizedBox(
          height: 50.h,
          width: double.infinity,
          child: TabBar(
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            labelPadding: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.only(right: 12.w),
            indicatorColor: colors.error500,
            isScrollable: isScrollable,
            tabAlignment: isScrollable ? TabAlignment.start : null,
            tabs: tabs
                .map(
                  (title) => Tab(
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
