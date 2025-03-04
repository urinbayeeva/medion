import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/calendar_style.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/header_style.dart';
import 'package:medion/presentation/component/table_calendar/src/shared/utils.dart';
import 'package:medion/presentation/component/table_calendar/src/table_calendar.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/application/auth/auth_bloc.dart';

class MyVisitsPage extends StatefulWidget {
  const MyVisitsPage({super.key});

  @override
  State<MyVisitsPage> createState() => _MyVisitsPageState();
}

class _MyVisitsPageState extends State<MyVisitsPage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientVisits());
    super.initState();
  }

  final DateTime firstDay = DateTime(2020, 1, 1);
  final DateTime lastDay = DateTime(2030, 1, 1);
  DateTime? selectedDate; // To track the selected date

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ThemeWrapper(
          builder: (context, colors, fonts, icons, controller) {
            return Scaffold(
              backgroundColor: colors.backgroundColor,
              body: Column(
                children: [
                  CAppBar(
                    padding: EdgeInsets.zero,
                    bottom: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomToggle(
                        iconList: [
                          Text(
                            'online'.tr(),
                            style: fonts.xSmallLink.copyWith(
                              color: colors.primary900,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'offline'.tr(),
                            style: fonts.xSmallLink.copyWith(
                              color: colors.primary900,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        current: true,
                        values: const [true, false],
                      ),
                    ),
                    bordered: true,
                    isBack: false,
                    title: "my_visits".tr(),
                    centerTitle: true,
                    trailing: GestureDetector(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: colors.shade0,
                              content: Container(
                                height: 400.h,
                                width: 560.w,
                                color: colors.shade0,
                                child: TableCalendar(
                                  locale: Localizations.localeOf(context)
                                      .toString(),
                                  rowHeight: 40,
                                  daysOfWeekHeight: 35,
                                  headerStyle: const HeaderStyle(
                                    formatButtonVisible: false,
                                    titleCentered: true,
                                  ),
                                  calendarStyle: CalendarStyle(
                                    markerSize: 48,
                                    todayDecoration: BoxDecoration(
                                      color: colors.error500,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  focusedDay: selectedDate ?? DateTime.now(),
                                  firstDay: firstDay,
                                  lastDay: lastDay,
                                  selectedDayPredicate: (day) =>
                                      isSameDay(selectedDate, day),
                                  onDaySelected: (selectedDay, _) {
                                    setState(() {
                                      selectedDate = selectedDay;
                                    });
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: icons.calendar.svg(width: 20.w, height: 20.h),
                    ),
                  ),
                  8.h.verticalSpace,
                  Expanded(
                    child: state.isLoadingVisits
                        ? Center(
                            child: CircularProgressIndicator(
                                color: colors.error500))
                        : _buildVisitsList(state, colors, fonts),
                  ),
                  80.h.verticalSpace,
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildVisitsList(AuthState state, colors, fonts) {
    final filteredVisits = selectedDate == null
        ? state.patientVisits
        : state.patientVisits
            .where((visit) =>
                visit!.visitDate! ==
                DateFormat('yyyy-MM-dd').format(selectedDate!))
            .toList();

    if (filteredVisits.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/emoji-sad_d.svg",
              width: 73.w,
              height: 75.h,
            ),
            12.h.verticalSpace,
            Text(
              selectedDate == null
                  ? "you_have_no_visits".tr()
                  : "you_have_no_visits_on".tr(namedArgs: {
                      "date":
                          DateFormat('dd MMMM yyyy', context.locale.toString())
                              .format(selectedDate!)
                    }),
              style: fonts.smallLink.copyWith(
                color: colors.neutral600,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: filteredVisits.length,
      itemBuilder: (context, index) {
        final visit = filteredVisits[index];

        return VisitInfoCard(
          onTap: () {
            context.read<BottomNavBarController>().changeNavBar(true);
            Navigator.push(
              context,
              AppRoutes.getVisitDetailPage(
                categoryName: visit!.categoryName,
                serviceName: visit.serviceName,
                doctorName: visit.doctorFullName,
                servicePrice: 10,
                visitDate: "${visit.visitDate}, ${visit.visitTime}",
                visitLocation: visit.address,
                visitStatus: visit.visitStatus,
                visitPaymentByWhom: "",
                paymentMethod: visit.paymentMethod,
                data: [visit],
                image: "",
              ),
            ).then((_) {
              context.read<BottomNavBarController>().changeNavBar(false);
            });
          },
          doctorName: visit!.doctorFullName!,
          doctorJob: visit.doctorJobName!,
          visitStatus: visit.visitStatus!,
          visitTime: visit.visitTime!,
        );
      },
    );
  }
}
