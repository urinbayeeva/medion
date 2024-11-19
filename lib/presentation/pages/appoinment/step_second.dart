import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/pages/appoinment/component/appoinment_data.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StepSecond extends StatefulWidget {
  // late int currentStep;
  final PageController pageController;
  final VoidCallback onTap;

  const StepSecond(
      {super.key, required this.pageController, required this.onTap});

  @override
  State<StepSecond> createState() => _StepSecondState();
}

class _StepSecondState extends State<StepSecond> {
  int chose = 0;
  @override
  void initState() {
    context.read<BottomNavBarController>().changeNavBar(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
              itemCount: appointmentDirections.length,
              itemBuilder: (context, index) {
                final item = appointmentDirections[index];
                return CustomExpansionListTile(
                    title: item['service'],
                    children: [
                      Column(
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
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                4.h.verticalSpace,
                                Text(
                                  item['use'],
                                  style: fonts.smallSemLink.copyWith(
                                    color: colors.neutral600,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                4.h.verticalSpace,
                                Text(item['price']),
                              ],
                            ),
                          ),
                        ],
                      )
                    ]);
              },
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
                    onTap: widget.onTap,
                    iconPath: icons.right),
                24.h.verticalSpace,
              ],
            ),
          ),
        ],
      );
    });
  }
}
