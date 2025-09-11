import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/pages/visits/widgets/order_card_w.dart';
import 'package:medion/presentation/pages/visits/widgets/order_payment_bottom_sheet.dart';
import 'package:medion/presentation/pages/visits/widgets/order_services_bottom_sheet.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BuildOrderList extends StatelessWidget {
  const BuildOrderList({super.key, required this.state, required this.onRefresh, required this.refreshController});

  final AuthState state;
  final VoidCallback onRefresh;
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    if (state.fetchPatientVisitStatus.isInitial || state.fetchPatientVisitStatus.isInProgress) {
      return ShimmerView(
        child: ListView.separated(
          itemCount: 10,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          separatorBuilder: (context, index) => 10.h.verticalSpace,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(top: index == 0 ? 10.h : 0),
            child: ShimmerContainer(width: 1.sw, height: 100.h),
          ),
        ),
      );
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
              bool available = "not_paid" != order.saleOrderPaymentStatus;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderCardItem(
                    paymentAvailable: available,
                    order: order,
                    invoice: order.saleOrderName ?? '',
                    paymentsTab: () => paymentsTab(order: order, context: context, colors: colors, fonts: fonts),
                    servicesTab: () => serviceTab(order: order, context: context, colors: colors, fonts: fonts),
                  ),
                ],
              );
            },
          ),
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
        return PaymentBottomSheet(
          payments: <OrderPayment>[...?order.payments],
          order: order,
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
        return ServiceBottomSheet(
          order: order,
          services: [...order.saleOrderLines],
        );
      },
    );
  }
}
