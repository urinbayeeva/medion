import 'package:flutter/material.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedServiceDoctorChose extends StatefulWidget {
  const MedServiceDoctorChose({super.key});

  @override
  State<MedServiceDoctorChose> createState() => _MedServiceDoctorChoseState();
}

class _MedServiceDoctorChoseState extends State<MedServiceDoctorChose> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
      );
    });
  }
}
