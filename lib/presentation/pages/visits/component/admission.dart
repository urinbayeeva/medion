import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/enums/visits_enum.dart';

class AboutAdmission extends StatelessWidget {
  const AboutAdmission({
    super.key,
    required this.colors,
    required this.press,
    required this.status,
    required this.admission,
    required this.paymentType,
    required this.fonts,
  });

  final CustomColorSet colors;
  final VoidCallback press;
  final VisitListEnum status;
  final String admission;
  final String paymentType;
  final FontSet fonts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                color: colors.shade0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 20),
                child: Column(
                  spacing: 12,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${"status".tr()}: ", style: fonts.smallLink),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: status.color.withValues(alpha: 0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                            child: Text(status.title, style: fonts.xSmallText.copyWith(color: status.color)),
                          ),
                        )
                      ],
                    ),
                    if (admission.isNotEmpty) ...{
                      Text("Оплачивает прием: $admission", style: fonts.smallLink),
                    } else ...{
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text("Оплачивает прием:", style: fonts.smallLink),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: colors.error100,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                              child: Text("recommendations_not_paid".tr(), style: fonts.smallLink),
                            ),
                          ),
                        ],
                      )
                    },
                    if (paymentType.isNotEmpty) ...{
                      Text("Способ оплаты: $paymentType", style: fonts.smallLink),
                    }
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              CButton(
                backgroundColor: colors.neutral200,
                textColor: colors.primary900,
                title: "open_invoice".tr(),
                onTap: press,
              ),
              8.h.verticalSpace,
              CButton(
                title: "open_location_clinic".tr(),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MapViewPage(
                  //       latitude: widget.latitude,
                  //       longitude: widget.longitude,
                  //     ),
                  //   ),
                  // );
                },
                iconPath: "assets/icons/geolocation.svg",
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ],
      ),
    );
  }
}
