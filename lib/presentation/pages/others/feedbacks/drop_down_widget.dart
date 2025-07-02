import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/styles/theme.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.items,
    required this.onChange,
    required this.colors,
    this.branch = '',
    required this.fonts,
  });

  final void Function(String val) onChange;
  final CustomColorSet colors;
  final FontSet fonts;
  final List<BranchModel> items;
  final String branch;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late final ValueNotifier<String> _title;
  late final ValueNotifier<bool> _extended;

  @override
  void initState() {
    super.initState();
    final title = (widget.branch.isNotEmpty && widget.branch.length > 4) ? widget.branch : 'choose_branch'.tr();
    _title = ValueNotifier(title);
    _extended = ValueNotifier(false);
  }

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
                      border: Border.all(color: widget.colors.neutral300, width: 1.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _title.value,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: widget.fonts.regularText.copyWith(color: const Color(0xFFAFAFAF), fontSize: 17.sp),
                            ),
                          ),
                          if (widget.branch.isEmpty && widget.branch.length < 4) ...{
                            AnimatedContainer(
                              height: 28,
                              width: 28,
                              padding: const EdgeInsets.all(2),
                              duration: const Duration(milliseconds: 200),
                              child: _extended.value
                                  ? const Icon(Icons.keyboard_arrow_up)
                                  : const Icon(Icons.keyboard_arrow_down),
                            )
                          }
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedCrossFade(
                  firstChild: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: widget.colors.shade0,
                          border: Border.all(color: widget.colors.neutral300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...List.generate(
                                widget.items.length,
                                (i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _extended.value = !_extended.value;
                                        _title.value = widget.items[i].address ?? '';
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                                                    child: Text(
                                                      widget.items[i].address ?? '',
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                if (_title.value == widget.items[i].address) ...{
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
