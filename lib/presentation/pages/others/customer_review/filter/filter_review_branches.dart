import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/w_bottom_sheet.dart';
import 'package:medion/presentation/component/w_check_box.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class FilterReviewBranches extends StatefulWidget {
  const FilterReviewBranches({super.key, required this.review, required this.selectedBranches});

  final ReviewModel review;
  final ValueNotifier<List<ReviewInfoModel>> selectedBranches;

  @override
  State<FilterReviewBranches> createState() => _FilterReviewBranchesState();
}

class _FilterReviewBranchesState extends State<FilterReviewBranches> {
  late final ValueNotifier<List<ReviewInfoModel>> _localeSelectedBranches;
  late final ValueNotifier<List<ReviewInfoModel>> selectedBranches;
  late final List<ReviewInfoModel> branches;

  @override
  void initState() {
    _localeSelectedBranches = ValueNotifier([...widget.selectedBranches.value]);
    branches = [...widget.review.branches];
    selectedBranches = widget.selectedBranches;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controllers) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 0.88.sh),
          child: WBottomSheet(
            hasTopLine: true,
            topBarColor: colors.shade0,
            children: [
              10.h.verticalSpace,
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
                title: Text("directions".tr(), style: fonts.regularMain),
                actions: [
                  WScaleAnimation(
                    onTap: () {
                      selectedBranches.value = [];
                      _localeSelectedBranches.value = [];
                    },
                    child: icons.cancel.svg(
                      height: 24.h,
                      width: 24.w,
                      color: const Color(0xff000000),
                    ),
                  ),
                  12.w.horizontalSpace,
                ],
              ),
              10.h.verticalSpace,
              Expanded(
                child: ValueListenableBuilder<List<ReviewInfoModel>>(
                  valueListenable: _localeSelectedBranches,
                  builder: (context, selectedList, __) {
                    return ListView.separated(
                      itemCount: branches.length,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      itemBuilder: (context, index) {
                        final item = branches[index];
                        final isSelected = selectedList.contains(item);

                        return WScaleAnimation(
                          onTap: () {
                            if (isSelected) {
                              _localeSelectedBranches.value = selectedList.where((e) => e != item).toList();
                            } else {
                              _localeSelectedBranches.value = [...selectedList, item];
                            }
                          },
                          child: ListTile(
                            title: Text(
                              item.name ?? '',
                              maxLines: 2,
                              style: fonts.smallTagSecond.copyWith(fontSize: 14.sp),
                            ),
                            subtitle: Text(
                              // item.name ?? '',
                              "-",
                              maxLines: 2,
                              style: fonts.xxSmallText.copyWith(fontSize: 12.sp),
                            ),
                            trailing: WCheckBox(
                              checkBoxColor: const Color(0xff283840),
                              borderColor: colors.neutral300,
                              value: isSelected,
                              onChanged: (_) {
                                if (isSelected) {
                                  _localeSelectedBranches.value = selectedList.where((e) => e != item).toList();
                                } else {
                                  _localeSelectedBranches.value = [...selectedList, item];
                                }
                              },
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: CButton(
                  title: "apply".tr(),
                  onTap: () {
                    selectedBranches.value = _localeSelectedBranches.value;
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
