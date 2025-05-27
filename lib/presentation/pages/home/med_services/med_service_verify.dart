import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_payment.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:intl/intl.dart';
import 'package:medion/utils/constants.dart';

class MedServiceVerify extends StatefulWidget {
  final String diagnosName;
  final String serviceName;
  final String doctorName;
  final String servicePrice;
  final String selectedTime;
  final String selectedLocation;
  final String doctorImage;
  final bool isHome;

  const MedServiceVerify({
    super.key,
    required this.diagnosName,
    required this.serviceName,
    required this.doctorName,
    required this.servicePrice,
    required this.selectedTime,
    required this.selectedLocation,
    required this.doctorImage,
    this.isHome = false,
  });

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

          return Scaffold(
            backgroundColor: colors.backgroundColor,
            body: Column(
              children: [
                widget.isHome
                    ? CAppBar(
                        title: "confirmation_of_appointment".tr(),
                        isBack: true,
                        centerTitle: true,
                        trailing: 24.w.horizontalSpace,
                        bottom: Column(
                          spacing: 8.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'step'.tr(namedArgs: {
                                      "count": "4",
                                      "total": "5"
                                    }),
                                    style: fonts.xSmallLink.copyWith(
                                        color: colors.neutral600,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text:
                                        "  ${"confirmation_of_appointment".tr()}",
                                    style: fonts.xSmallLink.copyWith(
                                        color: colors.primary900,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const CustomProgressBar(
                              count: 4,
                              allCount: 5,
                            ),
                          ],
                        ),
                      )
                    : CAppBar(
                        title: "selecting_the_time_the_date".tr(),
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
                        title: 'continue'.tr(),
                        onTap: () async {
                          if (selectedList.isNotEmpty) {
                            final appointment = selectedList.first;
                            final success =
                                await sendVisitRequest(appointment, context);
                            if (success && mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedServicePayment(
                                    diagnosis: widget.diagnosName,
                                    procedure: widget.serviceName,
                                    doctorName: widget.doctorName,
                                    price: widget.servicePrice,
                                    appointmentTime: widget.selectedTime,
                                    location: widget.selectedLocation,
                                    imagePath: widget.doctorImage,
                                  ),
                                ),
                              );
                            }
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
        },
      );
    });
  }

  Widget _buildAppointmentItem(Map<String, String> appointment, dynamic colors,
      dynamic fonts, BuildContext context) {
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

  Future<bool> sendVisitRequest(
      Map<String, String> appointment, BuildContext context) async {
    try {
      final dbService = await DBService.create;
      final token = dbService.token;

      if (token.accessToken == null || token.accessToken!.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('authentication_required'.tr())),
          );
        }
        return false;
      }

      final requestBody = jsonEncode([
        {
          "service_id": int.tryParse(appointment['serviceId'] ?? '0') ?? 0,
          "company_id": 0,
          "doctor_id": int.tryParse(appointment['doctorId'] ?? '0') ?? 0,
          "start_time": appointment['time'] ?? '',
          "end_time": appointment['time'] ?? '',
          "date": appointment['date'] ?? '',
        }
      ]);

      final response = await http.post(
        Uri.parse("${Constants.baseUrlP}/apiweb/create_visit"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': '${token.tokenType} ${token.accessToken}',
        },
        body: requestBody,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        return true;
      } else {
        // Handle error
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('appointment_failed'.tr())),
          );
        }
        return false;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('error_occurred'.tr())),
        );
      }
      return false;
    }
  }
}
