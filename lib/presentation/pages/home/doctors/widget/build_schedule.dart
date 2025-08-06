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
  });

  final WorkSchedule schedule;
  final CustomColorSet colors;
  final FontSet fonts;
  final ModelDoctor doctor;

  @override
  Widget build(BuildContext context) {
    final days = [
      {'day': 'monday'.tr(), 'schedules': schedule.monday},
      {'day': 'tuesday'.tr(), 'schedules': schedule.tuesday},
      {'day': 'wednesday'.tr(), 'schedules': schedule.wednesday},
      {'day': 'thursday'.tr(), 'schedules': schedule.thursday},
      {'day': 'friday'.tr(), 'schedules': schedule.friday},
      {'day': 'saturday'.tr(), 'schedules': schedule.saturday},
    ];
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          if ((doctor.workSchedule.monday.isNotEmpty ||
              doctor.workSchedule.tuesday.isNotEmpty ||
              doctor.workSchedule.wednesday.isNotEmpty ||
              doctor.workSchedule.thursday.isNotEmpty ||
              doctor.workSchedule.friday.isNotEmpty ||
              doctor.workSchedule.saturday.isNotEmpty)) ...[
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: colors.shade0,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: days.map((day) {
                    final dayName = day['day'] as String;
                    final schedules = day['schedules'] as BuiltList<ScheduleItem>;

                    if (schedules.isEmpty) return const SizedBox.shrink();

                    return Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: const Color(0xFFF9F9F9),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dayName,
                              style: fonts.mediumMain.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: colors.primary900,
                              ),
                            ),
                            ...schedules.map(
                              (item) {
                                return Text(
                                  item.time.toString(),
                                  style: fonts.regularMain.copyWith(color: colors.neutral600, fontSize: 13.sp),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
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
