import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/sources/screen_title.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
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
  final int? index;
  final Set<int>? selectedServiceIds; // Add this to receive IDs
  const AppointmentPage({super.key, this.index, this.selectedServiceIds});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late bool canPop;
  late DBService dbService;
  List<_AddAppointmentUseCaseModel> useCase = [];
  AddAppointmentScreenType currentScreenType =
      AddAppointmentScreenType.allServices;
  int screenIndex = 0;
  int id = 0;
  Set<int> selectedServiceIds = {}; // Store selected IDs

  List<String> listof = [
    'selecting_service_type'.tr(),
    "selecting_service".tr(),
    "selecting_the_time_the_date".tr(),
    "verify_selected".tr(),
    "payment".tr()
  ];

  late PageController _pageController;
  double turns = 0.0;
  bool changeSum = false; // Default to false (USD) until DB loads

@override
  void initState() {
    super.initState();
    screenIndex = widget.index ?? 0;
    selectedServiceIds = widget.selectedServiceIds ?? {};
    _pageController = PageController(initialPage: screenIndex);
    _initializeDBService();
    _setupUseCases();
    canPop = false;
  }

  Future<void> _initializeDBService() async {
    dbService = await DBService.create;
    setState(() {
      changeSum = dbService.getCurrencyPreference; // Update after loading
    });
  }

  void _setupUseCases() {
    useCase = [
      _AddAppointmentUseCaseModel(
          DisplayAllServicesPage(onTap: navigateToNextScreen),
          "All Services",
          AddAppointmentScreenType.allServices),
      _AddAppointmentUseCaseModel(
          SecondServicePage(
            onTap: () => navigateToNextScreen(id),
            id: 39,
            isUSD: changeSum,
          ),
          "Inner Services",
          AddAppointmentScreenType.secondService),
_AddAppointmentUseCaseModel(
          DoctorTimeAndService(
            onTap: navigateToNextScreen,
            selectedServiceIds: selectedServiceIds, // Pass IDs here
          ),
          "Doctors Time",
          AddAppointmentScreenType.doctorsTime),
      _AddAppointmentUseCaseModel(
          VerifyAppointment(onTap: navigateToNextScreen),
          "Fourth Service",
          AddAppointmentScreenType.fourthService),
      _AddAppointmentUseCaseModel(
          BlocProvider(
              create: (context) {
                DBService dbService = context.read<DBService>();
                return AuthBloc(
                  AuthRepository(dbService, AuthService.create(dbService),
                      PatientService.create(dbService), RefreshService.create(dbService)),
                  dbService,
                );
              },
              child: const PaymentPage()),
          "Payment",
          AddAppointmentScreenType.payment),
    ];
  }

  void navigateToNextScreen([int? newId]) {
    if (newId != null) {
      updateId(newId);
    }
    if (screenIndex < useCase.length - 1) {
      context.read<BookingBloc>().add(const BookingEvent.refreshServices());
      context.read<BottomNavBarController>().changeNavBar(true);
      setState(() {
        screenIndex++;
        _updateUseCaseForCurrency();
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
        _updateUseCaseForCurrency();
      });
      _pageController.animateToPage(
        screenIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateUseCaseForCurrency() {
    useCase[1] = _AddAppointmentUseCaseModel(
      SecondServicePage(
        onTap: () => navigateToNextScreen(id),
        id: id,
        isUSD: changeSum,
      ),
      "Inner Services",
      AddAppointmentScreenType.secondService,
    );
  }

  String formatNumber(dynamic number, {bool isDecimal = false}) {
    if (number == null) return isDecimal ? "0.00" : "0";

    if (isDecimal) {
      double doubleValue = (number is int) ? number.toDouble() : number as double;
      String formatted = doubleValue.toStringAsFixed(2);
      List<String> parts = formatted.split('.');
      String integerPart = parts[0];
      String decimalPart = parts.length > 1 ? parts[1] : "00";

      final buffer = StringBuffer();
      for (int i = 0; i < integerPart.length; i++) {
        if (i > 0 && (integerPart.length - i) % 3 == 0) {
          buffer.write(' ');
        }
        buffer.write(integerPart[i]);
      }
      buffer.write('.');
      buffer.write(decimalPart);
      return buffer.toString();
    } else {
      int intValue = (number is double) ? number.toInt() : number as int;
      String numberStr = intValue.toString();
      final buffer = StringBuffer();
      for (int i = 0; i < numberStr.length; i++) {
        if (i > 0 && (numberStr.length - i) % 3 == 0) {
          buffer.write(' ');
        }
        buffer.write(numberStr[i]);
      }
      return buffer.toString();
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
                          AnimatedRotation(
                              turns: turns,
                              duration: const Duration(seconds: 1),
                              child: AnimationButtonEffect(
                                  onTap: () {
                                    setState(() {
                                      turns += 2 / 4;
                                      changeSum = !changeSum;
                                      dbService.setCurrencyPreference(changeSum);
                                      _updateUseCaseForCurrency();
                                    });
                                  },
                                  child: icons.valyutaChange
                                      .svg(width: 20.w, height: 20.h))),
                          6.w.horizontalSpace,
                          icons.filter.svg(width: 20.w, height: 20.h),
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
                  children: useCase
                      .map((useCaseModel) => useCaseModel.widget)
                      .toList(),
                ),
              ),
              18.h.verticalSpace,
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