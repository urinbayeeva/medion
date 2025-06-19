import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class WhyUsWidget extends StatelessWidget {
  final String text;
  final String? iconUrl;

  const WhyUsWidget({required this.text, this.iconUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconUrl != null)
            Image.network(iconUrl!, width: 40.w, height: 40.h),
          SizedBox(height: 8.h),
          Text(text,
              style: TextStyle(fontSize: 14.sp), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
