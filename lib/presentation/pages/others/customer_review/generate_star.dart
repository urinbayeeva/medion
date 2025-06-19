import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/presentation/styles/theme.dart';

class GenerateStar extends StatelessWidget {
  final int rank;
  final CustomColorSet colors;
  final IconSet icons;

  const GenerateStar({super.key, required this.rank, required this.colors, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          final isActive = index < rank;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: SvgPicture.asset(
              icons.star,
              width: 16.w,
              height: 16.h,
              colorFilter: ColorFilter.mode(
                isActive ? colors.error500 : colors.neutral300,
                BlendMode.srcIn,
              ),
            ),
          );
        },
      ),
    );
  }
}
