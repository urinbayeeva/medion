import 'package:circle_flags/circle_flags.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndexPage = 0;

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentIndexPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: Column(
            children: <Widget>[
              24.h.verticalSpace,
              _buildButton(),
              Flexible(
                fit: FlexFit.tight,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndexPage = index;
                    });
                  },
                  children: <Widget>[
                    _buildPage(
                      imagePath: icons.medicalHistoryFirst,
                      title: "make_an_appoinment_doctor_online".tr(),
                      description: "choose_one_of_the_many".tr(),
                    ),
                    _buildPage(
                      imagePath: icons.calendarFirst,
                      title: "keep_tracks_of_your_visits".tr(),
                      description: "make_appointments_with_doctors".tr(),
                    ),
                    _buildPage(
                      imagePath: icons.folderFirst,
                      title: "get_your_analyze_easy".tr(),
                      description: "your_test_and_doctors_opinions".tr(),
                    ),
                  ],
                ),
              ),
              16.h.verticalSpace,
              DotsIndicator(
                dotsCount: 3,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  activeColor: colors.error500,
                  color: colors.neutral200,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              16.h.verticalSpace,
              CButton(
                  onTap: () {
                    if (currentIndexPage < 2) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacement(
                          context, AppRoutes.getSignUpPage());
                    }
                  },
                  title:
                      currentIndexPage < 2 ? "next".tr() : "lets_start".tr()),
              14.h.verticalSpace,
            ],
          ),
        ),
      );
    });
  }

  Widget _buildButton() {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Align(
        alignment: Alignment.topRight,
        child: AnimationButtonEffect(
          onTap: () => _pageController.jumpToPage(2),
          child: Text("skip".tr(),
              style: fonts.smallText.copyWith(
                  color: colors.neutral600,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500)),
        ),
      );
    });
  }

  Widget _buildPage({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            40.h.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: Style.headlineText(size: 22.sp, color: colors.primary900),
            ),
            8.h.verticalSpace,
            Text(
              description,
              textAlign: TextAlign.center,
              style: Style.smallLink(size: 15.sp, color: colors.neutral600),
            ),
          ],
        ),
      );
    });
  }
}
