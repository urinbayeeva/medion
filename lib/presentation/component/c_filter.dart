import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CFilter extends StatefulWidget {
  final String currentFilter;
  final Function(String) onFilterChanged;

  const CFilter({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  State<CFilter> createState() => _CFilterState();
}

class _CFilterState extends State<CFilter> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.currentFilter;
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 3.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.neutral200,
                ),
              ),
            ),
            12.h.verticalSpace,
            Center(child: Text("filter".tr(), style: fonts.regularMain)),
            8.h.verticalSpace,
            _buildRadioTile("All", "all".tr(), colors, fonts),
            const CDivider(),
            _buildRadioTile("Adults", "adult".tr(), colors, fonts),
            const CDivider(),
            _buildRadioTile("Children", "child".tr(), colors, fonts),
            8.h.verticalSpace,
            CButton(
              title: "apply".tr(),
              onTap: () {
                widget.onFilterChanged(_selectedCategory);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildRadioTile(String value, String title, colors, fonts) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: () => setState(() => _selectedCategory = value),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: fonts.smallLink.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (_selectedCategory == value)
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: colors.error500,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 16.sp),
                ),
            ],
          ),
        ),
      );
    });
  }
}
