import 'package:flutter/material.dart';
import 'package:medion/presentation/pages/appoinment/appoinment.dart';
import 'package:medion/presentation/pages/appoinment/component/doctor_appoinment_select_page.dart';
import 'package:medion/presentation/pages/appoinment/payment/payment_for_the_appoinment.dart';
import 'package:medion/presentation/pages/home/directions/directions_page.dart';
import 'package:medion/presentation/pages/home/directions/component/inner_pages/directions_info_page.dart';
import 'package:medion/presentation/pages/home/doctors/all_doctors_page.dart';
import 'package:medion/presentation/pages/home/home_page.dart';
import 'package:medion/presentation/pages/main/main_page.dart';
import 'package:medion/presentation/pages/onboarding/onboarding_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/data_entry_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_with_email.dart';
import 'package:medion/presentation/pages/auth/sign_up/sign_up_with_phone.dart';
import 'package:medion/presentation/pages/auth/sign_up/verify_code_page.dart';
import 'package:medion/presentation/pages/visits/my_visits_page.dart';

class AppRoutes {
  static MaterialPageRoute getOnBoardingPage({context}) {
    return MaterialPageRoute(builder: (_) => const MainPage());
  }

  static MaterialPageRoute getSignUpPage() {
    return MaterialPageRoute(builder: (_) => const SignUpPage());
  }

  static MaterialPageRoute getSignUpPageWithPhone() {
    return MaterialPageRoute(builder: (_) => const SignUpWithPhone());
  }

  static MaterialPageRoute getSignUpPageWithEmail() {
    return MaterialPageRoute(builder: (_) => const SignUpWithEmail());
  }

  static MaterialPageRoute getVerifyCodePage() {
    return MaterialPageRoute(builder: (_) => const VerifyCodePage());
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
    return MaterialPageRoute(builder: (_) => const AppoinmentPage());
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
        professionServiceType: professionServiceType, // Fixed typo here
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
    return MaterialPageRoute(builder: (_) => const PaymentForTheAppoinment());
  }

  static MaterialPageRoute getAllDoctorsPage() {
    return MaterialPageRoute(builder: (_) => const AllDoctorsPage());
  }
}
