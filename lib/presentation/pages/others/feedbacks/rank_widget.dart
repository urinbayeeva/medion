import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/styles/theme.dart';

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
                      width: 24.w,
                      height: 24.h,
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
      },
    );
  }
}
