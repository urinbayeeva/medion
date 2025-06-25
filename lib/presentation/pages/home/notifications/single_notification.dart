import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SingleNotification extends StatefulWidget {
  const SingleNotification({super.key, required this.id});

  final dynamic id;

  @override
  State<SingleNotification> createState() => _SingleNotificationState();
}

class _SingleNotificationState extends State<SingleNotification> {
  @override
  void initState() {
    // if (widget.id != 0) {
    //   context.read<NotificationBloc>().add(NotificationEvent.readNotification(index: widget.id));
    // }
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
            title: Text("${"notifications".tr()} -- ID: ${widget.id}", style: fonts.regularMain),
          ),
          body: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (widget.id == 0 || state.notificationStatus.isFailure && state.singleNotification != null) {
                return Center(
                  child: Lottie.asset("assets/anim/404.json"),
                );
              }

              if (state.singleStatus.isInProgress || state.singleStatus.isInitial) {
                return const Center(child: CupertinoActivityIndicator());
              }
              final notification = state.singleNotification!;

              return Padding(
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
                                if (notification.title != null) ...{
                                  Text(notification.title ?? '', style: fonts.regularMain)
                                },
                                if (notification.createdAt != null) ...{
                                  Text(
                                    notification.createdAt ?? '',
                                    style: fonts.xxSmallText.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                                  )
                                },
                                if (notification.body != null) ...{
                                  Text(notification.body ?? '', style: fonts.xSmallMain)
                                },
                              ],
                            ),
                          ),
                        ),
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
  }
}
