import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool crop;
  final VoidCallback onTap;
  final bool inner;

  final String imagePath;

  const NewsItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.crop,
    required this.onTap,
    this.inner = false,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(right: 15.5.w),
            width: 164.w,
            decoration: BoxDecoration(
              boxShadow: colors.shadowMM,
              borderRadius: BorderRadius.circular(8.r),
              color: colors.shade0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    height: 100.h,
                    width: double.infinity,
                  ),
                ),
                8.h.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: fonts.xSmallLink.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff00040A),
                    ),
                  ),
                ),
                8.h.verticalSpace,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      subtitle,
                      maxLines: crop ? 3 : null,
                      style: fonts.xxSmallText.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff66686C),
                      ),
                    ),
                  ),
                ),
                if (inner || true) ...[
                  10.h.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: CButton(
                      backgroundColor: colors.neutral200,
                      textColor: colors.primary900,
                      width: double.infinity,
                      title: "read_in_detail".tr(),
                      onTap: onTap,
                      height: 34.h,
                    ),
                  )
                ],
                8.h.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
