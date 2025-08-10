import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.isHome,
    required this.title,
    required this.back,
    required this.colors,
    required this.icons,
    required this.fonts,
  });

  final bool isHome;
  final String title;
  final VoidCallback back;
  final CustomColorSet colors;
  final IconSet icons;
  final FontSet fonts;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: colors.shade0,
      surfaceTintColor: Colors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: WScaleAnimation(
        onTap: back,
        child: Icon(Icons.keyboard_arrow_left, size: 32.h),
      ),
      title: Text(title, style: fonts.regularMain),
      bottom: _buildBottomWidget(),
    );
  }

  PreferredSizeWidget? _buildBottomWidget() {
    if (!isHome) return null;

    return PreferredSize(
      preferredSize: Size.fromHeight(32.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'step'.tr(namedArgs: {"count": "3", "total": "5"}),
                    style: fonts.xSmallLink.copyWith(
                      color: colors.neutral600,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "  ${"select_doctor_time".tr()}",
                    style: fonts.xSmallLink.copyWith(
                      color: colors.primary900,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const CustomProgressBar(count: 3, allCount: 5),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (isHome ? 32.h : 0));
}
