import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

// Track selected time globally
// Track selected time globally
ValueNotifier<Map<String, String>?> selectedAppointment = ValueNotifier(null);

class DoctorAppointmentWidget extends StatefulWidget {
  final Doctor doctor;
  final List<Map<String, dynamic>> schedules;
  final int? serviceId;
  final String? serviceName;

  const DoctorAppointmentWidget({
    super.key,
    required this.doctor,
    required this.schedules,
    required this.serviceId, this.serviceName,
  });

  @override
  _DoctorAppointmentWidgetState createState() =>
      _DoctorAppointmentWidgetState();
}

class _DoctorAppointmentWidgetState extends State<DoctorAppointmentWidget> {
  int selectedDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ValueListenableBuilder<Map<String, String>?>(
        valueListenable: selectedAppointment,
        builder: (context, globalSelectedAppointment, _) {
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: colors.shade0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: colors.neutral400,
                      backgroundImage: widget.doctor.name != null
                          ? NetworkImage(widget.doctor.name!)
                          : null,
                      child: widget.doctor.name == null
                          ? icons.nonUser.svg()
                          : null,
                    ),
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
                12.h.verticalSpace,
                if (widget.schedules.isNotEmpty &&
                    selectedDateIndex < widget.schedules.length &&
                    widget
                        .schedules[selectedDateIndex]
                            [widget.schedules[selectedDateIndex].keys.first]
                        .isNotEmpty) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('select_date'.tr(), style: fonts.xSmallMain),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.schedules.length,
                          itemBuilder: (context, index) {
                            String dateKey = widget.schedules[index].keys.first;
                            var formattedDate = DateFormat(
                                    'EEE, dd MMMM', context.locale.toString())
                                .format(DateTime.parse(dateKey));
                            bool isSelected = index == selectedDateIndex;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDateIndex = index;
                                });
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? colors.primary500
                                      : colors.shade0,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isSelected
                                        ? colors.primary500
                                        : colors.neutral400,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  formattedDate,
                                  style: TextStyle(
                                    color: isSelected
                                        ? colors.shade0
                                        : colors.primary900,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('select_recording_time'.tr(),
                          style: fonts.xSmallMain),
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
                          var timeSlot = widget.schedules[selectedDateIndex][
                              widget.schedules[selectedDateIndex].keys
                                  .first][index];

                          String time = timeSlot['time'];

                          bool isSelected = globalSelectedAppointment != null &&
                              globalSelectedAppointment['time'] == time;

                          bool isConflicting =
                              globalSelectedAppointment != null &&
                                  globalSelectedAppointment['time'] == time &&
                                  globalSelectedAppointment['serviceId'] !=
                                      widget.serviceId.toString();

                          return GestureDetector(
                            onTap: () {
                              if (isConflicting) return;

                              selectedAppointment.value = isSelected
                                  ? null
                                  : {
                                      "time": time,
                                      "serviceId": widget.serviceId.toString(),
                                      "serviceName":
                                          widget.serviceName!, // Add this line
                                      "doctorName": widget.doctor.name,
                                      "doctorPhoto": widget.doctor.name ?? "",
                                      "selectedIdCount": (((selectedAppointment
                                                              .value?[
                                                          "selectedIdCount"] ??
                                                      "0") as String)
                                                  .isNotEmpty
                                              ? int.parse(selectedAppointment
                                                              .value?[
                                                          "selectedIdCount"] ??
                                                      "0") +
                                                  1
                                              : 1)
                                          .toString(),
                                    };
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isConflicting
                                    ? colors.neutral600
                                    : isSelected
                                        ? colors.primary500
                                        : colors.neutral200,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? colors.primary500
                                      : colors.neutral200,
                                  width: 0,
                                ),
                              ),
                              child: Text(
                                time,
                                style: TextStyle(
                                  color: isConflicting
                                      ? colors.shade0
                                      : colors.primary900,
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
                  )
                ]
              ],
            ),
          );
        },
      );
    });
  }
}
