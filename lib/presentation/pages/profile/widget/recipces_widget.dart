import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class RecipcesWidget extends StatelessWidget {
  final String title;
  final String innerTitle;
  final String methodOfAdministration;
  final String regardingToFood;
  final String recipeDate;
  final String recipeTimes;
  final String comments;
  final String recipeCount;

  const RecipcesWidget({
    super.key,
    required this.title,
    required this.innerTitle,
    required this.methodOfAdministration,
    required this.regardingToFood,
    required this.recipeDate,
    required this.recipeTimes,
    required this.comments,
    required this.recipeCount,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
        child: Column(
          children: [
            CustomExpansionListTile(
              title: title,
              description: '',
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      innerTitle,
                      style: fonts.regularMain.copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    12.h.verticalSpace,
                    _buildRowElement(
                        title: "introduction_method".tr(),
                        subtitle: methodOfAdministration,
                        icon: icons.recipeFirst),
                    _buildRowElement(
                        title: "regarding_food".tr(),
                        subtitle: regardingToFood,
                        icon: icons.recipeSecond),
                    _buildRowElement(
                        title: "starting_from".tr(),
                        subtitle: recipeDate,
                        icon: icons.recipeThird),
                    _buildRowElement(
                        title: "times_a_day".tr(namedArgs: {
                          "count": recipeCount,
                          "times": recipeTimes,
                        }),
                        subtitle: "",
                        icon: icons.recipeFour),
                    _buildRowElement(
                        title: "infusion_rate".tr(),
                        subtitle: comments,
                        icon: icons.recipeFive),
                    _buildRowElement(
                        title: "comments".tr(),
                        subtitle: comments,
                        icon: icons.recipeSix),
                  ],
                )
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _buildRowElement(
      {required String icon, required String title, required String subtitle}) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Row(children: [
          SvgPicture.asset(icon, width: 20.w, height: 20.h),
          8.w.horizontalSpace,
          Text(
            title,
            style: fonts.smallTagFirst.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: colors.neutral800,
            ),
          ),
          Text(
            subtitle,
            style: fonts.smallTagFirst.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: colors.neutral800,
            ),
          ),
        ]),
      );
    });
  }
}
