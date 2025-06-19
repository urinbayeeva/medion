import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class StudyInfoCard extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? description;
  final VoidCallback? moreInfoOnTap;
  final VoidCallback? applyOnTap;

  const StudyInfoCard({
    super.key,
    this.imagePath,
    this.title,
    this.description,
    this.moreInfoOnTap,
    this.applyOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: colors.shade0,
            // boxShadow: colors.shadowM,
            borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagePath!.isEmpty) ...[
              SvgPicture.asset("assets/icons/picture.svg", width: double.infinity, height: 172.h)
            ] else ...{
              CachedImageComponent(height: 172.h, width: double.infinity, imageUrl: imagePath!)
            },
            8.h.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? '', style: fonts.regularMain),
                4.h.verticalSpace,
                Text(description ?? '', style: fonts.smallLink.copyWith(color: const Color(0xFF323232))),
                12.h.verticalSpace,
                AnimationButtonEffect(
                  onTap: moreInfoOnTap,
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: colors.neutral200),
                    child: Center(child: Text("get_know".tr(), style: fonts.smallMain)),
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
