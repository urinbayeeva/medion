import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/domain/sources/appoinment_data.dart';
import 'package:medion/presentation/pages/appoinment/step_second.dart';
import 'package:medion/presentation/pages/appoinment/step_third.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class StepFirst extends StatefulWidget {
  const StepFirst({super.key});

  @override
  _StepFirstState createState() => _StepFirstState();
}

class _StepFirstState extends State<StepFirst> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              // Custom App Bar
              CAppBar(
                isBack: true,
                onTap: _handleBackButton,
                bordered: true,
                padding: EdgeInsets.zero,
                title: "Выберите тип услуги",
                centerTitle: true,
                trailing: SizedBox(width: 13.w),
                bottom: _buildProgressBar(colors, fonts),
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  onPageChanged: _handlePageChange,
                  itemBuilder: (context, pageIndex) {
                    return _buildStepPage(context, pageIndex + 1);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Handles the back button logic
  void _handleBackButton() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        AppRoutes.getMainPage(0),
        (route) => false,
      );
    }
  }

  // Builds the progress bar and its associated UI
  Widget _buildProgressBar(colors, fonts) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: fonts.xSmallLink.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: colors.primary900,
              ),
              children: [
                TextSpan(
                  text: 'Шаг $_currentStep из 5: ',
                  style: fonts.xSmallLink.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: colors.neutral600,
                  ),
                ),
                const TextSpan(text: ' Выбор тип услуги'),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          CustomProgressBar(
            count: _currentStep,
            allCount: 5,
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  // Handles page changes in the PageView
  void _handlePageChange(int pageIndex) {
    setState(() => _currentStep = pageIndex + 1);
    context.read<BottomNavBarController>().changeNavBar(_currentStep > 0);
  }

  // Builds the content for each step
  Widget _buildStepPage(BuildContext context, int step) {
    switch (step) {
      case 1:
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: appointmentData.length,
          itemBuilder: (context, index) {
            final item = appointmentData[index];
            return MedicalDirectionItem(
              title: item['service'],
              subtitle: item['info'],
              iconPath: item['image'],
              onTap: () => _handleNextStep(context),
            );
          },
        );
      case 2:
        return StepSecond(
          pageController: _pageController,
          onTap: () {
            _handleNextStep(context);
          },
        );
      case 3:
        return StepThird(pageController: _pageController);
      case 4:
      case 5:
        return Center(child: Text('Content for Step $step'));
      default:
        return const SizedBox.shrink();
    }
  }

  // Handles moving to the next step or showing completion dialog
  void _handleNextStep(BuildContext context) {
    if (_currentStep < 5) {
      setState(() => _currentStep++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _showCompletionDialog(context);
    }
  }

  // Shows a dialog when all steps are completed
  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Congratulations!"),
        content: const Text("You have completed all steps."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
