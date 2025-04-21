import 'package:flutter/material.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ResponsiveTimeSlotGrid extends StatelessWidget {
  final List<dynamic>? dates;
  final Map<String, List<String>>? timeSlots;
  final int selectedDateIndex;
  final int? selectedTimeSlotIndex;
  final Function(int) onTimeSlotSelected;
  final bool active;
  final Set<String> disabledTimeSlots;

  const ResponsiveTimeSlotGrid({
    super.key,
    required this.dates,
    required this.timeSlots,
    required this.selectedDateIndex,
    required this.selectedTimeSlotIndex,
    required this.onTimeSlotSelected,
    required this.active,
    required this.disabledTimeSlots,
  });

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

  bool isTimeSlotDisabled(String timeSlot) {
    return disabledTimeSlots.contains(timeSlot);
  }

  @override
  Widget build(BuildContext context) {
    final availableTimeSlots =
        timeSlots?[dates?[selectedDateIndex].keys.first] ?? [];

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _calculateCrossAxisCount(4),
            childAspectRatio: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 8,
          ),
          itemCount: availableTimeSlots.length,
          itemBuilder: (context, index) =>
              _buildTimeSlotItem(context, availableTimeSlots[index], index),
        );
      },
    );
  }

  int _calculateCrossAxisCount(double width) {
    if (width > 600) return 6;
    if (width > 400) return 5;
    return 4;
  }

  Widget _buildTimeSlotItem(BuildContext context, String timeSlot, int index) {
    final isSelected = selectedTimeSlotIndex == index;
    final isDisabled = isTimeSlotDisabled(timeSlot);

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return GestureDetector(
        onTap: isDisabled ? null : () => onTimeSlotSelected(index),
        child: Container(
          decoration: BoxDecoration(
            border: isSelected
                ? null
                : Border.all(width: 1, color: colors.neutral400),
            color: isDisabled
                ? colors.neutral200
                : (active
                    ? colors.neutral200
                    : (isSelected ? colors.error500 : colors.shade0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              timeSlot,
              style: fonts.xSmallMain.copyWith(
                color: isDisabled
                    ? colors.neutral600
                    : (isSelected ? Colors.white : Colors.black),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    });
  }
}
