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
  final String price;
  final String location;
  final String imagePath;
  final String doctorName;
  final String serviceName;
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

                                final list = appointments.where((item) {
                                  final doctorID = item.doctorID > 0;
                                  final serviceID = item.serviceId > 0;
                                  return doctorID && serviceID || true;
                                }).map((a) {
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
                                });

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
                      20.h.verticalSpace
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
