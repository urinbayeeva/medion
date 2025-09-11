import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/extensions.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.serviceName,
    required this.procedure,
    required this.doctorName,
    required this.price,
    required this.appointmentTime,
    required this.location,
    required this.imagePath,
    required this.onCancel,
    this.hasImage = true,
    this.noCancel = false,
  });

  final String serviceName;
  final String procedure;
  final String doctorName;
  final String price;
  final String appointmentTime;
  final String location;
  final String imagePath;
  final VoidCallback onCancel;
  final bool? hasImage;
  final bool noCancel;

  String _formatNumber(String numberString) {
    final number = (double.tryParse(numberString) ?? 0).toStringAsFixed(0);
    final result = number.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ').trim();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime appointmentDateTime = DateTime.tryParse(appointmentTime) ?? DateTime.now();

    final dateFormatted = DateFormat('EEEE, d MMMM', 'ru').format(appointmentDateTime);
    final timeFormatted = DateFormat('HH:mm', 'ru').format(appointmentDateTime);

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          width: 1.sw,
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: colors.shade0,
            border: Border.all(color: colors.neutral200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: colors.shade0,
                  border: Border.all(color: colors.neutral300),
                ),
                child: CachedImageComponent(
                  borderRadius: 8.r,
                  height: 50.w,
                  width: 50.w,
                  imageUrl: imagePath,
                ),
              ),
              12.w.horizontalSpace,
              SizedBox(
                width: 1.sw - 160.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 1.sw - 200.w,
                          child: Text(
                            serviceName,
                            maxLines: 2,
                            style: fonts.smallMain.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: colors.primary900,
                            ),
                          ),
                        ),
                        if (noCancel) ...{
                          const SizedBox.shrink()
                        } else ...{
                          GestureDetector(
                            onTap: onCancel,
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              child: icons.cancel.svg(
                                width: 20.w,
                                height: 20.h,
                                color: colors.neutral600,
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                    4.h.verticalSpace,
                    Text(
                      procedure,
                      style: fonts.smallMain.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.neutral600,
                      ),
                    ),
                    8.h.verticalSpace,
                    // // Doctor Info
                    const CDivider(),
                    Text(
                      doctorName,
                      style: fonts.smallMain.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: colors.primary900,
                      ),
                    ),
                    4.h.verticalSpace,
                    Text(
                      "sum".tr(namedArgs: {"amount": _formatNumber(price)}),
                      style: fonts.smallMain.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.neutral600,
                      ),
                    ),
                    8.h.verticalSpace,
                    const CDivider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4.h,
                      children: [
                        _buildInfoRow(
                          icon: icons.calendar.svg(width: 16.w, height: 16.h, color: colors.neutral500),
                          text: dateFormatted.toCapitalized(),
                          colors: colors,
                          fonts: fonts,
                        ),
                        _buildInfoRow(
                          icon: icons.clock.svg(width: 16.w, height: 16.h, color: colors.neutral500),
                          text: timeFormatted.toCapitalized(),
                          colors: colors,
                          fonts: fonts,
                        ),
                        _buildInfoRow(
                          icon: icons.mapPin.svg(width: 16.w, height: 16.h, color: colors.neutral500),
                          text: location,
                          colors: colors,
                          fonts: fonts,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Expanded(
        //           child: Text(
        //             diagnosis,
        //             maxLines: 2,
        //             style: fonts.smallMain.copyWith(
        //               fontSize: 15.sp,
        //               fontWeight: FontWeight.w600,
        //               color: colors.primary900,
        //             ),
        //           ),
        //         ),
        //         GestureDetector(
        //           onTap: onCancel,
        //           child: Container(
        //             padding: EdgeInsets.all(4.w),
        //             child: icons.cancel.svg(
        //               width: 20.w,
        //               height: 20.h,
        //               color: colors.neutral600,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     4.h.verticalSpace,
        //     Text(
        //       procedure,
        //       style: fonts.smallMain.copyWith(
        //         fontSize: 13.sp,
        //         fontWeight: FontWeight.w400,
        //         color: colors.neutral600,
        //       ),
        //     ),
        //     8.h.verticalSpace,
        //     // // Doctor Info
        //     const CDivider(),
        //     Text(
        //       doctorName,
        //       style: fonts.smallMain.copyWith(
        //         fontSize: 15.sp,
        //         fontWeight: FontWeight.w600,
        //         color: colors.primary900,
        //       ),
        //     ),
        //     4.h.verticalSpace,
        //     Text(
        //       "sum".tr(namedArgs: {"amount": _formatNumber(price)}),
        //       style: fonts.smallMain.copyWith(
        //         fontSize: 13.sp,
        //         fontWeight: FontWeight.w400,
        //         color: colors.neutral600,
        //       ),
        //     ),
        //     8.h.verticalSpace,
        //     const CDivider(),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisSize: MainAxisSize.min,
        //       spacing: 4.h,
        //       children: [
        //         _buildInfoRow(
        //           icon: icons.calendar.svg(width: 16.w, height: 16.h, color: colors.neutral500),
        //           text: dateFormatted.toCapitalized(),
        //           colors: colors,
        //           fonts: fonts,
        //         ),
        //         _buildInfoRow(
        //           icon: icons.clock.svg(width: 16.w, height: 16.h, color: colors.neutral500),
        //           text: timeFormatted.toCapitalized(),
        //           colors: colors,
        //           fonts: fonts,
        //         ),
        //         _buildInfoRow(
        //           icon: icons.mapPin.svg(width: 16.w, height: 16.h, color: colors.neutral500),
        //           text: location,
        //           colors: colors,
        //           fonts: fonts,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      },
    );
  }

  Widget _buildInfoRow({
    required Widget icon,
    required String text,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        8.w.horizontalSpace,
        Expanded(
          child: Text(
            text,
            style: fonts.smallMain.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: colors.neutral600,
            ),
          ),
        ),
      ],
    );
  }
}
