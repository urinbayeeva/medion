import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/download_button.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
import 'package:medion/utils/format_currency.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BuildOrderList extends StatelessWidget {
  const BuildOrderList({super.key, required this.state, required this.onRefresh, required this.refreshController});

  final AuthState state;
  final VoidCallback onRefresh;
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    if (state.fetchPatientVisitStatus.isInitial || state.fetchPatientVisitStatus.isInProgress) {
      return const Center(child: CircularProgressIndicator(color: Style.error500));
    }
    if (state.moves.isEmpty) {
      return EmptyState(
        title: 'no_result_found'.tr(),
        body: Center(
          child: Column(
            children: [
              Text(
                'no_result_found'.tr(),
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff00040A),
                ),
              ),
              Text(
                "make_an_appoinment_doctor_online".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff66686C),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return SmartRefresher(
          onRefresh: onRefresh,
          controller: refreshController,
          enablePullDown: true,
          header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
          child: ListView.builder(
            itemCount: state.moves.length,
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) {
              final PatientOrder order = state.moves[index];
              return OrderCardItem(
                paymentAvailable: (order.saleOrderPaymentStatus ?? '').contains("not"),
                order: order,
                invoice: order.saleOrderName ?? '',
                paymentsTab: () => paymentsTab(order: order, context: context, colors: colors, fonts: fonts),
                servicesTab: () => serviceTab(order: order, context: context, colors: colors, fonts: fonts),
              );

              // return OrderCard(
              //   colors: colors,
              //   order: order,
              //   fonts: fonts,
              //   child: ListView.separated(
              //     padding: EdgeInsets.zero,
              //     separatorBuilder: (context, count) {
              //       return const Divider();
              //     },
              //     itemCount: order.saleOrderLines.length,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (ctx, i) {
              //       final card = order.saleOrderLines[i];
              //       return DynamicVisitsCard(
              //         doctorName: card.doctorFullName ?? '',
              //         doctorJob: card.service ?? '',
              //         serviceName: service,
              //         visitTime: "${card.createDate}",
              //         paymentStatus: order.saleOrderPaymentStatus == 'paid',
              //         listEnum: MyFunctions.getVisitStatus("ordered"),
              //         radius: BorderRadius.vertical(
              //           bottom: (i == order.saleOrderLines.length - 1) ? const Radius.circular(12) : Radius.zero,
              //         ),
              //         padding: EdgeInsets.zero,
              //         fonts: fonts,
              //         colors: colors,
              //       );
              //     },
              //   ),
              // );
            },
          ),
        );
      },
    );
  }

  void serviceTab({
    required PatientOrder order,
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      constraints: BoxConstraints(maxHeight: 0.7.sh),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ThemeWrapper(
          builder: (context, colors, fonts, icons, ctrl) {
            final list = order.saleOrderLines;
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
                      itemCount: list.length,
                      separatorBuilder: (_, __) => Divider(color: colors.neutral200),
                      itemBuilder: (context, i) {
                        final sale = list[i];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (i != 0) 10.h.verticalSpace,
                              Text(
                                sale.serviceType ?? "—",
                                style: fonts.xSmallMain.copyWith(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                List.generate(120, (i) => "- ").join(""),
                                maxLines: 1,
                                style: fonts.xSmallMain.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffbdbbbb),
                                ),
                              ),
                              8.h.verticalSpace,

                              /// Service ID
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Service ID:", style: fonts.xSmallMain),
                                  Text(
                                    "${sale.serviceId ?? "—"}",
                                    style: fonts.xSmallMain.copyWith(),
                                  ),
                                ],
                              ),
                              8.h.verticalSpace,

                              /// Doctor
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Доктор:", style: fonts.xSmallMain),
                                  Row(
                                    children: [
                                      CommonImage(
                                        imageUrl: "imageUrl",
                                        height: 32.h,
                                        width: 32.w,
                                      ),
                                      8.w.horizontalSpace,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            sale.doctor ?? "—",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: fonts.xSmallMain.copyWith(fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            sale.doctorJob ?? "—",
                                            overflow: TextOverflow.ellipsis,
                                            style: fonts.xSmallMain,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              8.h.verticalSpace,

                              /// Time
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Время обслуживания:", style: fonts.xSmallMain),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                        decoration: BoxDecoration(
                                          color: colors.neutral200,
                                          borderRadius: BorderRadius.circular(6.r),
                                        ),
                                        child: Text(
                                          "${sale.date ?? ''} - ${sale.date ?? ''}",
                                          style: fonts.xSmallMain.copyWith(fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      4.h.verticalSpace,
                                      Text(sale.date ?? "", style: fonts.xSmallMain),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    40.h.verticalSpace,
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void paymentsTab({
    required PatientOrder order,
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    final paymentList = [...?order.payments];
    if (paymentList.isEmpty) {
      context.showPopUp(
        status: PopUpStatus.warning,
        message: "no_data".tr(),
        fonts: fonts,
        colors: colors,
        context: context,
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: 0.9.sh),
      builder: (context) {
        return ThemeWrapper(
          builder: (context, colors, fonts, icons, ctrl) {
            final list = <OrderPayment>[...?order.payments];
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
                      itemCount: list.length,
                      separatorBuilder: (_, __) => Divider(color: colors.neutral200),
                      itemBuilder: (context, i) {
                        final payment = list[i];
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
                                            type.title.tr() ?? ' - ',
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
                                      spacing: 4.h,
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
                                      spacing: 4.h,
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
      },
    );
  }
}

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
