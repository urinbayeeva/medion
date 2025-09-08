import 'dart:io';

import 'package:flutter/material.dart';

class TappableArea extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final Widget child;
  final bool isDisabled;
  final Color splashColor;
  final BorderRadius borderRadius;

  const TappableArea({
    super.key,
    this.splashColor = Colors.white70,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.borderRadius = BorderRadius.zero,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isDisabled,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          splashColor: splashColor,
          splashFactory: splashFactory,
          highlightColor: highlightColor,
          onTap: onTap,
          onLongPress: onLongPress,
          child: child,
        ),
      ),
    );
  }

  InteractiveInkFeatureFactory get splashFactory =>
      Platform.isAndroid ? InkSplash.splashFactory : NoSplash.splashFactory;

  Color get highlightColor => Platform.isAndroid ? Colors.transparent : splashColor;
}
