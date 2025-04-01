import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
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
  final VoidCallback onTap;
  final Set<int>? selectedServiceIds;

  const DoctorTimeAndService({
    super.key,
    required this.onTap,
    this.selectedServiceIds,
  });

  @override
  State<DoctorTimeAndService> createState() => _DoctorTimeAndServiceState();
}

class _DoctorTimeAndServiceState extends State<DoctorTimeAndService> {
  ValueNotifier<List<Map<String, String>>> selectedAppointments =
      ValueNotifier([]);

  @override
  void dispose() {
    selectedAppointments.dispose();
    super.dispose();
  }

  void addAppointment(Map<String, String> appointment) {
    if (!mounted) return;

    final serviceId = appointment['serviceId'];

    // Remove any existing appointment with the same serviceId
    selectedAppointments.value = selectedAppointments.value
        .where((a) => a['serviceId'] != serviceId)
        .toList();

    // Add the new appointment
    selectedAppointments.value = [...selectedAppointments.value, appointment];
  }

  void removeAppointment(Map<String, String> appointment) {
    if (!mounted) return;
    selectedAppointments.value =
        selectedAppointments.value.where((a) => a != appointment).toList();
    print("Removed Appointment: $appointment");
  }

  @override
  Widget build(BuildContext context) {
    List<int> serviceIds = widget.selectedServiceIds != null
        ? widget.selectedServiceIds!.toList()
        : [];

    if (serviceIds.isEmpty) {
      return Center(child: Text(serviceIds.toString()));
    }

    return FutureBuilder<List<Service>>(
      future: ApiService.fetchServices(serviceIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: Style.error500));
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No services available'));
        }

        return ThemeWrapper(
          builder: (context, colors, fonts, icons, controller) {
            return Column(
              children: [
                Expanded(
                  child: CustomListView(
                    enablePullDown: false,
                    enablePullUp: false,
                    padding: EdgeInsets.zero,
                    data: snapshot.data!,
                    itemBuilder: (index, _) {
                      final service = snapshot.data![index];

                      // Filter out doctors who have no schedules
                      final availableDoctors = service.companiesDoctors
                          .expand((company) => company.doctors)
                          .where((doctor) =>
                              doctor.schedules != null &&
                              doctor.schedules!.isNotEmpty)
                          .toList();

                      // Skip rendering if no doctors are available
                      if (availableDoctors.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (service.companiesDoctors.isNotEmpty &&
                                      service.companiesDoctors.first
                                              .companyName !=
                                          null)
                                  ? service.companiesDoctors.first.companyName!
                                  : '',
                              style: fonts.regularMain,
                            ),
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
                                          isDoctorAppointment: false,
                                          serviceName: service.serviceName,
                                          doctor: doctor,
                                          schedules: doctor.schedules ?? [],
                                          serviceId: service.serviceId,
                                          companyID: service
                                                  .companiesDoctors.isNotEmpty
                                              ? service.companiesDoctors.first
                                                  .companyId
                                                  .toString()
                                              : 'Unknown',
                                          onAppointmentSelected: (appointment) {
                                            if (appointment != null) {
                                              addAppointment(appointment);
                                            } else {
                                              print(
                                                  "⚠️ Received null appointment");
                                            }
                                          },
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
                ValueListenableBuilder<List<Map<String, String>>>(
                  valueListenable: selectedAppointments,
                  builder: (context, selectedList, _) {
                    if (selectedList.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Container(
                      decoration: BoxDecoration(
                        color: colors.shade0,
                        boxShadow: Style.shadowMMMM,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: GestureDetector(
                        onTap: () => _showAppointmentsBottomSheet(
                            context, selectedList, colors, fonts),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "count_session_selected".tr(namedArgs: {
                                    "count": selectedList.length.toString()
                                  }),
                                  style: fonts.headlineMain
                                      .copyWith(fontSize: 14.sp),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.sp,
                                  color: colors.primary900,
                                ),
                              ],
                            ),
                            12.h.verticalSpace,
                            CButton(
                              title: 'next'.tr(),
                              onTap: widget.onTap,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  void _showAppointmentsBottomSheet(BuildContext context,
      List<Map<String, String>> selectedList, dynamic colors, dynamic fonts) {
    showModalBottomSheet(
      backgroundColor: colors.shade0,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "count_session_selected"
                    .tr(namedArgs: {"count": selectedList.length.toString()}),
                style: fonts.headlineMain.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(selectedList.length, (index) {
                  final appointment = selectedList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Doctor: ${appointment['doctorName'] ?? 'Unknown'}",
                                style: fonts.xSmallLink.copyWith(
                                  color: colors.primary900,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "Time: ${appointment['time'] ?? 'Not specified'}",
                                style: fonts.xSmallLink.copyWith(
                                  color: colors.neutral500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: () {
                            // Assuming selectedAppointments is a ValueNotifier
                            selectedAppointments.value =
                                List.from(selectedAppointments.value)
                                  ..removeAt(index);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/images/trash.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
