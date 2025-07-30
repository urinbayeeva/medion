import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorAppointmentWidget extends StatefulWidget {
  final Doctor doctor;
  final List<Map<String, dynamic>> schedules;
  final int? serviceId;
  final String? serviceName;
  final String? companyID;
  final bool? isDoctorAppointment;
  final Function(Map<String, String>? appointment)? onAppointmentSelected;

  const DoctorAppointmentWidget({
    super.key,
    required this.doctor,
    required this.schedules,
    required this.serviceId,
    this.serviceName,
    this.onAppointmentSelected,
    this.companyID,
    this.isDoctorAppointment,
  });

  @override
  _DoctorAppointmentWidgetState createState() => _DoctorAppointmentWidgetState();
}

class _DoctorAppointmentWidgetState extends State<DoctorAppointmentWidget> {
  int selectedDateIndex = 0;

  void _handleAppointmentSelection(String time, String currentDate, bool isSelected) {
    String calculateEndTime(String startTime) {
      final timeFormat = DateFormat('HH:mm');
      final DateTime start =
          DateTime(2024, 1, 1, int.parse(startTime.split(':')[0]), int.parse(startTime.split(':')[1]));
      final DateTime end = start.add(const Duration(minutes: 30));
      return timeFormat.format(end);
    }

    Map<String, String>? newAppointment = isSelected
        ? null
        : {
            "time": time,
            "start_time": time,
            "end_time": calculateEndTime(time),
            "date": currentDate,
            "serviceId": widget.serviceId.toString(),
            "serviceName": widget.serviceName.toString(),
            "doctorName": widget.doctor.name,
            "doctorPhoto": widget.doctor.image ?? "",
            "price": widget.doctor.price.toString(),
            "location": widget.doctor.location,
            "specialty": widget.doctor.specialty,
            "doctorID": widget.doctor.id.toString(),
            "companyID": widget.companyID ?? "",
          };

    if (newAppointment != null) {
      AppointmentState.addAppointment(newAppointment);
    } else {
      AppointmentState.removeAppointment(widget.serviceId.toString());
    }

    if (widget.onAppointmentSelected != null) {
      widget.onAppointmentSelected!(newAppointment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ValueListenableBuilder<List<Map<String, String>>>(
        valueListenable: AppointmentState.selectedAppointments,
        builder: (context, selectedList, _) {
          if (widget.schedules.isEmpty) {
            return const SizedBox.shrink();
          }

          String currentDate = widget.schedules[selectedDateIndex].keys.first;

          final currentAppointment = selectedList.firstWhere(
            (appointment) =>
                appointment['serviceId'] == widget.serviceId.toString() &&
                appointment['doctorID'] == widget.doctor.id.toString(),
            orElse: () => {},
          );

          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: colors.shade0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.isDoctorAppointment == false) ...[
                  _buildDoctorHeader(colors, fonts, icons),
                ],
                12.h.verticalSpace,
                if (widget.schedules.isNotEmpty) ...[
                  _buildDateSelector(context, colors, fonts),
                  16.h.verticalSpace,
                  _buildTimeSlots(
                    context,
                    colors,
                    fonts,
                    currentDate,
                    currentAppointment,
                  ),
                  12.h.verticalSpace,
                ]
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildDoctorHeader(CustomColorSet colors, fonts, icons) {
    final available = widget.doctor.image.isNotEmpty;

    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: colors.darkMode900),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: colors.neutral300,
            backgroundImage: available ? NetworkImage(widget.doctor.image) : null,
            child: !available
                ? SvgPicture.asset(
                    "assets/icons/non_user.svg",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  )
                : null,
          ),
        ),
        12.w.horizontalSpace,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.doctor.name, style: fonts.smallMain),
              Text(widget.doctor.specialty,
                  style: fonts.xSmallMain.copyWith(color: colors.neutral600, fontSize: 13.sp)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector(BuildContext context, colors, fonts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('select_date'.tr(), style: fonts.xSmallMain),
        8.h.verticalSpace,
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.schedules.length,
            itemBuilder: (context, index) {
              String dateKey = widget.schedules[index].keys.first;
              var formattedDate = DateFormat('EEE, dd MMMM', context.locale.toString()).format(DateTime.parse(dateKey));

              bool isSelected = index == selectedDateIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDateIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: isSelected ? colors.primary500 : colors.shade0,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? colors.primary500 : colors.neutral400,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    formattedDate,
                    style: TextStyle(
                      color: isSelected ? colors.shade0 : colors.primary900,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlots(
    context,
    colors,
    fonts,
    currentDate,
    Map<String, String> currentAppointment,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('select_recording_time'.tr(), style: fonts.xSmallMain),
        8.h.verticalSpace,
        GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2.2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
          ),
          itemCount: widget.schedules[selectedDateIndex][currentDate].length,
          itemBuilder: (context, index) {
            var timeSlot = widget.schedules[selectedDateIndex][currentDate][index];
            String time = timeSlot['time'];
            bool isActive = timeSlot['active'] ?? true;

            // Check if this time slot is selected for THIS doctor
            bool isSelected = currentAppointment['date'] == currentDate &&
                currentAppointment['time'] == time &&
                currentAppointment['doctorID'] == widget.doctor.id.toString();

            // Check if the time slot is taken by ANOTHER doctor
            bool isDisabledForOtherDoctors = AppointmentState.isTimeSlotTaken(
              currentDate,
              time,
              widget.doctor.id.toString(),
            );

            bool isDisabled = !isActive || isDisabledForOtherDoctors;

            return GestureDetector(
              onTap: isDisabled
                  ? null // Disable tap if not active or taken
                  : () {
                      _handleAppointmentSelection(time, currentDate, isSelected);
                    },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isDisabled
                      ? colors.error500.withOpacity(0.2) // Use theme color
                      : isSelected
                          ? colors.primary500
                          : colors.neutral200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? colors.error500 : colors.neutral200,
                    width: 2,
                  ),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: isDisabled
                        ? colors.neutral600.withOpacity(0.7)
                        : isSelected
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
      ],
    );
  }
}
