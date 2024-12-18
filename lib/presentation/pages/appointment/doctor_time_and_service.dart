import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/domain/sources/doctors_time.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_bottomsheet_seans.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';

import 'package:medion/presentation/pages/appointment/component/doctors_date_item.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorTimeAndService extends StatefulWidget {
  final int? seansCount;
  const DoctorTimeAndService({super.key, this.seansCount});

  @override
  State<DoctorTimeAndService> createState() => _DoctorTimeAndServiceState();
}

class _DoctorTimeAndServiceState extends State<DoctorTimeAndService> {
  int chose = 1;
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
        children: [
          Expanded(
            child: CustomListView(
              padding: EdgeInsets.only(top: 16.h),
              itemBuilder: (_, item) {
                return DoctorsDateItem(
                  name: item['name'],
                  profession: item['profession'],
                );
              },
              data: doctorsTimeData,
              emptyWidgetModel: null,
              status: FormzSubmissionStatus.success,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            width: double.infinity,
            color: chose >= 1 ? null : colors.shade0,
            decoration: chose >= 1
                ? BoxDecoration(
                    color: colors.shade0,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r)),
                  )
                : null,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (chose >= 1) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Выбраны $chose услуги",
                      style: fonts.xSmallLink.copyWith(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                    AnimationButtonEffect(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                      color: colors.shade0,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.r),
                                          topRight: Radius.circular(8.r))),
                                  child: CBottomsheetSeans(
                                    chose: 1,
                                  ));
                            });
                      },
                      child: icons.right.svg(
                          width: 20.w,
                          height: 20.h,
                          color: colors.iconGreyColor),
                    )
                  ],
                ),
                12.h.verticalSpace,
              ],
              CButton(title: "Продолжить", onTap: () {}, iconPath: icons.right),
              24.h.verticalSpace,
            ]),
          ),
        ],
      );
    });
  }
}
