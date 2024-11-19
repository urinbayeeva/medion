import 'package:flutter/material.dart';
import 'package:medion/presentation/pages/appoinment/widgets/choosing_doctor_widget.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class StepThird extends StatelessWidget {
  final PageController pageController;
  const StepThird({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Expanded(
        child: ChoosingDoctorWidget(
            doctorName: "Б. Наргиза Акбаровна",
            doctorStatus: "Врач Узд функциональной диагностики",
            image: icons.nargiza),
      );
    });
  }
}
