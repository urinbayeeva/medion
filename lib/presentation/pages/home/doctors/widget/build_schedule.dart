import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/presentation/styles/theme.dart';

class BuildSchedule extends StatelessWidget {
  const BuildSchedule({
    super.key,
    required this.schedule,
    required this.colors,
    required this.fonts,
    required this.doctor,
    required this.title,
  });

  final WorkSchedule schedule;
  final CustomColorSet colors;
  final FontSet fonts;
  final ModelDoctor doctor;
  final String title;

  @override
  Widget build(BuildContext context) {
    final days = [
      {'day': 'monday'.tr(), 'schedules': schedule.monday},
      {'day': 'tuesday'.tr(), 'schedules': schedule.tuesday},
      {'day': 'wednesday'.tr(), 'schedules': schedule.wednesday},
      {'day': 'thursday'.tr(), 'schedules': schedule.thursday},
      {'day': 'friday'.tr(), 'schedules': schedule.friday},
      {'day': 'saturday'.tr(), 'schedules': schedule.saturday},
      {'day': 'sunday'.tr(), 'schedules': schedule.sunday},
    ];
    final available = doctor.workSchedule.monday.isNotEmpty ||
        doctor.workSchedule.tuesday.isNotEmpty ||
        doctor.workSchedule.wednesday.isNotEmpty ||
        doctor.workSchedule.thursday.isNotEmpty ||
        doctor.workSchedule.friday.isNotEmpty ||
        doctor.workSchedule.sunday.isNotEmpty ||
        doctor.workSchedule.saturday.isNotEmpty;
    return SingleChildScrollView(
      child: Column(
        children: [
          if (available) ...[
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(color: colors.shade0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title.tr(), style: fonts.regularMain),
                          if (doctor.isThereFreeTime != null && doctor.isThereFreeTime!) ...{
                            Text(
                              "• ${"can_accept".tr()}",
                              style: fonts.regularMain.copyWith(color: colors.success500, fontSize: 14.sp),
                            ),
                          },
                        ],
                      ),
                    ),
                    ...days.map(
                      (day) {
                        final dayName = day['day'] as String;
                        final schedules = day['schedules'] as BuiltList<ScheduleItem>;

                        if (schedules.isEmpty) return const SizedBox.shrink();
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dayName,
                                style: fonts.xSmallMain.copyWith(
                                  fontSize: 14.sp,
                                  color: const Color(0xff66686C),
                                ),
                              ),
                              if (schedules.isEmpty) ...{
                                Text(
                                  "do_not_work".tr(),
                                  style: fonts.xSmallLink.copyWith(fontSize: 14.sp, color: colors.error500),
                                )
                              } else ...{
                                Text(
                                  schedules.first.time.toString(),
                                  style: fonts.xSmallLink.copyWith(fontSize: 14.sp),
                                )
                                // ...schedules.map(
                                //   (item) {
                                //     if (schedules.isEmpty || true) {
                                //       return Text(
                                //         "do_not_work".tr(),
                                //         style: fonts.xSmallLink.copyWith(fontSize: 14.sp, color: colors.error500),
                                //       );
                                //     }
                                //     return Text(
                                //       item.time.toString(),
                                //       style: fonts.xSmallLink.copyWith(fontSize: 14.sp),
                                //     );
                                //   },
                                // ),
                              }
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            const SizedBox.shrink()
          ],
        ],
      ),
    );
  }
}
