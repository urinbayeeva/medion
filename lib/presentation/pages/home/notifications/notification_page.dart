import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/home/notifications/notification_card.dart';
import 'package:medion/presentation/pages/home/notifications/single_notification.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/notification_type_enum.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    context.read<NotificationBloc>().add(const NotificationEvent.getNotifications());

    super.initState();
  }

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
          body: BlocConsumer<NotificationBloc, NotificationState>(
            listenWhen: (old, nyu) {
              final markAll = old.markAllNotificationStatus != nyu.markAllNotificationStatus;
              final notifications = old.notificationStatus != nyu.notificationStatus;
              return markAll || notifications;
            },
            listener: (context, state) {
              if (state.markAllNotificationStatus.isSuccess) {
                context.read<NotificationBloc>().add(const NotificationEvent.getNotifications());
                context.showPopUp(
                  status: PopUpStatus.success,
                  message: "success".tr(),
                  fonts: fonts,
                  colors: colors,
                  context: context,
                );
              }
              if (state.markAllNotificationStatus.isFailure) {
                context.showPopUp(
                  status: PopUpStatus.warning,
                  message: 'something_went_wrong'.tr(),
                  fonts: fonts,
                  colors: colors,
                  context: context,
                );
              }
            },
            buildWhen: (o, n) {
              final notifications = o.notifications.length != n.notifications.length;
              final nStatus = o.notificationStatus != n.notificationStatus;
              final rOStatus = o.readOnlyStatus != n.readOnlyStatus;
              final rAllStatus = o.markAllNotificationStatus != n.markAllNotificationStatus;
              final type = o.filterType != n.filterType;
              return notifications || nStatus || rOStatus || rAllStatus || type;
            },
            builder: (context, state) {
              if (state.notificationStatus.isInitial || state.notificationStatus.isInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }

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
                        style: fonts.regularLink.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: colors.neutral600,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          NotificationTypeEnum.values.length,
                          (i) {
                            final last = NotificationTypeEnum.values.length - 1;
                            final type = NotificationTypeEnum.values[i];
                            return FilterCard(
                              i: i,
                              type: type,
                              last: last,
                              fonts: fonts,
                              colors: colors,
                              filterType: state.filterType,
                              onTap: () {
                                context.read<NotificationBloc>().add(
                                      NotificationEvent.filterNotification(type: type.title, query: type.keyWord),
                                    );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.notifications.length,
                      itemBuilder: (context, index) {
                        final list = state.notifications;
                        final notification = list[index];

                        return NotificationCard(
                          icons: icons,
                          colors: colors,
                          fonts: fonts,
                          type: MyFunctions.getNotificationType(notification.type),
                          notification: notification,
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => SingleNotification(
                                  notification: notification,
                                  id: notification.id ?? 0,
                                  type: MyFunctions.getNotificationType(notification.type),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class FilterCard extends StatelessWidget {
  const FilterCard({
    super.key,
    required this.onTap,
    required this.type,
    required this.last,
    required this.colors,
    required this.fonts,
    required this.filterType,
    required this.i,
  });

  final VoidCallback onTap;
  final NotificationTypeEnum type;
  final int last;
  final CustomColorSet colors;
  final FontSet fonts;
  final String filterType;
  final int i;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: filterType == type.title ? colors.error500 : colors.shade0,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.fromLTRB((i == 0) ? 12 : 4, 10, (last == i) ? 12 : 4, 10),
        child: Center(
          child: Text(
            type.title,
            style: fonts.smallTagSecond.copyWith(
              color: filterType == type.title ? colors.shade0 : colors.darkMode900,
            ),
          ),
        ),
      ),
    );
  }
}
