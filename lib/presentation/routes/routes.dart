import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/pages/appoinment/step_first.dart';
import 'package:medion/domain/sources/doctor_appoinment_select_page.dart';
import 'package:medion/presentation/pages/appoinment/step_fifth.dart';
import 'package:medion/presentation/pages/home/directions/directions_page.dart';
import 'package:medion/presentation/pages/home/directions/component/inner_pages/directions_info_page.dart';
import 'package:medion/presentation/pages/home/doctors/all_doctors_page.dart';
import 'package:medion/presentation/pages/home/home_page.dart';
import 'package:medion/presentation/pages/main/main_page.dart';
import 'package:medion/presentation/pages/map/map_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/data_entry_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_with_email.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_with_phone.dart';
import 'package:medion/presentation/pages/auth/sign_up/verify_code_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/recipes_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/results_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/setting_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/user_details_page.dart';
import 'package:medion/presentation/pages/profile/inner_pages/wallet_page.dart';
import 'package:medion/presentation/pages/visits/my_visits_page.dart';

import '../../infrastructure/apis/apis.dart';

class AppRoutes {
  static MaterialPageRoute getOnBoardingPage({context}) {
    return MaterialPageRoute(builder: (_) => const MainPage());
  }

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
                BusinessService.create(dbService),
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

  static PageRouteBuilder getVerifyCodePage(
      {required String phoneNumber,
      required String? password,
      required String autofill,
      Function(dynamic)? onClose,
      bool additionalPhone = false}) {
    // AnalyticsService().analyzeScreenView('getFillSmsCode');
    return PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => BlocProvider(
            create: (context) {
              DBService dbService = context.read<DBService>();
              return AuthBloc(AuthRepository(
                dbService,
                AuthService.create(dbService),
                BusinessService.create(dbService),
              ));
            },
            child: VerifyCodePage(
              additionalPhone: additionalPhone,
              onClose: onClose,
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
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  static MaterialPageRoute getAppoinmentPage(index) {
    return MaterialPageRoute(builder: (_) => const StepFirst());
  }

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

  static MaterialPageRoute getPaymentForAppoinment() {
    return MaterialPageRoute(builder: (_) => const StepFifth());
  }

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
}
