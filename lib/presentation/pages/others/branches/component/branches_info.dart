import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_icon_button.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class BranchesInfoCard extends StatelessWidget {
  final BranchModel branch;
  final VoidCallback branchPhoneNumberButton;
  final VoidCallback branchAdressButton;
  final VoidCallback branchMoreInfo;
  final VoidCallback yandexButton;

  const BranchesInfoCard({
    super.key,
    required this.branchPhoneNumberButton,
    required this.branchAdressButton,
    required this.branchMoreInfo,
    required this.yandexButton,
    required this.branch,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h, left: 12.w, right: 12.w),
          padding: EdgeInsets.all(12.w),
          width: double.infinity,
          decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 16.h.verticalSpace,
              Center(
                child: CachedImageComponent(
                  borderRadius: 6.r,
                  height: 250,
                  width: double.infinity,
                  imageUrl: branch.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),

              12.h.verticalSpace,
              Text(
                semanticsLabel: branch.name,
                branch.name ?? '',
                style: fonts.regularMain.copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
              12.h.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.w,
                children: [
                  icons.location.svg(width: 20.w, height: 20.h),
                  Flexible(
                    child: Text(
                      semanticsLabel: branch.address,
                      overflow: TextOverflow.clip,
                      branch.address ?? '',
                      style: fonts.smallLink.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              12.h.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.w,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: icons.clock.svg(width: 18.w, height: 18.h, color: colors.primary900),
                  ),
                  Text(
                    semanticsLabel: branch.workTime,
                    branch.workTime,
                    style: fonts.smallLink.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              16.h.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: AnimationButtonEffect(
                      // isGrey: true,
                      onTap: branchPhoneNumberButton,
                      child: CButton(
                        backgroundColor: colors.neutral200,
                        textColor: colors.primary900,
                        title: "call_center".tr(),
                        iconPath: icons.phone,
                        onTap: branchPhoneNumberButton,
                      ),
                    ),
                  ),
                  8.w.horizontalSpace,
                  Expanded(
                    child: AnimationButtonEffect(
                      // isGrey: true,
                      onTap: branchAdressButton,
                      child: CButton(
                        backgroundColor: colors.neutral200,
                        textColor: colors.primary900,
                        title: "on_map".tr(),
                        iconPath: icons.map,
                        onTap: branchAdressButton,
                      ),
                    ),
                  ),
                ],
              ),
              8.h.verticalSpace,
              AnimationButtonEffect(
                // isGrey: true,
                onTap: branchMoreInfo,
                child: CButton(
                  backgroundColor: colors.neutral200,
                  textColor: colors.primary900,
                  title: "more_about_clinic".tr(),
                  onTap: branchMoreInfo,
                ),
              ),
              8.h.verticalSpace,
              CIconButton(
                title: "order_taxi".tr(),
                iconPath: "assets/images/yandex_png.png",
                onTap: yandexButton,
                // backgroundColor: colors.neutral200,
                // textColor: colors.primary900,
              ),
            ],
          ),
        );
      },
    );
  }
}
