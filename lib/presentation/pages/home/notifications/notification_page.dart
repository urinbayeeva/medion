import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/home/notifications/notification_card.dart';
import 'package:medion/presentation/pages/home/notifications/single_notification.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
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
            title: Text("notifications".tr(), style: fonts.regularMain),
            actions: [
              if (context.read<NotificationBloc>().state.notifications.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: WScaleAnimation(
                    child: const Icon(Icons.done_all),
                    onTap: () {
                      context.read<NotificationBloc>().add(const NotificationEvent.markAllNotificationAsRead());
                    },
                  ),
                ),
              ]
            ],
          ),
          body: BlocBuilder<NotificationBloc, NotificationState>(
            buildWhen: (o, n) {
              final notifications = o.notifications.length != n.notifications.length;
              final nStatus = o.notificationStatus != n.notificationStatus;
              final rOStatus = o.readOnlyStatus != n.readOnlyStatus;
              final rAllStatus = o.markAllNotificationStatus != n.markAllNotificationStatus;
              return notifications || nStatus || rOStatus || rAllStatus;
            },
            builder: (context, state) {
              if (state.notifications.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icons.ringBell.svg(),
                      Text(
                        "no_notifications_yet".tr(),
                        style: fonts.regularLink
                            .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w400, color: colors.neutral600),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];

                  return NotificationCard(
                    icons: icons,
                    colors: colors,
                    fonts: fonts,
                    notification: notification,
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => SingleNotification(id: notification.id ?? 0),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
