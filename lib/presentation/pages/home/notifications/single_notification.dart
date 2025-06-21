import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SingleNotification extends StatefulWidget {
  const SingleNotification({super.key, required this.notification});

  final NotificationModel notification;

  @override
  State<SingleNotification> createState() => _SingleNotificationState();
}

class _SingleNotificationState extends State<SingleNotification> {
  @override
  void initState() {
    if (widget.notification.id != null) {
      context.read<NotificationBloc>().add(NotificationEvent.readNotification(index: widget.notification.id!));
    }
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
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 1,
                children: [
                  const SizedBox.shrink(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.shade0,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.notification.title != null) ...{
                              Text(widget.notification.title!, style: fonts.regularMain)
                            },
                            if (widget.notification.createdAt != null) ...{
                              Text(
                                widget.notification.createdAt!,
                                style: fonts.xxSmallText.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                              )
                            },
                            if (widget.notification.body != null) ...{
                              Text(
                                  "widget.notification.body"
                                      "widg e t . n o t i fi  c a t io n . b o d y  w i d g e t . not i f i c s v s r   f   v a t i o n . bo d y   widget.notisrfsfsffication.body"
                                      " widget.notification.body widget.notifivfv cat ion.body widget.notification.bsdfrfsfsrody widget.notification.body widget.notification.body widget.notification.body"
                                      " widget.notification.body widget.notification.b ody wi d ge t .n o t i fi c a t i o n.body "
                                      "widget.notification.body"!,
                                  style: fonts.xSmallMain)
                            },
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
