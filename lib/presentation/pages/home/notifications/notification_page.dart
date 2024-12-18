import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/domain/sources/notification_data.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
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
          body: Column(
            children: [
              CAppBar(
                title: "Уведомления",
                isBack: true,
                centerTitle: true,
                trailing: 23.w.horizontalSpace,
              ),
              Expanded(
                  child: Column(
                children: [
                  const Spacer(),
                  icons.ringBell.svg(),
                  Text(
                    "Уведомлений пока нету",
                    style: fonts.regularLink.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.neutral600),
                  ),
                  const Spacer(),
                ],
              )),
              // Expanded(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16.w),
              //     child: CustomListView(
              //       itemBuilder: (int index, Map<String, dynamic> item) {
              //         return _buildNotificationTile(item);
              //       },
              //       data: notificationData,
              //       status: FormzSubmissionStatus.success,
              //       emptyWidgetModel: ErrorWidgetModel(
              //         title: "Уведомлений пока нету",
              //         subtitle: "Уведомлений пока нету",
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationTile(Map<String, dynamic> item) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        child: ListTile(
          onLongPress: () {},
          leading: CircleAvatar(
            radius: 32.r,
            backgroundColor: const Color(0xFFF9F9F9),
            child: Image.asset(item['image'], fit: BoxFit.fill),
          ),
          title: Text(item['priyom'],
              style: fonts.xSmallMain.copyWith(
                  color: colors.neutral600,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600)),
          subtitle: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'],
                style: fonts.smallMain
                    .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  icons.clock
                      .svg(width: 12.w, height: 12.h, color: colors.neutral600),
                  4.w.horizontalSpace,
                  Text(
                    item['data'],
                    style: fonts.xxSmallText
                        .copyWith(fontSize: 11.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  icons.location
                      .svg(width: 12.w, height: 12.h, color: colors.neutral600),
                  4.w.horizontalSpace,
                  Text(
                    item['address'],
                    style: fonts.xxSmallText
                        .copyWith(fontSize: 11.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          isThreeLine: true,
        ),
      );
    });
  }
}
