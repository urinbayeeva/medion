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
  ValueNotifier<List<Map<String, String>>> selectedAppointments = ValueNotifier([]);

  @override
  void dispose() {
    selectedAppointments.dispose(); // Dispose ValueNotifier
    super.dispose();
  }

  void addAppointment(Map<String, String> appointment) {
    if (!mounted) return;
    selectedAppointments.value = [...selectedAppointments.value, appointment];
    print("Added Appointment: $appointment");
    print("Current Appointments: ${selectedAppointments.value}");
  }

  void removeAppointment(Map<String, String> appointment) {
    if (!mounted) return;
    selectedAppointments.value = selectedAppointments.value.where((a) => a != appointment).toList();
    print("Removed Appointment: $appointment");
    print("Current Appointments: ${selectedAppointments.value}");
  }

  @override
  Widget build(BuildContext context) {
    List<int> serviceIds = widget.selectedServiceIds?.toList() ?? [];

    if (serviceIds.isEmpty) {
      return const Center(child: Text('Please select services first'));
    }

    return FutureBuilder<List<Service>?>(
      future: ApiService.fetchServices(serviceIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Style.error500));
        } 
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } 
        if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(child: Text('No services available'));
        }

        return ThemeWrapper(
          builder: (context, colors, fonts, icons, controller) {
            return Column(
              children: [
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
                              (service.companiesDoctors.isNotEmpty && service.companiesDoctors.first.companyName != null)
                                  ? service.companiesDoctors.first.companyName!
                                  : 'No Company',
                              style: fonts.regularMain,
                            ),
                            CustomExpansionListTile(
                              title: service.serviceName,
                              description: "${service.serviceId}",
                              children: [
                                Column(
                                  children: service.companiesDoctors.expand((company) {
                                    return company.doctors.map(
                                      (doctor) {
                                        return DoctorAppointmentWidget(
                                          serviceName: service.serviceName,
                                          doctor: doctor,
                                          schedules: doctor.schedules ?? [], // Ensure schedules is not null
                                          serviceId: service.serviceId,
                                          companyID: service.companiesDoctors.isNotEmpty
                                              ? service.companiesDoctors.first.companyId.toString()
                                              : 'Unknown',
                                          onAppointmentSelected: (appointment) {
                                            if (!mounted) return;
                                            if (appointment != null) {
                                              addAppointment(appointment);
                                            } else {
                                              print("Received null appointment"); // Debugging output
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
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...selectedList.map((selected) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Doctor: ${selected['doctorName'] ?? 'Unknown'}",
                                    style: fonts.smallMain,
                                  ),
                                  Text(
                                    "Time: ${selected['time'] ?? 'Not specified'}",
                                    style: fonts.xSmallMain.copyWith(
                                      color: colors.neutral500,
                                    ),
                                  ),
                                  const CDivider(),
                                ],
                              );
                            }).toList(),
                            8.h.verticalSpace,
                            CButton(
                              title: 'next'.tr(),
                              onTap: widget.onTap,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
