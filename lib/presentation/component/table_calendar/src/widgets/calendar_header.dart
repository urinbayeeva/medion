// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';

import '../customization/header_style.dart';
import '../shared/utils.dart' show CalendarFormat, DayBuilder;
import 'custom_icon_button.dart';
import 'format_button.dart';

class CalendarHeader extends StatelessWidget {
  final dynamic locale;
  final DateTime focusedMonth;
  final CalendarFormat calendarFormat;
  final HeaderStyle headerStyle;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onHeaderTap;
  final VoidCallback todayTap;
  final VoidCallback lastTap;
  final VoidCallback allTap;
  final VoidCallback onHeaderLongPress;
  final ValueChanged<CalendarFormat> onFormatButtonTap;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;

  const CalendarHeader({
    super.key,
    this.locale,
    required this.focusedMonth,
    required this.calendarFormat,
    required thiseaderStyle,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onHeaderTap,
    required this.onHeaderLongPress,
    required this.onFormatButtonTap,
    required this.availableCalendarFormats,
    thiseaderTitleBuilder,
    required this.headerStyle,
    this.headerTitleBuilder,
    required this.todayTap,
    required this.lastTap,
    required this.allTap,
  });

  @override
  Widget build(BuildContext context) {
    final text =
        headerStyle.titleTextFormatter?.call(focusedMonth, locale) ?? DateFormat.yMMMM(locale).format(focusedMonth);

    return Container(
      decoration: headerStyle.decoration,
      margin: headerStyle.headerMargin,
      padding: headerStyle.headerPadding,
      child: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: headerTitleBuilder?.call(context, focusedMonth) ??
                    GestureDetector(
                      onTap: onHeaderTap,
                      onLongPress: onHeaderLongPress,
                      child: Text(
                        text,
                        style: headerStyle.titleTextStyle,
                        textAlign: headerStyle.titleCentered ? TextAlign.center : TextAlign.start,
                      ),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: WScaleAnimation(
                  onTap: onLeftChevronTap,
                  child: headerStyle.leftChevronIcon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: WScaleAnimation(
                  onTap: onRightChevronTap,
                  child: headerStyle.rightChevronIcon,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 12,
            children: [
              ...List.generate(
                Days.values.length,
                (index) {
                  final day = Days.values[index];
                  return Expanded(
                    child: WScaleAnimation(
                      onTap: () {
                        if (day.isToday) {
                          todayTap();
                        }
                        if (day.isLast) {
                          lastTap();
                        }
                        if (day.isAll) {
                          allTap();
                        }
                      },
                      child: Container(
                        height: 34,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text(day.title.tr())),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum Days {
  today("todays"),
  last("last_day"),
  all("all");

  bool get isToday => this == Days.today;

  bool get isLast => this == Days.last;

  bool get isAll => this == Days.all;
  final String title;

  const Days(this.title);
}
