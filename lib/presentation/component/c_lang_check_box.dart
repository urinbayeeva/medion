import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CLangCheckbox extends StatefulWidget {
  const CLangCheckbox({super.key});

  @override
  State<CLangCheckbox> createState() => _CLangCheckboxState();
}

class _CLangCheckboxState extends State<CLangCheckbox> {
  String selectedLanguage = "Русский";

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          height: 243.h,
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              children: [
                Container(
                  width: 40.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6E6E6),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                12.h.verticalSpace,
                Text(
                  "Выбрать язык",
                  style: fonts.regularMain.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                8.h.verticalSpace,
                _buildLanguageOption(
                  context,
                  "Русский",
                  icons.russia,
                ),
                12.h.verticalSpace,
                _buildLanguageOption(
                  context,
                  "Английский",
                  icons.usa,
                ),
                12.h.verticalSpace,
                _buildLanguageOption(
                  context,
                  "Узбекский",
                  icons.uzbekistan,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String language,
    String icon,
  ) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: () {
          setState(() {
            selectedLanguage = language;
          });
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: colors.neutral400,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  8.w.horizontalSpace,
                  Text(
                    language,
                    style: fonts.smallLink.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedLanguage == language
                      ? colors.error500
                      : colors.shade0,
                  border: Border.all(
                    color: colors.neutral400,
                    width: 1,
                  ),
                ),
                child: selectedLanguage == language
                    ? Icon(
                        Icons.check,
                        size: 16.w,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      );
    });
  }
}
