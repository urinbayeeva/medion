import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/extensions.dart';

class VerifyAppointmentItem extends StatelessWidget {
  final String diagnosis;
  final String procedure;
  final String doctorName;
  final String price;
  final String appointmentTime;
  final String location;
  final String imagePath;
  final VoidCallback onCancel;
  final bool? hasImage;

  const VerifyAppointmentItem({
    Key? key,
    required this.diagnosis,
    required this.procedure,
    required this.doctorName,
    required this.price,
    required this.appointmentTime,
    required this.location,
    required this.imagePath,
    required this.onCancel,
    this.hasImage = true,
  }) : super(key: key);

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
    final DateTime appointmentDateTime =
        DateTime.tryParse(appointmentTime) ?? DateTime.now();

    final dateFormatted =
        DateFormat('EEEE, d MMMM', 'ru').format(appointmentDateTime);
    final timeFormatted = DateFormat('HH:mm', 'ru').format(appointmentDateTime);

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.primary900,
                ),
                child: CachedImageComponent(
                  height: 50.w,
                  width: 50.w,
                  imageUrl: imagePath,
                )),
            12.w.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diagnosis,
                    style: fonts.smallMain.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: colors.primary900,
                    ),
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
                  // Doctor Info
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
                    "sum".tr(namedArgs: {
                      "amount": '${_formatNumber(price)}',
                    }),
                    style: fonts.smallMain.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: colors.neutral600,
                    ),
                  ),
                  8.h.verticalSpace,
                  // Appointment Time
                  const CDivider(),
                  Row(
                    children: [
                      icons.calendar.svg(
                        width: 16.w,
                        height: 16.h,
                        color: colors.error500,
                      ),
                      8.w.horizontalSpace,
                      Text(
                        dateFormatted.toCapitalized(),
                        style: fonts.smallMain.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: colors.neutral600,
                        ),
                      ),
                    ],
                  ),
                  16.w.horizontalSpace,
                  Row(
                    children: [
                      icons.clock.svg(
                        width: 16.w,
                        height: 16.h,
                        color: colors.error500,
                      ),
                      8.w.horizontalSpace,
                      Text(
                        timeFormatted.toCapitalized(),
                        style: fonts.smallMain.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: colors.neutral600,
                        ),
                      ),
                    ],
                  ),
                  4.h.verticalSpace,
                  // Location
                  _buildInfoRow(
                    icon: icons.location
                        .svg(width: 16.w, height: 16.h, color: colors.error500),
                    text: location,
                    colors: colors,
                    fonts: fonts,
                  ),
                ],
              ),
            ),
            8.w.horizontalSpace,
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
          ],
        ),
      );
    });
  }

  Widget _buildInfoRow({
    required Widget icon,
    required String text,
    required colors,
    required fonts,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
