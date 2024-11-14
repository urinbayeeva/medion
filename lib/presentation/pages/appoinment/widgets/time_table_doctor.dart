import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/appoinment/widgets/image_container.dart';
import 'package:medion/presentation/pages/appoinment/widgets/time_selection_widget.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class TimeTableDoctor extends StatelessWidget {
  final String doctorName;
  final String doctorsJob;
  final String doctorsExperience;
  final String doctorsImage;

  const TimeTableDoctor(
      {super.key,
      required this.doctorName,
      required this.doctorsJob,
      required this.doctorsExperience,
      required this.doctorsImage});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(imagePath: doctorsImage),
                12.w.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        doctorName ?? "",
                        style: fonts.smallMain.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      4.h.verticalSpace,
                      Text(
                        doctorsJob ?? "",
                        style: fonts.smallMain.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      4.h.verticalSpace,
                      Text(
                        doctorsExperience ?? "",
                        style: fonts.smallMain.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            8.h.verticalSpace,
            const TimeSlotSelection(),
          ],
        ),
      );
    });
  }
}
