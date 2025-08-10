import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/presentation/pages/appointment/verify_appointment.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_doctor_chose.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorAppointmentWidget extends StatefulWidget {
  const DoctorAppointmentWidget({
    super.key,
    required this.doctor,
    required this.bloc,
    required this.schedules,
    required this.serviceId,
    this.serviceName,
    this.onAppointmentSelected,
    this.companyID,
    this.isDoctorAppointment,
    required this.orderDetailId,
  });

  final ThirdBookingDoctor doctor;
  final List<ThirdBookingDoctorSchedule> schedules;
  final int? serviceId;
  final String? serviceName;
  final int? companyID;
  final List<SelectedServices> orderDetailId;
  final bool? isDoctorAppointment;
  final BookingBloc bloc;
  final Function(AppointmentItem? appointment)? onAppointmentSelected;

  @override
  State<DoctorAppointmentWidget> createState() => _DoctorAppointmentWidgetState();
}

class _DoctorAppointmentWidgetState extends State<DoctorAppointmentWidget> {
  int selectedDateIndex = 0;

  void _handleAppointmentSelection(String time, String currentDate, bool isSelected) {
    String calculateEndTime(String startTime) {
      final timeFormat = DateFormat('HH:mm');
      int parsing(int number) => int.parse(startTime.split(':')[number]);
      final DateTime start = DateTime(2024, 1, 1, parsing(0), parsing(1));
      final DateTime end = start.add(const Duration(minutes: 30));
      return timeFormat.format(end);
    }

    final List<SelectedServices> services = widget.orderDetailId;
    final int? serviceId = widget.serviceId;

    final matchedService = services.firstWhere(
      (e) => e.serviceId == serviceId,
      orElse: () => const SelectedServices(serviceId: -1, orderDetailId: -1),
    );

    final int orderId = matchedService.orderDetailId ?? -1;

    AppointmentItem? newAppointment = isSelected
        ? null
        : AppointmentItem(
            doctorName: widget.doctor.name ?? '',
            price: widget.doctor.price.toString(),
            location: widget.doctor.location ?? "",
            imagePath: widget.doctor.image ?? "",
            time: time,
            date: currentDate,
            startTime: time,
            endTime: calculateEndTime(time),
            serviceName: widget.serviceName.toString(),
            specialty: widget.doctor.specialty ?? '',
            doctorID: widget.doctor.id ?? -1,
            serviceId: widget.serviceId ?? -1,
            companyID: widget.companyID ?? -1,
            orderDetailId: orderId,
          );

    if (widget.onAppointmentSelected != null) {
      widget.onAppointmentSelected!(newAppointment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<BookingBloc, BookingState>(
        bloc: widget.bloc,
        buildWhen: (o, n) {
          final appointment = o.selectedAppointments != n.selectedAppointments;
          return appointment;
        },
        builder: (context, state) {
          if (widget.schedules.isEmpty) {
            return const SizedBox.shrink();
          }
          String currentDate = widget.schedules[selectedDateIndex].date ?? '';

          final currentAppointment = state.selectedAppointments.firstWhere(
            (appointment) {
              final serviceID = appointment.serviceId == widget.serviceId.toString();
              final doctorID = appointment.doctorID == widget.doctor.id.toString();
              return serviceID && doctorID;
            },
            orElse: () => const AppointmentItem(
              doctorName: '',
              price: '',
              location: '',
              imagePath: '',
              time: '',
              date: '',
              startTime: '',
              endTime: '',
              serviceName: '',
              specialty: '',
              serviceId: -1,
              doctorID: -1,
              companyID: -1,
              orderDetailId: -1,
            ),
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
                    context: context,
                    colors: colors,
                    fonts: fonts,
                    currentDate: currentDate,
                    items: state.selectedAppointments,
                    currentAppointment: currentAppointment,
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
    final available = (widget.doctor.image != null && widget.doctor.image!.isNotEmpty) ? true : false;

    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: colors.darkMode900),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: colors.neutral300,
            backgroundImage: available ? NetworkImage(widget.doctor.image ?? '') : null,
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
              Text(widget.doctor.name ?? "", style: fonts.smallMain),
              Text(
                widget.doctor.specialty ?? "",
                style: fonts.xSmallMain.copyWith(color: colors.neutral600, fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector(BuildContext context, CustomColorSet colors, FontSet fonts) {
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
              String dateKey = widget.schedules[index].date ?? "";
              DateTime? parsedDate = DateTime.tryParse(dateKey);

              String formattedDate =
                  parsedDate != null ? DateFormat('EEE, dd MMMM', context.locale.toString()).format(parsedDate) : "";
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
                    style: fonts.xSmallLink.copyWith(color: isSelected ? colors.shade0 : colors.primary900),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bool isTimeSlotTaken({
    required String date,
    required String time,
    required String currentServiceId,
    required List<AppointmentItem> appointment,
  }) {
    return appointment.any(
      (appointment) =>
          appointment.date == date && appointment.time == time && appointment.serviceId != currentServiceId,
    );
  }

  Widget _buildTimeSlots({
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
    required String currentDate,
    required AppointmentItem currentAppointment,
    required List<AppointmentItem> items,
  }) {
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
          itemCount: [...?widget.schedules[selectedDateIndex].scheduleList].length,
          itemBuilder: (context, index) {
            var timeSlot = widget.schedules[selectedDateIndex].scheduleList![index];
            String time = timeSlot.time ?? '';
            bool isActive = timeSlot.active ?? true;

            // Check if this time slot is selected for THIS doctor
            bool isSelected = currentAppointment.date == currentDate &&
                currentAppointment.time == time &&
                currentAppointment.doctorID == widget.doctor.id.toString();

            // Check if the time slot is taken by ANOTHER doctor
            bool isDisabledForOtherDoctors = isTimeSlotTaken(
              date: currentDate,
              time: time,
              currentServiceId: widget.doctor.id.toString(),
              appointment: items, // selected appointment
            );

            bool isDisabled = !isActive || isDisabledForOtherDoctors;

            return GestureDetector(
              onTap: () {
                if (!isDisabled) {
                  _handleAppointmentSelection(time, currentDate, isSelected);
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isDisabled
                      ? colors.error500.withValues(alpha: 0.2)
                      : isSelected
                          ? colors.primary500
                          : colors.neutral200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: isSelected ? colors.error500 : colors.neutral200, width: 2),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: isDisabled
                        ? colors.neutral600.withValues(alpha: 0.7)
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

        ///       GridView.builder(
        //           padding: EdgeInsets.zero,
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 4,
        //             childAspectRatio: 2.2,
        //             crossAxisSpacing: 8.w,
        //             mainAxisSpacing: 8.h,
        //           ),
        //           itemCount: widget.schedules[selectedDateIndex][currentDate].length,
        //           itemBuilder: (context, index) {
        //             var timeSlot = widget.schedules[selectedDateIndex][currentDate][index];
        //             String time = timeSlot['time'];
        //             bool isActive = timeSlot['active'] ?? true;
        //
        //             // Check if this time slot is selected for THIS doctor
        //             bool isSelected = currentAppointment['date'] == currentDate &&
        //                 currentAppointment['time'] == time &&
        //                 currentAppointment['doctorID'] == widget.doctor.id.toString();
        //
        //             // Check if the time slot is taken by ANOTHER doctor
        //             // bool isDisabledForOtherDoctors = AppointmentState.isTimeSlotTaken(
        //             //   currentDate,
        //             //   time,
        //             //   widget.doctor.id.toString(),
        //             // );
        //             //
        //             // bool isDisabled = !isActive || isDisabledForOtherDoctors;
        //
        //             return GestureDetector(
        //               // onTap: isDisabled
        //               //     ? null // Disable tap if not active or taken
        //               //     : () {
        //               //         _handleAppointmentSelection(time, currentDate, isSelected);
        //               //       },
        //               onTap: () {},
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 decoration: BoxDecoration(
        //                   color:
        //                       // isDisabled
        //                       3 > 9
        //                           ? colors.error500.withOpacity(0.2) // Use theme color
        //                           : isSelected
        //                               ? colors.primary500
        //                               : colors.neutral200,
        //                   borderRadius: BorderRadius.circular(8),
        //                   border: Border.all(
        //                     color: isSelected ? colors.error500 : colors.neutral200,
        //                     width: 2,
        //                   ),
        //                 ),
        //                 child: Text(
        //                   time,
        //                   style: TextStyle(
        //                     color:
        //                         // isDisabled
        //
        //                         3 > 9
        //                             ? colors.neutral600.withOpacity(0.7)
        //                             : isSelected
        //                                 ? colors.shade0
        //                                 : colors.primary900,
        //                     fontSize: 13.sp,
        //                   ),
        //                 ),
        //               ),
        //             );
        //           },
        //           shrinkWrap: true,
        //           physics: const NeverScrollableScrollPhysics(),
        //         ),
      ],
    );
  }
}
