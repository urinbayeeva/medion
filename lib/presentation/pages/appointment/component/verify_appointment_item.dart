import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VerifyAppointmentItem extends StatelessWidget {
  final String diagnosis;
  final String procedure;
  final String doctorName;
  final String price;
  final String appointmentTime;
  final String location;
  final String imagePath;
  final VoidCallback onCancel;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.only(bottom: 8.h,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80.w, // Fixed width for image container
              height: 80.w, // Square aspect ratio
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.neutral200,
                ),
                child: imagePath.isEmpty
                    ? icons.nonUser.svg()
                    : Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            12.w.horizontalSpace,
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diagnosis,
                    style: fonts.smallMain.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    procedure,
                    style: fonts.smallMain.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: colors.neutral600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const CDivider(),
                  Text(
                    doctorName,
                    style: fonts.smallMain.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    price,
                    style: fonts.smallMain.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: colors.neutral600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const CDivider(),
                  Row(
                    children: [
                      icons.clock.svg(width: 14.w, height: 14.h),
                      4.w.horizontalSpace,
                      Expanded(
                        child: Text(
                          appointmentTime,
                          style: fonts.smallMain.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      icons.location.svg(width: 14.w, height: 14.h),
                      4.w.horizontalSpace,
                      Expanded(
                        child: Text(
                          location,
                          style: fonts.smallMain.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const CDivider(),
                ],
              ),
            ),
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: GestureDetector(
                onTap: onCancel,
                child: icons.cancel.svg(),
              ),
            ),
          ],
        ),
      );
    });
  }
}