import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/extensions.dart';

class VisitInfoDetailCard extends StatelessWidget {
  final String? categoryName;
  final String? serviceName;
  final String? doctorName;
  final double? servicePrice;
  final String? visitDate;
  final String? visitLocation;
  final String? visitStatus;
  final String? visitTime;
  final String? visitPaymentByWhom;
  final String? paymentMethod;
  final dynamic data;
  final String? image;

  const VisitInfoDetailCard({
    super.key,
    this.visitStatus,
    this.servicePrice,
    this.categoryName,
    this.serviceName,
    this.doctorName,
    this.visitDate,
    this.visitLocation,
    this.visitPaymentByWhom,
    this.paymentMethod,
    this.data,
    this.image,
    this.visitTime,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.3),
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 8.h, 16, 1.h),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: colors.neutral300)),
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
              color: colors.shade0,
            ),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: colors.shade0,
                border: Border.all(width: 1, color: const Color(0xFFEDEDED)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 12,
                children: [
                  CommonImage(
                    height: 138.h,
                    width: 118.w,
                    imageUrl: image ?? "",
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4.h,
                      children: [
                        _buildOverflowText(categoryName ?? "N/A", fonts, colors, context,
                            size: 13.sp, fontWeight: FontWeight.w600),
                        _buildOverflowText(serviceName ?? "N/A", fonts, colors, context,
                            size: 11.sp, fontWeight: FontWeight.w500),
                        DecoratedBox(
                          decoration: BoxDecoration(color: colors.neutral300),
                          child: SizedBox(width: MediaQuery.of(context).size.width * 0.46.w, height: 1),
                        ),
                        _buildOverflowText(doctorName ?? "N/A", fonts, colors, context,
                            size: 13.sp, fontWeight: FontWeight.w600),
                        _buildOverflowText("$servicePrice UZS", fonts, colors, context,
                            size: 11.sp, fontWeight: FontWeight.w500),
                        DecoratedBox(
                          decoration: BoxDecoration(color: colors.neutral300),
                          child: SizedBox(width: MediaQuery.of(context).size.width * 0.46.w, height: 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4.w,
                          children: [
                            icons.clock.svg(width: 13.w, height: 13.h),
                            _buildOverflowText(
                              visitDate?.toCapitalized() ?? "N/A",
                              fonts,
                              colors,
                              context,
                              size: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4.w,
                          children: [
                            icons.location.svg(width: 13.w, height: 13.h),
                            _buildOverflowText(
                              visitLocation ?? "N/A",
                              maxLine: 2,
                              fonts,
                              colors,
                              context,
                              size: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                  // SingleChildScrollView(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [

                  // _buildOverflowText(serviceName ?? "N/A", fonts, colors, size: 11.sp, fontWeight: FontWeight.w500),
                  // const CDivider(),
                  // _buildOverflowText(doctorName ?? "N/A", fonts, colors, size: 13.sp, fontWeight: FontWeight.w600),
                  // _buildOverflowText("$servicePrice UZS", fonts, colors, size: 11.sp, fontWeight: FontWeight.w500),
                  // const CDivider(),
                  // SizedBox(
                  //   height: 16,
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       icons.clock.svg(width: 12.w, height: 12.h),
                  //       4.w.horizontalSpace,
                  //       Expanded(
                  //         child: _buildOverflowText(
                  //           visitDate?.toCapitalized() ?? "N/A",
                  //           fonts,
                  //           colors,
                  //           size: 13.sp,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 16,
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       icons.location.svg(width: 12.w, height: 12.h),
                  //       4.w.horizontalSpace,
                  //       Expanded(
                  //         child: _buildOverflowText(
                  //           visitLocation ?? "N/A",
                  //           fonts,
                  //           colors,
                  //           size: 11.sp,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const CDivider(),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOverflowText(String text, fonts, colors, BuildContext context,
      {required double size, required FontWeight fontWeight, int maxLine = 1}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Text(
          text,
          maxLines: maxLine,
          overflow: TextOverflow.clip,
          style: fonts.smallMain.copyWith(
            color: colors.primary900,
            fontSize: size,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

///          // 20.h.verticalSpace,
//               // Row(
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   children: [
//               //     Text("${"status".tr()} : ",
//               //         style: fonts.smallLink.copyWith(
//               //             color: colors.primary900,
//               //             fontSize: 15.sp,
//               //             fontWeight: FontWeight.w500)),
//               //     4.w.horizontalSpace,
//               //     Container(
//               //       padding:
//               //           EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
//               //       decoration: BoxDecoration(
//               //           borderRadius: BorderRadius.circular(60.r),
//               //           color: visitStatus! == "paid"
//               //               ? const Color(0xFF0E73F6).withOpacity(0.3)
//               //               : const Color(0xFFFFA41B).withOpacity(0.3)),
//               //       child: Text(
//               //         visitStatus!,
//               //         style: fonts.xSmallMain.copyWith(
//               //             color: visitStatus! == "paid"
//               //                 ? const Color(0xFF0E73F6)
//               //                 : const Color(0xFFFFA41B)),
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               // 10.h.verticalSpace,
//               // Text("pays_the_appoinment".tr(namedArgs: {"name": "N/A"}),
//               //     style: fonts.smallLink.copyWith(
//               //         color: colors.primary900,
//               //         fontSize: 15.sp,
//               //         fontWeight: FontWeight.w500)),
//               // 10.h.verticalSpace,
//               // Row(
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   children: [
//               //     Text(
//               //         "${"payment_method".tr()} : ${paymentMethod == "" ? "N/A" : paymentMethod} ",
//               //         style: fonts.smallLink.copyWith(
//               //             color: colors.primary900,
//               //             fontSize: 15.sp,
//               //             fontWeight: FontWeight.w500)),
//               //     4.w.horizontalSpace,
//               //     Text(paymentMethod!,
//               //         style: fonts.smallLink.copyWith(
//               //             color: colors.primary900,
//               //             fontSize: 15.sp,
//               //             fontWeight: FontWeight.w600)),
//               //   ],
//               // ),
//               // 10.h.verticalSpace,
