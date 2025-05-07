import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VisitsNewDesignCard extends StatefulWidget {
  const VisitsNewDesignCard({super.key});

  @override
  State<VisitsNewDesignCard> createState() => _VisitsNewDesignCardState();
}

class _VisitsNewDesignCardState extends State<VisitsNewDesignCard> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
          boxShadow: colors.shadowMM,
        ),
      );
    });
  }
}
