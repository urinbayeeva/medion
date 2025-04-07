import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/home/doctors/widget/about_doctor_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AboutDoctor extends StatefulWidget {
  final String? name;
  final String? profession;
  final String? status;
  final String? image;
  final int id;

  const AboutDoctor({
    super.key,
    this.name,
    this.profession,
    this.status,
    this.image,
    required this.id,
  });

  @override
  State<AboutDoctor> createState() => _AboutDoctorState();
}

class _AboutDoctorState extends State<AboutDoctor> {
  @override
  void initState() {
    super.initState();
    LogService.d("Fetching details for doctor ID: ${widget.id}");
    context.read<DoctorBloc>().add(DoctorEvent.fetchDoctorDetails(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "doctors".tr(),
                isBack: true,
                centerTitle: true,
                trailing: 24.w.horizontalSpace,
                bottom: Column(
                  children: [
                    AboutDoctorWidget(
                      name: widget.name,
                      profession: widget.profession,
                      specialty: widget.status,
                      image: widget.image,
                    ),
                    16.h.verticalSpace,
                    CustomTabbarBlack(
                      leftTab: "about_the_doctor".tr(),
                      middleTab: "working_experience".tr(),
                      nextMiddle: "education".tr(),
                      rightTab: "working_hours".tr(),
                    ),
                  ],
                ),
              ),
              BlocBuilder<DoctorBloc, DoctorState>(
                builder: (context, state) {
                  if (state.doctorDetails == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final doctor = state.doctorDetails!;
                  return Expanded(
                    child: TabBarView(
                      children: [
                        // About the Doctor tab
                        _buildAboutDoctorTab(doctor, colors, fonts, icons),

                        // Working Experience tab
                        _buildExperienceTab(doctor, colors, fonts, icons),

                        // Education tab
                        _buildEducationTab(doctor, colors, fonts, icons),

                        // Working Hours tab
                        _buildWorkingHoursTab(doctor, colors, fonts),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildAboutDoctorTab(
      ModelDoctor doctor, dynamic colors, dynamic fonts, icons) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text("about_the_doctor".tr(), style: fonts.regularSemLink),
          ),
          8.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CContainer(
                text: doctor.decodedDescription.replaceAll('\n', '').trim()),
          ),
          _buildExperienceTab(doctor, colors, fonts, icons),
          _buildEducationTab(doctor, colors, fonts, icons),
          _buildWorkingHoursTab(doctor, colors, fonts),
        ],
      ),
    );
  }

  Widget _buildExperienceTab(
      ModelDoctor doctor, dynamic colors, dynamic fonts, dynamic icons) {
    if (doctor.experience.isEmpty) {
      return _buildEmptyState(colors, fonts, icons);
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("working_experience".tr(), style: fonts.regularSemLink),
          8.h.verticalSpace,
          Column(
            children: doctor.experience.map((exp) {
              // Format the date
              final dateParts = exp.date.split(" - ");
              final startDate = DateTime.parse(dateParts[0]);
              final formattedStartDate =
                  DateFormat('d MMM yyyy').format(startDate);

              // If the date includes 'current', we leave the end date as 'current'
              final endDate = dateParts.length > 1 && dateParts[1] == 'current'
                  ? 'current'
                  : DateFormat('d MMM yyyy')
                      .format(DateTime.parse(dateParts[1]));

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: colors.shade0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exp.title,
                          style: fonts.xSmallText
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text('$formattedStartDate - $endDate',
                          style: fonts.xSmallText),
                      8.h.verticalSpace,
                      Text(exp.description, style: fonts.xSmallText),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationTab(
      ModelDoctor doctor, dynamic colors, dynamic fonts, dynamic icons) {
    if (doctor.education.isEmpty) {
      return _buildEmptyState(colors, fonts, icons);
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("education".tr(), style: fonts.regularSemLink),
          8.h.verticalSpace,
          Column(
            children: doctor.education.map((edu) {
              // Format the date
              final dateParts = edu.date.split(" - ");
              final startDate = DateTime.parse(dateParts[0]);
              final formattedStartDate =
                  DateFormat('d MMM yyyy').format(startDate);

              // If the date includes 'current', we leave the end date as 'current'
              final endDate = dateParts.length > 1 && dateParts[1] == 'current'
                  ? 'current'
                  : DateFormat('d MMM yyyy')
                      .format(DateTime.parse(dateParts[1]));

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: colors.shade0,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(edu.title,
                          style: fonts.xSmallLink
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text('$formattedStartDate - $endDate',
                          style: fonts.xSmallLink),
                      8.h.verticalSpace,
                      Text(edu.description, style: fonts.xSmallLink),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingHoursTab(
      ModelDoctor doctor, dynamic colors, dynamic fonts) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("working_hours".tr(), style: fonts.regularSemLink),
          8.h.verticalSpace,
          _buildSchedule(doctor.workSchedule, colors, fonts),
        ],
      ),
    );
  }

  Widget _buildSchedule(WorkSchedule schedule, dynamic colors, dynamic fonts) {
    final days = [
      {'day': 'Monday', 'schedules': schedule.monday},
      {'day': 'Tuesday', 'schedules': schedule.tuesday},
      {'day': 'Wednesday', 'schedules': schedule.wednesday},
      {'day': 'Thursday', 'schedules': schedule.thursday},
      {'day': 'Friday', 'schedules': schedule.friday},
      {'day': 'Saturday', 'schedules': schedule.saturday},
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: colors.shade0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: days.map((day) {
            final dayName = day['day'] as String;
            final schedules = day['schedules'] as BuiltList<ScheduleItem>;

            if (schedules.isEmpty) return SizedBox.shrink();

            return Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Color(0xFFF9F9F9),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dayName.tr(),
                      style: fonts.mediumMain.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: colors.primary900,
                      ),
                    ),
                    ...schedules
                        .map((item) => Text(
                              item.time,
                              style: fonts.regularMain.copyWith(
                                color: colors.neutral600,
                                fontSize: 13.sp,
                              ),
                            ))
                        .toList(),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildEmptyState(dynamic colors, dynamic fonts, dynamic icons) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "no_result_found".tr(),
              style: fonts.mediumMain.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
