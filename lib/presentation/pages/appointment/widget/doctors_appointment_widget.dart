import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorAppointmentWidget extends StatefulWidget {
  final Doctor doctor;
  final List<Map<String, dynamic>> schedules;

  const DoctorAppointmentWidget({
    super.key,
    required this.doctor,
    required this.schedules,
  });

  @override
  _DoctorAppointmentWidgetState createState() =>
      _DoctorAppointmentWidgetState();
}

class _DoctorAppointmentWidgetState extends State<DoctorAppointmentWidget> {
  int selectedDateIndex = 0;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: colors.neutral400,
                      child: icons.nonUser.svg()),
                  12.w.horizontalSpace,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.doctor.name, style: fonts.smallMain),
                        Text(widget.doctor.specialty,
                            style: fonts.xSmallMain.copyWith(
                                color: const Color(0xFF323232),
                                fontSize: 13.sp)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            12.h.verticalSpace,
            if (widget.schedules.isNotEmpty &&
                selectedDateIndex < widget.schedules.length &&
                widget
                    .schedules[selectedDateIndex]
                        [widget.schedules[selectedDateIndex].keys.first]
                    .isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Выберите дату', style: fonts.xSmallMain),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.schedules.length,
                        itemBuilder: (context, index) {
                          String dateKey = widget.schedules[index].keys.first;
                          var formattedDate =
                              DateFormat('EEE, dd MMMM', 'ru_RU')
                                  .format(DateTime.parse(dateKey));
                          bool isSelected = index == selectedDateIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDateIndex = index;
                                selectedTime = null;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colors.error500
                                    : colors.shade0,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? colors.error500
                                      : colors.neutral400,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(formattedDate,
                                  style: TextStyle(
                                    color: isSelected
                                        ? colors.shade0
                                        : colors.primary900,
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Выберите время записи', style: fonts.xSmallMain),
                    const SizedBox(height: 8),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 2.2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: widget
                          .schedules[selectedDateIndex]
                              [widget.schedules[selectedDateIndex].keys.first]
                          .length,
                      itemBuilder: (context, index) {
                        var timeSlot = widget.schedules[selectedDateIndex]
                                [widget.schedules[selectedDateIndex].keys.first]
                            [index];
                        String time = timeSlot['time'];
                        String nextTime = _getNextTimeSlot(time);

                        bool isSelected = selectedTime == time;
                        bool isNextTime = selectedTime != null &&
                            time == _getNextTimeSlot(selectedTime!);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedTime = null;
                              } else {
                                selectedTime = time;
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? colors.error500
                                  : isNextTime
                                      ? colors.neutral500
                                      : colors.neutral200,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? colors.error500
                                    : colors.neutral200,
                                width: 0,
                              ),
                            ),
                            child: isSelected
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      icons.check.svg(),
                                      Text(
                                        time,
                                        style: TextStyle(
                                          color: colors.shade0,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    time,
                                    style: TextStyle(
                                      color: colors.primary900,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                    12.h.verticalSpace,
                  ],
                ),
              )
            ]
          ],
        ),
      );
    });
  }

  String _getNextTimeSlot(String currentTime) {
    DateTime dateTime = DateFormat('HH:mm').parse(currentTime);
    DateTime nextTime = dateTime.add(const Duration(minutes: 30));
    return DateFormat('HH:mm').format(nextTime);
  }
}
