import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class NoSearchFound extends StatelessWidget {
  const NoSearchFound({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/anim/no_search.json",
            width: 120.w,
            height: 120.h,
            fit: BoxFit.contain,
          ),
          Text(
            "no_result_found".tr(),
            style: fonts.regularText.copyWith(
              color: colors.neutral600,
              fontSize: 16.sp,
            ),
          ),
          120.h.verticalSpace,
        ],
      );
    });
  }
}
