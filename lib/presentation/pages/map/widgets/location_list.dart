import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/location_model.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_icon_button.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;
  final int? selectedIndex;
  final Function(int) onTap;
  final void Function(double, double, double, double) openYandexTaxi;

  const LocationList({
    super.key,
    required this.locations,
    required this.selectedIndex,
    required this.onTap,
    required this.openYandexTaxi,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: colors.shade0,
        height: 322.h,
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return GestureDetector(
                  onTap: () {
                    onTap(index); // Move to location
                    // Trigger openYandexTaxi callback with location's lat/lon
                    final selectedLocation = locations[index];
                    openYandexTaxi(
                      41.327405, // Example starting lat/lon
                      69.184021, // Example starting lat/lon
                      selectedLocation.latitude,
                      selectedLocation.longitude,
                    );
                  },
                  child: Container(
                    height: 64.h,
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: selectedIndex != index
                          ? const Color(0xFFF2F2F3)
                          : const Color(0xFFF5F5F6),
                      borderRadius: BorderRadius.circular(8.r),
                      border: selectedIndex == index
                          ? Border.all(color: const Color(0xFFE6E6E6), width: 1)
                          : null,
                    ),
                    child: Row(
                      children: [
                        10.w.horizontalSpace,
                        SvgPicture.asset(location.image),
                        8.w.horizontalSpace,
                        Divider(),
                        SizedBox(width: 12.w),
                        Text(location.name, style: fonts.smallLink),
                      ],
                    ),
                  ),
                );
              },
            ),
            8.h.verticalSpace,
            CIconButton(
                title: 'Заказать такси',
                iconPath: "assets/images/yandex_png.png",
                onTap: () {
                  // Trigger taxi ordering with hardcoded coordinates for demonstration
                  openYandexTaxi(
                    41.327405, // Example starting coordinates
                    69.184021, // Example starting coordinates
                    41.326456, // Example ending coordinates
                    69.249044, // Example ending coordinates
                  );
                }),
            20.h.verticalSpace,
          ],
        ),
      );
    });
  }
}
