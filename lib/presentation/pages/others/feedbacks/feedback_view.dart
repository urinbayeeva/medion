import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  late final TextEditingController _controller;
  int _rank = -1;
  String _selectedLocation = '';

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.shade0,
          body: SingleChildScrollView(
            child: Column(
              spacing: 1.h,
              children: [
                CAppBar(
                  title: "leave_feedback".tr(),
                  isBack: true,
                  showBottomBar: true,
                  centerTitle: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "send_to_us_feedbacks".tr(),
                          style: fonts.regularText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      12.verticalSpace,
                      Text("branches".tr(), style: fonts.regularMain),
                      DropDownWidget(
                        items: list,
                        onChange: (String val) {
                          _selectedLocation = val;
                        },
                      ),
                      12.verticalSpace,
                      Text("give_stars".tr(), style: fonts.regularMain),
                      6.verticalSpace,
                      RankWidget(
                        icons: icons,
                        colors: colors,
                        onTap: (val) {
                          _rank = val;
                        },
                      ),
                      20.verticalSpace,
                      Text("feedback".tr(), style: fonts.regularMain),
                      CustomTextField(
                        controller: _controller,
                        onChanged: (value) {},
                        hintText: 'leave_feedback'.tr(),
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
            child: CButton(
              title: 'send'.tr(),
              onTap: () {
                log("Rank: $_rank");
                log("Location: $_selectedLocation");
                log("Text: ${_controller.text}");
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RankWidget extends StatefulWidget {
  const RankWidget({super.key, required this.icons, required this.colors, required this.onTap});

  final IconSet icons;
  final CustomColorSet colors;
  final void Function(int value) onTap;

  @override
  State<RankWidget> createState() => _RankWidgetState();
}

class _RankWidgetState extends State<RankWidget> {
  final ValueNotifier _rank = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _rank,
        builder: (ctx, val, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                5,
                (i) {
                  final isActive = i < _rank.value;
                  return GestureDetector(
                    onTap: () {
                      widget.onTap(i + 1);
                      _rank.value = (i + 1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: SvgPicture.asset(
                        widget.icons.star,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: ColorFilter.mode(
                          isActive ? widget.colors.error500 : widget.colors.neutral300,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        });
  }
}

const list = ["Medion 1", "Medion 2", "Medion 3"];

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key, required this.items, required this.onChange});

  final void Function(String val) onChange;

  final List<String> items;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final ValueNotifier<String> _title = ValueNotifier('choose_branch'.tr());
  final ValueNotifier<bool> _extended = ValueNotifier(false);
  String title = 'choose_branch'.tr();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _extended,
      builder: (ctx, v, c) {
        return ValueListenableBuilder(
          valueListenable: _title,
          builder: (c, val, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _extended.value = !_extended.value,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Expanded(child: Text(_title.value)),
                          AnimatedContainer(
                            height: 28,
                            width: 28,
                            padding: const EdgeInsets.all(2),
                            duration: const Duration(milliseconds: 200),
                            child: _extended.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedCrossFade(
                  firstChild: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...List.generate(
                                  widget.items.length,
                                  (i) {
                                    return GestureDetector(
                                      onTap: () {
                                        _extended.value = !_extended.value;
                                        _title.value = widget.items[i];
                                        widget.onChange(_title.value);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(color: Colors.white),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    widget.items[i],
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                if (_title.value == widget.items[i]) ...{
                                                  const Icon(Icons.done_all),
                                                } else ...{
                                                  const SizedBox.shrink()
                                                }
                                              ],
                                            ),
                                            if ((widget.items.length - 1) != i) ...{
                                              const Divider(),
                                            }
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  secondChild: const SizedBox(width: double.infinity),
                  duration: const Duration(milliseconds: 200),
                  crossFadeState: _extended.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
