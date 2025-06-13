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
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/doctors/widget/about_doctor_widget.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/pages/others/dicsount/discount_page.dart';
import 'package:medion/presentation/routes/routes.dart';
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
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  @override
  void initState() {
    super.initState();
    LogService.d("Fetching details for doctor ID: ${widget.id}");
    context.read<DoctorBloc>().add(DoctorEvent.fetchDoctorDetails(widget.id));
  }

  String _formatDiscountDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'дата не указана'.tr();
    }
    try {
      return _dateFormat.format(DateTime.parse(date));
    } catch (e) {
      return 'неверный формат даты'.tr();
    }
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
                      doctorID: widget.id,
                      name: widget.name,
                      profession: widget.profession,
                      specialty: widget.status,
                      image: widget.image,
                    ),
                    16.h.verticalSpace,
                    CustomTabbarBlack(tabs: [
                      "about_the_doctor".tr(),
                      "working_experience".tr(),
                      "education".tr(),
                      "working_hours".tr(),
                    ]),
                  ],
                ),
              ),
              BlocBuilder<DoctorBloc, DoctorState>(
                builder: (context, state) {
                  if (state.loading || state.doctorDetails == null) {
                    return Expanded(child: _buildShimmerView(colors));
                  }

                  final doctor = state.doctorDetails!;
                  return Expanded(
                    child: TabBarView(
                      children: [
                        _buildAboutDoctorTab(doctor, colors, fonts, icons),
                        _buildExperienceTab(doctor, colors, fonts, icons),
                        _buildEducationTab(doctor, colors, fonts, icons),
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

  Widget _buildShimmerView(dynamic colors) {
    return ShimmerView(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(
              width: 150.w,
              height: 20.h,
              borderRadius: 4.r,
              margin: EdgeInsets.only(bottom: 8.h),
            ),
            ShimmerContainer(
              width: double.infinity,
              height: 100.h,
              borderRadius: 8.r,
              margin: EdgeInsets.only(bottom: 16.h),
            ),
            Column(
              children: List.generate(
                2,
                (index) => ShimmerContainer(
                  width: double.infinity,
                  height: 80.h,
                  borderRadius: 8.r,
                  margin: EdgeInsets.only(bottom: 8.h),
                ),
              ),
            ),
            ShimmerContainer(
              width: double.infinity,
              height: 120.h,
              borderRadius: 8.r,
              margin: EdgeInsets.only(bottom: 16.h),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutDoctorTab(ModelDoctor doctor, dynamic colors, dynamic fonts, icons) {
    return doctor.education.isEmpty && doctor.experience.isEmpty && doctor.workSchedule == null
        ? SizedBox.shrink()
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "about_the_doctor".tr(),
                    style: fonts.regularSemLink,
                  ),
                ),
                8.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CContainer(
                    text: doctor.decodedDescription is String
                        ? doctor.decodedDescription.replaceAll('\n', '').trim()
                        : '',
                  ),
                ),
                _buildExperienceTab(doctor, colors, fonts, icons),
                _buildEducationTab(doctor, colors, fonts, icons),
                _buildWorkingHoursTab(doctor, colors, fonts),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.54,
                  ),
                  itemCount: doctor.discount.length,
                  itemBuilder: (context, index) {
                    final discount = doctor.discount[index];
                    final endDateFormatted = _formatDiscountDate(discount.discountEndDate?.toString());

                    return ArticleCardWidget(
                      onTap: () {
                        print("${discount.id}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiscountPage(
                              discountId: discount.id,
                            ),
                          ),
                        );
                      },
                      title: discount.title,
                      image: discount.image,
                      description: "Акция до {date}".tr(namedArgs: {"date": endDateFormatted}),
                    );
                  },
                ),
                60.h.verticalSpace,
              ],
            ),
          );
  }

  Widget _buildExperienceTab(ModelDoctor doctor, dynamic colors, dynamic fonts, dynamic icons) {
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
              final dateParts = exp.date.toString().split(" - ");
              final startDate = DateTime.parse(dateParts[0]);
              final formattedStartDate = DateFormat('d MMM yyyy').format(startDate);

              final endDate = dateParts.length > 1 && dateParts[1] == 'current'
                  ? 'current'
                  : DateFormat('d MMM yyyy').format(DateTime.parse(dateParts[1]));

              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: colors.shade0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exp.title.toString(),
                        style: fonts.xSmallText.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '- $formattedStartDate - $endDate',
                        style: fonts.xSmallText,
                      ),
                      // 8.h.verticalSpace,
                      exp.description.toString().isEmpty
                          ? const SizedBox.shrink()
                          : Text(
                              exp.description.toString(),
                              style: fonts.xSmallText,
                            ),
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

  Widget _buildEducationTab(ModelDoctor doctor, dynamic colors, dynamic fonts, dynamic icons) {
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
              final dateParts = edu.date.toString().split(" - ");
              final startDate = DateTime.parse(dateParts[0]);
              final formattedStartDate = DateFormat('d MMM yyyy').format(startDate);

              final endDate = dateParts.length > 1 && dateParts[1] == 'current'
                  ? 'current'
                  : DateFormat('d MMM yyyy').format(DateTime.parse(dateParts[1]));

              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colors.shade0,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        edu.title.toString(),
                        style: fonts.xSmallLink.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '- $formattedStartDate - $endDate',
                        style: fonts.xSmallLink,
                      ),
                      if (edu.description.toString().isNotEmpty)
                        Text(
                          edu.description.toString(),
                          style: fonts.xSmallLink,
                        ),
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

  Widget _buildWorkingHoursTab(ModelDoctor doctor, dynamic colors, dynamic fonts) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("working_hours".tr(), style: fonts.regularSemLink),
          8.h.verticalSpace,
          doctor.workSchedule != null &&
                  (doctor.workSchedule.monday.isNotEmpty ||
                      doctor.workSchedule.tuesday.isNotEmpty ||
                      doctor.workSchedule.wednesday.isNotEmpty ||
                      doctor.workSchedule.thursday.isNotEmpty ||
                      doctor.workSchedule.friday.isNotEmpty ||
                      doctor.workSchedule.saturday.isNotEmpty)
              ? _buildSchedule(doctor.workSchedule, colors, fonts)
              : SizedBox.shrink(),
          20.h.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildSchedule(WorkSchedule schedule, dynamic colors, dynamic fonts) {
    final days = [
      {'day': 'monday'.tr(), 'schedules': schedule.monday},
      {'day': 'tuesday'.tr(), 'schedules': schedule.tuesday},
      {'day': 'wednesday'.tr(), 'schedules': schedule.wednesday},
      {'day': 'thursday'.tr(), 'schedules': schedule.thursday},
      {'day': 'friday'.tr(), 'schedules': schedule.friday},
      {'day': 'saturday'.tr(), 'schedules': schedule.saturday},
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

            if (schedules.isEmpty) return const SizedBox.shrink();

            return Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xFFF9F9F9),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dayName,
                      style: fonts.mediumMain.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: colors.primary900,
                      ),
                    ),
                    ...schedules
                        .map((item) => Text(
                              item.time.toString(),
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
    return SizedBox.shrink();
  }
}
