import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ArticleCardWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  final String? link;
  final String? date;
  final VoidCallback onTap;

  const ArticleCardWidget({
    super.key,
    this.image,
    this.title,
    this.description,
    this.link,
    this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                  child: _buildImageSection(colors, fonts),
                ),
                4.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: fonts.xSmallLink.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                4.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: fonts.xSmallLink.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: colors.neutral600,
                    ),
                  ),
                ),
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
        height: 250,
      );
    } else {
      return CachedImageComponent(
        height: 164.h,
        width: double.infinity,
        imageUrl: image!,
        fit: BoxFit.cover,
      );
    }
  }
}
