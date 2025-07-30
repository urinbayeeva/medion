import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:shimmer/shimmer.dart';

class UiHelper extends StatelessWidget {
  const UiHelper({super.key, required this.isFailure});

  final bool isFailure;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controllers) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("doctors".tr(), style: fonts.regularMain),
          ),
          body: isFailure
              ? Center(
                  child: errorUi(title: "something_went_wrong".tr(), fonts: fonts, icons: icons),
                )
              : Padding(
                  padding: EdgeInsets.all(16.r),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: List.generate(8, (index) => _buildShimmerItem()),
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget errorUi({
    required String title,
    String subTitle = '',
    required FontSet fonts,
    required IconSet icons,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.h,
          children: [
            icons.emojiSad.svg(height: 60.h, width: 1.sw),
            Text(title, style: fonts.regularMain),
            if (subTitle.isNotEmpty) ...{
              Text(title, style: fonts.xSmallMain),
            },
            60.h.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left image block
            Container(
              height: 100.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(width: 12.w),

            // Text column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(width: 150.w, height: 16.h),
                  SizedBox(height: 8.h),
                  _shimmerLine(width: 120.w, height: 14.h),
                  SizedBox(height: 8.h),
                  _shimmerLine(width: double.infinity, height: 12.h),
                  SizedBox(height: 8.h),
                  _shimmerLine(width: double.infinity, height: 12.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _shimmerLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
