import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_lang_check_box.dart';
import 'package:medion/presentation/component/c_logout_bottomsheet.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/home/directions/component/home_list_tile.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_widget.dart';
import 'package:medion/presentation/pages/profile/widget/settings_data.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/phone_utils.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final bool isRu = EasyLocalization.of(context)!.locale.languageCode == 'ru';

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
                title: "settings".tr(),
                isBack: true,
                centerTitle: true,
                trailing: 24.w.horizontalSpace),
            16.h.verticalSpace,
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: colors.shade0,
                    ),
                    child: Column(
                      children: [
                        HomeListTile(
                          title: "language".tr(),
                          icon: icons.globe,
                          trailing: CustomToggle(
                            height: 32.h,
                            indicatorColor: colors.primary500,
                            backgroundColor: colors.neutral50,
                            indicatorSize: Size.fromWidth(78.w),
                            iconList: [
                              Text(
                                "РУ",
                                style: fonts.captionSemiBold.copyWith(
                                    color: isRu
                                        ? colors.shade0
                                        : colors.neutral700),
                                semanticsLabel: "РУ",
                              ),
                              Text(
                                "UZ",
                                style: fonts.captionSemiBold.copyWith(
                                    color: !isRu
                                        ? colors.shade0
                                        : colors.neutral700),
                                semanticsLabel: "UZ",
                              ),
                            ],
                            onChanged: (bool value) {
                              EasyLocalization.of(context)!.setLocale(
                                value
                                    ? const Locale('ru', 'RU')
                                    : const Locale('uz', 'UZ'),
                              );
                              setState(() {});
                            },
                            current: isRu,
                            values: const [true, false],
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: settingsData.length,
                          itemBuilder: (context, index) {
                            return _buildNavItem(
                              context: context,
                              data: settingsData[index],
                              isLastItem: index == settingsData.length - 1,
                              onTap: () => _handleNavTap(context, index),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // child:
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Version: Test",
                  style: fonts.regularLink.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: colors.primary900,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  _buildNavItem({
    required BuildContext context,
    required Map<String, dynamic> data,
    required bool isLastItem,
    required VoidCallback onTap,
  }) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
        children: [
          AnimationButtonEffect(
            onTap: onTap,
            child: ListTile(
              leading: SvgPicture.asset(data['icon']),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data['title'], style: fonts.regularLink),
                ],
              ),
              trailing: icons.right.svg(
                width: 20.w,
                height: 20.h,
                color: const Color(0xFFDEDEDE),
              ),
            ),
          ),
          if (!isLastItem)
            Divider(
              color: colors.neutral400,
              height: 1,
            ),
        ],
      );
    });
  }

  void _handleNavTap(BuildContext context, int index) {
    void setNavBarState(bool state) {
      if (mounted) {
        context.read<BottomNavBarController>().changeNavBar(state);
      }
    }

    if (index == 0) {
      makePhoneCall("+998958098661");
    } else {
      setNavBarState(true);
      showModalBottomSheet(
        context: context,
        builder: (item) => CBottomsheetProfile(
          onTapBack: () {
            context.read<BottomNavBarController>().changeNavBar(false);
          },
          onTapLogOut: () async {
            context.read<BottomNavBarController>().changeNavBar(true);
            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
              AppRoutes.getSignUpPage(),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ).then((_) {
        context.read<BottomNavBarController>().changeNavBar(false);
      });
    }
  }
}
