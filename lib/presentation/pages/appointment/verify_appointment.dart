// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/visit/visit_bloc.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/appointment/payment_page.dart';
import 'package:medion/presentation/pages/appointment/widget/appointment_card.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AppointmentItem {
  final String time;
  final String date;
  final String startTime;
  final String endTime;
  final String serviceName;
  final String doctorName;
  final String price;
  final String location;
  final String imagePath;
  final String specialty;
  final int serviceId;
  final int doctorID;
  final int companyID;
  final int? orderDetailId;

  const AppointmentItem({
    required this.doctorName,
    required this.price,
    required this.location,
    required this.imagePath,
    required this.time,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.serviceId,
    required this.serviceName,
    required this.specialty,
    required this.doctorID,
    required this.companyID,
    this.orderDetailId,
  });
}

class VerifyAppointment extends StatefulWidget {
  final bool isHome;
  final VoidCallback onTap;
  final BookingBloc bloc;

  const VerifyAppointment({
    super.key,
    required this.onTap,
    this.isHome = false,
    required this.bloc,
  });

  @SemanticsHintOverrides()
  State<VerifyAppointment> createState() => _VerifyAppointmentState();
}

class _VerifyAppointmentState extends State<VerifyAppointment> {
  late final VisitBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<VisitBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocConsumer<BookingBloc, BookingState>(
          listenWhen: (o, n) {
            final appointments = o.selectedAppointments != n.selectedAppointments;
            return appointments;
          },
          listener: (context, state) {
            final list = state.selectedAppointments;
            if (list.isEmpty) {
              Navigator.of(context).pop();
            }
          },
          buildWhen: (o, n) {
            final appointment = o.selectedAppointments != n.selectedAppointments;
            return appointment;
          },
          builder: (x, bookingState) {
            return BlocConsumer<VisitBloc, VisitState>(
              bloc: _bloc,
              listenWhen: (o, n) {
                final status = o.createVisitStatus != n.createVisitStatus;
                final data = o.visits != n.visits;
                return status || data;
              },
              listener: (ctx, lState) {
                if (lState.createVisitStatus.isSuccess) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return PaymentPage(
                      bloc: widget.bloc,
                      appointments: bookingState.selectedAppointments,
                      isHome: true,
                    );
                  }));
                }
              },
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
                      ] else ...{
                        const SafeArea(child: SizedBox.shrink()),
                      },
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                            child: Column(
                              children: bookingState.selectedAppointments
                                  .map((appointment) => _buildAppointmentItem(
                                        appointment: appointment,
                                        colors: colors,
                                        fonts: fonts,
                                        icons: icons,
                                        context: context,
                                        bloc: widget.bloc,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(color: colors.shade0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.h).copyWith(top: 10.h),
                          child: CButton(
                            title: '',
                            onTap: () {
                              if (bookingState.selectedAppointments.isNotEmpty) {
                                final appointments = bookingState.selectedAppointments;
                                final l = EasyLocalization.of(context)?.locale ?? const Locale('ru', 'RU');

                                final list = appointments.map((a) {
                                  return VisitRequest(
                                    (e) => e
                                      ..orderDetailId = (a.orderDetailId == -1) ? null : a.orderDetailId
                                      ..serviceId = a.serviceId
                                      ..companyId = a.companyID
                                      ..doctorId = a.doctorID
                                      ..date = a.date
                                      ..endTime = a.endTime
                                      ..langCode = l.toString()
                                      ..startTime = a.startTime,
                                  );
                                }).toList();
                                _bloc.add(VisitEvent.createVisit(request: <VisitRequest>[...list]));
                              }
                            },
                            child: Center(
                              child: (state.createVisitStatus.isInProgress)
                                  ? CupertinoActivityIndicator(color: colors.shade0)
                                  : Text(
                                      'next'.tr(),
                                      style: fonts.smallMain.copyWith(color: colors.shade0, fontSize: 14.sp),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      10.h.verticalSpace
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

  Widget _buildAppointmentItem({
    required AppointmentItem appointment,
    required CustomColorSet colors,
    required FontSet fonts,
    required IconSet icons,
    required BuildContext context,
    required BookingBloc bloc,
  }) {
    final date = DateFormat('EEE, dd MMMM', context.locale.toString()).format(DateTime.parse(appointment.date));
    return AppointmentCard(
      hasImage: true,
      diagnosis: appointment.serviceName,
      procedure: appointment.specialty,
      doctorName: 'Dr. ${appointment.doctorName}',
      price: appointment.price,
      appointmentTime: '$date ${appointment.time}',
      location: appointment.location,
      imagePath: appointment.imagePath,
      onCancel: () {
        bloc.add(BookingEvent.removeAppointment(serviceId: appointment.serviceId));
        // AppointmentState.removeAppointment(appointment['serviceId']!);
      },
    );
  }
}
// final success = await sendVisitRequest(appointment, context);

// if (success) {
//   if (widget.isHome) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             PaymentPage(
//               bloc: widget.bloc,
//               appointments: widget.appointments,
//               isHome: true,
//             ),
//       ),
//     );
//   } else {
//     widget.onTap();
//   }
// }
///
// Future<bool> sendVisitRequest(AppointmentItem appointment, BuildContext context) async {
//   final dbService = await DBService.create;
//   final token = dbService.token.accessToken;
//
//   if (token == null || token.isEmpty) {
//     print("Error: No token found.");
//     EasyLoading.showError("Token not found");
//     return false;
//   }
//
//   final url = Uri.parse('${Constants.baseUrlP}/create_visit');
//   log("service id: ${appointment.serviceId}");
//   log("company id: ${appointment.companyID}");
//   log("doctor id: ${appointment.doctorID}");
//   log("Start time: ${appointment.startTime}");
//   log("End time: ${appointment.endTime}");
//   log("date: ${appointment.date}");
//
//   final requestBody = [
//     {
//       "service_id": appointment.serviceId,
//       "company_id": appointment.companyID,
//       "doctor_id": appointment.doctorID,
//       "start_time": appointment.startTime,
//       "end_time": appointment.endTime,
//       "date": appointment.date,
//     }
//   ];
//
//   print("REQUEST BODY: ${requestBody}");
//   try {
//     EasyLoading.show(status: "Loading...");
//
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: jsonEncode(requestBody),
//     );
//
//     if (response.statusCode == 200) {
//       final List<dynamic> responseBody = jsonDecode(response.body);
//
//       String paymeUrl = "";
//       String clickUrl = "";
//       String multicardUrl = "";
//
//       for (var item in responseBody) {
//         if (item is Map<String, dynamic>) {
//           if (item.containsKey("payme_url")) {
//             paymeUrl = item["payme_url"];
//           }
//           if (item.containsKey("click_url")) {
//             clickUrl = item["click_url"];
//           }
//           if (item.containsKey("multicard_url")) {
//             multicardUrl = item["multicard_url"];
//           }
//         }
//       }
//
//       // Store payment URLs in the provider
//       Provider.of<PaymentProvider>(context, listen: false).setPaymentUrls(paymeUrl, clickUrl, multicardUrl);
//
//       Future.delayed(Duration.zero, () {
//         showAppointmentConfirmedDialog(context);
//       });
//
//       print("Visit created successfully: $responseBody");
//       return true; // Success
//     } else {
//       print("Error: ${response.statusCode}, ${response.body}");
//       try {
//         final errorResponse = jsonDecode(response.body);
//
//         const specificMessage =
//             "This Patient already has a visit for the selected doctor on this date. You can't create another visit.";
//
//         if (response.statusCode == 400 &&
//             errorResponse is Map<String, dynamic> &&
//             errorResponse["detail"] == specificMessage) {
//           EasyLoading.showError('visit_already_exists'.tr());
//         } else if (errorResponse is Map<String, dynamic> && errorResponse.containsKey("detail")) {
//           EasyLoading.showError(errorResponse["detail"].toString());
//         } else {
//           EasyLoading.showError("Failed to create visit");
//         }
//       } catch (_) {
//         EasyLoading.showError("Failed to create visit");
//       }
//       return false; // Failure
//     }
//   } catch (e) {
//     print("Exception: $e");
//     EasyLoading.showError("Something went wrong");
//     return false; // Failure
//   } finally {
//     EasyLoading.dismiss();
//   }
// }

// void showAppointmentConfirmedDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext dialogContext) {
//       Future.delayed(const Duration(seconds: 2), () {
//         if (Navigator.canPop(dialogContext)) {
//           Navigator.of(dialogContext).pop();
//         }
//       });
//
//       return AlertDialog(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         contentPadding: const EdgeInsets.all(24),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircleAvatar(
//               backgroundColor: Colors.red.shade400,
//               radius: 28,
//               child: SvgPicture.asset("assets/icons/done.svg"),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'your_appointment_has_been_confirmed'.tr(),
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 12),
//             Text(
//               'you_can_keep_track_your_appoinment'.tr(),
//               style: TextStyle(fontSize: 14, color: Colors.black54),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       );
//     },de
//   );
// }
