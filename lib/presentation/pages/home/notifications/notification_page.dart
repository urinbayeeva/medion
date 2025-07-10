import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/home/notifications/notification_card.dart';
import 'package:medion/presentation/pages/home/notifications/single_notification.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/notification_type_enum.dart';

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
              final type = o.filterType != n.filterType;
              return notifications || nStatus || rOStatus || rAllStatus || type;
            },
            builder: (context, state) {
              if (!state.notifications.isEmpty) {
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
                      itemCount: state.notifications.length + notifications.length,
                      itemBuilder: (context, index) {
                        final list = [...state.notifications, ...notifications];
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

final notifications = [
  NotificationModel((b) => b
    ..type = 'links'
    ..title = 'New Link Available'
    ..id = 24
    ..body = 'Check out this new link we’ve shared.'
    ..createdAt = '01 июл 2024'
    ..isRead = false
    ..link = 'https://example.com/1'),
  NotificationModel((b) => b
    ..type = 'discount'
    ..title = 'Summer Discount!'
    ..id = 25
    ..body = 'Get up to 50% off on selected items.'
    ..createdAt = '02 июл 2024'
    ..isRead = true
    ..discount.update((d) => d
      ..id = 101
      ..title = 'Summer Sale'
      ..image = 'discount_banner.png'
      ..endDate = '31 июл 2024')),
  NotificationModel((b) => b
    ..type = 'reminders'
    ..title = 'Appointment Reminder'
    ..id = 2976
    ..body = 'You have an appointment tomorrow.'
    ..createdAt = '03 июл 2024'
    ..isRead = false
    ..reminder.update((r) => r
      ..id = 2180
      ..doctorName = 'Dr. Akmal'
      ..image = 'doctor.png'
      ..startDate = '04 июл 2024'
      ..location = 'Clinic A')),
  NotificationModel((b) => b
    ..type = 'reviews'
    ..title = 'Leave a Review'
    ..id = 27
    ..body = 'Let us know your experience.'
    ..createdAt = '04 июл 2024'
    ..isRead = true
    ..review.update((r) => r
      ..name = 'Service A'
      ..review = 'It was great!'
      ..status = 'completed'
      ..location = 'Center 1'
      ..createDate = '03 июл 2024'
      ..ratings.addAll(['5']))),
  NotificationModel((b) => b
    ..type = 'results'
    ..title = 'Lab Results Ready'
    ..id = 28
    ..body = 'Download your latest lab results.'
    ..createdAt = '05 июл 2024'
    ..isRead = false
    ..labResult.add(
      NotificationLabResult((l) => l
        ..documentName = 'Blood Test'
        ..documentUrl = 'https://example.com/blood_result.pdf'
        ..date.addAll(['04 июл 2024'])),
    )),
  NotificationModel((b) => b
    ..type = 'links'
    ..title = 'Health Tips'
    ..id = 29
    ..body = 'Read daily health tips.'
    ..createdAt = '06 июл 2024'
    ..isRead = false
    ..link = 'https://example.com/tips'),
  NotificationModel((b) => b
    ..type = 'discount'
    ..title = 'Limited Time Offer'
    ..id = 30
    ..body = 'Flat 30% off till 10th July.'
    ..createdAt = '06 июл 2024'
    ..isRead = false
    ..discount.update((d) => d
      ..id = 102
      ..title = 'July Deal'
      ..image = 'july_offer.png'
      ..endDate = '10 июл 2024')),
  NotificationModel((b) => b
    ..type = 'reminders'
    ..title = 'Vaccination Reminder'
    ..id = 2932
    ..body = 'Your child’s vaccination is due.'
    ..createdAt = '07 июл 2024'
    ..isRead = true
    ..reminder.update((r) => r
      ..id = 2181
      ..doctorName = 'Dr. Kamola'
      ..image = 'vaccine_doc.png'
      ..startDate = '08 июл 2024'
      ..location = 'Pediatrics Center')),
  NotificationModel(
    (b) => b
      ..type = 'reviews'
      ..title = 'Rate Our App'
      ..id = 32
      ..body = 'We value your feedback.'
      ..createdAt = '08 июл 2024'
      ..isRead = false,
  ),
  NotificationModel((b) => b
    ..type = 'results'
    ..title = 'X-ray Result Uploaded'
    ..id = 33
    ..body = 'View your recent X-ray report.'
    ..createdAt = '09 июл 2024'
    ..isRead = true
    ..labResult.add(
      NotificationLabResult((l) => l
        ..documentName = 'Chest X-ray'
        ..documentUrl = 'https://example.com/xray_result.pdf'
        ..date.addAll(['08 июл 2024'])),
    )),
];
