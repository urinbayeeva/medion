import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/download_button.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
import 'package:medion/utils/format_currency.dart';

class OrderCardItem extends StatelessWidget {
  const OrderCardItem({
    super.key,
    required this.invoice,
    required this.order,
    required this.paymentsTab,
    required this.servicesTab,
    required this.paymentAvailable,
  });

  final String invoice;
  final PatientOrder order;
  final VoidCallback paymentsTab;
  final VoidCallback servicesTab;
  final bool paymentAvailable;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controllers) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.neutral200,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                ),
                child: SizedBox(
                  width: 1.sw,
                  height: 65.h,
                  child: Center(
                    child: Column(
                      spacing: 6.h,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "service_price".tr(),
                          style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff80868B)),
                        ),
                        Text(
                          "sum".tr(namedArgs: {"amount": formatNumber(order.saleOrderPrice)}),
                          style: fonts.regularSemLink,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              12.h.verticalSpace,
              if (paymentAvailable) ...{
                rowItems(
                  title: "recommendations_price".tr(),
                  trailing: WScaleAnimation(
                    onTap: paymentsTab,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4.w,
                      children: [
                        Text(
                          "${"sum".tr(namedArgs: {"amount": formatNumber(order.saleOrderPrice)})} ",
                          style: fonts.xSmallLink.copyWith(fontSize: 12, color: colors.error500),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: colors.error500,
                          size: 12.h,
                        )
                      ],
                    ),
                  ),
                  fonts: fonts,
                ),
              },
              rowItems(
                title: "Invoice Id:",
                trailing: Row(
                  spacing: 4.w,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      invoice,
                      style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff80868B)),
                    ),
                    DownloadButton(onTap: () {}),
                  ],
                ),
                fonts: fonts,
              ),
              rowItems(
                title: "clinic_address".tr(),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          order.companyAddress ?? "--",
                          style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff80868B)),
                        ),
                        Text(
                          order.companyAddress ?? "--",
                          style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff80868B)),
                        ),
                      ],
                    ),
                    CommonImage(
                      imageUrl: order.companyLogo ?? '',
                      fit: BoxFit.contain,
                      height: 23.h,
                      width: 27.w,
                    )
                  ],
                ),
                fonts: fonts,
              ),
              rowItems(
                title: "services".tr(),
                trailing: WScaleAnimation(
                  onTap: servicesTab,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4.w,
                    children: [
                      Text(
                        "${order.saleOrderLines.length} ${"services".tr()} ",
                        style: fonts.xSmallLink.copyWith(fontSize: 12, color: colors.error500),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: colors.error500,
                        size: 12.h,
                      )
                    ],
                  ),
                ),
                fonts: fonts,
              ),
              rowItems(
                title: "status_type".tr(namedArgs: {"type": "account".tr()}),
                trailing: itemStatus(
                  status: paymentAvailable,
                  colors: colors,
                  fonts: fonts,
                ),
                fonts: fonts,
              ),
              if (paymentAvailable == false) ...{
                10.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: CButton(
                    height: 42.h,
                    onTap: () {
                      if (order.fiscalUrlCheck != null && order.fiscalUrlCheck!.isNotEmpty) {
                        MyFunctions.openLink(order.fiscalUrlCheck!);
                      } else {
                        context.showPopUp(
                          status: PopUpStatus.warning,
                          message: "no_data".tr(),
                          fonts: fonts,
                          colors: colors,
                          context: context,
                        );
                      }
                    },
                    title: "pay".tr(),
                  ),
                ),
              },
              10.h.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  Widget itemStatus({
    required bool status,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    const green = Color(0xff1CB57A);
    const red = Color(0xffD90506);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: (status ? green : red).withValues(alpha: 0.1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: Center(
          child: Text(
            status ? "paid".tr() : "not_paid".tr(),
            style: fonts.xSmallLink.copyWith(color: status ? green : red),
          ),
        ),
      ),
    );
  }

  Widget rowItems({required String title, required Widget trailing, required FontSet fonts}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title${(title.contains(":") ? "" : ":")} ",
            style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff80868B)),
          ),
          trailing,
        ],
      ),
    );
  }
}
