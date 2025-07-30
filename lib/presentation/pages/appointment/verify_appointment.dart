// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/payment_provider.dart';
import 'package:medion/application/visit/visit_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/payment_page.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';
import 'package:medion/utils/extensions.dart';
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
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return ValueListenableBuilder<List<Map<String, String>>>(
          valueListenable: AppointmentState.selectedAppointments,
          builder: (context, selectedList, _) {
            if (selectedList.isEmpty) {
              Navigator.pop(context);
            }

            return BlocBuilder<VisitBloc, VisitState>(
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: colors.backgroundColor,
                  body: Column(
                    children: [
                      if (widget.isHome) ...[
                        CAppBar(
                          title: "verify_selected".tr(),
                          centerTitle: true,
                          isBack: true,
                          trailing: 24.w.horizontalSpace,
                        ),
                      ] else
                        const SafeArea(child: SizedBox.shrink()),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                            child: Column(
                              children: selectedList
                                  .map((appointment) => _buildAppointmentItem(
                                        appointment,
                                        colors,
                                        fonts,
                                        icons,
                                        context,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(color: colors.shade0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).copyWith(top: 10.h),
                          child: CButton(
                            title: 'next'.tr(),
                            onTap: () async {
                              if (selectedList.isNotEmpty) {
                                final appointment = selectedList.first;
                                final success = await sendVisitRequest(appointment, context);
                                print("VISIT DATA: ${appointment}");
                                if (success) {
                                  if (widget.isHome) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PaymentPage(
                                          isHome: true,
                                        ),
                                      ),
                                    );
                                  } else {
                                    widget.onTap();
                                  }
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildAppointmentItem(Map<String, String> appointment, colors, fonts, icons, BuildContext context) {
    return AppointmentCard(
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
}

Future<bool> sendVisitRequest(Map<String, String> appointment, BuildContext context) async {
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
      Provider.of<PaymentProvider>(context, listen: false).setPaymentUrls(paymeUrl, clickUrl, multicardUrl);

      Future.delayed(Duration.zero, () {
        showAppointmentConfirmedDialog(context);
      });

      print("Visit created successfully: $responseBody");
      return true; // Success
    } else {
      print("Error: ${response.statusCode}, ${response.body}");
      try {
        final errorResponse = jsonDecode(response.body);

        const specificMessage =
            "This Patient already has a visit for the selected doctor on this date. You can't create another visit.";

        if (response.statusCode == 400 &&
            errorResponse is Map<String, dynamic> &&
            errorResponse["detail"] == specificMessage) {
          EasyLoading.showError('visit_already_exists'.tr());
        } else if (errorResponse is Map<String, dynamic> && errorResponse.containsKey("detail")) {
          EasyLoading.showError(errorResponse["detail"].toString());
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

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.diagnosis,
    required this.procedure,
    required this.doctorName,
    required this.price,
    required this.appointmentTime,
    required this.location,
    required this.imagePath,
    required this.onCancel,
    this.hasImage = true,
  });

  final String diagnosis;
  final String procedure;
  final String doctorName;
  final String price;
  final String appointmentTime;
  final String location;
  final String imagePath;
  final VoidCallback onCancel;
  final bool? hasImage;

  String _formatNumber(String numberString) {
    final number = (double.tryParse(numberString) ?? 0).toStringAsFixed(0);
    final result = number.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ').trim();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime appointmentDateTime = DateTime.tryParse(appointmentTime) ?? DateTime.now();

    final dateFormatted = DateFormat('EEEE, d MMMM', 'ru').format(appointmentDateTime);
    final timeFormatted = DateFormat('HH:mm', 'ru').format(appointmentDateTime);

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          width: 1.sw,
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: colors.shade0,
            border: Border.all(color: colors.neutral200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: colors.shade0,
                  border: Border.all(color: colors.neutral300),
                ),
                child: CachedImageComponent(
                  borderRadius: 8.r,
                  height: 50.w,
                  width: 50.w,
                  imageUrl: imagePath,
                ),
              ),
              12.w.horizontalSpace,
              SizedBox(
                width: 1.sw - 155.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "diagnosis",
                          maxLines: 2,
                          style: fonts.smallMain.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: colors.primary900,
                          ),
                        ),
                        GestureDetector(
                          onTap: onCancel,
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            child: icons.cancel.svg(
                              width: 20.w,
                              height: 20.h,
                              color: colors.neutral600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    4.h.verticalSpace,
                    Text(
                      procedure,
                      style: fonts.smallMain.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.neutral600,
                      ),
                    ),
                    8.h.verticalSpace,
                    // // Doctor Info
                    const CDivider(),
                    Text(
                      doctorName,
                      style: fonts.smallMain.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: colors.primary900,
                      ),
                    ),
                    4.h.verticalSpace,
                    Text(
                      "sum".tr(namedArgs: {"amount": _formatNumber(price)}),
                      style: fonts.smallMain.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.neutral600,
                      ),
                    ),
                    8.h.verticalSpace,
                    const CDivider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4.h,
                      children: [
                        _buildInfoRow(
                          icon: icons.calendar.svg(width: 16.w, height: 16.h, color: colors.neutral500),
                          text: dateFormatted.toCapitalized(),
                          colors: colors,
                          fonts: fonts,
                        ),
                        _buildInfoRow(
                          icon: icons.clock.svg(width: 16.w, height: 16.h, color: colors.neutral500),
                          text: timeFormatted.toCapitalized(),
                          colors: colors,
                          fonts: fonts,
                        ),
                        _buildInfoRow(
                          icon: icons.mapPin.svg(width: 16.w, height: 16.h, color: colors.neutral500),
                          text: location,
                          colors: colors,
                          fonts: fonts,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Expanded(
        //           child: Text(
        //             diagnosis,
        //             maxLines: 2,
        //             style: fonts.smallMain.copyWith(
        //               fontSize: 15.sp,
        //               fontWeight: FontWeight.w600,
        //               color: colors.primary900,
        //             ),
        //           ),
        //         ),
        //         GestureDetector(
        //           onTap: onCancel,
        //           child: Container(
        //             padding: EdgeInsets.all(4.w),
        //             child: icons.cancel.svg(
        //               width: 20.w,
        //               height: 20.h,
        //               color: colors.neutral600,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     4.h.verticalSpace,
        //     Text(
        //       procedure,
        //       style: fonts.smallMain.copyWith(
        //         fontSize: 13.sp,
        //         fontWeight: FontWeight.w400,
        //         color: colors.neutral600,
        //       ),
        //     ),
        //     8.h.verticalSpace,
        //     // // Doctor Info
        //     const CDivider(),
        //     Text(
        //       doctorName,
        //       style: fonts.smallMain.copyWith(
        //         fontSize: 15.sp,
        //         fontWeight: FontWeight.w600,
        //         color: colors.primary900,
        //       ),
        //     ),
        //     4.h.verticalSpace,
        //     Text(
        //       "sum".tr(namedArgs: {"amount": _formatNumber(price)}),
        //       style: fonts.smallMain.copyWith(
        //         fontSize: 13.sp,
        //         fontWeight: FontWeight.w400,
        //         color: colors.neutral600,
        //       ),
        //     ),
        //     8.h.verticalSpace,
        //     const CDivider(),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisSize: MainAxisSize.min,
        //       spacing: 4.h,
        //       children: [
        //         _buildInfoRow(
        //           icon: icons.calendar.svg(width: 16.w, height: 16.h, color: colors.neutral500),
        //           text: dateFormatted.toCapitalized(),
        //           colors: colors,
        //           fonts: fonts,
        //         ),
        //         _buildInfoRow(
        //           icon: icons.clock.svg(width: 16.w, height: 16.h, color: colors.neutral500),
        //           text: timeFormatted.toCapitalized(),
        //           colors: colors,
        //           fonts: fonts,
        //         ),
        //         _buildInfoRow(
        //           icon: icons.mapPin.svg(width: 16.w, height: 16.h, color: colors.neutral500),
        //           text: location,
        //           colors: colors,
        //           fonts: fonts,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      },
    );
  }

  Widget _buildInfoRow({
    required Widget icon,
    required String text,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        8.w.horizontalSpace,
        Expanded(
          child: Text(
            text,
            style: fonts.smallMain.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: colors.neutral600,
            ),
          ),
        ),
      ],
    );
  }
}
