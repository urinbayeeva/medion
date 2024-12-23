import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medion/domain/sources/doctors_time.dart';

import 'package:medion/presentation/pages/appointment/component/time_slot_selection.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DoctorsDateItem extends StatefulWidget {
  final String? name;
  final String? profession;

  const DoctorsDateItem({super.key, this.name, this.profession});

  @override
  State<DoctorsDateItem> createState() => _DoctorsDateItemState();
}

class _DoctorsDateItemState extends State<DoctorsDateItem> {
  int _selectedDateIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              isThreeLine: true,
              leading: Container(
                // width: 78.w,
                // height: 78.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: colors.neutral200),
                child: icons.nargiza.asset(fit: BoxFit.fill),
              ),
              title: Text(
                widget.name ?? "",
                style: fonts.smallMain
                    .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                widget.name ?? "",
                style: fonts.xSmallMain.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: colors.primary900),
              ),
            ),
            8.h.verticalSpace,
            Text(
              "Выберите дату",
              style: fonts.xSmallMain.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.primary900),
            ),
            8.h.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  doctorsTimeData.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        // Ensure valid index
                        if (index >= 0 && index < doctorsTimeData.length) {
                          _selectedDateIndex = index;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 4.w),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        border: _selectedDateIndex == index
                            ? null
                            : Border.all(width: 1, color: colors.neutral400),
                        color: _selectedDateIndex == index
                            ? colors.error500
                            : colors.shade0,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Пн, 16 Октября",
                        style: TextStyle(
                            color: _selectedDateIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            8.h.verticalSpace,
            Text(
              "Выберите время записи",
              style: fonts.xSmallMain.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.primary900),
            ),
            8.h.verticalSpace,
            const TimeSlotSelection(),
            // 8.h.verticalSpace,
            // SizedBox(
            //   height: 32.h,
            //   child: GridView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     padding: EdgeInsets.zero,
            //     itemCount: timesSlot.length, // Use the timesSlot list
            //     itemBuilder: (BuildContext context, int index) {
            //       return GestureDetector(
            //         onTap: () => _selectTimeSlot(index),
            //         child: Container(
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //               color: _selectedTimeSlot == index
            //                   ? colors.error500
            //                   : colors.neutral200,
            //               borderRadius: BorderRadius.circular(8.r)),
            //           child: Text(
            //             timesSlot[index],
            //             style: TextStyle(
            //                 color: _selectedTimeSlot == index
            //                     ? Colors.black
            //                     : Colors.black,
            //                 fontSize: 12.sp,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //         ),
            //       );
            //     },
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 4, // 4 columns
            //       crossAxisSpacing: 4.w, // Spacing between columns
            //     ),
            //   ),
            // ),
            // 24.h.verticalSpace,
          ],
        ),
      );
    });
  }
}
