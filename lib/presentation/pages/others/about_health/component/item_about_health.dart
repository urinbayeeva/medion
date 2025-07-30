import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_enum.dart';

class ItemAboutHealth extends StatelessWidget {
  final String title;
  final ContentEnum type;
  final String desc;
  final String time;
  final String imagePath;
  final VoidCallback? onTap;
  final double? imageSize;
  final int descMaxLine;

  const ItemAboutHealth({
    super.key,
    this.descMaxLine = 1,
    this.title = '',
    this.desc = '',
    this.imagePath = '',
    this.onTap,
    this.imageSize,
    required this.type,
    this.time = '',
  });

  String _formatTimeSafely(String? time) {
    if (time == null || time.isEmpty) return 'Nomaʼlum vaqt';

    try {
      final dateTime = DateTime.parse(time);
      return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    } catch (e) {
      return 'Noto‘g‘ri vaqt';
    }
  }

  @override
  Widget build(BuildContext context) {
    log("time: $time");
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
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
                    if (type.isHealth) ...{
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 6.h),
                        child: Text(
                          _formatTimeSafely(time),
                          style: fonts.xSmallMain.copyWith(color: const Color(0xff808284)),
                        ),
                      ),
                    },
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (type.isHealth) ...{
                            4.h.verticalSpace,
                          } else ...{
                            12.h.verticalSpace,
                          },
                          Text(title, style: fonts.regularMain),
                        ],
                      ),
                    ),
                    if (!type.isEquipment) ...{
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              desc,
                              maxLines: descMaxLine,
                              overflow: TextOverflow.ellipsis,
                              style: fonts.xSmallMain,
                            ),
                            4.h.verticalSpace,
                          ],
                        ),
                      )
                    } else ...{
                      4.h.verticalSpace,
                    }
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
