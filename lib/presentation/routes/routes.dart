import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/repository/booking_repository.dart';
import 'package:medion/infrastructure/repository/home_repo.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/domain/sources/doctor_appoinment_select_page.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/appointment/second_service_page.dart';
import 'package:medion/presentation/pages/core/choose_language_page.dart';
import 'package:medion/presentation/pages/core/no_connection.dart';

import 'package:medion/presentation/pages/home/directions/component/inner_pages/directions_info_page.dart';
import 'package:medion/presentation/pages/home/directions/directions_page.dart';
import 'package:medion/presentation/pages/home/doctors/all_doctors_page.dart';
import 'package:medion/presentation/pages/home/doctors/inner_page/about_doctor.dart';
import 'package:medion/presentation/pages/home/home_page.dart';
import 'package:medion/presentation/pages/home/news/news_page.dart';
import 'package:medion/presentation/pages/home/news/news_view.dart';
import 'package:medion/presentation/pages/home/notifications/notification_page.dart';
import 'package:medion/presentation/pages/main/main_page.dart';
import 'package:medion/presentation/pages/map/component/adress_view_page.dart';
import 'package:medion/presentation/pages/map/map_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/data_entry_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_with_email.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_with_phone.dart';
import 'package:medion/presentation/pages/auth/sign_up/verify_code_page.dart';
import 'package:medion/presentation/pages/onboarding/onboarding_page.dart';
import 'package:medion/presentation/pages/onboarding/splash_page.dart';
import 'package:medion/presentation/pages/others/under_dev_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/recipes_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/results_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/setting_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/user_details_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/wallet_page.dart';
import 'package:medion/presentation/pages/visits/my_visits_page.dart';

import '../../infrastructure/apis/apis.dart';

class AppRoutes {
  static PageRoute onGenerateRoute(
      {required BuildContext context,
      required bool notConnection,
      required bool isLang,
      Uri? initLink}) {
    ScreenUtil.init(context, designSize: const Size(390, 846));
    if (notConnection) {
      return getNetworkNotFound();
    } else if (!isLang) {
      return getLangPage();
    } else {
      return getMainPage(0);
    }
  }

  static MaterialPageRoute getOnboardingPage() {
    // AnalyticsService().analyzeScreenView('getNetworkNotFound');
    return MaterialPageRoute(
      builder: (_) => const OnboardingPage(),
    );
  }

  static MaterialPageRoute getNetworkNotFound() {
    // AnalyticsService().analyzeScreenView('getNetworkNotFound');
    return MaterialPageRoute(
      builder: (_) => const NoConnection(),
    );
  }

  static MaterialPageRoute getLangPage() {
    // AnalyticsService().analyzeScreenView('getLangPage');
    return MaterialPageRoute(
      builder: (_) => const ChooseLanguagePage(),
    );
  }

  // static MaterialPageRoute getSignUpPage() {
  //   return MaterialPageRoute(builder: (_) => const SignUpPage());
  // }

  // static MaterialPageRoute getSignUpWithPhone(
  //     {Function(dynamic)? onClose,
  //     bool additionalPhone = false,
  //     List<String>? phoneNumbers}) {
  //   // AnalyticsService().analyzeScreenView('singUp');
  //   return MaterialPageRoute(
  //       builder: (_) =>
  //            SignUpWithPhone(
  //             phoneNumbers: phoneNumbers,
  //             additionalPhone: additionalPhone,
  //             onClose: onClose,
  //    ) );
  // }

  static MaterialPageRoute getSignUpPage() {
    return MaterialPageRoute(builder: (_) => const SignUpPage());
  }

