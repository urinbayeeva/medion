import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VisitInfoCard extends StatefulWidget {
  final String? image;
  final String? doctorName;
  final String? doctorJob;
  final String? categoryName;
  final String? serviceName;
  final String? visitDate;
  final String? visitTime;
  final String? visitStatus;
  final VoidCallback onTap;
  const VisitInfoCard(
      {super.key,
      this.image,
      this.doctorName,
      this.doctorJob,
      this.categoryName,
      this.serviceName,
      this.visitDate,
      this.visitTime,
      this.visitStatus, required this.onTap});

  @override
  State<VisitInfoCard> createState() => _VisitInfoCardState();
}

class _VisitInfoCardState extends State<VisitInfoCard> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: widget.onTap,
        child: SizedBox(
          child: Card(
            elevation: 0,
            color: colors.shade0,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 3.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color(0xFFFFA41B)),
                  ),
                  8.w.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4.h,
                    children: [
                      Text(widget.doctorName!, style: fonts.smallSemLink),
                      Text(
                        widget.visitStatus!,
                        style: fonts.xSmallMain
                            .copyWith(color: const Color(0xFFFFA41B)),
                      ),
                      Text(widget.doctorJob!,
                          style: fonts.xSmallMain
                              .copyWith(color: colors.neutral600))
                    ],
                  ),
                  Flexible(
                      child: Text(widget.visitTime!, style: fonts.xSmallLink)),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
