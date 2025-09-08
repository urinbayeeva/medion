import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/appointment/verify_appointment.dart';
import 'package:medion/presentation/pages/appointment/widget/doctors_appointment_widget.dart';
import 'package:medion/presentation/pages/home/med_services/widgets/custom_app_bar.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SelectedServices {
  final int serviceId;

  // this is need for recommendation page
  final int? orderDetailId;

  const SelectedServices({required this.serviceId, this.orderDetailId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedServices && runtimeType == other.runtimeType && serviceId == other.serviceId;

  @override
  int get hashCode => serviceId.hashCode;
}

class MedServiceDoctorChose extends StatefulWidget {
  final List<SelectedServices> servicesIDes;
  final int? doctorsID;
  final bool isHome;
  final BookingBloc? bloc;

  const MedServiceDoctorChose({
    super.key,
    required this.servicesIDes,
    this.doctorsID,
    this.isHome = false,
    this.bloc,
  }) : assert(servicesIDes != null || doctorsID != null);

  @override
  State<MedServiceDoctorChose> createState() => _MedServiceDoctorChoseState();
}

class _MedServiceDoctorChoseState extends State<MedServiceDoctorChose> {
  late final BookingBloc _bloc;

  @override
  void initState() {
    if (widget.bloc != null) {
      _bloc = widget.bloc!;
    } else {
      _bloc = context.read<BookingBloc>();
    }
    List<SelectedServices> allId = widget.servicesIDes;
    List<int> serviceIdes = allId.map((e) => e.serviceId).toList();

    _bloc.add(BookingEvent.fetchThirdBookingServices(request: serviceIdes));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controllers) {
        if (widget.servicesIDes.isEmpty && widget.doctorsID == null) {
          return Scaffold(
            appBar: CustomAppBar(
              isHome: widget.isHome,
              title: "select_doctor_time".tr(),
              back: () => Navigator.of(context).pop(),
              colors: colors,
              icons: icons,
              fonts: fonts,
            ),
            backgroundColor: colors.backgroundColor,
            body: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 130.h),
                child: EmptyState(title: "no_services_available".tr()),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: CustomAppBar(
            isHome: widget.isHome,
            title: "select_doctor_time".tr(),
            back: () => Navigator.of(context).pop(),
            colors: colors,
            icons: icons,
            fonts: fonts,
          ),
          body: BlocBuilder<BookingBloc, BookingState>(
            bloc: _bloc,
            buildWhen: (o, n) {
              final status = o.getDoctorsStatus != n.getDoctorsStatus;
              final service = o.thirdBookingServices != n.thirdBookingServices;
              final selected = o.selectedAppointments != n.selectedAppointments;
              final appointments = o.selectedAppointments != n.selectedAppointments;
              return status || service || selected || appointments;
            },
            builder: (context, state) {
              if (state.getDoctorsStatus.isInitial || state.getDoctorsStatus.isInProgress) {
                return ShimmerView(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ShimmerContainer(
                        margin: EdgeInsets.only(bottom: 12.h, top: index == 0 ? 10.h : 0),
                        height: 80.h,
                        borderRadius: 8.r,
                      );
                    },
                  ),
                );
              }

              /// need open the comment
              /// then delete default data
              final failure = state.getDoctorsStatus.isFailure;
              final empty =
                  state.thirdBookingServices?.services == null || state.thirdBookingServices!.services!.isEmpty;

              if (failure || empty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_services_available".tr()),
                  ),
                );
              }

              //...?defaultServices.services
              final services = [
                ...?state.thirdBookingServices?.services,
              ];

              // Check if ALL services have no available doctors
              bool allServicesHaveNoDoctors = services.every((service) {
                return [...?service.companies]
                    .expand((company) => company.doctors ?? <ThirdBookingDoctor>[])
                    .where((doctor) => doctor.schedules != null && doctor.schedules!.isNotEmpty)
                    .isEmpty;
              });

              if (allServicesHaveNoDoctors) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: EmptyState(
                      title: "no_result_found".tr(),
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  10.h.verticalSpace,
                  Expanded(
                    child: ListView.builder(
                      itemCount: services.length,
                      itemBuilder: (context, builderIndex) {
                        final ThirdBookingService service = services[builderIndex];
                        final List<ThirdBookingCompany> companies = <ThirdBookingCompany>[...?service.companies];

                        final availableDoctors = service.companies!
                            .expand((company) => company.doctors ?? <ThirdBookingDoctor>[])
                            .where((doctor) => doctor.schedules != null && doctor.schedules!.isNotEmpty)
                            .toList();

                        if (availableDoctors.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (companies.isNotEmpty && companies.first.companyName != null) ...{
                                  Text(companies.first.companyName!, style: fonts.regularMain),
                                },
                                8.h.verticalSpace,
                                CustomExpansionListTile(
                                  key: UniqueKey(),
                                  title: service.serviceName ?? '',
                                  description: "${service.serviceId}",
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 16.h),
                                        child: Text(
                                          "no_result_found".tr(),
                                          style: fonts.regularMain.copyWith(fontSize: 16.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        return CustomExpansionListTile(
                          title: service.serviceName ?? '',
                          description: "${service.serviceId}",
                          children: [
                            DoctorAppointmentWidget(
                              serviceType: service.serviceType ?? '',
                              service: service,
                              bloc: _bloc,
                              isDoctorAppointment: false,
                              serviceName: service.serviceName,
                              // doctor: service.,
                              // schedules: <ThirdBookingDoctorSchedule>[...?doctor.schedules],
                              serviceId: service.serviceId,
                              // companyID: company.companyId,
                              orderDetailId: widget.servicesIDes,
                              onAppointmentSelected: (appointment) {
                                if (appointment != null) {
                                  _bloc.add(BookingEvent.addAppointment(appointment: appointment));
                                } else {
                                  // _bloc.add(
                                  // BookingEvent.removeAppointment(serviceId: company.companyId ?? -1),
                                  // );
                                }
                              },
                            ),
                          ],
                          // children: companies.expand<Widget>((company) {
                          //   return <ThirdBookingDoctor>[...(company.doctors ?? [])].map<Widget>(
                          //     (doctor) {
                          //       return DoctorAppointmentWidget(
                          //         service: service,
                          //         bloc: _bloc,
                          //         isDoctorAppointment: false,
                          //         serviceName: service.serviceName,
                          //         doctor: doctor,
                          //         schedules: <ThirdBookingDoctorSchedule>[...?doctor.schedules],
                          //         serviceId: service.serviceId,
                          //         companyID: company.companyId,
                          //         orderDetailId: widget.servicesIDes,
                          //         onAppointmentSelected: (appointment) {
                          //           if (appointment != null) {
                          //             _bloc.add(BookingEvent.addAppointment(appointment: appointment));
                          //           } else {
                          //             _bloc.add(
                          //               BookingEvent.removeAppointment(serviceId: company.companyId ?? -1),
                          //             );
                          //           }
                          //         },
                          //       );
                          //     },
                          //   ).toList();
                          // }).toList(),
                        );

                        // return Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       if (companies.isNotEmpty && companies.first.companyName != null) ...{
                        //         Text(companies.first.companyName!, style: fonts.regularMain),
                        //       },
                        //       8.h.verticalSpace,
                        //       CustomExpansionListTile(
                        //         title: service.serviceName ?? '',
                        //         description: "${service.serviceId}",
                        //         children: companies.expand<Widget>((company) {
                        //           return <ThirdBookingDoctor>[...(company.doctors ?? [])].map<Widget>(
                        //             (doctor) {
                        //               return DoctorAppointmentWidget(
                        //                 bloc: _bloc,
                        //                 isDoctorAppointment: false,
                        //                 serviceName: service.serviceName,
                        //                 doctor: doctor,
                        //                 schedules: <ThirdBookingDoctorSchedule>[...?doctor.schedules],
                        //                 serviceId: service.serviceId,
                        //                 companyID: company.companyId,
                        //                 orderDetailId: widget.servicesIDes,
                        //                 onAppointmentSelected: (appointment) {
                        //                   if (appointment != null) {
                        //                     _bloc.add(BookingEvent.addAppointment(appointment: appointment));
                        //                   } else {
                        //                     _bloc.add(
                        //                       BookingEvent.removeAppointment(serviceId: company.companyId ?? -1),
                        //                     );
                        //                   }
                        //                 },
                        //               );
                        //             },
                        //           ).toList();
                        //         }).toList(),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                    ),
                    // child: CustomListView(
                    //   enablePullDown: false,
                    //   enablePullUp: false,
                    //   padding: EdgeInsets.zero,
                    //   data: services,
                    //   itemBuilder: (index, _) {
                    //     final ThirdBookingService service = services[index];
                    //     log("Service type ---- ${services.length} ----- ${_.serviceType}");
                    //     log("Service type ---- ${service.serviceType}");
                    //     final List<ThirdBookingCompany> companies = <ThirdBookingCompany>[...?service.companies];
                    //
                    //     final availableDoctors = service.companies!
                    //         .expand((company) => company.doctors ?? <ThirdBookingDoctor>[])
                    //         .where((doctor) => doctor.schedules != null && doctor.schedules!.isNotEmpty)
                    //         .toList();
                    //
                    //     if (availableDoctors.isEmpty) {
                    //       return Padding(
                    //         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             if (companies.isNotEmpty && companies.first.companyName != null) ...{
                    //               Text(companies.first.companyName!, style: fonts.regularMain),
                    //             },
                    //             8.h.verticalSpace,
                    //             CustomExpansionListTile(
                    //               title: service.serviceName ?? '',
                    //               description: "${service.serviceId}",
                    //               children: [
                    //                 Center(
                    //                   child: Padding(
                    //                     padding: EdgeInsets.symmetric(vertical: 16.h),
                    //                     child: Text(
                    //                       "no_result_found".tr(),
                    //                       style: fonts.regularMain.copyWith(fontSize: 16.sp),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     }
                    //     return CustomExpansionListTile(
                    //       title: service.serviceName ?? '',
                    //       description: "${service.serviceId}",
                    //       children: companies.expand<Widget>((company) {
                    //         return <ThirdBookingDoctor>[...(company.doctors ?? [])].map<Widget>(
                    //           (doctor) {
                    //             return DoctorAppointmentWidget(
                    //               service: service,
                    //               bloc: _bloc,
                    //               isDoctorAppointment: false,
                    //               serviceName: service.serviceName,
                    //               doctor: doctor,
                    //               schedules: <ThirdBookingDoctorSchedule>[...?doctor.schedules],
                    //               serviceId: service.serviceId,
                    //               companyID: company.companyId,
                    //               orderDetailId: widget.servicesIDes,
                    //               onAppointmentSelected: (appointment) {
                    //                 if (appointment != null) {
                    //                   _bloc.add(BookingEvent.addAppointment(appointment: appointment));
                    //                 } else {
                    //                   _bloc.add(
                    //                     BookingEvent.removeAppointment(serviceId: company.companyId ?? -1),
                    //                   );
                    //                 }
                    //               },
                    //             );
                    //           },
                    //         ).toList();
                    //       }).toList(),
                    //     );
                    //
                    //     // return Padding(
                    //     //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                    //     //   child: Column(
                    //     //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     //     children: [
                    //     //       if (companies.isNotEmpty && companies.first.companyName != null) ...{
                    //     //         Text(companies.first.companyName!, style: fonts.regularMain),
                    //     //       },
                    //     //       8.h.verticalSpace,
                    //     //       CustomExpansionListTile(
                    //     //         title: service.serviceName ?? '',
                    //     //         description: "${service.serviceId}",
                    //     //         children: companies.expand<Widget>((company) {
                    //     //           return <ThirdBookingDoctor>[...(company.doctors ?? [])].map<Widget>(
                    //     //             (doctor) {
                    //     //               return DoctorAppointmentWidget(
                    //     //                 bloc: _bloc,
                    //     //                 isDoctorAppointment: false,
                    //     //                 serviceName: service.serviceName,
                    //     //                 doctor: doctor,
                    //     //                 schedules: <ThirdBookingDoctorSchedule>[...?doctor.schedules],
                    //     //                 serviceId: service.serviceId,
                    //     //                 companyID: company.companyId,
                    //     //                 orderDetailId: widget.servicesIDes,
                    //     //                 onAppointmentSelected: (appointment) {
                    //     //                   if (appointment != null) {
                    //     //                     _bloc.add(BookingEvent.addAppointment(appointment: appointment));
                    //     //                   } else {
                    //     //                     _bloc.add(
                    //     //                       BookingEvent.removeAppointment(serviceId: company.companyId ?? -1),
                    //     //                     );
                    //     //                   }
                    //     //                 },
                    //     //               );
                    //     //             },
                    //     //           ).toList();
                    //     //         }).toList(),
                    //     //       ),
                    //     //     ],
                    //     //   ),
                    //     // );
                    //   },
                    //   emptyWidgetModel: null,
                    //   status: FormzSubmissionStatus.success,
                    // ),
                  ),
                  Builder(
                    builder: (context) {
                      // Get all service IDs from selected appointments
                      final selectedServiceIds = state.selectedAppointments.map((e) => e.serviceId).toSet();
                      final totalSelectedServices = services.length;
                      final servicesWithSessions = selectedServiceIds.length;

                      if (services.isEmpty) return const SizedBox.shrink();

                      return Container(
                        decoration: BoxDecoration(
                          color: colors.shade0,
                          boxShadow: Style.shadowMMMM,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        child: GestureDetector(
                          onTap: () => _showAppointmentsBottomSheet(
                            context: context,
                            selectedList: state.selectedAppointments,
                            colors: colors,
                            fonts: fonts,
                            icons: icons,
                            services: services,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: colors.neutral400,
                                    ),
                                    child: Text(
                                      "$servicesWithSessions/$totalSelectedServices",
                                      style: fonts.xSmallText.copyWith(fontSize: 11.sp, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  4.w.horizontalSpace,
                                  Text(
                                    "count_session_selected".tr(
                                      namedArgs: {"count": state.selectedAppointments.length.toString()},
                                    ),
                                    style: fonts.headlineMain.copyWith(fontSize: 16.sp),
                                  ),
                                  const Spacer(),
                                  icons.right.svg(color: colors.neutral600, width: 20.w, height: 20.h),
                                ],
                              ),
                              12.h.verticalSpace,
                              CButton(
                                title: 'continue'.tr(),
                                onTap: () {
                                  if (state.selectedAppointments.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VerifyAppointment(
                                          bloc: _bloc,
                                          isHome: true,
                                          onTap: () {},
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('No appointment selected'.tr())),
                                    );
                                  }
                                },
                              ),
                              12.h.verticalSpace,
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _showAppointmentsBottomSheet({
    required BuildContext context,
    required List<AppointmentItem> selectedList,
    required CustomColorSet colors,
    required FontSet fonts,
    required IconSet icons,
    required List<ThirdBookingService> services,
  }) {
    showModalBottomSheet(
      backgroundColor: colors.shade0,
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(minHeight: 0.3.sh),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
      builder: (context) {
        // Get all service IDs from selected appointments
        final selectedServiceIds = selectedList.map((e) => e.serviceId).toSet();

        // Get all services that don't have any selected appointments
        final unselectedServices =
            services.where((service) => !selectedServiceIds.contains(service.serviceId)).toList();

        final totalSelectedServices = services.length;
        final servicesWithSessions = selectedServiceIds.length;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w).copyWith(top: 10.h),
          child: Container(
            constraints: BoxConstraints(maxHeight: 0.7.sh, minHeight: 0.2.sh),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: colors.neutral400,
                        ),
                        child: Text("$servicesWithSessions/$totalSelectedServices", style: fonts.xSmallText.copyWith()),
                      ),
                      4.w.horizontalSpace,
                      Text(
                        "count_session_selected".tr(namedArgs: {"count": selectedList.length.toString()}),
                        style: fonts.headlineMain.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  // Show selected appointments
                  if (selectedList.isNotEmpty) ...[
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: selectedList.length,
                        itemBuilder: (context, index) {
                          final appointment = selectedList[index];
                          String timeString = appointment.time;
                          List<String> parts = timeString.split(':');
                          int hour = int.tryParse(parts[0]) ?? 0;
                          int minute = int.tryParse(parts[1]) ?? 0;

                          DateTime startTime = DateTime(0, 1, 1, hour, minute);
                          DateTime endTime = startTime.add(const Duration(minutes: 30));

                          // Use diagnosis or serviceName
                          String name =
                              appointment.serviceName.isNotEmpty ? appointment.serviceName : 'Unknown Service';
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: colors.neutral300.withValues(alpha: 0.8),
                                    radius: 34.r,
                                    child: ClipOval(
                                      child: CachedImageComponent(
                                        height: 68.h,
                                        width: 68.w,
                                        imageUrl: appointment.imagePath,
                                      ),
                                    ),
                                  ),
                                  10.w.horizontalSpace,
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          appointment.doctorName,
                                          style: fonts.xSmallLink.copyWith(
                                            color: colors.primary900,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        4.h.verticalSpace,
                                        Container(
                                          padding: EdgeInsets.all(4.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.r),
                                            color: const Color(0xff0E73F6).withValues(alpha: 0.3),
                                          ),
                                          child: Text(
                                            "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')} - "
                                            "${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}",
                                            style: fonts.xSmallLink
                                                .copyWith(fontSize: 12.sp, color: const Color(0xFF0E73F6)),
                                          ),
                                        ),
                                        4.h.verticalSpace,
                                        Text(
                                          name,
                                          style: fonts.xSmallLink.copyWith(
                                            color: colors.neutral500,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Divider after each appointment
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Divider(height: 1, color: colors.neutral200),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                  // Show unselected services if any exist
                  if (unselectedServices.isNotEmpty) ...[
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: unselectedServices.length,
                        itemBuilder: (context, index) {
                          final service = unselectedServices[index];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: colors.neutral300,
                                    radius: 34.r,
                                    child: ClipOval(child: IconSet.create.nonUser.svg()),
                                  ),
                                  10.w.horizontalSpace,
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "choose_seans_for_this".tr(),
                                          style: fonts.xSmallLink.copyWith(
                                            color: colors.primary900,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        4.h.verticalSpace,
                                        Container(
                                          padding: EdgeInsets.all(4.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.r),
                                            color: const Color(0xffD90506).withValues(alpha: 0.3),
                                          ),
                                          child: Text(
                                            "session_is_not_selected".tr(),
                                            style: fonts.xSmallLink.copyWith(
                                              fontSize: 12.sp,
                                              color: const Color(0xFFD90506),
                                            ),
                                          ),
                                        ),
                                        4.h.verticalSpace,
                                        Text(
                                          service.serviceName ?? "",
                                          style: fonts.xSmallLink.copyWith(
                                            color: colors.neutral500,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Divider(height: 1, color: colors.neutral200),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
