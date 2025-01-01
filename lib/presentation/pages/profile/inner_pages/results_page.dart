import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/profile/widget/results_data_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:table_calendar/table_calendar.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  bool isAnalyse = true;

  final DateTime firstDay = DateTime(2020, 1, 1);
  final DateTime lastDay = DateTime(2030, 1, 1);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "my_results".tr(),
              centerTitle: true,
              isBack: true,
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
                            locale: "ru_RU",
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
                            focusedDay: DateTime.now(),
                            firstDay: firstDay,
                            lastDay: lastDay,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: icons.calendar.svg(width: 20.w, height: 20.h),
              ),
              bottom: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CustomToggle(
                      iconList: [
                        Text(
                          'doctors_reports'.tr(),
                          style: fonts.xSmallLink.copyWith(
                            color:
                                isAnalyse ? colors.shade0 : colors.primary900,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'analyzes'.tr(),
                          style: fonts.xSmallLink.copyWith(
                            color:
                                !isAnalyse ? colors.shade0 : colors.primary900,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          isAnalyse = value;
                        });
                      },
                      current: isAnalyse,
                      values: const [
                        true,
                        false,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: ResultsDataWidget(),
            )
          ],
        ),
      );
    });
  }
}
