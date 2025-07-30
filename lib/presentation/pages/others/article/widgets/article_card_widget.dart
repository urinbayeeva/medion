import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ArticleCardWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final VoidCallback onTap;

  const ArticleCardWidget({
    super.key,
    this.image,
    this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            width: 164.w,
            height: 220.h,
            decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                  child: _buildImageSection(colors, fonts),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    title ?? "",
                    maxLines: 5,
                    overflow: TextOverflow.visible,
                    style: fonts.xSmallLink.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                4.h.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection(colors, fonts) {
    if (image!.isEmpty) {
      return SvgPicture.asset(
        "assets/icons/picture.svg",
        color: colors.neutral400,
        width: double.infinity,
        height: 164.h,
      );
    } else {
      return CachedImageComponent(
        height: 120.h,
        width: double.infinity,
        imageUrl: image!,
        fit: BoxFit.fill,
      );
    }
  }
}
