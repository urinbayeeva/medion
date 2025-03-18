import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
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

         return BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                   child: CButton(
  title: 'next'.tr(),
  onTap: () {
                        if (selectedList.isNotEmpty) {
                          final createPatientRequest = selectedList.map((appointment) => 
                            CreatePatientRequest((b) => b
                              ..serviceId = int.parse(appointment['serviceId']!)
                              ..companyId = int.parse(appointment['companyID']!)
                              ..doctorId = int.parse(appointment['doctorID']!)
                              ..startTime = appointment['start_time'].toString()
                              ..endTime = appointment['end_time'].toString()
                              ..date = appointment['date'].toString()
                            )).toList();

                          // context.read<BookingBloc>().add(
                          //   BookingEvent.createPatientVisit(requests: createPatientRequest),
                          // );
                        }
  },
),

                  ),
                ],
              );
            }
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
      hasImage: true,
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