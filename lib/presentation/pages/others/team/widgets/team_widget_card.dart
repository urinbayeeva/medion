import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class TeamWidgetCard extends StatelessWidget {
  final String? image;
  final String? name;
  final String? title;
  const TeamWidgetCard({super.key, this.image, this.name, this.title});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8.r),
        ),
      );
    });
  }
}
