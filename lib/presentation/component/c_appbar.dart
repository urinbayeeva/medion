import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/calendar/calendar_day_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CAppBar extends StatefulWidget {
  final String title;
  final Widget? titleWidget;
  final bool isBack;
  final Widget? leading;
  final Widget? trailing;
  final Widget? bottom;
  final EdgeInsetsGeometry? padding;
  final bool bordered;
  final bool centerTitle;
  final bool blur;
  final bool? hasToggle;
  final bool? hasSearch;
  final VoidCallback? onTap;
  final bool? hasCalendar;
  final bool? hasProgressBar;
  final int? count;
  final int? allCount;
  final String? toggleFirstText;
  final String? toggleSecondText;
  final Function(String)? onSearchChanged;

  const CAppBar(
      {super.key,
      required this.title,
      this.isBack = true,
      this.leading,
      this.trailing,
      this.padding,
      this.bordered = false,
      this.bottom,
      this.centerTitle = false,
      this.blur = true,
      this.titleWidget,
      this.hasToggle,
      this.hasSearch,
      this.onTap,
      this.hasCalendar,
      this.hasProgressBar,
      this.count,
      this.allCount,
      this.toggleFirstText,
      this.toggleSecondText,
      this.onSearchChanged});

  @override
  State<CAppBar> createState() => _CAppBarState();
}

class _CAppBarState extends State<CAppBar> {
  bool isOnline = true;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return ClipRRect(
          child: BackdropFilter(
            filter: widget.blur
                ? ImageFilter.blur(sigmaX: 50, sigmaY: 50)
                : ImageFilter.blur(),
            child: Container(
              width: double.infinity,
              // height: 58.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: widget.bordered
                      ? const Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFEDEDED)),
                        )
                      : null),
              padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SafeArea(bottom: false, child: SizedBox.shrink()),
                  40.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.isBack) ...[
                        AnimationButtonEffect(
                          onTap: widget.onTap ??
                              () {
                                Navigator.pop(context);
                              },
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: icons.left.svg(
                              height: 28.r,
                              width: 28.r,
                              color: colors.shade100,
                            ),
                          ),
                        ),
                        8.w.horizontalSpace,
                      ] else
                        widget.leading ??
                            (widget.centerTitle
                                ? 36.w.horizontalSpace
                                : const SizedBox.shrink()),
                      8.w.horizontalSpace,
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(12.0.w),
                          child: widget.titleWidget ??
                              Text(
                                semanticsLabel: widget.title,
                                widget.title,
                                style: fonts.regularMain.copyWith(
                                    color: colors.primary900, fontSize: 17.sp),
                                textAlign: widget.centerTitle
                                    ? TextAlign.center
                                    : TextAlign.start,
                              ),
                        ),
                      ),
                      8.w.horizontalSpace,
                      if (widget.trailing == null)
                        const SizedBox.shrink()
                      else
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: widget.trailing!,
                        ),
                    ],
                  ),
                  if (widget.bottom != null) ...[
                    16.h.verticalSpace,
                    widget.bottom!,
                    12.h.verticalSpace,
                  ],
                  if (widget.hasSearch == true) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CustomTextField(
                        controller: searchController,
                        hintText: "Название направления",
                        prefixIcon: icons.search.svg(width: 16.w, height: 16.h),
                        onChanged: widget.onSearchChanged,
                      ),
                    ),
                    8.h.verticalSpace
                  ],
                  if (widget.hasCalendar == true) ...[
                    10.h.verticalSpace,
                    CalendarDayWidget(),
                    10.h.verticalSpace,
                    // 10.h.verticalSpace,
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
