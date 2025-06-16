import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CContainer extends StatelessWidget {
  final String? text;

  const CContainer({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
          child: SingleChildScrollView(
            child: Text(
              text ?? "",
              style: fonts.xSmallText.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
              overflow: TextOverflow.visible,
              softWrap: true,
              maxLines: null,
            ),
          ),
        );
      },
    );
  }
}
