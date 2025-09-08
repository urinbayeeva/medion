import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/presentation/pages/appointment/verify_appointment.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_doctor_chose.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorAppointmentWidget extends StatefulWidget {
  const DoctorAppointmentWidget({
    super.key,
    required this.service,
    required this.serviceType,
    required this.bloc,
    required this.serviceId,
    this.serviceName,
    this.onAppointmentSelected,
    this.isDoctorAppointment,
    required this.orderDetailId,
  });

  final ThirdBookingService service;
  final String serviceType;
  final int? serviceId;
  final String? serviceName;
  final List<SelectedServices> orderDetailId;
  final bool? isDoctorAppointment;
  final BookingBloc bloc;
  final Function(AppointmentItem? appointment)? onAppointmentSelected;

  @override
  State<DoctorAppointmentWidget> createState() => _DoctorAppointmentWidgetState();
}

class _DoctorAppointmentWidgetState extends State<DoctorAppointmentWidget> {
  int selectedDateIndex = 0;
  late final ValueNotifier<List<ThirdBookingDoctor>> doctors = ValueNotifier([]);
  late final ValueNotifier<List<ThirdBookingCompany>> branches = ValueNotifier<List<ThirdBookingCompany>>([]);
  late final ValueNotifier<ThirdBookingCompany?> selectedBranch = ValueNotifier(null);
  late final ValueNotifier isOff = ValueNotifier<bool>(false);

