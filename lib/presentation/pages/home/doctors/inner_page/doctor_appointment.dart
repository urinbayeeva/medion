import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/application/services/api_service.dart';
import 'package:medion/domain/models/models.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/pages/appointment/component/doctors_date_item.dart';
import 'package:medion/presentation/pages/home/doctors/widget/about_doctor_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/date_util.dart';
import 'package:provider/provider.dart';

import 'package:formz/formz.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/appointment/widget/doctors_appointment_widget.dart';
import 'package:medion/presentation/styles/style.dart';

class DoctorsAppointment extends StatefulWidget {
  final VoidCallback onTap;
  final Set<int>? selectedServiceIds;
  final String? name;
  final String? profession;
  final String? image;
  final String? specialty;

  const DoctorsAppointment({
    super.key,
    required this.onTap,
    this.selectedServiceIds,
    this.name,
    this.profession,
    this.image,
    this.specialty,
  });

  @override
  State<DoctorsAppointment> createState() => _DoctorsAppointmentState();
}

class _DoctorsAppointmentState extends State<DoctorsAppointment> {
  ValueNotifier<List<Map<String, String>>> selectedAppointments =
      ValueNotifier([]);

  @override
  void dispose() {
    selectedAppointments.dispose();
    super.dispose();
  }

  void addAppointment(Map<String, String> appointment) {
    if (!mounted) return;
    selectedAppointments.value = [...selectedAppointments.value, appointment];
    print("Added Appointment: $appointment");
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
        : [223556];

    if (serviceIds.isEmpty) {
      return Center(child: Text(serviceIds.toString()));
    }

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(children: [
            CAppBar(
              bordered: true,
              title: "doctors".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: colors.shade0,
                    width: double.infinity,
                    padding: EdgeInsets.all(8.w),
                    child: AboutDoctorWidget(
                      name: widget.name,
                      profession: widget.profession,
                      image: widget.image,
                      specialty: widget.specialty,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      icons.emojiSad.svg(width: 72.w, height: 72.h),
                      Text(
                        "no_result_found".tr(),
                        style: fonts.headlineSecondary,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            )
          ]));
    });
  }
}

//     return FutureBuilder<List<Service>>(
//       future: ApiService.fetchServices(serviceIds),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//               child: CircularProgressIndicator(color: Style.error500));
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//         if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No services available'));
//         }

//         return ThemeWrapper(
//           builder: (context, colors, fonts, icons, controller) {
//             return Scaffold(
//               backgroundColor: colors.backgroundColor,
//               body: Column(
//                 children: [
//                   CAppBar(
//                     bordered: true,
//                     title: "doctors".tr(),
//                     centerTitle: true,
//                     isBack: true,
//                     trailing: 24.w.horizontalSpace,
//                   ),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Container(
//                           color: colors.shade0,
//                           width: double.infinity,
//                           padding: EdgeInsets.all(8.w),
//                           child: AboutDoctorWidget(
//                             name: widget.name,
//                             profession: widget.profession,
//                             image: widget.image,
//                             specialty: widget.specialty,
//                           ),
//                         ),
//                         24.h.verticalSpace,
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16.w),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "choose_doctor_time".tr(),
//                                 style: fonts.smallLink.copyWith(
//                                     fontSize: 15.sp,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               Container(
//                                 height: 400.h,
//                                 padding: EdgeInsets.all(8.w),
//                                 decoration: BoxDecoration(
//                                     color: colors.shade0,
//                                     borderRadius: BorderRadius.circular(8.r)),
//                                 child: Expanded(
//                                   child: CustomListView(
//                                     enablePullDown: false,
//                                     enablePullUp: false,
//                                     padding: EdgeInsets.zero,
//                                     data: snapshot.data!,
//                                     itemBuilder: (index, _) {
//                                       final service = snapshot.data![index];

//                                       // Filter out doctors who have no schedules
//                                       final availableDoctors = service
//                                           .companiesDoctors
//                                           .expand((company) => company.doctors)
//                                           .where((doctor) =>
//                                               doctor.schedules != null &&
//                                               doctor.schedules!.isNotEmpty)
//                                           .toList();

//                                       // Skip rendering if no doctors are available
//                                       if (availableDoctors.isEmpty) {
//                                         return const SizedBox.shrink();
//                                       }

//                                       return Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 16.w),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Column(
//                                               children: service.companiesDoctors
//                                                   .expand((company) {
//                                                 return company.doctors.map(
//                                                   (doctor) {
//                                                     return DoctorAppointmentWidget(
//                                                       isDoctorAppointment: true,
//                                                       serviceName:
//                                                           service.serviceName,
//                                                       doctor: doctor,
//                                                       schedules:
//                                                           doctor.schedules ??
//                                                               [],
//                                                       serviceId:
//                                                           service.serviceId,
//                                                       companyID: service
//                                                               .companiesDoctors
//                                                               .isNotEmpty
//                                                           ? service
//                                                               .companiesDoctors
//                                                               .first
//                                                               .companyId
//                                                               .toString()
//                                                           : 'Unknown',
//                                                       onAppointmentSelected:
//                                                           (appointment) {
//                                                         if (appointment !=
//                                                             null) {
//                                                           addAppointment(
//                                                               appointment);
//                                                         } else {
//                                                           print(
//                                                               "⚠️ Received null appointment");
//                                                         }
//                                                       },
//                                                     );
//                                                   },
//                                                 ).toList();
//                                               }).toList(),
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                     },
//                                     emptyWidgetModel: null,
//                                     status: FormzSubmissionStatus.success,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
