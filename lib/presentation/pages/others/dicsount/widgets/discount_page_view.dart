import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/condition_of_discount_widget.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/discount_duration_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DiscountPageView extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? desc;
  final String? date;
  final String? discountAddress;
  final String? discountDuration;
  final String? phoneShortNumber;
  final String? phoneNumber;
  final String discountCondition;

  const DiscountPageView({
    super.key,
    this.imagePath,
    this.title,
    this.desc,
    this.date,
    this.discountAddress,
    this.discountDuration,
    this.phoneShortNumber,
    this.phoneNumber,
    required this.discountCondition,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.shade0,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    imagePath!.isNotEmpty
                        ? CachedImageComponent(
                            height: MediaQuery.of(context).size.height * 0.19,
                            width: double.infinity,
                            imageUrl: imagePath!,
                          )
                        : Image.asset(
                            imagePath ?? 'assets/placeholder.png',
                            width: double.infinity,
                            height: 264.h,
                            fit: BoxFit.cover,
                          ),
                    Positioned(
                      top: 60.h,
                      left: 16.w,
                      right: 16.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: colors.shade0,
                            foregroundColor: colors.primary900,
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<BottomNavBarController>()
                                    .changeNavBar(true);
                                Navigator.pop(context);
                              },
                              child: icons.left.svg(width: 24.w, height: 24.h),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: colors.shade0,
                            foregroundColor: colors.primary900,
                            child: icons.share.svg(width: 24.w, height: 24.h),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                12.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(title!, style: fonts.mediumMain),
                ),
                8.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(desc!, style: fonts.smallLink),
                ),
                if (discountCondition.isNotEmpty) ...[
                  24.h.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ConditionOfDiscountWidget(
                        discountCondition: discountCondition),
                  ),
                ],
                24.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: DiscountDurationWidget(
                    discountAddress: discountAddress ?? "",
                    discountDuration: discountDuration ?? "",
                    phoneNumber: phoneNumber ?? "",
                    phoneShortNumber: phoneShortNumber ?? "",
                  ),
                ),
                24.h.verticalSpace,
              ],
            ),
          ),
        ),
      );
    });
  }
}
