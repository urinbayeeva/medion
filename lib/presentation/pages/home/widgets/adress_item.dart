import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AdressItem extends StatelessWidget {
  final VoidCallback onTap;
  final String address;
  final String url;
  const AdressItem({
    super.key,
    required this.address,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 8.h),
          width: double.infinity,
          height: 64.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: colors.shade0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 64.h,
                width: 64.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r),
                  ),
                  color: colors.shade0,
                ),
                child: Center(
                  child: Image.network(
                    url,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(icons.medionIcon),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: fonts.smallLink.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
