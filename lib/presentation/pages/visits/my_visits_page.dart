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

class MyVisitsPage extends StatefulWidget {
  const MyVisitsPage({super.key});

  @override
  State<MyVisitsPage> createState() => _MyVisitsPageState();
}

class _MyVisitsPageState extends State<MyVisitsPage> {
  final ValueNotifier<bool> _showVisits = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientVisits());
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
                                        child: TableCalendar(
                                          focusedDay: DateTime.now(),
                                          firstDay: DateTime(2025, 06, 25),
                                          lastDay: DateTime(2025, 09, 30),
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
                      Expanded(child: _showVisits.value ? BuildVisitList(state: state) : BuildOrderList(state: state)),
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
