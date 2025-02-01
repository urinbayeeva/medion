import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorAppointmentWidget extends StatefulWidget {
  final CompanyDoctor doctor;

  const DoctorAppointmentWidget({super.key, required this.doctor});

  @override
  _DoctorAppointmentWidgetState createState() =>
      _DoctorAppointmentWidgetState();
}

class _DoctorAppointmentWidgetState extends State<DoctorAppointmentWidget> {
  final List<DateTime> availableDates =
      List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
  DateTime selectedDate = DateTime.now();
  String? selectedTime;

  final Map<String, List<String>> schedule = {
    '2025-01-28': ['17:30'],
    '2025-01-29': [
      '09:00',
      '09:30',
      '10:00',
      '10:30',
      '11:00',
      '11:30',
      '12:00',
      '12:30',
      '13:00',
      '13:30',
      '14:00',
      '14:30',
      '15:00',
      '15:30',
      '16:00',
      '16:30',
      '17:00',
      '17:30'
    ]
  };

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8.r),
        ),
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.h.verticalSpace,
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: colors.neutral400,
                  backgroundImage: widget.doctor.doctor?[0].image != null &&
                          widget.doctor.doctor![0].image!.isNotEmpty
                      ? NetworkImage(widget.doctor.doctor![0].image!)
                      : null,
                  child: widget.doctor.doctor?[0].image == null ||
                          widget.doctor.doctor![0].image!.isEmpty
                      ? icons.nonUser.svg()
                      : null,
                ),
                10.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.doctor.doctor?[0].name ?? 'No Name',
                        style: fonts.smallMain),
                    Text(
                      widget.doctor.doctor?[0].specialty ?? 'No Specialty',
                      style: fonts.xSmallMain.copyWith(
                        color: const Color(0xFF323232),
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Выберите дату',
              style: fonts.xSmallMain.copyWith(
                color: const Color(0xFF323232),
                fontSize: 13.sp,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: availableDates.map((date) {
                  bool isSelected = selectedDate == date;
                  return GestureDetector(
                    onTap: () => setState(() => selectedDate = date),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 32.w),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? colors.error500 : colors.shade0,
                        border: isSelected
                            ? null
                            : Border.all(
                                width: 1, color: const Color(0xFFEDEDED)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        DateFormat('E, d MMM', 'ru').format(date),
                        style: fonts.smallText.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: isSelected ? colors.shade0 : colors.primary900,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Выберите время записи',
              style: fonts.xSmallMain.copyWith(
                color: const Color(0xFF323232),
                fontSize: 13.sp,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  (schedule[DateFormat('yyyy-MM-dd').format(selectedDate)] ??
                          [])
                      .map((time) {
                bool isSelected = selectedTime == time;
                return GestureDetector(
                  onTap: () => setState(() => selectedTime = time),
                  child: Container(
                    width: 78.w,
                    height: 36.h,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? colors.error500 : colors.neutral200,
                      border: isSelected
                          ? null
                          : Border.all(
                              width: 1, color: const Color(0xFFEDEDED)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: isSelected
                        ? Row(
                            children: [
                              icons.check.svg(color: colors.shade0),
                              Text(
                                time,
                                style: fonts.xSmallMain.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: isSelected
                                      ? colors.shade0
                                      : colors.primary900,
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Text(
                              time,
                              style: fonts.xSmallMain.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: isSelected
                                    ? colors.shade0
                                    : colors.primary900,
                              ),
                            ),
                          ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    });
  }
}
