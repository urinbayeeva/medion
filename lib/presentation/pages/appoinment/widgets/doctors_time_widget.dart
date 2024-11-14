import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorsTimeWidget extends StatelessWidget {
  const DoctorsTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              children: [
                
              ],
            ),
      );
    });
  }
}
