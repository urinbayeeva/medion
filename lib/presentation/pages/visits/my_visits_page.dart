import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
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
                    trailing: icons.calendar.svg(width: 24.w, height: 24.h),
                  ),
                  8.h.verticalSpace,
                  Expanded(
                    child: state.isLoadingVisits
                        ? Center(
                            child: CircularProgressIndicator(
                                color: colors.error500))
                        : state.patientVisits.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    icons.bigCalendar
                                        .svg(width: 72.w, height: 75.h),
                                    12.h.verticalSpace,
                                    Text(
                                      "you_have_no_visits".tr(),
                                      style: fonts.smallLink.copyWith(
                                        color: colors.neutral600,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                itemCount: state.patientVisits.length,
                                itemBuilder: (context, index) {
                                  final visit = state.patientVisits[index];

                                  return VisitInfoCard(
                                    onTap: () {
                                      context
                                          .read<BottomNavBarController>()
                                          .changeNavBar(true);

                                      Navigator.push(
                                        context,
                                        AppRoutes.getVisitDetailPage(
                                          categoryName: visit!.categoryName,
                                          serviceName: visit.serviceName,
                                          doctorName: visit.doctorFullName,
                                          servicePrice: 10,
                                          visitDate:
                                              "${visit.visitDate}, ${visit.visitTime}",
                                          visitLocation: visit.address,
                                          visitStatus: visit.visitStatus,
                                          visitPaymentByWhom: "",
                                          paymentMethod: visit.paymentMethod,
                                          data: [visit],
                                          image: "",
                                        ),
                                      ).then((_) {
                                        // ignore: use_build_context_synchronously
                                        context
                                            .read<BottomNavBarController>()
                                            .changeNavBar(false);
                                      });
                                    },
                                    doctorName: visit!.doctorFullName!,
                                    doctorJob: visit.doctorJobName!,
                                    visitStatus: visit.visitStatus!,
                                    visitTime: visit.visitTime!,
                                  );
                                },
                              ),
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
}
