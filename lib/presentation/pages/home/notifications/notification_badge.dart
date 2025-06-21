import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({super.key, required this.onTap, required this.icons, required this.colors});

  final VoidCallback onTap;
  final CustomColorSet colors;
  final IconSet icons;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      buildWhen: (o, n) => o.notifications.length != n.notifications.length,
      builder: (context, state) {
        if (state.notifications.length > 9) {
          return WScaleAnimation(
            onTap: onTap,
            child: icons.notificationBadge.svg(width: 24.w, height: 24.h),
          );
        } else if (state.notifications.length < 9 && state.notifications.isNotEmpty) {
          return Badge.count(
            count: state.notifications.length + 2,
            child: Transform.rotate(
              angle: 0.785398,
              child: WScaleAnimation(
                onTap: onTap,
                child: icons.notification.svg(
                  color: colors.primary900,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
          );
        }

        return WScaleAnimation(
          onTap: onTap,
          child: icons.notification.svg(color: colors.primary900, width: 24.w, height: 24.h),
        );
      },
    );
  }
}
