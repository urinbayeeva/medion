import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_data.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class NavListWidget extends StatelessWidget {
  final List? data;
  final List? routes;
  const NavListWidget({super.key, this.data, this.routes});

  @override
  Widget build(BuildContext context) {
    final resolvedData = data ?? navListData;

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: resolvedData.length,
          itemBuilder: (context, index) {
            return _buildNavItem(
              context: context,
              data: resolvedData[index],
              isLastItem: index == resolvedData.length - 1,
              onTap: () => _handleNavTap(context, index),
            );
          },
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
    final resolvedRoutes = routes ??
        [
          AppRoutes.getUserDetailsPage(),
          AppRoutes.getResultsPage(),
          AppRoutes.getRecipesPage(),
          AppRoutes.getWalletPage(),
          AppRoutes.getSettingsPage(),
        ];

    if (index < resolvedRoutes.length) {
      Navigator.push(context, resolvedRoutes[index]);
    }
  }
}
