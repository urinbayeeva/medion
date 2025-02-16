import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VerifyAppointment extends StatelessWidget {
  final VoidCallback onTap;
  
  const VerifyAppointment({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ValueListenableBuilder<List<Map<String, String>>>(
        valueListenable: AppointmentState.selectedAppointments,
        builder: (context, selectedList, _) {
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

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: selectedList.map((appointment) => _buildAppointmentItem(
                        appointment,
                        colors,
                        fonts,
                        context
                      )).toList(),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h, // Added vertical padding
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colors.shade0,
               
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: CButton(
                  title: 'next'.tr(),
                  onTap: onTap,
                ),
              ),
            ],
          );
        },
      );
    });
  }

  Widget _buildAppointmentItem(
    Map<String, String> appointment,
    colors,
    fonts,
    BuildContext context
  ) {
    return VerifyAppointmentItem(
      diagnosis: appointment['serviceName'] ?? '',
      procedure: appointment['specialty'] ?? '',
      doctorName: 'Dr. ${appointment['doctorName']}',
      price: appointment['price'] ?? '',
appointmentTime: '${DateFormat('EEE, dd MMMM', context.locale.toString()).format(DateTime.parse(appointment['date']!))} ${appointment['time']}',
      location: appointment['location'] ?? '',
      imagePath: '', 
      onCancel: () {
        AppointmentState.removeAppointment(appointment['serviceId']!);
      },
    );
  }
}