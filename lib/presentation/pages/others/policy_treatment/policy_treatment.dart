import 'package:flutter/material.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class PolicyTreatment extends StatefulWidget {
  const PolicyTreatment({super.key});

  @override
  State<PolicyTreatment> createState() => _PolicyTreatmentState();
}

class _PolicyTreatmentState extends State<PolicyTreatment> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
        );
      }
    );
  }
}