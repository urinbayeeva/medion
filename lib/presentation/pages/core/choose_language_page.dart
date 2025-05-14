import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/custom_button.dart';
import 'package:medion/presentation/component/custom_checkbox.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ChooseLanguagePage extends StatelessWidget {
  const ChooseLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.neutral50,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      "choose_language".tr(),
                      style: fonts.mediumMain,
                      semanticsLabel: "choose_language",
                    ),
                    32.h.verticalSpace,
                    _buildListTile(
                      context: context,
                      onTap: () {
                        EasyLocalization.of(context)!.setLocale(
                          const Locale('uz', 'UZ'),
                        );
                      },
                      title: "O’zbekcha",
                      icon: icons.flagUz,
                      isCheck: !(context.locale == const Locale('uz', 'UZ')),
                    ),
                    16.h.verticalSpace,
                    _buildListTile(
                      context: context,
                      onTap: () {
                        EasyLocalization.of(context)!.setLocale(
                          const Locale('ru', 'RU'),
                        );
                      },
                      title: "Русский",
                      icon: icons.flagRu,
                      isCheck: context.locale == const Locale('uz', 'UZ'),
                    ),
                    const Spacer(),
                    const Spacer(),
                    CustomButton(
                      borderRadius: 8.r,
                      onPressed: () {
                        Navigator.push(context, AppRoutes.getOnboardingPage());
                      },
                      backgroundColor: colors.primary500,
                      title: "next".tr(),
                    ),
                    // 24.h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildListTile(
      {required BuildContext context,
      required GestureTapCallback onTap,
      required String title,
      required String icon,
      required bool isCheck}) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: !isCheck ? Border.all(color: colors.shade0) : null,
              borderRadius: BorderRadius.circular(16.r),
              color: colors.shade0,
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              children: [
                icon.svg(height: 40.r, width: 40.r),
                8.w.horizontalSpace,
                Text(
                  title,
                  semanticsLabel: title,
                  style: fonts.smallLink.copyWith(
                    color: isCheck ? colors.neutral500 : null,
                  ),
                ),
                const Spacer(),
                CustomCheckBoxComponent(
                    horizontalMargin: 0, isCheck: !isCheck, onChanged: onTap),
                8.w.horizontalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
