import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/table_calendar/src/table_calendar.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/build_order_list.dart';
import 'package:medion/presentation/pages/visits/widgets/build_visits_list.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyVisitsPage extends StatefulWidget {
  const MyVisitsPage({super.key});

  @override
  State<MyVisitsPage> createState() => _MyVisitsPageState();
}

class _MyVisitsPageState extends State<MyVisitsPage> {
  final RefreshController _visitController = RefreshController();
  final RefreshController _orderController = RefreshController();
  final ValueNotifier<bool> _showVisits = ValueNotifier(true);
  final ValueNotifier<DateTime?> _today = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _today.addListener(() {
      final day = _today.value?.day;
      final month = _today.value?.month;
      final year = _today.value?.year;

      if (day != null && month != null && year != null) {
        context.read<AuthBloc>().add(AuthEvent.fetchPatientVisits(time: "$day-$month-$year"));
      } else {
        context.read<AuthBloc>().add(const AuthEvent.fetchPatientVisits(time: ""));
      }
    });
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientVisits(time: ''));
  }

  @override
  void dispose() {
    _visitController.dispose();
    _orderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: colors.backgroundColor,
              body: ValueListenableBuilder(
                valueListenable: _showVisits,
                builder: (context, val, child) {
                  return Column(
                    children: [
                      CAppBar(
                        title: "my_visits".tr(),
                        centerTitle: true,
                        isBack: false,
                        trailing: WScaleAnimation(
                          child: icons.calendar.svg(width: 20.w, height: 20.h),
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              barrierColor: Colors.black.withValues(alpha: 0.5),
                              useSafeArea: true,
                              builder: (BuildContext context) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Colors.white, // or your custom color
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.55),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ValueListenableBuilder(
                                          valueListenable: _today,
                                          builder: (ctx, val, child) {
                                            final now = DateTime.now();
                                            return TableCalendar(
                                              onHeaderTapped: (DateTime time) {
                                                log("Time: $time");
                                              },
                                              onPageChanged: (DateTime time) {
                                                log("Time: $time");
                                              },
                                              selectedDayPredicate: (time) => time == _today.value,
                                              todayTap: () => _today.value = now,
                                              lastTap: () => _today.value = DateTime.now().copyWith(day: now.day - 1),
                                              allTap: () => _today.value = null,
                                              onDaySelected: (start, end) {
                                                _today.value = start;
                                              },
                                              currentDay: _today.value,
                                              focusedDay: _today.value ?? DateTime.now(),
                                              firstDay: DateTime(2020, 06, 25),
                                              lastDay: DateTime(2027, 09, 30),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        bottom: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: CustomToggle(
                            iconList: [
                              Text(
                                'Мои приемы'.tr(),
                                style: fonts.xSmallLink.copyWith(
                                  color: _showVisits.value ? colors.shade0 : colors.primary900,
                                ),
                              ),
                              Text(
                                'Мои счета'.tr(),
                                style: fonts.xSmallLink.copyWith(
                                  color: !_showVisits.value ? colors.shade0 : colors.primary900,
                                ),
                              ),
                            ],
                            onChanged: (value) => setState(() => _showVisits.value = value),
                            current: _showVisits.value,
                            values: const [true, false],
                          ),
                        ),
                      ),
                      if (_showVisits.value) ...{
                        Expanded(
                          child: BuildVisitList(
                            state: state,
                            onRefresh: () async {
                              context.read<AuthBloc>().add(const AuthEvent.fetchPatientVisits(time: ''));
                              _visitController.refreshCompleted();
                            },
                            refreshController: _visitController,
                          ),
                        )
                      } else ...{
                        Expanded(
                          child: BuildOrderList(
                            state: state,
                            onRefresh: () async {
                              context.read<AuthBloc>().add(const AuthEvent.fetchPatientVisits(time: ''));
                              _orderController.refreshCompleted();
                            },
                            refreshController: _orderController,
                          ),
                        )
                      },
                      60.h.verticalSpace,
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
