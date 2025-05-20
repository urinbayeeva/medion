import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/sources/category.dart';
import 'package:medion/presentation/component/c_bottomsheet_line.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/home/doctors/all_doctors_page.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/ex_category.dart';

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
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              8.h.verticalSpace,
              const Center(child: CBottomsheetLine()),
              8.h.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    const Spacer(),
                    Text("filter".tr(),
                        style: fonts.smallSemLink.copyWith(
                            fontSize: 18.sp, fontWeight: FontWeight.w500)),
                    const Spacer(),
                    TextButton(
                      child: Text("clear".tr(),
                          style: fonts.smallSemLink.copyWith(
                              color: colors.error500,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500)),
                      onPressed: () {
                        setState(() {
                          selectedCategory = Category.all;
                        });
                      },
                    ),
                  ],
                ),
              ),
              8.h.verticalSpace,
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: Category.values.map((category) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      title: Text(category.russianName),
                      shape: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: category == Category.values.last
                              ? colors.shade0
                              : colors.neutral400,
                        ),
                      ),
                      trailing: selectedCategory == category
                          ? Icon(
                              Icons.check_circle,
                              color: colors.error500,
                              size: 30.w,
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
              ),
              16.h.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CButton(
                  title: "apply".tr(),
                  onTap: () {
                    Navigator.pop(context, selectedCategory);
                  },
                ),
              ),
              16.h.verticalSpace,
            ],
          ),
        ),
      );
    });
  }
}
