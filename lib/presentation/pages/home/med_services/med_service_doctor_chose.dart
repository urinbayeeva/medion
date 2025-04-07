import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/services/api_service.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/appointment/widget/doctors_appointment_widget.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_verify.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedServiceDoctorChose extends StatefulWidget {
  final List<int> servicesID;
  const MedServiceDoctorChose({super.key, required this.servicesID});

  @override
  State<MedServiceDoctorChose> createState() => _MedServiceDoctorChoseState();
}

class _MedServiceDoctorChoseState extends State<MedServiceDoctorChose> {
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
    final updatedList =
        selectedAppointments.value.where((a) => a != appointment).toList();
    if (updatedList.length != selectedAppointments.value.length) {
      selectedAppointments.value = updatedList;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.servicesID.isEmpty) {
      return Center(child: Text("No services selected"));
    }

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "selecting_the_time_the_date".tr(),
                centerTitle: true,
                isBack: true,
                trailing: 24.w.horizontalSpace,
              ),
              12.h.verticalSpace,
              Expanded(
                child: FutureBuilder<List<Service>>(
                  future: ApiService.fetchServices(widget.servicesID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child:
                              CircularProgressIndicator(color: Style.error500));
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No services available'));
                    }

                    return CustomListView(
                      enablePullDown: false,
                      enablePullUp: false,
                      padding: EdgeInsets.zero,
                      data: snapshot.data!,
                      itemBuilder: (index, _) {
                        final service = snapshot.data![index];

                        final availableDoctors = service.companiesDoctors
                            .expand((company) => company.doctors)
                            .where((doctor) =>
                                doctor.schedules != null &&
                                doctor.schedules!.isNotEmpty)
                            .toList();

                        if (availableDoctors.isEmpty)
                          return const SizedBox.shrink();

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (service.companiesDoctors.isNotEmpty &&
                                  service.companiesDoctors.first.companyName !=
                                      null)
                                Text(
                                    service.companiesDoctors.first.companyName!,
                                    style: fonts.regularMain),
                              8.h.verticalSpace,
                              CustomExpansionListTile(
                                title: service.serviceName,
                                description: "${service.serviceId}",
                                children:
                                    service.companiesDoctors.expand((company) {
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
                              Icon(Icons.arrow_forward_ios,
                                  size: 16.sp, color: colors.primary900),
                            ],
                          ),
                          12.h.verticalSpace,
                          // Replace the current CButton onTap code with this:
                          CButton(
                            title: 'next'.tr(),
                            onTap: () {
                              if (selectedList.isNotEmpty) {
                                final appointment = selectedList.first;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MedServiceVerify(
                                      doctorImage:
                                          appointment['doctorPhoto'] ?? "",
                                      diagnosName:
                                          appointment['category_name'] ?? '',
                                      serviceName:
                                          appointment['serviceName'] ?? '',
                                      doctorName:
                                          appointment['doctorName'] ?? '',
                                      servicePrice:
                                          appointment['servicePrice'] ?? '',
                                      selectedTime: appointment['time'] ?? '',
                                      selectedLocation:
                                          appointment['location'] ?? '',
                                      // Add any additional fields you need
                                    ),
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

  void _showAppointmentsBottomSheet(BuildContext context,
      List<Map<String, String>> selectedList, dynamic colors, dynamic fonts) {
    showModalBottomSheet(
      backgroundColor: colors.shade0,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
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
                  style: fonts.headlineMain.copyWith(fontSize: 16.sp)),
              SizedBox(height: 10.h),
              Column(
                children: List.generate(selectedList.length, (index) {
                  final appointment = selectedList[index];
                  String timeString = appointment['time']!;
                  List<String> parts = timeString.split(':');
                  int hour = int.parse(parts[0]);
                  int minute = int.parse(parts[1]);

                  DateTime startTime = DateTime(0, 1, 1, hour, minute);
                  DateTime endTime = startTime.add(Duration(minutes: 30));
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: colors.neutral500,
                          radius: 34.r,
                          child: ClipOval(
                            child: CachedImageComponent(
                              height: 68.h, // slightly smaller than the avatar
                              width: 68.w,
                              imageUrl: appointment['doctorPhoto']!,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appointment['doctorName'] ?? 'Unknown',
                                style: fonts.xSmallLink.copyWith(
                                    color: colors.primary900,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      color:
                                          Color(0xff0E73F6).withOpacity(0.3)),
                                  child: Text(
                                    "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')} - "
                                    "${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}",
                                    style: fonts.xSmallLink.copyWith(
                                        fontSize: 12.sp,
                                        color: Color(0xFF0E73F6)),
                                  )),
                              Text(
                                "Test Description",
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
