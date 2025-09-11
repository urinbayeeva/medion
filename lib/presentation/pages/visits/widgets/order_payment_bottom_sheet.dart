import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/format_currency.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key, required this.payments, required this.order});

  final List<OrderPayment> payments;
  final PatientOrder order;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, ctrl) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                12.h.verticalSpace,

                /// Drag indicator
                Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SizedBox(width: 40.w, height: 4.h),
                  ),
                ),
                12.h.verticalSpace,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  itemCount: payments.length,
                  separatorBuilder: (_, __) => Divider(color: colors.neutral200),
                  itemBuilder: (context, i) {
                    final payment = payments[i];
                    final type = MyFunctions.paymentType(payment.journalName ?? "");
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: SizedBox(
                        width: 1.sw,
                        height: 100.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (i != 0) 10.h.verticalSpace,
                            Row(
                              spacing: 10.w,
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    image: DecorationImage(image: AssetImage(type.icon)),
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        type.title.tr(),
                                        style: fonts.regularMain.copyWith(fontSize: 16.sp),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        spacing: 4.w,
                                        children: [
                                          if (payment.isDone != null && payment.isDone!) ...{
                                            icons.doneCircle.svg(
                                              height: 16.h,
                                              width: 16.w,
                                              color: colors.success500,
                                            ),
                                            Text(
                                              "recommendations_completed".tr(),
                                              style: fonts.xxSmallTagFirst.copyWith(
                                                fontSize: 12.sp,
                                                color: colors.success500,
                                              ),
                                            ),
                                          } else ...{
                                            icons.cancelCircle.svg(
                                              height: 16.h,
                                              width: 16.w,
                                              color: colors.error500,
                                            ),
                                            Text(
                                              "un_successful".tr(),
                                              style: fonts.xxSmallTagFirst.copyWith(
                                                fontSize: 12.sp,
                                                color: colors.error500,
                                              ),
                                            ),
                                          },
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  spacing: 8.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${"pay_price".tr()}: ",
                                      style: fonts.xSmallLink.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xff80868B),
                                      ),
                                    ),
                                    Text(
                                      "sum".tr(
                                        namedArgs: {
                                          "amount": formatNumber(int.tryParse("${payment.currency}") ?? 0),
                                        },
                                      ),
                                      style: fonts.xxSmallTagFirst.copyWith(fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: 8.h,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "date_and_time".tr(),
                                      style: fonts.xSmallLink.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xff80868B),
                                      ),
                                    ),
                                    Text(
                                      MyFunctions.checkFormatDate(payment.paymentDate ?? ''),
                                      style: fonts.xxSmallTagFirst.copyWith(fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                12.h.verticalSpace,
                Center(
                  child: SizedBox(
                    height: 200.h,
                    width: 200.h,
                    child: QrImageView(
                      data:
                          "${(order.saleOrderCheckPdfUrl != null && order.saleOrderCheckPdfUrl!.isNotEmpty) ? order.saleOrderCheckPdfUrl : "https://medion.uz"}",
                      version: QrVersions.auto,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                      backgroundColor: colors.shade0,
                      padding: const EdgeInsets.all(20),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Colors.black,
                      ),
                      eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
                      embeddedImageStyle: QrEmbeddedImageStyle(size: Size(42.h, 42.w)),
                    ),
                  ),
                ),

                if (order.fiscalId != null && order.fiscalId!.isNotEmpty) ...{
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4.h,
                      children: [
                        Text(
                          "${"fiscal_number".tr()}:",
                          style: fonts.xxSmallText.copyWith(color: const Color(0xff888789)),
                        ),
                        Text(
                          "${order.fiscalUrlCheck}",
                          style: fonts.xxSmallTagFirst.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                },
                12.h.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
