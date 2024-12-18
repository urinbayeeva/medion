import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/sources/screen_title.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/component/un_focus_widget.dart';
import 'package:medion/presentation/pages/appointment/display_all_services_page.dart';
import 'package:medion/presentation/pages/appointment/doctor_time_and_service.dart';
import 'package:medion/presentation/pages/appointment/second_service_page.dart';
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

  //   void changeTap( AddAppointmentScreenType type, BuildContext context) {
  //   context.read<AddCarBloc>().add(AddCarEvent.setCreateReqValue(
  //         type: type,
  //       ));
  // }

  @override
  void initState() {
    super.initState();
    useCase = [
      _AddAppointmentUseCaseModel(DisplayAllServicesPage(
        onTap: () {
          context.read<BottomNavBarController>().changeNavBar(true);
          setState(() {
            screenIndex++;
          });
        },
      ), "All Services", AddAppointmentScreenType.allServices),
      _AddAppointmentUseCaseModel(SecondServicePage(
        onTap: () {
          context.read<BottomNavBarController>().changeNavBar(true);
          setState(() {
            screenIndex++;
          });
        },
      ), "Inner Services", AddAppointmentScreenType.secondService),
      _AddAppointmentUseCaseModel(const DoctorTimeAndService(), "Doctors Time",
          AddAppointmentScreenType.doctorsTime),
      _AddAppointmentUseCaseModel(const DoctorTimeAndService(),
          "Fourth Service", AddAppointmentScreenType.fourthService),
      _AddAppointmentUseCaseModel(const DisplayAllServicesPage(), "Payment",
          AddAppointmentScreenType.payment),
    ];
    Future.delayed(const Duration(milliseconds: 400), () {
      // context.read<BottomNavBarController>().changeNavBar(true);
    });
    canPop = false;
    super.initState();
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
                title: screenTitle[screenIndex],
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
                      .changeNavBar(screenIndex == 2 ? true : false);

                  setState(() {
                    screenIndex--;
                  });
                },
                bottom: Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Шаг ${screenIndex + 1} из 5: ',
                            style: fonts.xSmallLink.copyWith(
                                color: colors.neutral600,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' Выбор тип услуги', // Black color part
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
                child: IndexedStack(
                  index: screenIndex,
                  children: useCase.map((e) => e.widget).toList(),
                ),
              ),
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
