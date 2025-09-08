import 'package:flutter/material.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class WBottomSheet extends StatelessWidget {
  const WBottomSheet({
    super.key,
    required this.children,
    this.hasTopLine = false,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.topBarColor,
    this.topLineColor = Colors.grey,
    this.padding,
  });

  final List<Widget> children;
  final MainAxisSize? mainAxisSize;
  final bool hasTopLine;
  final CrossAxisAlignment crossAxisAlignment;
  final Color? topBarColor;
  final Color topLineColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: padding ?? EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom + 12),
        decoration: BoxDecoration(
          color: topBarColor ?? colors.shade0,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: mainAxisSize ?? MainAxisSize.min,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (hasTopLine)
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: topLineColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(top: 8),
                height: 4,
                width: 36,
              ),
            ...children,
          ],
        ),
      );
    });
  }
}