  @override
  void initState() {
    final List<ThirdBookingCompany> companies = [...?widget.service.companies];
    branches.value = <ThirdBookingCompany>[
      ...List.generate(companies.length, (i) => companies[i]),
    ];

    doctors.value = [
      for (final company in companies) ...?company.doctors,
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<BookingBloc, BookingState>(
          bloc: widget.bloc,
          buildWhen: (o, n) {
            final appointment = o.selectedAppointments != n.selectedAppointments;
            return appointment;
          },
          builder: (context, state) {
            // if (widget.schedules.isEmpty) {
            //   return const SizedBox.shrink();
            // }

            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: colors.shade0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 12.w), child: const Divider()),
                  if (widget.serviceType == 'lab_exam') ...{
                    10.h.verticalSpace,
                    txt(text: "laboratory".tr(), fonts: fonts, vertical: 0),
                    10.h.verticalSpace,
                    ...List.generate(
                      [...?widget.service.serviceNames].length,
                      (i) {
                        final labItem = [...?widget.service.serviceNames][i];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 4.w,
                          children: [
                            Icon(CupertinoIcons.play_fill, color: colors.error500, size: 16.sp),
                            Flexible(
                              child: Text(
                                labItem.name ?? '',
                                style: fonts.xSmallMain.copyWith(color: const Color(0xff5F6368)),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    12.h.verticalSpace,
                    Container(
                      height: 82.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F3F4),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Выезд на дом", style: fonts.regularMain.copyWith(fontSize: 14.sp)),
                                Text(
                                  "Все анализы можно сдать дома, не выходя из квартиры.",
                                  style: fonts.xSmallMain.copyWith(color: const Color(0xff5F6368)),
                                ),
                              ],
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: isOff,
                            builder: (context, value, child) {
                              return CupertinoSwitch(
                                value: value,
                                onChanged: (val) {
                                  isOff.value = val;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  },
                  10.h.verticalSpace,
                  txt(text: "branches".tr(), fonts: fonts, vertical: 0),
                  10.h.verticalSpace,
                  if (branches.value.isNotEmpty) ...{
                    ...List.generate(
                      branches.value.length,
                      (index) {
                        final company = branches.value[index];

                        return ValueListenableBuilder<ThirdBookingCompany?>(
                          valueListenable: selectedBranch,
                          builder: (context, value, child) {
                            bool isSelect = value?.companyName == company.companyName;
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 4.h),
                              decoration: BoxDecoration(
                                color: const Color(0xffF1F3F4),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: ListTile(
                                onTap: () {
                                  selectedBranch.value = company;
                                  if (selectedBranch.value?.companyName == company.companyName) {
                                    doctors.value = [...?company.doctors];
                                  }
                                },
                                title: Text(
                                  company.companyName ?? "",
                                  style: fonts.regularMain.copyWith(fontSize: 14.sp),
                                ),
                                subtitle: Text(
                                  company.companyLocation ?? "",
                                  style: fonts.xSmallMain,
                                ),
                                leading: isSelect
                                    ? Icon(Icons.radio_button_checked, color: colors.error500)
                                    : Icon(Icons.radio_button_off, color: colors.neutral500),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  },
                  10.h.verticalSpace,
                  txt(text: "doctors".tr(), fonts: fonts, vertical: 0),
                  10.h.verticalSpace,
                  ValueListenableBuilder(
                    valueListenable: doctors,
                    builder: (context, doctorsValues, child) {
                      return ListView.builder(
                        itemCount: doctorsValues.length,
                        itemBuilder: (context, index) {
                          final doctor = doctors.value[index];
                          final schedule = doctor.schedules;
                          String currentDate = [...?doctor.schedules][selectedDateIndex].date ?? '';

                          final currentAppointment = state.selectedAppointments.firstWhere(
                            (appointment) {
                              final serviceID = appointment.serviceId == widget.serviceId;
                              final doctorID = appointment.doctorID == doctor.doctorId;
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

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildDoctorHeader(
                                colors: colors,
                                fonts: fonts,
                                icons: icons,
                                doctor: doctor,
                              ),
                              10.h.verticalSpace,
                              _buildDateSelector(
                                context: context,
                                colors: colors,
                                fonts: fonts,
                                doctor: doctor,
                              ),
                              16.h.verticalSpace,
                              _buildTimeSlots(
                                context: context,
                                colors: colors,
                                fonts: fonts,
                                doctor: doctor,
                                company: selectedBranch.value,
                                schedules: [...?doctor.schedules],
                                currentDate: currentDate,
                                items: state.selectedAppointments,
                                currentAppointment: currentAppointment,
                              ),
                              12.h.verticalSpace,
                            ],
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _handleAppointmentSelection({
    required String time,
    required String currentDate,
    required bool isSelected,
    required ThirdBookingDoctor doctor,
    ThirdBookingCompany? company,
  }) {
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
            doctorName: doctor.doctorName ?? '',
            price: doctor.doctorPrice.toString(),
            location: doctor.doctorLocation ?? "",
            imagePath: doctor.doctorImage ?? "",
            time: time,
            date: currentDate,
            startTime: time,
            endTime: calculateEndTime(time),
            serviceName: widget.serviceName.toString(),
            specialty: doctor.doctorSpecialty ?? '',
            doctorID: doctor.doctorId ?? -1,
            serviceId: widget.serviceId ?? -1,
            companyID: company?.companyId ?? -1,
            orderDetailId: orderId,
          );

    if (widget.onAppointmentSelected != null) {
      widget.onAppointmentSelected!(newAppointment);
    }
  }

  Widget txt({
    required String text,
    required FontSet fonts,
    double horizontal = 12,
    double vertical = 12,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h),
      child: Text(text, style: fonts.regularMain),
    );
  }

  Widget _buildDoctorHeader({
    required CustomColorSet colors,
    required FontSet fonts,
    required IconSet icons,
    required ThirdBookingDoctor doctor,
  }) {
    return Row(
      children: [
        Container(
          height: 74.h,
          width: 74.w,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: const Color(0xffF2F2F3),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: CommonImage(
            imageUrl: doctor.doctorImage ?? '',
            fit: BoxFit.contain,
            errorImageAsset: "assets/images/doctor_placeholder.png",
          ),
        ),
        12.w.horizontalSpace,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doctor.doctorName ?? "", style: fonts.smallMain),
              Text(
                doctor.doctorSpecialty ?? "",
                style: fonts.xSmallMain.copyWith(color: colors.neutral600, fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector({
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
    required ThirdBookingDoctor doctor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('select_date'.tr(), style: fonts.xSmallMain),
        8.h.verticalSpace,
        if (doctor.schedules != null && doctor.schedules!.isNotEmpty) ...{
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: doctor.schedules!.length,
              itemBuilder: (context, index) {
                String dateKey = doctor.schedules![index].date ?? "";
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
          )
        }
      ],
    );
  }

  bool isTimeSlotTaken({
    required String date,
    required String time,
    required int currentServiceId,
    required List<AppointmentItem> appointment,
  }) {
    return appointment.any((appointment) {
      return appointment.date == date && appointment.time == time && appointment.serviceId != currentServiceId;
    });
  }

  Widget _buildTimeSlots({
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
    required String currentDate,
    required AppointmentItem currentAppointment,
    required ThirdBookingDoctor doctor,
    ThirdBookingCompany? company,
    required List<AppointmentItem> items,
    required List<ThirdBookingDoctorSchedule> schedules,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('select_recording_time'.tr(), style: fonts.xSmallMain),
        8.h.verticalSpace,

        /// new
        GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2.2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
          ),
          itemCount: [...?schedules[selectedDateIndex].scheduleList].length,
          itemBuilder: (context, index) {
            var timeSlot = schedules[selectedDateIndex].scheduleList![index];
            String time = timeSlot.time ?? '';
            bool isActive = timeSlot.active ?? true;

            // Check if this time slot is selected for THIS doctor
            bool isSelected = currentAppointment.date == currentDate &&
                currentAppointment.time == time &&
                currentAppointment.doctorID == doctor.doctorId;

            // Check if the time slot is taken by ANOTHER doctor
            bool isDisabledForOtherDoctors = isTimeSlotTaken(
              date: currentDate,
              time: time,
              currentServiceId: widget.serviceId ?? 0,
              appointment: items, // selected appointment
            );

            bool isDisabled = !isActive || isDisabledForOtherDoctors;

            return GestureDetector(
              onTap: () {
                if (!isDisabled) {
                  _handleAppointmentSelection(
                    time: time,
                    currentDate: currentDate,
                    isSelected: isSelected,
                    doctor: doctor,
                    company: company,
                  );
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

        ///old
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
