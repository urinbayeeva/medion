import 'package:flutter/material.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ResponsiveTimeSlotGrid extends StatelessWidget {
  final List<dynamic>? dates;
  final Map<String, List<String>>? timeSlots;
  final int selectedDateIndex;
  final int? selectedTimeSlotIndex;
  final Function(int) onTimeSlotSelected;

  const ResponsiveTimeSlotGrid({
    super.key,
    required this.dates,
    required this.timeSlots,
    required this.selectedDateIndex,
    required this.selectedTimeSlotIndex,
    required this.onTimeSlotSelected,
  });

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
            crossAxisCount: _calculateCrossAxisCount(constraints.maxWidth),
            childAspectRatio: 1.8,
            crossAxisSpacing: 8,
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

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return GestureDetector(
        onTap: () => onTimeSlotSelected(index),
        child: Container(
          decoration: BoxDecoration(
            border: isSelected
                ? null
                : Border.all(width: 1, color: colors.neutral400),
            color: isSelected ? colors.error500 : colors.shade0,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              timeSlot,
              style: fonts.xSmallMain.copyWith(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    });
  }
}
