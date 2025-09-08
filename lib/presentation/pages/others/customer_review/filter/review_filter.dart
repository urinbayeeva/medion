import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/w_bottom_sheet.dart';
import 'package:medion/presentation/component/w_check_box.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/filter_interval_enum.dart';

class ReviewFilter extends StatelessWidget {
  final ReviewModel review;

  const ReviewFilter({
    super.key,
    required this.branchTab,
    required this.directionTab,
    required this.review,
    required this.selectedRank,
    required this.applyTab,
    required this.selectedInterval,
    required this.clear,
  });

  final VoidCallback branchTab;
  final VoidCallback directionTab;
  final VoidCallback applyTab;
  final VoidCallback clear;
  final ValueNotifier<int> selectedRank;
  final ValueNotifier<FilterIntervalEnum> selectedInterval;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controllers) {
        return WBottomSheet(
          hasTopLine: true,
          topBarColor: colors.shade0,
          children: [
            AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: colors.darkMode900,
              scrolledUnderElevation: 0,
              leading: WScaleAnimation(
                child: Icon(Icons.keyboard_arrow_left, size: 32.h),
                onTap: () => Navigator.of(context).pop(),
              ),
              actions: [
                WScaleAnimation(
                  onTap: clear,
                  child: Text("clear".tr(), style: fonts.xSmallMain..copyWith(color: const Color(0xff998D8D))),
                ),
                20.w.horizontalSpace,
              ],
              title: Text("filter".tr(), style: fonts.regularMain),
            ),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(color: colors.backgroundColor),
                child: ListView(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(color: colors.backgroundColor),
                      child: SizedBox(height: 4.h, width: 1.sw),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: colors.shade0,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      width: 1.sw,
                      height: 90.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 10.h,
                        children: [
                          Text("rating".tr(), style: fonts.smallTagSecond.copyWith(fontSize: 14.sp)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 6.w,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...List.generate(
                                  RatingEnum.values.length,
                                  (index) {
                                    final rating = RatingEnum.values[index];
                                    return WScaleAnimation(
                                      onTap: () {
                                        selectedRank.value = rating.value;
                                      },
                                      child: ValueListenableBuilder(
                                        valueListenable: selectedRank,
                                        builder: (context, title, child) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: rating.value != title
                                                  ? const Color(0xffF1F3F4)
                                                  : const Color(0xff283840),
                                              borderRadius: BorderRadius.circular(8.r),
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              spacing: 6.w,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      rating.value == title ? colors.shade0 : const Color(0xffFFA800),
                                                ),
                                                Text(
                                                  rating.title,
                                                  style: fonts.xSmallLink.copyWith(
                                                    color: rating.value == title ? colors.shade0 : colors.darkMode900,
                                                  ),
                                                ),
                                                1.w.horizontalSpace,
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (review.categories.isNotEmpty) ...{
                      4.h.verticalSpace,
                      Container(
                        width: 1.sw,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: colors.shade0,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 10.h,
                          children: [
                            Text("directions".tr(), style: fonts.smallTagSecond.copyWith(fontSize: 14.sp)),
                            WScaleAnimation(
                              onTap: directionTab,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF8F9FA),
                                  border: Border.all(color: colors.neutral300),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      spacing: 6.w,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        icons.menu.svg(height: 20.h, width: 20.w),
                                        Text(
                                          "all_directions".tr(),
                                          style: fonts.xSmallLink.copyWith(
                                            color: const Color(0xff202124),
                                          ),
                                        ),
                                      ],
                                    ),
                                    icons.right.svg(color: const Color(0xff202124))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    },
                    if (review.branches.isNotEmpty) ...{
                      4.h.verticalSpace,
                      Container(
                        width: 1.sw,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: colors.shade0,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 10.h,
                          children: [
                            Text("branch".tr(), style: fonts.smallTagSecond.copyWith(fontSize: 14.sp)),
                            WScaleAnimation(
                              onTap: branchTab,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF8F9FA),
                                  border: Border.all(color: colors.neutral300),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      spacing: 6.w,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        icons.branch.svg(height: 20.h, width: 20.w),
                                        Text(
                                          "branches".tr(),
                                          style: fonts.xSmallLink.copyWith(
                                            color: const Color(0xff202124),
                                          ),
                                        ),
                                      ],
                                    ),
                                    icons.right.svg(color: const Color(0xff202124))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    },
                    if (review.source.isNotEmpty) ...{
                      4.h.verticalSpace,
                      Container(
                        decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(12.r)),
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("source".tr(), style: fonts.smallTagSecond.copyWith(fontSize: 14.sp)),
                            Builder(
                              builder: (context) {
                                final integrations = [...review.source];
                                return ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: integrations.length,
                                  separatorBuilder: (context, index) => const Divider(),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final link = integrations[index];
                                    final select = ValueNotifier(false);
                                    return ValueListenableBuilder(
                                      valueListenable: select,
                                      builder: (context, value, child) {
                                        return SizedBox(
                                          height: 60.h,
                                          width: 1.sw,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonImage(
                                                imageUrl: link,
                                                height: double.infinity,
                                                fit: BoxFit.contain,
                                              ),
                                              WCheckBox(
                                                shape: CheckBoxShape.square,
                                                iconColor: colors.shade0,
                                                borderColor: colors.neutral300,
                                                checkBoxColor: const Color(0xff283840),
                                                value: select.value,
                                                onChanged: (v) {
                                                  select.value = v;
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    },
                    4.h.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        color: colors.shade0,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                      child: ValueListenableBuilder(
                        valueListenable: selectedInterval,
                        builder: (context, intervals, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "timeInterval".tr(),
                                style: fonts.smallTagSecond.copyWith(fontSize: 14.sp),
                              ),
                              10.h.verticalSpace,
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: FilterIntervalEnum.values.length,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (_, __) => const Divider(),
                                itemBuilder: (context, index) {
                                  final item = FilterIntervalEnum.values[index];
                                  final isSelected = item == intervals;

                                  return WScaleAnimation(
                                    onTap: () {
                                      // final updated = {...intervals};
                                      // if (isSelected) {
                                      //   updated.remove(item);
                                      // } else {
                                      //   updated.add(item);
                                      // }
                                      selectedInterval.value = item;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 6.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item.title.tr(), style: fonts.xSmallMain),
                                          WCheckBox(
                                            shape: CheckBoxShape.round,
                                            iconColor: colors.shade0,
                                            borderColor: colors.neutral300,
                                            checkBoxColor: const Color(0xff283840),
                                            value: isSelected,
                                            onChanged: (v) {
                                              // final updated = {...intervals};
                                              // if (v) {
                                              //   updated.add(item);
                                              // } else {
                                              //   updated.remove(item);
                                              // }
                                              selectedInterval.value = item;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: CButton(
                title: "apply".tr(),
                onTap: () async {
                  applyTab();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
