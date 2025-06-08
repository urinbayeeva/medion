import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class WhatWeOfferCard extends StatefulWidget {
  final String? title;
  final String? desc;
  const WhatWeOfferCard({
    super.key,
    this.title,
    this.desc,
  });

  @override
  State<WhatWeOfferCard> createState() => _WhatWeOfferCardState();
}

class _WhatWeOfferCardState extends State<WhatWeOfferCard> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, contorller) {
      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colors.shade0,
          boxShadow: colors.shadowMMMM,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title ?? "",
              style: fonts.smallMain,
            ),
            8.h.verticalSpace,
            Text(
              widget.desc ?? "",
              style: fonts.smallLink,
            ),
            12.h.verticalSpace,
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                iconColor: colors.error500,
                tilePadding: EdgeInsets.zero,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "read_more_more".tr(),
                      style: fonts.smallMain.copyWith(
                          color: colors.error500, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                children: [],
              ),
            ),
          ],
        ),
      );
    });
  }
}
