import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
    required this.colors,
    required this.icons,
    required this.fonts,
    required this.onTap,
  });

  final NotificationModel notification;
  final CustomColorSet colors;
  final IconSet icons;
  final FontSet fonts;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: (notification.isRead ?? false) ? Colors.transparent : Style.green),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  if (notification.title != null) ...{
                    Text(notification.title!, style: fonts.regularMain),
                  },
                  if (notification.body != null) ...{
                    Text(
                      notification.body!,
                      style: fonts.xSmallText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  },
                  if (notification.createdAt != null) ...{
                    Text(
                      notification.createdAt!,
                      style: fonts.xxSmallText.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                    ),
                  },
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
