import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AdressItem extends StatelessWidget {
  final VoidCallback onTap;
  final String address;
  final String url;
  const AdressItem(
      {super.key,
      required this.address,
      required this.url,
      required this.onTap});

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
              borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r)),
                  child: Image.asset(icons.medionIcon)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                child: Text(address,
                    overflow: TextOverflow.ellipsis,
                    style: fonts.smallLink.copyWith(
                        fontSize: 13.sp, fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ),
      );
    });
  }
}
