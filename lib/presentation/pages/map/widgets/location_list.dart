import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/domain/models/location_model.dart';
import 'package:medion/domain/models/map/map_model.dart';
import 'package:medion/presentation/component/c_icon_button.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class LocationList extends StatelessWidget {
  final List<LocationModel> locations;
  final int? selectedIndex;
  final Function(int) onTap;
  final void Function(double, double) openYandexTaxi;

  const LocationList({
    super.key,
    required this.locations,
    required this.selectedIndex,
    required this.onTap,
    required this.openYandexTaxi,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          color: colors.shade0,
          constraints: BoxConstraints(maxHeight: 0.33.sh, minHeight: 0.1.sh),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: locations.length + 1,
            itemBuilder: (context, index) {
              if (index == locations.length) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0.h),
                  child: CIconButton(
                    title: 'order_taxi'.tr(),
                    iconPath: "assets/images/yandex_png.png",
                    onTap: () {
                      if (locations.isNotEmpty && selectedIndex != null) {
                        final location = locations[selectedIndex!];
                        openYandexTaxi(
                          location.position.latitude,
                          location.position.longitude,
                        );
                      } else if (locations.isNotEmpty && selectedIndex == null) {
                        // If nothing is selected but we have locations, use the first one
                        final location = locations.first;
                        openYandexTaxi(
                          location.position.latitude,
                          location.position.longitude,
                        );
                      }
                    },
                  ),
                );
              }
              final location = locations[index];
              return GestureDetector(
                onTap: () {
                  onTap(index); // Only select the location on tap
                },
                child: Container(
                  height: 64,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? const Color(0xFFF5F5F6) : const Color(0xFFF2F2F3),
                    borderRadius: BorderRadius.circular(8),
                    border: selectedIndex == index ? Border.all(color: colors.primary900, width: 1) : null,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.0.w, top: 6.h, bottom: 6.h),
                        child: CachedNetworkImage(
                          imageUrl: location.icon,
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 1.w,
                        color: colors.neutral300,
                      ),
                      6.w.horizontalSpace,
                      Expanded(child: Text(location.address, style: fonts.smallLink)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
