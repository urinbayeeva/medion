import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/pages/appointment/component/doctors_date_item.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

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
  late Future<List<Service>> futureServices;

  @override
  void initState() {
    super.initState();
    futureServices = ApiService().fetchServices([2492]);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: FutureBuilder<List<Service>>(
            future: futureServices,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colors.error500,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('no_data_found'.tr()));
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: CustomListView(
                        padding: EdgeInsets.zero,
                        itemBuilder: (int serviceIndex, _) {
                          Service service = snapshot.data![serviceIndex];
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var companyDoctor
                                    in service.companiesDoctors ?? []) ...[
                                  Text(companyDoctor.companyName ?? "",
                                      style: fonts.regularMain),
                                  8.h.verticalSpace,
                                  if (companyDoctor.doctor != null &&
                                      companyDoctor.doctor!.isNotEmpty)
                                  CustomExpansionListTile(
  title: service.serviceName ?? 'No Service Name',
  description: "",
  children: service.companiesDoctors?.map((companyDoctor) {
    return DoctorAppointmentWidget(doctor: companyDoctor); // Pass doctor data
  }).toList() ?? [],
)

                                  else
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      child: Text("No available doctors",
                                          style: fonts.xSmallMain),
                                    ),
                                  24.h.verticalSpace,
                                ]
                              ]);
                        },
                        data: snapshot.data!,
                        emptyWidgetModel: ErrorWidgetModel(
                          title: "title",
                          subtitle: "subtitle",
                        ),
                        status: FormzSubmissionStatus.success,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      );
    });
  }
}




//  children: service.companiesDoctors
//                                     ?.map((companyDoctor) {
//                                   return DoctorAppointmentWidget(
//                                     // Pass any required parameters here
//                                   );
//                                 }).toList() ??
//                                 [],
//                           );