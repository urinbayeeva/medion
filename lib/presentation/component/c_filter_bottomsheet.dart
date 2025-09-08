import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/sources/category.dart';
import 'package:medion/presentation/component/c_bottomsheet_line.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/home/doctors/all_doctors_page.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/ex_category.dart';

class CFilterBottomsheet extends StatefulWidget {
  const CFilterBottomsheet({super.key, required this.items, required this.selectedTitle});

  final List<String> items;
  final ValueNotifier<String> selectedTitle;

  @override
  State<CFilterBottomsheet> createState() => _CFilterBottomsheetState();
}

class _CFilterBottomsheetState extends State<CFilterBottomsheet> {
  late final ValueNotifier<String> _selectedTitle;

  @override
  void initState() {
    _selectedTitle = widget.selectedTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 0.7.sh),
            child: Scaffold(
              backgroundColor: colors.shade0,
              appBar: AppBar(
                backgroundColor: colors.shade0,
                leadingWidth: 0,
                automaticallyImplyLeading: false,
                centerTitle: true,
                scrolledUnderElevation: 0,
                title: Text(
                  "filter".tr(),
                  style: fonts.smallSemLink.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
                actions: [
                  WScaleAnimation(
                    onTap: () => _selectedTitle.value = "all",
                    child: Text(
                      "clear".tr(),
                      style: fonts.smallSemLink.copyWith(
                        color: colors.error500,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  12.w.horizontalSpace,
                ],
              ),
              body: ValueListenableBuilder(
                valueListenable: _selectedTitle,
                builder: (context, title, child) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                        title: Text("all".tr()),
                        trailing: _selectedTitle.value == "all"
                            ? Icon(
                                Icons.check_circle,
                                color: colors.error500,
                                size: 30.w,
                              )
                            : null,
                        shape: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: _selectedTitle.value == "all" ? colors.shade0 : colors.neutral400,
                          ),
                        ),
                        onTap: () => _selectedTitle.value = "all",
                      ),
                      ...List.generate(
                        widget.items.length,
                        (index) {
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                            title: Text(widget.items[index]),
                            trailing: _selectedTitle.value == widget.items[index]
                                ? Icon(
                                    Icons.check_circle,
                                    color: colors.error500,
                                    size: 30.w,
                                  )
                                : null,
                            shape: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: _selectedTitle.value == widget.items[index] ? colors.shade0 : colors.neutral400,
                              ),
                            ),
                            onTap: () {
                              _selectedTitle.value = widget.items[index];
                              // setState(() => selectedCategory = category);
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CButton(
                  title: "apply".tr(),
                  onTap: () {
                    Navigator.pop(context, _selectedTitle.value);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
