import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/pages/appointment/verify_appointment.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedServiceVerify extends StatefulWidget {
  final String diagnosName;
  final String serviceName;
  final String doctorName;
  final String servicePrice;
  final String selectedTime;
  final String selectedLocation;
  final String doctorImage;
  const MedServiceVerify(
      {super.key,
      required this.diagnosName,
      required this.serviceName,
      required this.doctorName,
      required this.servicePrice,
      required this.selectedTime,
      required this.selectedLocation,
      required this.doctorImage});

  @override
  State<MedServiceVerify> createState() => _MedServiceVerifyState();
}

class _MedServiceVerifyState extends State<MedServiceVerify> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ValueListenableBuilder<List<Map<String, String>>>(
          valueListenable: AppointmentState.selectedAppointments,
          builder: (context, selectedList, _) {
            if (selectedList.isEmpty) {
              Future.microtask(() {
                if (mounted) {
                  Navigator.pop(context);
                }
              });
              return const SizedBox();
            }
            if (selectedList.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    'no_appointments_selected'.tr(),
                    style: fonts.smallMain,
                  ),
                ),
              );
            }
            return Scaffold(
              backgroundColor: colors.backgroundColor,
              body: Column(
                children: [
                  CAppBar(
                    title: "verify_selected".tr(),
                    centerTitle: true,
                    isBack: true,
                    trailing: 24.w.horizontalSpace,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: Column(
                          children: selectedList
                              .map((appointment) => _buildAppointmentItem(
                                  appointment, colors, fonts, context))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colors.shade0,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        CButton(
                          width: double.infinity,
                          title: 'next'.tr(),
                          onTap: () async {
                            if (selectedList.isNotEmpty) {
                              final appointment = selectedList.first;
                              final success =
                                  await sendVisitRequest(appointment, context);
                              if (success) {}
                            }
                          },
                        ),
                        8.h.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}

Widget _buildAppointmentItem(
    Map<String, String> appointment, colors, fonts, BuildContext context) {
  return VerifyAppointmentItem(
    hasImage: true,
    diagnosis: appointment['serviceName'] ?? '',
    procedure: appointment['specialty'] ?? '',
    doctorName: 'Dr. ${appointment['doctorName']}',
    price: appointment['price'] ?? '',
    appointmentTime:
        '${DateFormat('EEE, dd MMMM', context.locale.toString()).format(DateTime.parse(appointment['date']!))} ${appointment['time']}',
    location: appointment['location'] ?? '',
    imagePath: appointment['doctorPhoto'] ?? "",
    onCancel: () {
      AppointmentState.removeAppointment(appointment['serviceId']!);
    },
  );
}
