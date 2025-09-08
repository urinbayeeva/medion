import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/w_bottom_sheet.dart';
import 'package:medion/presentation/component/w_check_box.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ReviewDirection extends StatefulWidget {
  const ReviewDirection({super.key, required this.review, required this.selectedDirection});

  final ReviewModel review;
  final ValueNotifier<List<ReviewInfoModel>> selectedDirection;

  @override
  State<ReviewDirection> createState() => _ReviewDirectionState();
}

class _ReviewDirectionState extends State<ReviewDirection> {
  late final ValueNotifier<List<ReviewInfoModel>> selectedDirection;
  late final ValueNotifier<List<ReviewInfoModel>> searchedFilteredDirections;
  late final ValueNotifier<List<ReviewInfoModel>> _localeSelectedItems;
  final searchController = TextEditingController();

  @override
  void initState() {
    selectedDirection = widget.selectedDirection;
    _localeSelectedItems = ValueNotifier([...widget.selectedDirection.value]);
    searchedFilteredDirections = ValueNotifier([...widget.review.categories]);

    searchController.addListener(
      () {
        final query = searchController.text.toLowerCase();
        if (query.isEmpty) {
          searchedFilteredDirections.value = [...widget.review.categories];
        } else {
          searchedFilteredDirections.value = widget.review.categories.where((item) {
            return (item.name ?? '').toLowerCase().contains(query);
          }).toList();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controllers) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 0.88.sh),
          child: WBottomSheet(
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
                title: Text("directions".tr(), style: fonts.regularMain),
                actions: [
                  WScaleAnimation(
                    onTap: () {
                      searchController.clear();
                      selectedDirection.value = [];
                      _localeSelectedItems.value = [];
                      searchedFilteredDirections.value = [...widget.review.categories];
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
              CustomTextField(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                controller: searchController,
                hintText: "Направление поиска".tr(),
                prefixIcon: IconSet.create.search.svg(
                  height: 24.h,
                  width: 24.w,
                  color: const Color(0xff9AA0A6),
                ),
              ),
              10.h.verticalSpace,
              Expanded(
                child: ValueListenableBuilder<List<ReviewInfoModel>>(
                  valueListenable: searchedFilteredDirections,
                  builder: (context, filteredDirections, _) {
                    return ValueListenableBuilder<List<ReviewInfoModel>>(
                      valueListenable: _localeSelectedItems,
                      builder: (context, selectedList, __) {
                        return ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          itemBuilder: (context, index) {
                            final item = filteredDirections[index];
                            final isSelected = selectedList.contains(item);
                            return WScaleAnimation(
                              onTap: () {
                                if (isSelected) {
                                  _localeSelectedItems.value = selectedList.where((e) => e != item).toList();
                                } else {
                                  _localeSelectedItems.value = [...selectedList, item];
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                                child: Row(
                                  spacing: 10.w,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.name ?? '',
                                        maxLines: 2,
                                        style: fonts.xSmallText,
                                      ),
                                    ),
                                    WCheckBox(
                                      checkBoxColor: const Color(0xff283840),
                                      borderColor: colors.neutral300,
                                      value: isSelected,
                                      onChanged: (_) {
                                        if (isSelected) {
                                          _localeSelectedItems.value = selectedList.where((e) => e != item).toList();
                                        } else {
                                          _localeSelectedItems.value = [...selectedList, item];
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: filteredDirections.length,
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: CButton(
                  title: "apply".tr(),
                  onTap: () {
                    selectedDirection.value = _localeSelectedItems.value;
                    log("Pop -1");
                    Navigator.of(context).pop();
                    log("Pop -2");
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
