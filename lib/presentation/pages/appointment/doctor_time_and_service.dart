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
  @override
  Widget build(BuildContext context) {
    final selectedServiceIdsProvider =
        Provider.of<SelectedServiceIdsProvider>(context);
    return FutureBuilder<List<Service>>(
      future: ApiService.fetchServices(
          selectedServiceIdsProvider.selectedServiceIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ThemeWrapper(
              builder: (context, colors, fonts, icons, controller) {
            return CustomListView(
              padding: EdgeInsets.zero,
              data: snapshot.data!,
              itemBuilder: (index, _) {
                final service = snapshot.data![index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.h.verticalSpace,
                      Text(
                          service.companiesDoctors.isNotEmpty
                              ? (index < service.companiesDoctors.length
                                  ? service.companiesDoctors[index].companyName
                                  : 'No company name available')
                              : 'No company name',
                          style: fonts.regularMain),
                      12.h.verticalSpace,
                      Column(
                        children: service.companiesDoctors.expand((company) {
                          return [
                            ...company.doctors.map(
                              (doctor) {
                                return DoctorAppointmentWidget(
                                    doctor: doctor,
                                    schedules: doctor.schedules);
                              },
                            )
                          ];
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
              emptyWidgetModel: ErrorWidgetModel(
                title: "title",
                subtitle: "subtitle",
              ),
              status: FormzSubmissionStatus.success,
            );
          });
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}
