// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

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
  final VoidCallback onHeaderLongPress;
  final ValueChanged<CalendarFormat> onFormatButtonTap;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;

  const CalendarHeader({
    Key? key,
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
    thiseaderTitleBuilder, required this.headerStyle, this.headerTitleBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = headerStyle.titleTextFormatter?.call(focusedMonth, locale) ??
        DateFormat.yMMMM(locale).format(focusedMonth);

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
                        textAlign: headerStyle.titleCentered
                            ? TextAlign.center
                            : TextAlign.start,
                      ),
                    ),
              ),
              CustomIconButton(
                icon: headerStyle.leftChevronIcon,
                onTap: onLeftChevronTap,
                margin: headerStyle.leftChevronMargin,
                padding: headerStyle.leftChevronPadding,
              ),
              CustomIconButton(
                icon: headerStyle.rightChevronIcon,
                onTap: onRightChevronTap,
                    margin: headerStyle.rightChevronMargin,
                padding: headerStyle.rightChevronMargin,
              ),
            ],
          ),
       SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 34,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text("Позавчера")),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 34,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text("Вчера")),
                ),
              ),
             SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 34,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text("Сегодня")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
