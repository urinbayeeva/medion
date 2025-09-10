import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class UserInfoWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final FontSet fonts;

  const UserInfoWidget({
    super.key,
    required this.title,
    required this.children,
    required this.fonts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Style.shade0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title, style: fonts.regularSemLink), 12.h.verticalSpace, ...children],
      ),
    );
  }
}
