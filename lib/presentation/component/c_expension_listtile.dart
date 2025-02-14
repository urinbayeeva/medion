import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CustomExpansionListTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String description;
  final dynamic price;
  final List<Widget> children;
  final Function(bool)? onExpansionChanged;

  const CustomExpansionListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.description,
    this.price,
    required this.children,
    this.onExpansionChanged,
  });

  @override
  State<CustomExpansionListTile> createState() =>
      _CustomExpansionListTileState();
}

class _CustomExpansionListTileState extends State<CustomExpansionListTile> {
  final GlobalKey<_CustomExpansionListTileState> _expansionTileKey =
      GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
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
          child: ExpansionTile(
            initiallyExpanded: false,
            key: _expansionTileKey,
            childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
            collapsedBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              widget.title,
              style: fonts.smallSemLink.copyWith(
                color: colors.primary900,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
            subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
            children: widget.children, // Correctly passing the list of widgets
          ),
        ),
      );
    });
  }
}
