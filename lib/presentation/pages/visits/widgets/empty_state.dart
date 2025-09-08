import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.title, this.icons, this.body});

  final String title;
  final Widget? icons;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4.h,
      children: [
        if (icons != null) ...{
          icons!,
        } else ...{
          IconSet.create.newEmpty.svg(width: 128.w, height: 141.h),
        },
        10.h.verticalSpace,
        if (body != null) ...{
          body!
        } else ...{
          Center(child: Text(title, style: Style.regularMain())),
        }
      ],
    );
  }
}
