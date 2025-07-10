import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_data.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class NavListWidget extends StatelessWidget {
  const NavListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ct, colors, fonts, icons, controller) {
        return BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
              child: ListView.separated(
                separatorBuilder: (context, i) {
                  return Divider(color: colors.neutral400, thickness: 1);
                },
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: NavListItemEnum.values.length,
                itemBuilder: (ctx, index) {
                  final nav = NavListItemEnum.values[index];
                  final String title = nav.title();
                  final last = NavListItemEnum.values.length - 1;
                  return AnimationButtonEffect(
                    onTap: () => _handleNavTap(context, index),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: colors.shade0,
                        borderRadius: (index == 0)
                            ? const BorderRadius.vertical(top: Radius.circular(8))
                            : (index == last)
                                ? const BorderRadius.vertical(bottom: Radius.circular(8))
                                : BorderRadius.zero,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 6,
                            children: [
                              SvgPicture.asset(nav.icon(), height: 22, width: 22),
                              Text(title.tr(context: context), style: fonts.regularLink),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 4,
                            children: [
                              if (nav.isNotification) ...{
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: colors.error500,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    (state.unReadNotifications).toString(),
                                    style: fonts.smallLink.copyWith(color: colors.shade0),
                                  ),
                                )
                              },
                              icons.right.svg(width: 20.w, height: 20.h, color: const Color(0xFFDEDEDE))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  void _handleNavTap(BuildContext context, int index) {
    final resolvedRoutes = [
      AppRoutes.getUserDetailsPage(),
      AppRoutes.getResultsPage(),
      AppRoutes.getRecipesPage(),
      AppRoutes.getRecommendationPage(),
      AppRoutes.getWalletPage(),
      AppRoutes.getNotificationPage(),
      AppRoutes.getSettingsPage(),
    ];

    if (index < resolvedRoutes.length) {
      Navigator.of(context, rootNavigator: true).push(resolvedRoutes[index]);
    }
  }
}
