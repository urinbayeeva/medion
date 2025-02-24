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
  const ArticleCardWidget(
      {super.key,
      this.image,
      this.title,
      this.description,
      this.link,
      this.date, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
              color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r)),
                  child: _buildImageSection(colors, fonts)),
              4.h.verticalSpace,
              Text(title!, style: fonts.xSmallLink),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildImageSection(colors, fonts) {
    return image!.isEmpty
        ? SvgPicture.asset(
            "assets/icons/picture.svg",
            color: colors.neutral400,
            width: double.infinity,
            height: 250,
          )
        : CachedImageComponent(
            height: 164.h,
            width: double.infinity,
            imageUrl: image!,
            fit: BoxFit.cover,
          );
  }
}
