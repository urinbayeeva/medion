import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/appointment/component/time_slot_selection.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorsDateItem extends StatefulWidget {
  final String? name;
  final String? profession;
  final String? image;
  final bool? active;
  final List<dynamic>? dates;
  final Map<String, List<String>>? timeSlots;
  final Function(String)? onDateSelected;
  final Function(String)? onTimeSelected;
  final Set<String> disabledTimeSlots;

  const DoctorsDateItem({
    super.key,
    this.name,
    this.profession,
    this.image,
    this.dates,
    this.timeSlots,
    this.onDateSelected,
    this.onTimeSelected,
    this.active,
    required this.disabledTimeSlots,
  });

  @override
  State<DoctorsDateItem> createState() => _DoctorsDateItemState();
}

class _DoctorsDateItemState extends State<DoctorsDateItem> {
  int _selectedDateIndex = 0;
  int _selectedTimeSlotIndex = -1;

  // Helper method to get next 30-minute slot
  String getNext30MinSlot(String timeSlot) {
    final parts = timeSlot.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    
    minutes += 30;
    if (minutes >= 60) {
      minutes = 0;
      hours += 1;
    }
    
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              isThreeLine: true,
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.neutral200,
                ),
                child: widget.image != null && widget.image!.isNotEmpty
                    ? CachedNetworkImage(imageUrl: widget.image!)
                    : icons.nonUser.svg(),
              ),
              title: Text(
                widget.name ?? "",
                style: fonts.smallMain.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                widget.profession ?? "",
                style: fonts.xSmallMain.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: colors.primary900,
                ),
              ),
            ),
            12.h.verticalSpace,
            Text("select_date".tr(),
                style: fonts.xSmallMain.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                )),
            6.h.verticalSpace,
            if (widget.dates != null && widget.dates!.isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: 36.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.dates!.length,
                  itemBuilder: (context, index) {
                    String date = widget.dates![index].keys.first;
                    return GestureDetector(
                      onTap: () {
                        widget.onDateSelected?.call(date);
                        setState(() {
                          _selectedDateIndex = index;
                          _selectedTimeSlotIndex = -1;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        width: 140.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          border: _selectedDateIndex == index
                              ? null
                              : Border.all(width: 1, color: colors.neutral400),
                          color: _selectedDateIndex == index
                              ? colors.error500
                              : colors.shade0,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            date,
                            style: TextStyle(
                              color: _selectedDateIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            12.h.verticalSpace,
            Text("select_recording_time".tr(),
                style: fonts.xSmallMain.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                )),
            6.h.verticalSpace,
            if (widget.timeSlots != null &&
                widget.dates != null &&
                widget.dates!.isNotEmpty)
              ResponsiveTimeSlotGrid(
                active: widget.active ?? false,
                dates: widget.dates,
                timeSlots: widget.timeSlots,
                selectedDateIndex: _selectedDateIndex,
                selectedTimeSlotIndex: _selectedTimeSlotIndex,
                disabledTimeSlots: widget.disabledTimeSlots,
                onTimeSlotSelected: (index) {
                  final selectedTime = widget.timeSlots![
                      widget.dates![_selectedDateIndex].keys.first]![index];
                  
                  setState(() {
                    _selectedTimeSlotIndex = index;
                  });
                  
                  // Call onTimeSelected with the selected time
                  widget.onTimeSelected?.call(selectedTime);
                },
              ),
            20.h.verticalSpace,
          ],
        ),
      );
    });
  }
}