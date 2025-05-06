import 'package:cached_network_image/cached_network_image.dart';
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
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: colors.shade0,
        height: 322,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  final location = locations[index];
                  return GestureDetector(
                    onTap: () {
                      onTap(index); // Only select the location on tap
                    },
                    child: Container(
                      height: 64,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? const Color(0xFFF5F5F6)
                            : const Color(0xFFF2F2F3),
                        borderRadius: BorderRadius.circular(8),
                        border: selectedIndex == index
                            ? Border.all(
                                color: const Color(0xFFE6E6E6), width: 1)
                            : null,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          CachedNetworkImage(
                            imageUrl: location.icon,
                            width: 40.w,
                            height: 40.h,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                              child: Text(location.address,
                                  style: fonts.smallLink)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            CIconButton(
              title: 'Заказать такси',
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
            const SizedBox(height: 20),
          ],
        ),
      );
    });
  }
}
