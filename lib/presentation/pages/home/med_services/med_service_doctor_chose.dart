import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/services/api_service.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/appointment/verify_appointment.dart';
import 'package:medion/presentation/pages/appointment/widget/doctors_appointment_widget.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedServiceDoctorChose extends StatefulWidget {
  final List<int>? servicesID;
  final int? doctorsID;
  final bool isHome;

  const MedServiceDoctorChose({
    super.key,
    this.servicesID,
    this.doctorsID,
    this.isHome = false,
  }) : assert(servicesID != null || doctorsID != null);

  @override
  State<MedServiceDoctorChose> createState() => _MedServiceDoctorChoseState();
}

class _MedServiceDoctorChoseState extends State<MedServiceDoctorChose> {
  ValueNotifier<List<Map<String, String>>> selectedAppointments = ValueNotifier([]);
  Future<List<Service>>? _servicesFuture;
  List<Service>? _services;
  int _selectedDay = 1; // Start with day 1

  @override
  void dispose() {
    selectedAppointments.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fetchServices(_selectedDay);
    super.initState();
  }

  void _fetchServices(int days) {
    setState(() {
      _servicesFuture = ApiService.fetchServices(
        serviceIds: widget.servicesID,
        doctorId: widget.doctorsID,
        days: days,
      );
    });
  }

  void addAppointment(Map<String, String> appointment) {
    if (!mounted) return;

    final serviceId = appointment['serviceId'];
    // Find the service to get the serviceName
    final service = _services?.firstWhere(
      (s) => s.serviceId.toString() == serviceId,
      orElse: () => Service(
        serviceId: 0,
        serviceName: 'Unknown Service',
        companiesDoctors: [],
      ),
    );

    // Add diagnosis to the appointment map
    final updatedAppointment = {
      ...appointment,
      'diagnosis': service?.serviceName ?? 'Unknown Diagnosis',
    };

    selectedAppointments.value = selectedAppointments.value.where((a) => a['serviceId'] != serviceId).toList();

    selectedAppointments.value = [...selectedAppointments.value, updatedAppointment];
  }

  void removeAppointment(Map<String, String> appointment) {
    if (!mounted) return;
    selectedAppointments.value = selectedAppointments.value
        .where((a) =>
            a['serviceId'] != appointment['serviceId'] ||
            a['time'] != appointment['time'] ||
            a['doctorName'] != appointment['doctorName'])
        .toList();
  }

