import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/domain/sources/appoinment_data.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/component/custom_pagination.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondServicePage extends StatefulWidget {
  final bool? isAdded;
  const SecondServicePage({super.key, this.isAdded});

  @override
  State<SecondServicePage> createState() => _SecondServicePageState();
}

class _SecondServicePageState extends State<SecondServicePage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int chose = 0;
  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return CustomPagination(
          controller: _refreshController,
          onRetry: () {},
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                  child: CustomListView(
                      itemBuilder: (_, item) {
                        return CustomExpansionListTile(
                          title: item['service'],
                          children: [
                            Column(
                              spacing: 4,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          width: 1, color: colors.neutral400),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.w, top: 8.h, right: 16.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item['description'],
                                          style: fonts.smallSemLink.copyWith(
                                            color: colors.primary900,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        AnimationButtonEffect(
                                          onTap: () {
                                            setState(() {
                                              chose++;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: colors.error500,
                                            ),
                                            child: icons.plus.svg(
                                                width: 20.w,
                                                height: 20.h,
                                                color: colors.shade0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.w, top: 8.h, right: 16.w),
                                  child: Text(
                                    item['use'],
                                    style: fonts.smallSemLink.copyWith(
                                      color: colors.neutral600,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.w, top: 8.h, right: 16.w),
                                  child: Text(
                                    item['price'],
                                    style: fonts.smallSemLink.copyWith(
                                      color: colors.primary900,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      data: appointmentDirections,
                      emptyWidgetModel:
                          ErrorWidgetModel(title: "", subtitle: ""),
                      status: FormzSubmissionStatus.inProgress),
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (chose >= 1) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Выбраны $chose услуги",
                              style: fonts.xSmallLink.copyWith(
                                  fontSize: 13.sp, fontWeight: FontWeight.bold),
                            ),
                            icons.right.svg(
                                width: 20.w,
                                height: 20.h,
                                color: colors.iconGreyColor)
                          ],
                        ),
                        12.h.verticalSpace,
                      ],
                      CButton(
                          title: "Продолжить",
                          onTap: () {},
                          iconPath: icons.right),
                    ]),
              ),
            ],
          ));
    });
  }
}
