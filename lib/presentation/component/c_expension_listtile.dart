import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CustomExpansionListTile extends StatefulWidget {
  final String title;
  final String? hasIcon;
  final String? subtitle;
  final String description;
  final Widget? titleWidget;
  final dynamic price;
  final List<Widget> children;
  final Function(bool)? onExpansionChanged;

  const CustomExpansionListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.description = '',
    this.price,
    required this.children,
    this.onExpansionChanged,
    this.hasIcon,
    this.titleWidget,
  });

  @override
  State<CustomExpansionListTile> createState() => _CustomExpansionListTileState();
}

class _CustomExpansionListTileState extends State<CustomExpansionListTile> {
  final GlobalKey<_CustomExpansionListTileState> _expansionTileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              dividerColor: Colors.transparent,
            ),
            child: Builder(builder: (context) {
              return DoctorTimeSlotWidget(
                key: _expansionTileKey,
                title: widget.title,
                children: widget.children,
              );
            }),
            // child: ExpansionTile(
            //   iconColor: colors.error500,
            //   // initiallyExpanded: true,
            //   key: _expansionTileKey,
            //   childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
            //   collapsedBackgroundColor: Colors.transparent,
            //   backgroundColor: Colors.transparent,
            //   controlAffinity: ListTileControlAffinity.trailing,
            //   title: (widget.titleWidget != null)
            //       ? widget.titleWidget!
            //       : widget.hasIcon != null
            //           ? Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 SvgPicture.asset(widget.hasIcon!),
            //                 6.w.horizontalSpace,
            //                 Text(
            //                   widget.title,
            //                   style: fonts.smallSemLink.copyWith(
            //                     color: colors.primary900,
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 13.sp,
            //                   ),
            //                 ),
            //               ],
            //             )
            //           : Text(
            //               widget.title,
            //               style: fonts.smallSemLink.copyWith(
            //                 color: colors.primary900,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 13.sp,
            //               ),
            //             ),
            //   subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
            //   children: widget.children, // Correctly passing the list of widgets
            // ),
          ),
        );
      },
    );
  }
}

class DoctorTimeSlotWidget extends StatefulWidget {
  const DoctorTimeSlotWidget({
    super.key,
    required this.children,
    required this.title,
    this.backgroundColor,
    this.activeIconColor,
    this.inActiveIconColor,
    this.radius,
  });

  final List<Widget> children;
  final Color? activeIconColor;
  final Color? inActiveIconColor;
  final Color? backgroundColor;
  final BorderRadiusGeometry? radius;
  final String title;

  @override
  State<DoctorTimeSlotWidget> createState() => _DoctorTimeSlotWidgetState();
}

class _DoctorTimeSlotWidgetState extends State<DoctorTimeSlotWidget> {
  late final ValueNotifier isOpen;

  @override
  void initState() {
    isOpen = ValueNotifier(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controllers) {
        return ValueListenableBuilder(
          valueListenable: isOpen,
          builder: (context, open, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: widget.radius ?? BorderRadius.circular(12.r),
                color: widget.backgroundColor ?? colors.shade0,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    InkWell(
                      onTap: () => isOpen.value = !open,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text(widget.title, style: fonts.regularMain)),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: colors.error100,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: SizedBox(
                                height: 32.h,
                                width: 32.w,
                                child: Icon(
                                  open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                  color: open
                                      ? (widget.activeIconColor ?? colors.error500)
                                      : (widget.inActiveIconColor ?? colors.error500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Animated children
                    AnimatedSize(
                      duration: Duration(milliseconds: open ? 700 : 300),
                      curve: Curves.easeInOut,
                      child: Builder(
                        builder: (context) {
                          if (open) {
                            return Column(children: widget.children);
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
