import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ItemAboutHealth extends StatelessWidget {
  final String title;
  final String desc;
  final String imagePath;
  final VoidCallback? onTap;
  final double? imageSize;

  const ItemAboutHealth({super.key, this.title = '', this.desc = '', this.imagePath = '', this.onTap, this.imageSize});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.h.verticalSpace,
          AnimationButtonEffect(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(bottom: 24.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: colors.shade0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                    child: imagePath == null
                        ? SvgPicture.asset("assets/icons/picture.svg")
                        : CachedImageComponent(
                            imageUrl: imagePath!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            height: imageSize ?? 172.h,
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.h.verticalSpace,
                        Text(title, style: fonts.regularMain),
                        4.h.verticalSpace,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
