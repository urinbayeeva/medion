// // horizontal_calendar.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:intl/intl.dart';
// import 'package:medion/application/calendar/calendar_bloc.dart';
// import 'package:medion/application/calendar/calendar_event.dart';
// import 'package:medion/application/calendar/calendar_state.dart';
// import 'package:medion/presentation/styles/theme_wrapper.dart';
//
// class CalendarDayWidget extends StatelessWidget {
//   final PageController _pageController = PageController(initialPage: 0);
//
//   CalendarDayWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CalendarBloc(),
//       child: BlocBuilder<CalendarBloc, CalendarState>(
//         builder: (context, state) {
//           DateTime selectedDate = state.selectedDate;
//           DateTime startOfWeek = selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
//
//           return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${DateFormat.yMMMM('ru').format(selectedDate)[0].toUpperCase()}${DateFormat.yMMMM('ru').format(selectedDate).substring(1)}',
//                   style: fonts.smallMain.copyWith(fontSize: 15.sp),
//                 ),
//                 12.h.verticalSpace,
//                 SizedBox(
//                   height: 66.h,
//                   child: PageView.builder(
//                     controller: _pageController,
//                     onPageChanged: (pageIndex) {
//                       DateTime newDate = startOfWeek.add(Duration(days: 7 * (pageIndex - 0)));
//                       context.read<CalendarBloc>().add(SelectDate(newDate));
//                     },
//                     itemBuilder: (context, pageIndex) {
//                       DateTime weekStartDate = startOfWeek.add(Duration(days: 7 * (pageIndex - 0)));
//                       // return _buildWeekRow(context, weekStartDate, selectedDate);
//                       return Text("data");
//                     },
//                   ),
//                 ),
//               ],
//             );
//           });
//         },
//       ),
//     );
//   }
//
//   Widget _buildWeekRow(BuildContext context, DateTime weekStartDate, DateTime selectedDate) {
//     return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(7, (index) {
//           DateTime date = weekStartDate.add(Duration(days: index));
//           bool isSelected =
//               date.day == selectedDate.day && date.month == selectedDate.month && date.year == selectedDate.year;
//           // ignore: unused_local_variable
//           bool isToday =
//               date.day == DateTime.now().day && date.month == DateTime.now().month && date.year == DateTime.now().year;
//
//           return GestureDetector(
//             onTap: () {
//               context.read<CalendarBloc>().add(SelectDate(date));
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.r),
//                 color: isSelected ? colors.error500 : Colors.transparent,
//                 shape: BoxShape.rectangle,
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                       '${DateFormat.E('ru').format(date)[0].toUpperCase()}${DateFormat.E('ru').format(date).substring(1)}',
//                       style: fonts.xSmallText.copyWith(color: isSelected ? colors.shade0 : colors.neutral800)),
//                   const SizedBox(height: 8),
//                   Text(
//                     date.day.toString(),
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: isSelected ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       );
//     });
//   }
// }
