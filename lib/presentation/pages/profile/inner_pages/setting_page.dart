import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_widget.dart';
import 'package:medion/presentation/pages/profile/widget/settings_data.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
                title: "Настройки",
                isBack: true,
                centerTitle: true,
                trailing: 24.w.horizontalSpace),
            16.h.verticalSpace,
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: colors.shade0,
                    ),
                    child: ListView.builder(
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
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
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

  Widget _buildNavItem({
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
              title: Text(data['title'], style: fonts.regularLink),
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
    if (index == 0) {
      context.read<BottomNavBarController>().changeNavBar(true);
      showModalBottomSheet(
        context: context,
        builder: (item) {
          return ThemeWrapper(
              builder: (context, colors, fonts, icons, controller) {
            return Container(
              decoration: BoxDecoration(
                color: colors.shade0,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
              ),
            );
          });
        },
      ).then((_) {
        context.read<BottomNavBarController>().changeNavBar(false);
      });
    }
  }
}
