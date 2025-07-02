import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.title, this.icons});

  final String title;
  final Widget? icons;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4.h,
      children: [
        if (icons != null) ...{
          icons!,
        } else ...{
          IconSet.create.emptyCalendar.svg(width: 74.w, height: 78.h),
        },
        Center(child: Text(title, style: Style.regularMain()))
      ],
    );
  }
}
