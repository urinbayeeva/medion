import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/dicsount/discount_page.dart';
import 'package:medion/presentation/pages/visits/component/visit_detail_page.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:medion/utils/enums/notification_type_enum.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
    required this.colors,
    required this.icons,
    required this.fonts,
    required this.onTap,
    required this.type,
  });

  final NotificationModel notification;
  final NotificationTypeEnum type;
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
            color: colors.shade0,
            border: Border.all(color: (notification.isRead ?? false) ? Colors.transparent : colors.error500),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 10, bottom: !type.isLink ? 10 : 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (notification.createdAt != null) ...{
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              notification.createdAt!,
                              style: fonts.xSmallMain.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                            ),
                            Text(
                              notification.createdAt!,
                              style: fonts.xSmallMain.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                            ),
                          ],
                        )
                      },
                      if (notification.title != null) ...{
                        Text(notification.title ?? '', style: fonts.regularMain),
                      },
                      if (notification.body != null) ...{
                        Text(
                          notification.body!,
                          style: fonts.xSmallText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      },
                    ],
                  ),
                ),

                ///type.subTitle.isNotEmpty && type.subTitle.length > 3
                if (type.isLink || type.isDiscount || type.isReview) ...{
                  Container(
                    width: double.infinity,
                    height: 41,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.r)),
                      color: colors.error500,
                    ),
                    child: WScaleAnimation(
                      onTap: () async {
                        if (type.isReview) {
                        } else if (type.isLink) {
                          await MyFunctions.openLink(notification.link ?? "");
                        } else if (type.isDiscount) {
                          if (notification.discount?.id != null) {
                            Navigator.of(context, rootNavigator: true).push(
                              AppRoutes.getInfoViewAboutHealth(
                                id: notification.discount!.id!,
                                type: ContentTypeEnum.discount,
                              ),
                            );
                          } else {
                            context.showPopUp(
                              status: PopUpStatus.warning,
                              message: "Id not found",
                              fonts: fonts,
                              colors: colors,
                              context: context,
                            );
                          }
                        } else if (type.isReminder) {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return VisitDetailPage(
                                  id: notification.reminder!.id ?? 0,
                                  onTap: () {},
                                  image: notification.reminder!.image!,
                                  doctorName: notification.reminder!.doctorName!,
                                  visitDate: notification.reminder!.startDate!,
                                );
                              },
                            ),
                          ).then((value) {
                            context.read<NotificationBloc>();
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            type.subTitle,
                            style: fonts.xSmallLink.copyWith(
                              color: colors.shade0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          icons.right.svg(height: 24, width: 24, color: colors.shade0),
                        ],
                      ),
                    ),
                  )
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
