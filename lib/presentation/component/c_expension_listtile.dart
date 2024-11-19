import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CustomExpansionListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;

  const CustomExpansionListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.only(bottom: 8.h),
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            collapsedBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              title,
              style: fonts.smallSemLink.copyWith(
                  color: colors.primary900,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp),
            ),
            subtitle: subtitle != null ? Text(subtitle!) : null,
            children: children,
          ),
        ),
      );
    });
  }
}
