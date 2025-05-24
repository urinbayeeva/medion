// ignore_for_file: use_build_context_synchronously

import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/application/visit/visit_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/pages/appointment/payment_page.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';
import 'package:provider/provider.dart';

class VerifyAppointment extends StatefulWidget {
  final bool isHome;
  final VoidCallback onTap;

  const VerifyAppointment({
    super.key,
    required this.onTap,
    this.isHome = false,
  });

  @SemanticsHintOverrides()
  State<VerifyAppointment> createState() => _VerifyAppointmentState();
}

class _VerifyAppointmentState extends State<VerifyAppointment> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ValueListenableBuilder<List<Map<String, String>>>(
        valueListenable: AppointmentState.selectedAppointments,
        builder: (context, selectedList, _) {
          if (selectedList.isEmpty) {
            Navigator.pop(context);
          }

          return BlocBuilder<VisitBloc, VisitState>(builder: (context, state) {
            return Column(
              children: [
                if (widget.isHome) ...[
                  CAppBar(
                    title: "verify_selected".tr(),
                    centerTitle: true,
                    isBack: true,
                    trailing: 24.w.horizontalSpace,
                  ),
                ],
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
                  child: CButton(
                    title: 'next'.tr(),
                    onTap: () async {
                      if (selectedList.isNotEmpty) {
                        final appointment = selectedList.first;
                        final success =
                            await sendVisitRequest(appointment, context);
                        print("VISIT DATA: ${appointment}");
                        if (success) {
                          if (widget.isHome) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PaymentPage(
                                          isHome: true,
                                        )));
                          } else {
                            widget.onTap();
                          }
                        }
                      }
                    },
                  ),
                ),
                6.h.verticalSpace,
              ],
            );
          });
        },
      );
    });
  }

  Widget _buildAppointmentItem(
      Map<String, String> appointment, colors, fonts, BuildContext context) {
    return VerifyAppointmentItem(
      hasImage: true,
      diagnosis: appointment['service_name'] ?? '',
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
}

Future<bool> sendVisitRequest(
    Map<String, String> appointment, BuildContext context) async {
  final dbService = await DBService.create;
  final token = dbService.token.accessToken;

  if (token == null || token.isEmpty) {
    print("Error: No token found.");
    EasyLoading.showError("Token not found");
    return false;
  }

  final url = Uri.parse('${Constants.baseUrlP}/create_visit');

  final requestBody = [
    {
      "service_id": int.parse(appointment['serviceId']!),
      "company_id": int.parse(appointment['companyID']!),
      "doctor_id": int.parse(appointment['doctorID']!),
      "start_time": appointment['start_time']!,
      "end_time": appointment['end_time']!,
      "date": appointment['date']!,
    }
  ];

  print("REQUEST BODY: ${requestBody}");
  try {
    EasyLoading.show(status: "Loading...");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body);

      String paymeUrl = "";
      String clickUrl = "";
      String multicardUrl = "";

      for (var item in responseBody) {
        if (item is Map<String, dynamic>) {
          if (item.containsKey("payme_url")) {
            paymeUrl = item["payme_url"];
          }
          if (item.containsKey("click_url")) {
            clickUrl = item["click_url"];
          }
          if (item.containsKey("multicard_url")) {
            multicardUrl = item["multicard_url"];
          }
        }
      }

      // Store payment URLs in the provider
      Provider.of<PaymentProvider>(context, listen: false)
          .setPaymentUrls(paymeUrl, clickUrl, multicardUrl);

      Future.delayed(Duration.zero, () {
        showAppointmentConfirmedDialog(context);
      });

      print("Visit created successfully: $responseBody");
      return true; // Success
    } else {
      print("Error: ${response.statusCode}, ${response.body}");
      try {
        final errorResponse = jsonDecode(response.body);
        if (errorResponse is Map<String, dynamic> &&
            errorResponse.containsKey("detail") &&
            errorResponse["detail"] is Map<String, dynamic> &&
            errorResponse["detail"].containsKey("error")) {
          EasyLoading.showError(errorResponse["detail"]["error"]);
        } else {
          EasyLoading.showError("Failed to create visit");
        }
      } catch (_) {
        EasyLoading.showError("Failed to create visit");
      }
      return false; // Failure
    }
  } catch (e) {
    print("Exception: $e");
    EasyLoading.showError("Something went wrong");
    return false; // Failure
  } finally {
    EasyLoading.dismiss();
  }
}

void showAppointmentConfirmedDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      Future.delayed(const Duration(seconds: 2), () {
        if (Navigator.canPop(dialogContext)) {
          Navigator.of(dialogContext).pop();
        }
      });

      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red.shade400,
              radius: 28,
              child: SvgPicture.asset("assets/icons/done.svg"),
            ),
            const SizedBox(height: 20),
            Text(
              'your_appointment_has_been_confirmed'.tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'you_can_keep_track_your_appoinment'.tr(),
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
    },
  );
}
