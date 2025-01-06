import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CustomExpansionListTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String description;
  final dynamic price;

  const CustomExpansionListTile({
    super.key,
    required this.title,
    this.subtitle,
   required this.description, this.price,
  });

  @override
  State<CustomExpansionListTile> createState() =>
      _CustomExpansionListTileState();
}

class _CustomExpansionListTileState extends State<CustomExpansionListTile> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.only(bottom: 8.h),
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                widget.title,
                style: fonts.smallSemLink.copyWith(
                    color: colors.primary900,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp),
              ),
              subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
              children: [
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: colors.neutral400),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.w, top: 8.h, right: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.description,
                              style: fonts.smallSemLink.copyWith(
                                color: colors.primary900,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                              ),
                            ),
                            AnimationButtonEffect(
                              onTap: () {
                                setState(() {
                                  // chose++;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: colors.error500,
                                ),
                                child: icons.plus.svg(
                                    width: 20.w,
                                    height: 20.h,
                                    color: colors.shade0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding:
                    //       EdgeInsets.only(left: 16.w, top: 8.h, right: 16.w),
                    //   child: Text(
                    //     "${widget.price}",
                    //     style: fonts.smallSemLink.copyWith(
                    //       color: colors.neutral600,
                    //       fontWeight: FontWeight.w400,
                    //       fontSize: 11.sp,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16.w, top: 8.h, right: 16.w),
                      child: Text(
                          "${widget.price}",
                        style: fonts.smallSemLink.copyWith(
                          color: colors.primary900,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    24.h.verticalSpace,
                  ],
                ),
              ],
            )),
      );
    });
  }
}
