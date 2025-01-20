import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/sources/category.dart';
import 'package:medion/presentation/component/c_bottomsheet_line.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CFilterBottomsheet extends StatefulWidget {
  const CFilterBottomsheet({super.key});

  @override
  State<CFilterBottomsheet> createState() => _CFilterBottomsheetState();
}

class _CFilterBottomsheetState extends State<CFilterBottomsheet> {
  Category selectedCategory = Category.all;
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          8.h.verticalSpace,
          const Center(child: CBottomsheetLine()),
          8.h.verticalSpace,
          Row(
            children: [
              const Spacer(),
              const Spacer(),
              20.w.horizontalSpace,
              Text("filter".tr(),
                  style: fonts.smallSemLink
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500)),
              8.w.horizontalSpace,
              const Spacer(),
              TextButton(
                child: Text("clear".tr(),
                    style: fonts.smallSemLink.copyWith(
                        color: colors.error500,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500)),
                onPressed: () {},
              ),
              16.w.horizontalSpace,
            ],
          ),
          8.h.verticalSpace,
          Column(
            children: Category.values.map((category) {
              return ListTile(
                title: Text(category.displayName),
                shape: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: category == Category.pediatric
                            ? colors.shade0
                            : colors.neutral400)),
                trailing: selectedCategory == category
                    ? Icon(
                        Icons.check_circle,
                        color: colors.error500,
                        weight: 30.w,
                      )
                    : null,
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              );
            }).toList(),
          ),
          8.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CButton(title: "apply".tr(), onTap: () {}),
          ),
          40.h.verticalSpace,
        ],
      );
    });
  }
}
