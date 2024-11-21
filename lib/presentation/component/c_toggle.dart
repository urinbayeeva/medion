import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CustomToggle<T> extends StatelessWidget {
  final List<Widget> iconList;
  final Function(T value) onChanged;
  final T current;
  final List<T> values;
  final double height;
  final Size indicatorSize;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final bool elevation;

  const CustomToggle({
    super.key,
    required this.iconList,
    required this.onChanged,
    required this.current,
    required this.values,
    this.height = 40,
    this.indicatorSize = const Size.fromWidth(200),
    this.backgroundColor,
    this.indicatorColor,
    this.elevation = false,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimatedToggleSwitch.size(
          current: current,
          indicatorSize: indicatorSize,
          values: values,
          onChanged: onChanged,
          height: height.h,
          borderWidth: 4.w,
          animationDuration: const Duration(milliseconds: 200),
          selectedIconScale: 1,
          style: ToggleStyle(
            backgroundColor: backgroundColor ?? colors.neutral50,
            indicatorColor: indicatorColor ?? colors.error500,
            borderColor: backgroundColor ?? colors.neutral50,
            indicatorBorderRadius: BorderRadius.circular(10.r),
            borderRadius: BorderRadius.circular(8.r),
          ),
          iconOpacity: 1,
          iconList: iconList,
        );
      },
    );
  }
}
