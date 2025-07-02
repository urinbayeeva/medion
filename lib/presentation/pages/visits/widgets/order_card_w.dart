import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/services/download_service.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/download_button.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';

class OrderCard extends StatelessWidget {
  OrderCard({
    super.key,
    required this.order,
    required this.child,
    required this.colors,
    required this.fonts,
  });

  final CustomColorSet colors;
  final PatientOrder order;
  final FontSet fonts;
  final Widget child;
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isExpanded,
      builder: (context, val, ch) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4.w,
                      children: [
                        Text(order.saleOrderName ?? '', style: fonts.smallTagFirst),
                        DownloadButton(
                          onTap: () async => await MyFunctions.openLink(order.saleOrderCheckPdfUrl ?? ''),
                        ),
                      ],
                    ),
                    PaymentButton(
                      url: order.saleOrderCheckPdfUrl ?? "",
                      status: order.saleOrderPaymentStatus ?? '',
                      colors: colors,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${order.saleOrderPrice ?? 0} so’m',
                      style: fonts.smallTagSecond.copyWith(color: colors.neutral600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: WScaleAnimation(
                        onTap: () {
                          _isExpanded.value = !_isExpanded.value;
                        },
                        child: Icon(
                          _isExpanded.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              if (_isExpanded.value) ...{
                Divider(color: colors.backgroundColor, thickness: 2),
              },

              // Expanded content
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: child,
                crossFadeState: _isExpanded.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key, required this.status, required this.colors, required this.url});

  final String status;
  final CustomColorSet colors;
  final String url;

  @override
  Widget build(BuildContext context) {
    if (status == 'not_paid') {
      return CButton(
        title: "payment".tr(),
        onTap: () async => await MyFunctions.openLink(url),
        width: 88,
        height: 44,
      );
    }
    return CButton(
      title: "recommendations_paid".tr(),
      textColor: colors.blue,
      onTap: () {},
      width: 88,
      height: 44,
      backgroundColor: colors.blue.withValues(alpha: 0.08),
    );
  }
}