  static MaterialPageRoute getSignUpWithPhone(
      {Function(dynamic)? onClose,
      bool additionalPhone = false,
      List<String>? phoneNumbers}) {
    // AnalyticsService().analyzeScreenView('singUp');
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (context) {
              DBService dbService = context.read<DBService>();
              return AuthBloc(AuthRepository(
                dbService,
                AuthService.create(dbService),
              ));
            },
            child: SignUpWithPhone(
              phoneNumbers: phoneNumbers,
              additionalPhone: additionalPhone,
              onClose: onClose,
            )));
  }

  static MaterialPageRoute getSignUpPageWithEmail() {
    return MaterialPageRoute(builder: (_) => const SignUpWithEmail());
  }

  static MaterialPageRoute getVerifyCodePage(
      {required String phoneNumber,
      required String? password,
      required String autofill,
      bool additionalPhone = false}) {
    // AnalyticsService().analyzeScreenView('getFillSmsCode');
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (context) {
              DBService dbService = context.read<DBService>();
              return AuthBloc(AuthRepository(
                dbService,
                AuthService.create(dbService),
              ));
            },
            child: VerifyCodePage(
              additionalPhone: additionalPhone,
              phoneNumber: phoneNumber,
              password: password,
              autofill: autofill,
            )));
  }

  static MaterialPageRoute getDataEntryPage() {
    return MaterialPageRoute(builder: (_) => const DataEntryPage());
  }

  static MaterialPageRoute getMainPage(index) {
    return MaterialPageRoute(builder: (_) => MainPage(index: index));
  }

  static MaterialPageRoute getHomePage(index) {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (context) {
              DBService dbService = context.read<DBService>();
              return HomeBloc(
                  HomeRepository(HomePageService.create(dbService)));
            },
            child: const HomePage()));
  }

  // static MaterialPageRoute getAppoinmentPage(index) {
  //   return MaterialPageRoute(builder: (_) => const StepFirst());
  // }

  static MaterialPageRoute getMyVisitsPage(index) {
    return MaterialPageRoute(builder: (_) => const MyVisitsPage());
  }

  static MaterialPageRoute getDiresctionPage() {
    return MaterialPageRoute(builder: (_) => const DirectionsPage());
  }

  static MaterialPageRoute getDirectionInfoPage({
    required String appBarTitle,
    required String informationTitle,
    required List<Map<String, dynamic>> doctorsList,
    required String professionServiceType,
    required String price,
  }) {
    return MaterialPageRoute(
      builder: (_) => DirectionInfoPage(
        appBarTitle: appBarTitle,
        informationTitle: informationTitle,
        doctorsList: doctorsList,
        professionServiceType: professionServiceType,
        price: price,
      ),
    );
  }

  static MaterialPageRoute getDoctorAppointmentPage({
    required BuildContext context,
    required String doctorsName,
    required String doctorsJob,
    required String doctorsExperience,
    required String doctorsImage,
  }) {
    return MaterialPageRoute(
      builder: (_) => DoctorAppoinmentSelectPage(
        doctorsName: doctorsName,
        doctorsJob: doctorsJob,
        doctorsExperience: doctorsExperience,
        doctorsImage: doctorsImage,
      ),
    );
  }

  // static MaterialPageRoute getPaymentForAppoinment() {
  //   return MaterialPageRoute(builder: (_) => const StepFifth());
  // }

  static MaterialPageRoute getAllDoctorsPage() {
    return MaterialPageRoute(builder: (_) => const AllDoctorsPage());
  }

  static MaterialPageRoute getSettingsPage() {
    return MaterialPageRoute(builder: (_) => const SettingPage());
  }

  static MaterialPageRoute getWalletPage() {
    return MaterialPageRoute(builder: (_) => const WalletPage());
  }

  static MaterialPageRoute getRecipesPage() {
    return MaterialPageRoute(builder: (_) => const RecipesPage());
  }

  static MaterialPageRoute getResultsPage() {
    return MaterialPageRoute(builder: (_) => const ResultsPage());
  }

  static MaterialPageRoute getUserDetailsPage() {
    return MaterialPageRoute(builder: (_) => const UserDetailsPage());
  }

  static MaterialPageRoute getMapPage() {
    return MaterialPageRoute(builder: (_) => const MapPage());
  }

  static MaterialPageRoute getAboutDoctorPage() {
    return MaterialPageRoute(builder: (_) => const AboutDoctor());
  }

  static MaterialPageRoute getNewsPage() {
    return MaterialPageRoute(builder: (_) => const NewsPage());
  }

  static MaterialPageRoute getNewsViewPage() {
    return MaterialPageRoute(builder: (_) => const NewsView());
  }

  static MaterialPageRoute getNotificationPage() {
    return MaterialPageRoute(builder: (_) => const NotificationPage());
  }

  static MaterialPageRoute getAppointmentPage() {
    return MaterialPageRoute(builder: (_) => const AppointmentPage());
  }

  // static MaterialPageRoute getSecondServicePage(onTap, id) {
  //   return MaterialPageRoute(
  //       builder: (_) => SecondServicePage(onTap: onTap, id: id));
  // }

  static MaterialPageRoute getUnderDevPage({required appBarTitle}) {
    return MaterialPageRoute(builder: (_) {
      return UnderDevPage(appBarTitle: appBarTitle);
    });
  }

  static MaterialPageRoute getAdressViewPage() {
    return MaterialPageRoute(builder: (_) => const AdressViewPage());
  }
}
