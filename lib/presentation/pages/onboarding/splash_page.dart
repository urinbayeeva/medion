import 'package:flutter/material.dart';

import 'package:medion/presentation/styles/theme_wrapper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
          backgroundColor: colors.shade0,
          body: Center(
            child: Image.asset(
              "assets/images/medion_logo_text.png",
              scale: 3,
            ),
          ));
    });
  }
}
