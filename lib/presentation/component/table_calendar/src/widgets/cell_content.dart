// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/calendar_builders.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/calendar_style.dart';

class CellContent extends StatelessWidget {
  final DateTime day;
  final DateTime focusedDay;
  final dynamic locale;
  final bool isTodayHighlighted;
  final bool isToday;
  final bool isSelected;
  final bool isRangeStart;
  final bool isRangeEnd;
  final bool isWithinRange;
  final bool isOutside;
  final bool isDisabled;
  final bool isHoliday;
  final bool isWeekend;
  final bool haveBottomDots;
  final CalendarStyle calendarStyle;
  final CalendarBuilders calendarBuilders;

  const CellContent({
    Key? key,
    required this.day,
    required this.focusedDay,
    required this.calendarStyle,
    required this.calendarBuilders,
    required this.isTodayHighlighted,
    required this.isToday,
    required this.isSelected,
    required this.isRangeStart,
    required this.isRangeEnd,
    required this.isWithinRange,
    required this.isOutside,
    required this.isDisabled,
    required this.isHoliday,
    required this.isWeekend,
    required this.haveBottomDots,
    this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dowLabel = DateFormat.EEEE(locale).format(day);
    final dayLabel = DateFormat.yMMMMd(locale).format(day);
    final semanticsLabel = '$dowLabel, $dayLabel';

    Widget? cell = calendarBuilders.prioritizedBuilder?.call(context, day, focusedDay);

    if (cell != null) {
      return Semantics(
        label: semanticsLabel,
        excludeSemantics: true,
        child: cell,
      );
    }

    final text = calendarStyle.dayTextFormatter?.call(day, locale) ?? '${day.day}';
    final margin = calendarStyle.cellMargin;
    final padding = calendarStyle.cellPadding;
    final alignment = calendarStyle.cellAlignment;
    const duration = Duration(milliseconds: 250);

    if (isDisabled) {
      cell = calendarBuilders.disabledBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.disabledDecoration,
            alignment: alignment,
            child: Text(text, style: calendarStyle.disabledTextStyle),
          );
    } else if (haveBottomDots && (isSelected == false)) {
      cell = calendarBuilders.selectedBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.disabledDecoration,
            alignment: alignment,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: (isWeekend && isOutside)
                      ? calendarStyle.outsideTextStyle
                      : isWeekend
                          ? calendarStyle.weekendTextStyle
                          : isOutside
                              ? calendarStyle.disabledTextStyle
                              : calendarStyle.defaultTextStyle,
                ),
                const Icon(Icons.circle, size: 6, color: Color(0xffD90506)),
              ],
            ),
          );
    } else if (isSelected || (isSelected && haveBottomDots)) {
      cell = calendarBuilders.selectedBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.selectedDecoration,
            alignment: alignment,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Text(text, style: calendarStyle.selectedTextStyle)),
                if (haveBottomDots) ...{
                  CircleOutline(
                    size: 6.h,
                    strokeWidth: 1.4,
                  )
                }
              ],
            ),
          );
    } else if (isRangeStart) {
      cell = calendarBuilders.rangeStartBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.rangeStartDecoration,
            alignment: alignment,
            child: Text(text, style: calendarStyle.rangeStartTextStyle),
          );
    } else if (isRangeEnd) {
      cell = calendarBuilders.rangeEndBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.rangeEndDecoration,
            alignment: alignment,
            child: Text(text, style: calendarStyle.rangeEndTextStyle),
          );
    } else if (isToday && isTodayHighlighted) {
      cell = calendarBuilders.todayBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.todayDecoration,
            alignment: alignment,
            child: Text(text, style: calendarStyle.todayTextStyle),
          );
    } else if (isHoliday) {
      cell = calendarBuilders.holidayBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.holidayDecoration,
            alignment: alignment,
            child: Text(text, style: calendarStyle.holidayTextStyle),
          );
    } else if (isWithinRange) {
      cell = calendarBuilders.withinRangeBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.withinRangeDecoration,
            alignment: alignment,
            child: Text(text, style: calendarStyle.withinRangeTextStyle),
          );
    } else if (isOutside) {
      cell = calendarBuilders.outsideBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: calendarStyle.outsideDecoration,
            alignment: alignment,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text, style: calendarStyle.outsideTextStyle),
                const SizedBox(height: 6),
              ],
            ),
          );
    } else {
      cell = calendarBuilders.defaultBuilder?.call(context, day, focusedDay) ??
          AnimatedContainer(
            duration: duration,
            margin: margin,
            padding: padding,
            decoration: isWeekend ? calendarStyle.weekendDecoration : calendarStyle.defaultDecoration,
            alignment: alignment,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: isWeekend ? calendarStyle.weekendTextStyle : calendarStyle.defaultTextStyle,
                ),
                const SizedBox(height: 6),
              ],
            ),
          );
    }

    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: cell,
    );
  }
}

class CircleOutline extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color color;

  const CircleOutline({
    super.key,
    this.size = 24.0,
    this.strokeWidth = 6.0,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircleOutlinePainter(
          strokeWidth: strokeWidth,
          color: color,
        ),
      ),
    );
  }
}

class _CircleOutlinePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  _CircleOutlinePainter({
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..color = color;

    final center = Offset(size.width / 2, size.height / 2);
    // radius must account for strokeWidth so stroke stays inside the bounds
    final radius = math.min(size.width, size.height) / 2 - strokeWidth / 2;
    if (radius > 0) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CircleOutlinePainter old) {
    return old.strokeWidth != strokeWidth || old.color != color;
  }
}
