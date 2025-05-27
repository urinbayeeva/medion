import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/custom_button.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class PaymentHistoryWidget extends StatefulWidget {
  final String? moveId;
  final String? createDate;
  final double? debit;
  final double? credit;
  final double? displayAmount;
  final String? createUser;
  const PaymentHistoryWidget(
      {super.key,
      this.moveId,
      this.createDate,
      this.debit,
      this.credit,
      this.displayAmount,
      this.createUser});

  @override
  State<PaymentHistoryWidget> createState() => _PaymentHistoryWidgetState();
}

class _PaymentHistoryWidgetState extends State<PaymentHistoryWidget> {
  String _formatDate(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return "";
    try {
      final dateTime = DateTime.parse(rawDate);
      return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
    } catch (e) {
      return rawDate;
    }
  }

  String _formatNumber(String numberString) {
    final number = double.tryParse(numberString) ?? 0;
    return number
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.moveId ?? "",
              style: fonts.regularLink
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            const CDivider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: colors.neutral200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/plus_payment.svg",
                    color: colors.error500.withOpacity(0.7),
                    width: 18.w,
                    height: 18.h,
                  ),
                ),
              ),
              title: Text(
                widget.createUser ?? "",
                style: fonts.regularLink.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                _formatDate(widget.createDate),
                style: fonts.regularLink.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.neutral600,
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "sum".tr(namedArgs: {
                      "amount": _formatNumber(widget.displayAmount.toString())
                    }),
                    style: fonts.regularLink.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.createUser ?? "",
                    style: fonts.regularLink.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: colors.neutral600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
