import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class UserInfoWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const UserInfoWidget(
      {super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: fonts.regularSemLink
                    .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600)),
            12.h.verticalSpace,
            ...children
          ],
        ),
      );
    });
  }
}
