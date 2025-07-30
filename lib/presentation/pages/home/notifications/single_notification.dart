import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/infrastructure/services/download_service.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/customer_review/review_card.dart';
import 'package:medion/presentation/pages/others/dicsount/discount_page.dart';
import 'package:medion/presentation/pages/others/feedbacks/feedback_view_vithout_location.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/notification_type_enum.dart';

class SingleNotification extends StatefulWidget {
  const SingleNotification({super.key, required this.id, required this.type, this.notification});

  final int id;
  final NotificationModel? notification;
  final NotificationTypeEnum type;

  @override
  State<SingleNotification> createState() => _SingleNotificationState();
}

class _SingleNotificationState extends State<SingleNotification> {
  @override
  void initState() {
    if (widget.id != 0 || (widget.notification != null && widget.notification!.isRead == false)) {
      context.read<NotificationBloc>().add(NotificationEvent.readNotification(index: widget.id));
    }
    context.read<NotificationBloc>().add(NotificationEvent.getSingleNotification(pk: widget.id));
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
          body: BlocConsumer<NotificationBloc, NotificationState>(
            listenWhen: (old, fresh) {
              final postReview = old.postNotificationReviewStatus != fresh.postNotificationReviewStatus;

              return postReview;
            },
            listener: (context, lState) {
              if (lState.postNotificationReviewStatus.isSuccess) {
                context.read<NotificationBloc>().add(NotificationEvent.readNotification(index: widget.id));
              }
            },
            buildWhen: (old, fresh) {
              final postReview = old.postNotificationReviewStatus != fresh.postNotificationReviewStatus;
              final single = old.singleNotification != fresh.singleNotification;
              final status = old.singleStatus != fresh.singleStatus;
              return postReview || single || status;
            },
            builder: (context, state) {
              log("build time ");
              if (widget.id == 0 || state.notificationStatus.isFailure && state.singleNotification == null) {
                return Center(child: Lottie.asset("assets/anim/404.json"));
              } else if (state.singleStatus.isInProgress && state.singleStatus.isInitial) {
                return const Center(child: CupertinoActivityIndicator());
              } else {
                final notification = state.singleNotification;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        if (widget.notification != null) ...{
                          Text(
                            widget.notification!.title ?? '',
                            style: fonts.mediumMain.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 8,
                            children: [
                              icons.calendar.svg(height: 16, width: 16, color: const Color(0xFF596066)),
                              Text(
                                widget.notification!.date ?? '',
                                style: fonts.xxSmallText.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                              ),
                              Text(
                                widget.notification!.time ?? '',
                                style: fonts.xxSmallText.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                              )
                            ],
                          ),
                          Text(widget.notification!.body ?? '', style: fonts.xSmallMain),
                        } else ...{
                          if (notification?.title != null) ...{
                            Text(
                              notification!.title ?? '',
                              style: fonts.mediumMain.copyWith(fontWeight: FontWeight.w700),
                            ),
                          },
                          if (notification!.date != null) ...{
                            1.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 8,
                              children: [
                                icons.calendar.svg(height: 16, width: 16, color: const Color(0xFF596066)),
                                Text(
                                  notification.date ?? '',
                                  style: fonts.xxSmallText.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                                ),
                                Text(
                                  notification.time ?? '',
                                  style: fonts.xxSmallText.copyWith(fontSize: 12, color: const Color(0xFF596066)),
                                )
                              ],
                            )
                          },
                          if (notification.body != null) ...{
                            4.verticalSpace,
                            Text(widget.notification!.body ?? '', style: fonts.xSmallMain),
                          },
                        },
                        if (widget.type.isLink) ...{
                          10.verticalSpace,
                          CButton(
                            title: '',
                            onTap: () => MyFunctions.openLink(notification?.link ?? (widget.notification?.link ?? '')),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "go".tr(),
                                    style: fonts.xSmallLink.copyWith(
                                      color: colors.shade0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  icons.linkIcon.svg(height: 22, width: 22, color: colors.shade0),
                                ],
                              ),
                            ),
                          )
                        },
                        if (widget.type.isResult) ...{
                          10.verticalSpace,
                          ...List.generate(
                            notification?.labResult?.length ?? 0,
                            (i) {
                              final res = notification?.labResult?[i];
                              return Container(
                                height: 56.h,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: colors.shade0,
                                ),
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${res?.documentName}", style: fonts.regularMain),
                                        Text("${res?.date}", style: fonts.xSmallMain),
                                      ],
                                    ),
                                    const Spacer(),
                                    WScaleAnimation(
                                      onTap: () async {
                                        final service = FileDownloadService();
                                        await service.downloadPDFWithProgress(
                                          context: context,
                                          url: "${res?.documentUrl}",
                                          fileName: "${res?.documentName}",
                                          colors: colors,
                                        );
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: colors.neutral300,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: icons.download.svg(height: 16, width: 16),
                                        ),
                                      ),
                                    ),
                                    WScaleAnimation(
                                      onTap: () => MyFunctions.openLink("${res?.documentUrl}"),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: colors.neutral300,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: icons.link.svg(height: 16, width: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        },
                        if (widget.type.isDiscount) ...{
                          SizedBox(
                            width: 163.w,
                            height: 255.h,
                            child: DiscountCard(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) => DiscountPage(
                                      discountId: notification?.discount?.id ?? 0,
                                    ),
                                  ),
                                );
                              },
                              fonts: fonts,
                              colors: colors,
                              title: notification?.discount?.title ?? "",
                              image: notification?.discount?.image ?? "",
                              date: "Акция до {date}".tr(namedArgs: {
                                "date": "${notification?.discount?.endDate}",
                              }),
                            ),
                          ),
                        },
                        if (widget.type.isReminder) ...{
                          10.verticalSpace,
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: colors.shade0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 12,
                                children: [
                                  Container(
                                    width: 77,
                                    height: 77,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: colors.neutral50),
                                    child: CommonImage(imageUrl: "${notification?.reminder?.image}"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        notification?.reminder?.doctorName ?? '',
                                        style: fonts.regularMain,
                                      ),
                                      Row(
                                        spacing: 8,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                                            child: icons.clock.svg(height: 17, width: 17),
                                          ),
                                          Text(
                                            notification?.reminder?.startDate ?? '',
                                            style: fonts.xSmallMain,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        spacing: 4,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          icons.location.svg(height: 20, width: 20),
                                          Text(
                                            notification?.reminder?.location ?? '',
                                            style: fonts.xSmallMain,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        },
                        if (widget.type.isReview && (notification == null || notification.review == null)) ...{
                          FeedBackWithoutLocation(noBack: true, id: widget.notification?.visitId ?? 0),
                        } else if (widget.type.isReview) ...{
                          ReviewCard(
                            margin: const EdgeInsets.only(top: 10),
                            review: GetReviewModel((b) => b
                              ..review = notification!.review!.review ?? ""
                              ..ratings = "${notification.review!.ratings?.length}"
                              ..name = "${notification.review!.name}"
                              ..location = "${notification.review!.location}"
                              ..title = '${notification.review!.name}'),
                            colors: colors,
                            icons: icons,
                            fonts: fonts,
                            status: MyFunctions.getFeedBackStatus(notification?.review?.status ?? ""),
                          ),
                        }
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
