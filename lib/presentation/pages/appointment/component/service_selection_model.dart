import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ServiceSelectionModal extends StatelessWidget {
  final List<dynamic> selectedServices;
  final VoidCallback onRemoveService;
  final int chose;

  const ServiceSelectionModal({
    super.key,
    required this.selectedServices,
    required this.onRemoveService,
    required this.chose,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "count_services_selected".tr(
                namedArgs: {"count": "$chose"},
              ),
              style: fonts.smallSemLink.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            8.h.verticalSpace,
            ...selectedServices.map((service) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.name,
                            style: fonts.smallLink.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            service.description ?? 'no_description',
                            style: fonts.smallLink.copyWith(
                                fontSize: 12.sp, color: colors.neutral600),
                          ),
                          Text(
                            "${service.priceUzs} UZS",
                            style: fonts.smallLink.copyWith(
                                color: colors.primary900,
                                fontWeight: FontWeight.bold),
                          ),
                          const CDivider()
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () => onRemoveService(),
                        icon: Image.asset(
                          "assets/images/trash.png",
                          width: 28.w,
                          height: 28.h,
                        )),
                  ],
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
