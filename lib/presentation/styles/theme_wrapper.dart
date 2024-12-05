import 'package:flutter/material.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:provider/provider.dart';

class ThemeWrapper extends StatelessWidget {
  final Function(
    BuildContext context,
    CustomColorSet colors,
    FontSet fonts,
    IconSet icons,
    GlobalController controller,
  ) builder;

  const ThemeWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    // context.locale;
    return Consumer<GlobalController>(builder: (context, theme, _) {
      return builder(context, theme.colors, theme.fonts, theme.icons, theme);
    });
  }
}
