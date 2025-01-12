import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/sources/screen_title.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/component/un_focus_widget.dart';
import 'package:medion/presentation/pages/appointment/display_all_services_page.dart';
import 'package:medion/presentation/pages/appointment/doctor_time_and_service.dart';
import 'package:medion/presentation/pages/appointment/payment_page.dart';
import 'package:medion/presentation/pages/appointment/second_service_page.dart';
import 'package:medion/presentation/pages/appointment/verify_appointment.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late bool canPop;

  List<_AddAppointmentUseCaseModel> useCase = [];
  AddAppointmentScreenType currentScreenType =
      AddAppointmentScreenType.allServices;
  int screenIndex = 0;
  int id = 0;

  List<String> listof = [
    'selecting_service_type'.tr(),
    "selecting_service".tr(),
    "selecting_the_time_the_date".tr(),
    "verify_selected".tr(),
    "payment".tr()
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: screenIndex);
    useCase = [
      _AddAppointmentUseCaseModel(
          DisplayAllServicesPage(
              onTap: navigateToNextScreen, id: id, updateIdCallback: updateId),
          "All Services",
          AddAppointmentScreenType.allServices),
      _AddAppointmentUseCaseModel(
          SecondServicePage(
            onTap: () => navigateToNextScreen(id),
            id: id,
          ),
          "Inner Services",
          AddAppointmentScreenType.secondService),
      _AddAppointmentUseCaseModel(
          DoctorTimeAndService(onTap: navigateToNextScreen),
          "Doctors Time",
          AddAppointmentScreenType.doctorsTime),
      _AddAppointmentUseCaseModel(
          VerifyAppointment(onTap: navigateToNextScreen),
          "Fourth Service",
          AddAppointmentScreenType.fourthService),
      _AddAppointmentUseCaseModel(
          const PaymentPage(), "Payment", AddAppointmentScreenType.payment),
    ];
    canPop = false;
  }

  void navigateToNextScreen([int? newId]) {
    if (newId != null) {
      updateId(newId);
    }
    if (screenIndex < useCase.length - 1) {
      context.read<BottomNavBarController>().changeNavBar(true);
      setState(() {
        screenIndex++;
      });
      _pageController.animateToPage(
        screenIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void updateId(int newId) {
    setState(() {
      id = newId;
    });
  }

  void navigateBack() {
    if (screenIndex > 0) {
      setState(() {
        screenIndex--;
      });
      _pageController.animateToPage(
        screenIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Style.dark,
      child: ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return OnUnFocusTap(
            child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: screenTitle[screenIndex].tr(),
                centerTitle: true,
                trailing: screenIndex == 1
                    ? Row(
                        children: [
                          icons.valyutaChange.svg(),
                          4.w.horizontalSpace,
                          icons.filter.svg(),
                        ],
                      )
                    : screenIndex == 2 || screenIndex == 3
                        ? icons.filter.svg()
                        : 24.w.horizontalSpace,
                isBack: screenIndex == 0 ? false : true,
                onTap: () {
                  context
                      .read<BottomNavBarController>()
                      .changeNavBar(screenIndex >= 2 ? true : false);

                  navigateBack();
                },
                bottom: Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'step'.tr(namedArgs: {
                              "count": "5",
                              "total": "${screenIndex + 1}"
                            }),
                            style: fonts.xSmallLink.copyWith(
                                color: colors.neutral600,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: listof[screenIndex],
                            style: fonts.xSmallLink.copyWith(
                                color: colors.primary900,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    CustomProgressBar(
                      count: screenIndex + 1,
                      allCount: useCase.length,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: useCase.map((e) => e.widget).toList(),
                ),
              ),
              20.h.verticalSpace,
            ],
          ),
        ));
      }),
    );
  }
}

class _AddAppointmentUseCaseModel {
  final Widget widget;
  final String title;
  final AddAppointmentScreenType type;

  _AddAppointmentUseCaseModel(
    this.widget,
    this.title,
    this.type,
  );
}

enum AddAppointmentScreenType {
  allServices,
  secondService,
  doctorsTime,
  fourthService,
  payment
}
