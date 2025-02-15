import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
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

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'selected_appointments'.tr(),
                    style: fonts.mediumMain,
                  ),
                  16.h.verticalSpace,
                  ...selectedList.map((appointment) => _buildAppointmentItem(
                    appointment,
                    colors,
                    fonts,
                  )).toList(),
                  24.h.verticalSpace,
                  CButton(
                    title: 'next'.tr(),
                    onTap: onTap,
                  ),
                  16.h.verticalSpace,
                ],
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildAppointmentItem(
    Map<String, String> appointment,
     colors,
     fonts,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (appointment['doctorPhoto'] != null && appointment['doctorPhoto']!.isNotEmpty)
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(appointment['doctorPhoto']!),
              )
            else
              CircleAvatar(
                radius: 20,
                backgroundColor: colors.neutral400,
                child: Icon(Icons.person, color: colors.shade0),
              ),
            12.w.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment['serviceName'] ?? '',
                    style: fonts.smallMain.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.h.verticalSpace,
                  Text(
                    'Dr. ${appointment['doctorName']}',
                    style: fonts.smallMain,
                  ),
                  4.h.verticalSpace,
                  Text(
                    '${DateFormat('EEE, dd MMMM').format(DateTime.parse(appointment['date']!))} at ${appointment['time']}',
                    style: fonts.xSmallMain.copyWith(
                      color: colors.neutral500,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: colors.neutral500),
              onPressed: () {
                AppointmentState.removeAppointment(appointment['serviceId']!);
              },
            ),
          ],
        ),
        12.h.verticalSpace,
        CDivider(),
        12.h.verticalSpace,
      ],
    );
  }
}
