import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class TimeSlotSelection extends StatefulWidget {
  const TimeSlotSelection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeSlotSelectionState createState() => _TimeSlotSelectionState();
}

class _TimeSlotSelectionState extends State<TimeSlotSelection> {
  final List<String> timeSlots = [
    "08:30",
    "09:30",
    "10:30",
    "11:30",
    "12:30",
    "13:30",
    "14:00",
    "16:30"
  ];

  final List<bool> availability = [
    true,
    true,
    false,
    false,
    true,
    true,
    false,
    true
  ];
  int selectedSlotIndex = 1;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SizedBox(
        height: 100.h,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 2.2,
          ),
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            bool isAvailable = availability[index];
            bool isSelected = index == selectedSlotIndex;

            return GestureDetector(
              onTap: isAvailable
                  ? () {
                      setState(() {
                        selectedSlotIndex = index;
                      });
                    }
                  : null,
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? colors.error500
                      : isAvailable
                          ? colors.neutral200
                          : colors.neutral200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isSelected == true) ...[
                      icons.check.svg(width: 16.w, height: 16.h),
                    ],
                    Text(
                      timeSlots[index],
                      style: TextStyle(
                        color: isSelected
                            ? colors.shade0
                            : isAvailable
                                ? colors.primary900
                                : const Color(0x2600040A),
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
