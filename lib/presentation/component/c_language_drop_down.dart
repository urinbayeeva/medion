import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CLanguageDropDown extends StatelessWidget {
  const CLanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return TextButton(
          onPressed: () {},
          child: Row(
            children: [
              CircleFlag(
                'us',
              ),
            ],
          ));
    });
  }
}