  void removeAppointmentForService(String serviceId) {
    if (!mounted) return;
    selectedAppointments.value = selectedAppointments.value.where((a) => a['serviceId'] != serviceId).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.servicesID == null && widget.doctorsID == null) {
      return const Center(child: Text("No services selected"));
    }

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              widget.isHome
                  ? CAppBar(
                      title: "select_doctor_time".tr(),
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
                                  text: 'step'.tr(namedArgs: {"count": "3", "total": "5"}),
                                  style: fonts.xSmallLink
                                      .copyWith(color: colors.neutral600, fontSize: 13.sp, fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: "  ${"select_doctor_time".tr()}",
                                  style: fonts.xSmallLink
                                      .copyWith(color: colors.primary900, fontSize: 13.sp, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const CustomProgressBar(count: 3, allCount: 5),
                        ],
                      ),
                    )
                  : CAppBar(
                      title: "selecting_the_time_the_date".tr(),
                      centerTitle: true,
                      isBack: true,
                      trailing: 24.w.horizontalSpace,
                    ),
              12.h.verticalSpace,
              Expanded(
                child: FutureBuilder<List<Service>>(
                  future: _servicesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ShimmerView(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return ShimmerContainer(
                              margin: EdgeInsets.only(bottom: 12.h),
                              height: 80.h,
                              borderRadius: 8.r,
                            );
                          },
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No services available'));
                    }

                    _services = snapshot.data;

                    // Check if ALL services have no available doctors
                    // bool allServicesHaveNoDoctors = snapshot.data!.every((service) {
                    //   return service.companiesDoctors
                    //       .expand((company) => company.doctors)
                    //       .where((doctor) => doctor.schedules != null && doctor.schedules!.isNotEmpty)
                    //       .isEmpty;
                    // });

                    // if (allServicesHaveNoDoctors) {
                    //   return SizedBox(
                    //     height: MediaQuery.of(context).size.height * 0.7,
                    //     child: Center(
                    //       child: Text(
                    //         "no_result_found".tr(),
                    //         style: fonts.regularMain.copyWith(fontSize: 18.sp),
                    //       ),
                    //     ),
                    //   );
                    // }

                    return CustomListView(
                      enablePullDown: false,
                      enablePullUp: false,
                      padding: EdgeInsets.zero,
                      data: snapshot.data!,
                      itemBuilder: (index, _) {
                        final service = snapshot.data![index];

                        final availableDoctors = service.companiesDoctors
                            .expand((company) => company.doctors)
                            .where((doctor) => doctor.schedules != null && doctor.schedules!.isNotEmpty)
                            .toList();

                        if (availableDoctors.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (service.companiesDoctors.isNotEmpty &&
                                    service.companiesDoctors.first.companyName != null)
                                  Text(service.companiesDoctors.first.companyName!, style: fonts.regularMain),
                                8.h.verticalSpace,
                                CustomExpansionListTile(
                                  title: service.serviceName,
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

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (service.companiesDoctors.isNotEmpty &&
                                  service.companiesDoctors.first.companyName != null)
                                Text(service.companiesDoctors.first.companyName!, style: fonts.regularMain),
                              8.h.verticalSpace,
                              CustomExpansionListTile(
                                title: service.serviceName,
                                description: "${service.serviceId}",
                                children: service.companiesDoctors.expand((company) {
                                  return company.doctors.map(
                                    (doctor) {
                                      return DoctorAppointmentWidget(
                                        isDoctorAppointment: false,
                                        serviceName: service.serviceName,
                                        doctor: doctor,
                                        schedules: doctor.schedules ?? [],
                                        serviceId: service.serviceId,
                                        companyID: company.companyId.toString(),
                                        onAppointmentSelected: (appointment) {
                                          if (appointment != null) {
                                            addAppointment(appointment);
                                          } else {
                                            removeAppointmentForService(service.serviceId.toString());
                                          }
                                        },
                                      );
                                    },
                                  ).toList();
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                      emptyWidgetModel: null,
                      status: FormzSubmissionStatus.success,
                    );
                  },
                ),
              ),
              ValueListenableBuilder<List<Map<String, String>>>(
                valueListenable: selectedAppointments,
                builder: (context, selectedList, _) {
                  // Get all service IDs from selected appointments
                  final selectedServiceIds = selectedList.map((e) => e['serviceId']).toSet();

                  // Get all services that don't have any selected appointments
                  final unselectedServices = _services
                          ?.where((service) => !selectedServiceIds.contains(service.serviceId.toString()))
                          .toList() ??
                      [];

                  final totalSelectedServices = _services?.length ?? 0;
                  final servicesWithSessions = selectedServiceIds.length;

                  if (selectedList.isEmpty) return const SizedBox.shrink();

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
                      onTap: () => _showAppointmentsBottomSheet(context, selectedList, colors, fonts, icons),
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
                              Text("count_session_selected".tr(namedArgs: {"count": selectedList.length.toString()}),
                                  style: fonts.headlineMain.copyWith(fontSize: 16.sp)),
                              Spacer(),
                              icons.right.svg(color: colors.neutral600, width: 20.w, height: 20.h),
                            ],
                          ),
                          12.h.verticalSpace,
                          CButton(
                            title: 'continue'.tr(),
                            onTap: () {
                              if (selectedList.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VerifyAppointment(
                                      isHome: true,
                                      onTap: () {},
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('No appointment selected'.tr()),
                                  ),
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
          ),
        );
      },
    );
  }

  void _showAppointmentsBottomSheet(
    BuildContext context,
    List<Map<String, String>> selectedList,
    CustomColorSet colors,
    FontSet fonts,
    IconSet icons,
  ) {
    showModalBottomSheet(
      backgroundColor: colors.shade0,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
      builder: (context) {
        // Get all service IDs from selected appointments
        final selectedServiceIds = selectedList.map((e) => e['serviceId']).toSet();

        // Get all services that don't have any selected appointments
        final unselectedServices =
            _services?.where((service) => !selectedServiceIds.contains(service.serviceId.toString())).toList() ?? [];

        final totalSelectedServices = _services?.length ?? 0;
        final servicesWithSessions = selectedServiceIds.length;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w).copyWith(top: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(selectedList.length, (index) {
                    final appointment = selectedList[index];
                    String timeString = appointment['time'] ?? '00:00';
                    List<String> parts = timeString.split(':');
                    int hour = int.tryParse(parts[0]) ?? 0;
                    int minute = int.tryParse(parts[1]) ?? 0;

                    DateTime startTime = DateTime(0, 1, 1, hour, minute);
                    DateTime endTime = startTime.add(const Duration(minutes: 30));

                    // Use diagnosis or serviceName
                    String serviceName = appointment['diagnosis'] ?? 'Unknown Service';
                    log("Image: ${appointment['doctorPhoto']}");

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
                                  imageUrl: appointment['doctorPhoto'] ?? '',
                                ),
                              ),
                            ),
                            10.w.horizontalSpace,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appointment['doctorName'] ?? 'Unknown',
                                    style: fonts.xSmallLink.copyWith(
                                        color: colors.primary900, fontSize: 14.sp, fontWeight: FontWeight.w600),
                                  ),
                                  4.h.verticalSpace,
                                  Container(
                                      padding: EdgeInsets.all(4.w),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.r),
                                          color: const Color(0xff0E73F6).withOpacity(0.3)),
                                      child: Text(
                                        "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')} - "
                                        "${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}",
                                        style:
                                            fonts.xSmallLink.copyWith(fontSize: 12.sp, color: const Color(0xFF0E73F6)),
                                      )),
                                  4.h.verticalSpace,
                                  Text(
                                    serviceName,
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
                          child: Divider(
                            height: 1,
                            color: colors.neutral200,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],

              // Show unselected services if any exist
              if (unselectedServices.isNotEmpty) ...[
                SizedBox(height: 8.h),
                ...unselectedServices
                    .map((service) => Column(
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
                                            color: colors.primary900, fontSize: 14.sp, fontWeight: FontWeight.w600),
                                      ),
                                      4.h.verticalSpace,
                                      Container(
                                          padding: EdgeInsets.all(4.w),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30.r),
                                              color: const Color(0xffD90506).withOpacity(0.3)),
                                          child: Text(
                                            "session_is_not_selected".tr(),
                                            style: fonts.xSmallLink
                                                .copyWith(fontSize: 12.sp, color: const Color(0xFFD90506)),
                                          )),
                                      4.h.verticalSpace,
                                      Text(
                                        service.serviceName,
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
                              child: Divider(
                                height: 1,
                                color: colors.neutral200,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ],
            ],
          ),
        );
      },
    );
  }
}
