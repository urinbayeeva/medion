import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VerifyAppointment extends StatelessWidget {
  final VoidCallback onTap;
  const VerifyAppointment({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
        children: [
          Expanded(
            child: CustomListView(
                loadingItemCount: 1,
                count: 1,
                padding: EdgeInsets.only(top: 16.h),
                itemBuilder: (_, item) {
                  return const VerifyAppointmentItem();
                },
                // data: doctorsData,
                emptyWidgetModel:
                    ErrorWidgetModel(title: "", subtitle: "subtitle"),
                status: FormzSubmissionStatus.success, data: [],),
          ),
          Container(
              // height: 70.h,
              decoration: BoxDecoration(color: colors.shade0),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                      title: "Продолжить", onTap: onTap, iconPath: icons.right),
                  14.h.verticalSpace,
                ],
              )),
        ],
      );
    });
  }
}
