import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    "08:40",
    "08:50",
    "09:00",
    "09:30",
    "11:00",
    "14:00",
    "16:30"
  ];

  final List<bool> initialAvailability = [
    true,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    true
  ];

  late List<bool> availability;

  int selectedSlotIndex = -1;

  @override
  void initState() {
    super.initState();
    availability = List<bool>.from(initialAvailability);
  }

  void updateAvailability(int selectedIndex) {
    final selectedTime = _parseTime(timeSlots[selectedIndex]);

    setState(() {
      for (int i = 0; i < timeSlots.length; i++) {
        final slotTime = _parseTime(timeSlots[i]);
        if (slotTime.isAfter(selectedTime) &&
            slotTime.isBefore(selectedTime.add(const Duration(minutes: 30)))) {
          availability[i] = false;
        }
      }
    });
  }

  DateTime _parseTime(String time) {
    final parts = time.split(":");
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return DateTime(0, 0, 0, hour, minute);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SizedBox(
        height: 100.h,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
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
                        availability = List<bool>.from(initialAvailability);
                        updateAvailability(index);
                      });
                    }
                  : null,
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? colors.error500
                      : isAvailable
                          ? colors.neutral200
                          : colors.neutral100,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isSelected) ...[
                      icons.check.svg(width: 16.w, height: 16.h),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      timeSlots[index],
                      style: TextStyle(
                        color: isSelected
                            ? colors.shade0
                            : isAvailable
                                ? colors.primary900
                                : colors.neutral600,
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
