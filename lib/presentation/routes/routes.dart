import 'package:flutter/material.dart';
import 'package:medion/presentation/pages/appoinment/appoinment.dart';
import 'package:medion/presentation/pages/home/directions/directions_page.dart';
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
    return MaterialPageRoute(builder: (_) => const OnboardingPage());
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
}
