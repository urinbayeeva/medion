import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/calendar_style.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/header_style.dart';
import 'package:medion/presentation/component/table_calendar/src/shared/utils.dart';
import 'package:medion/presentation/component/table_calendar/src/table_calendar.dart';
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
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

  bool current = true;

  final DateTime firstDay = DateTime(2020, 1, 1);
  final DateTime lastDay = DateTime(2030, 1, 1);
  DateTime? selectedDate;

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
                                    Navigator.pop(context);
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
                  SizedBox(height: 8.h),
                  Expanded(
                    child: state.isLoadingVisits
                        ? Center(
                            child: CircularProgressIndicator(
                                color: colors.error500))
                        : _buildVisitsList(state, colors, fonts),
                  ),
                  SizedBox(height: 80.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildVisitsList(AuthState state, colors, fonts) {
    // Group visits by date
    final Map<String, List<dynamic>> groupedVisits = {};

    for (final visit in state.patientVisits) {
      if (visit != null) {
        final visitDate = visit.visits.first.visitDate!;
        groupedVisits.putIfAbsent(visitDate, () => []);
        groupedVisits[visitDate]!.add(visit);
      }
    }

    // Filter by selected date if one is selected
    final filteredVisits = selectedDate == null
        ? groupedVisits
        : {
            DateFormat('yyyy-MM-dd').format(selectedDate!):
                groupedVisits[DateFormat('yyyy-MM-dd').format(selectedDate!)] ??
                    []
          };

    if (filteredVisits.isEmpty ||
        filteredVisits.values.every((list) => list.isEmpty)) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/emoji-sad_d.svg",
              width: 73.w,
              height: 75.h,
            ),
            SizedBox(height: 12.h),
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

    // Sort dates in chronological order
    final sortedDates = filteredVisits.keys.toList()
      ..sort((a, b) => a.compareTo(b));

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        final date = sortedDates[index];
        final visitsForDate = filteredVisits[date]!;
        final formattedDate =
            DateFormat('dd MMMM yyyy').format(DateTime.parse(date));

        return AnimationButtonEffect(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.all(12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${"order".tr()}: ${state.patientVisits[index]!.orderNumber}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                12.h.verticalSpace,
                ...visitsForDate.map((visit) {
                  final visitData = visit.visits.first;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VisitInfoCard(
                        onTap: () {
                          context
                              .read<BottomNavBarController>()
                              .changeNavBar(true);
                          Navigator.push(
                            context,
                            AppRoutes.getVisitDetailPage(
                              longitude: visitData.longitude,
                              latitude: visitData.latitude,
                              categoryName: visitData.categoryName,
                              serviceName: visitData.serviceName,
                              doctorName: visitData.doctorFullName,
                              servicePrice: 10,
                              visitDate:
                                  "${visitData.visitDate}, ${visitData.visitTime}",
                              visitLocation: visitData.address,
                              visitStatus: visitData.paymentStatus,
                              visitPaymentByWhom: "",
                              paymentMethod: visitData.paymentMethod,
                              data: [visit],
                              image: visitData.imageUrl,
                            ),
                          ).then((_) {
                            context
                                .read<BottomNavBarController>()
                                .changeNavBar(false);
                          });
                        },
                        doctorJob: visitData.doctorSpecialization ?? "N/A",
                        doctorName: visitData.doctorFullName ?? "N/A",
                        visitDate: visitData.visitDate,
                        serviceName: visitData.serviceName,
                        visitTime: visitData.visitTime,
                        visitStatus: visitData.paymentStatus == "paid"
                            ? "Paid"
                            : "Not Paid",
                        image: visitData.imageUrl,
                        categoryName: visitData.categoryName,
                      ),
                      12.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedDate,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(true);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentWebView(
                                    isInvoice: true,
                                    url: visit.orderCheckPdfUrl,
                                  ),
                                ),
                              ).then((_) {
                                context
                                    .read<BottomNavBarController>()
                                    .changeNavBar(false);
                              });
                            },
                            child: Text(
                              "open_invoice".tr(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Style.error500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      4.h.verticalSpace,
                      if (visit != visitsForDate.last)
                        Divider(
                          color: colors.neutral300,
                          height: 16.h,
                        ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
