import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/format_currency.dart';

class ServiceSelectionModal extends StatelessWidget {
  final List<dynamic> selectedServices;
  final int chose;
  final Function(Service)?
      onRemoveService; // Changed to accept specific service
  final VoidCallback? onRemoveAllServices;

  const ServiceSelectionModal({
    super.key,
    required this.selectedServices,
    required this.chose,
    this.onRemoveService,
    this.onRemoveAllServices,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: colors.shadowMMMM,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.r), topLeft: Radius.circular(8.r))),
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "selected_services".tr(),
                  style: fonts.headlineMain.copyWith(fontSize: 16.sp),
                ),
                if (onRemoveAllServices != null)
                  TextButton(
                    onPressed: onRemoveAllServices,
                    child: Text(
                      "remove_all".tr(),
                      style: fonts.xSmallLink.copyWith(color: colors.error500),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: selectedServices.length,
              itemBuilder: (context, index) {
                final service = selectedServices[index] as Service;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.name ?? "",
                            style: fonts.xSmallLink.copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Test Description",
                            style: fonts.xSmallLink.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF66686C)),
                          ),
                          Text(
                            "sum".tr(namedArgs: {
                              "amount": formatNumber(
                                service.priceUzs,
                              )
                            }),
                            style: fonts.xSmallLink.copyWith(
                              color: colors.primary900,
                            ),
                          ),
                          if (index < selectedServices.length - 1)
                            const CDivider(),
                        ],
                      ),
                    ),
                    AnimationButtonEffect(
                      onTap: () {
                        if (onRemoveService != null) {
                          onRemoveService!(service);
                        }
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/trash.png",
                        width: 28.w,
                        height: 28.h,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
