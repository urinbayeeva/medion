import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_icon_button.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/education/education_page.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MapPolylinesWidget extends StatefulWidget {
  final String name;
  final String workingHours;
  final String image;
  final double distanceKm;
  final String travelTime;
  final VoidCallback yandexTap;

  const MapPolylinesWidget({
    super.key,
    required this.name,
    required this.workingHours,
    required this.image,
    required this.distanceKm,
    required this.travelTime,
    required this.yandexTap,
  });

  @override
  State<MapPolylinesWidget> createState() => _MapPolylinesWidgetState();
}

class _MapPolylinesWidgetState extends State<MapPolylinesWidget> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (widget.image.isNotEmpty) ...{
                      CommonImage(
                        width: 80.w,
                        height: 60.h,
                        imageUrl: widget.image,
                        fit: BoxFit.contain,
                      ),
                    } else ...{
                      Container(
                        width: 80.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          "assets/images/medion_only.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    },
                    SizedBox(width: 12.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: fonts.regularMain),
                          const SizedBox(height: 4),
                          Text(
                            widget.workingHours,
                            style: fonts.smallLink.copyWith(color: colors.neutral600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                12.h.verticalSpace,
                CIconButton(
                  onTap: widget.yandexTap,
                  title: "order_taxi".tr(),
                  iconPath: "assets/images/yandex_png.png",
                ),
                12.h.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
