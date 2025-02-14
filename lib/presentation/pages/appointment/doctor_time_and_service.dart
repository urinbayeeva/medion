import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/pages/appointment/component/doctors_date_item.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/date_util.dart';
import 'package:provider/provider.dart';

import '../../../application/services/api_service.dart';
import '../../../domain/models/models.dart';

import 'package:formz/formz.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/appointment/widget/doctors_appointment_widget.dart';
import 'package:medion/presentation/styles/style.dart';

class DoctorTimeAndService extends StatefulWidget {
  final int? seansCount;
  final VoidCallback onTap;

  const DoctorTimeAndService({super.key, this.seansCount, required this.onTap});

  @override
  State<DoctorTimeAndService> createState() => _DoctorTimeAndServiceState();
}

class _DoctorTimeAndServiceState extends State<DoctorTimeAndService> {
  List<Map<String, dynamic>> getAllDoctorsSchedules(List<Service> services) {
    List<Map<String, dynamic>> allSchedules = [];
    for (var service in services) {
      for (var company in service.companiesDoctors) {
        for (var doctor in company.doctors) {
          allSchedules.addAll(doctor.schedules);
        }
      }
    }
    return allSchedules;
  }

  @override
  Widget build(BuildContext context) {
    final selectedServiceIdsProvider =
        Provider.of<SelectedServiceIdsProvider>(context);

    return FutureBuilder<List<Service>>(
      future: ApiService.fetchServices(
          selectedServiceIdsProvider.selectedServiceIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: Style.error500));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ThemeWrapper(
              builder: (context, colors, fonts, icons, controller) {
            return Column(
              children: [
                // Display Selected Services

                Expanded(
                  child: CustomListView(
                    padding: EdgeInsets.zero,
                    data: snapshot.data!,
                    itemBuilder: (index, _) {
                      final service = snapshot.data![index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                service.companiesDoctors.isNotEmpty
                                    ? service.companiesDoctors.first.companyName
                                    : 'No Company',
                                style: fonts.regularMain),
                            CustomExpansionListTile(
                              title: service.serviceName,
                              description: "${service.serviceId}",
                              children: [
                                Column(
                                  children: service.companiesDoctors
                                      .expand((company) {
                                    return company.doctors.map(
                                      (doctor) {
                                        return DoctorAppointmentWidget(
                                          serviceName: service.serviceName,
                                          doctor: doctor,
                                          schedules: doctor.schedules,
                                          serviceId: service.serviceId,
                                        );
                                      },
                                    ).toList();
                                  }).toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    emptyWidgetModel: null,
                    status: FormzSubmissionStatus.success,
                  ),
                ),
                ValueListenableBuilder<Map<String, String>?>(
                  valueListenable: selectedAppointment,
                  builder: (context, selected, _) {
                    if (selected == null) {
                      return const SizedBox.shrink();
                    }

                    final selectedService = snapshot.data!
                        .where((service) =>
                            service.serviceId.toString() ==
                            selected['serviceId'])
                        .toList()
                        .firstOrNull;

                    return selectedService!.serviceId != -1
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: colors.shade0,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24.r),
                                  topRight: Radius.circular(24.r)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                          "count_session_selected"
                                              .tr(namedArgs: {"count": "${1}"}),
                                          style: fonts.xSmallLink
                                              .copyWith(fontSize: 13.sp)),
                                      leading: Container(
                                        padding: EdgeInsets.all(4.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          color: colors.shade0,
                                        ),
                                        child: Text("${snapshot.data!.length}",
                                            style: fonts.xxSmallTagSecond),
                                      ),
                                      trailing: AnimationButtonEffect(
                                        onTap: () {
                                          showModalBottomSheet(
                                            backgroundColor: colors.shade0,
                                            context: context,
                                            isDismissible: true,
                                            isScrollControlled: true,
                                            enableDrag: true,
                                            builder: (context) {
                                              return DraggableScrollableSheet(
                                                expand: false,
                                                builder: (BuildContext context,
                                                    ScrollController
                                                        scrollController) {
                                                  return SingleChildScrollView(
                                                      controller:
                                                          scrollController,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ListTile(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              title: Text(
                                                                  "count_session_selected".tr(
                                                                      namedArgs: {
                                                                        "count":
                                                                            "${1}"
                                                                      }),
                                                                  style: fonts
                                                                      .xSmallLink
                                                                      .copyWith(
                                                                          fontSize:
                                                                              13.sp)),
                                                              leading:
                                                                  Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(4
                                                                            .w),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.r),
                                                                  color: colors
                                                                      .neutral200,
                                                                ),
                                                                child: Text(
                                                                  "${snapshot.data!.length} / ${selectedAppointment.value?['selectedIdCount'] ?? '0'}",
                                                                  style: fonts
                                                                      .xxSmallTagSecond,
                                                                ),
                                                              ),
                                                            ),
                                                            8.h.verticalSpace,
                                                            Row(
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 34,
                                                                  backgroundColor:
                                                                      colors
                                                                          .neutral200,
                                                                  child: icons
                                                                      .nonUser
                                                                      .svg(),
                                                                ),
                                                                12.w.horizontalSpace,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        selectedAppointment.value![
                                                                            'doctorName']!,
                                                                        style: fonts.xSmallLink.copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize: 13.sp)),
                                                                    4.h.verticalSpace,
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .all(8
                                                                              .w),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(32.r),
                                                                        color: const Color
                                                                            .fromRGBO(
                                                                            14,
                                                                            115,
                                                                            246,
                                                                            0.07),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "${selectedAppointment.value!['time']} ${DateFormat('HH:mm').format(DateFormat('HH:mm').parse(selectedAppointment.value!['time']!).add(const Duration(minutes: 30)))}",
                                                                        style: fonts.xSmallMain.copyWith(
                                                                            color:
                                                                                Color(0xFF0E73F6),
                                                                            fontSize: 13.sp,
                                                                            fontWeight: FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                    4.h.verticalSpace,
                                                                    Text(
                                                                      selectedAppointment
                                                                              .value![
                                                                          'serviceName']!,
                                                                      style: fonts.xSmallMain.copyWith(
                                                                          fontSize: 13
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              colors.neutral500),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            8.h.verticalSpace,
                                                            CDivider(),
                                                          ],
                                                        ),
                                                      ));
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: icons.right.svg(
                                          width: 20.w,
                                          height: 20.h,
                                          color: colors.iconGreyColor,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            );
          });
        }
        return const SizedBox.shrink();
      },
    );
  }
}




// Padding(
//                             padding: EdgeInsets.all(12.w),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Selected Appointment:",
//                                     style: fonts.mediumMain),
//                                 SizedBox(height: 8.h),
//                                 Container(
//                                   padding: EdgeInsets.all(12.w),
//                                   decoration: BoxDecoration(
//                                     color: colors.primary100,
//                                     borderRadius: BorderRadius.circular(8.r),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                           "Service: ${selectedService.serviceName}",
//                                           style: fonts.smallMain),
//                                       Text("Time: ${selected['time']}",
//                                           style: fonts.smallMain),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )