import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/pages/appointment/component/doctors_date_item.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorTimeAndService extends StatefulWidget {
  final int? seansCount;
  final VoidCallback onTap;

  const DoctorTimeAndService({super.key, this.seansCount, required this.onTap});

  @override
  State<DoctorTimeAndService> createState() => _DoctorTimeAndServiceState();
}

class _DoctorTimeAndServiceState extends State<DoctorTimeAndService> {
  int _selectedServiceCount = 0;
  List<dynamic> _services = [];
  bool _isLoading = true;

  String? _selectedDate;
  String? _selectedTime;

  final Set<String> _selectedTimes = {}; // Keep track of all selected times
  final Set<String> _disabledTimeSlots = {}; // Only for the +30min slots

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
  void initState() {
    super.initState();

    _fetchServiceData();
  }

  Future<void> _fetchServiceData() async {
    final selectedId =
        context.read<BookingBloc>().state.selectedInnerServiceIds;
    try {
      final response = await http.post(
        Uri.parse('https://his.uicgroup.tech/apiweb/booking/doctors'),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: json.encode({
          "service_ids": [1961, 2019, 2021, 2022, 2023, 2024, 2078]
        }),
      );

      if (response.statusCode == 200) {
        final utf8Body = utf8.decode(response.bodyBytes);
        setState(() {
          _services = json.decode(utf8Body);
          _isLoading = false;
        });
      } else {
        _handleError('Failed to load services');
      }
    } catch (e) {
      _handleError('Error: ${e.toString()}');
    }
  }

  void _handleError(String message) {
    setState(() {
      _isLoading = false;
    });
  }

  Map<String, List<String>> _processTimeSlots(
      List<Map<String, dynamic>> schedules) {
    Map<String, List<String>> timeSlots = {};

    for (var schedule in schedules) {
      schedule.forEach((date, entries) {
        timeSlots.putIfAbsent(date, () => []);
        timeSlots[date]!.addAll((entries as List)
            .where((entry) => entry['active'] == true)
            .map((entry) => entry['time'] as String));
      });
    }

    return timeSlots;
  }

  Widget _buildServiceSection(dynamic service) {
    var companies = service['companies_doctors'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildServiceHeader(service),
        ...companies.expand((company) =>
            (company['doctor'] as List<dynamic>).map(_buildDoctorItem)),
      ],
    );
  }

  Widget _buildServiceHeader(dynamic service) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Text(
        service['service_name'] ?? 'Unknown Service',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildDoctorItem(dynamic doctor) {
    var rawSchedules = doctor['schedules'] as List<dynamic>;
    List<Map<String, dynamic>> schedules =
        rawSchedules.whereType<Map<String, dynamic>>().toList();

    Map<String, List<String>> timeSlots = _processTimeSlots(schedules);

    return DoctorsDateItem(
      disabledTimeSlots: _disabledTimeSlots,
      name: doctor['name'] ?? 'Unknown Name',
      profession: doctor['specialty'] ?? 'Unknown Profession',
      image: doctor['image'],
      dates: schedules,
      timeSlots: timeSlots,
      onDateSelected: (date) {
        setState(() {
          _selectedDate = date;
          _selectedTimes.clear();
          _disabledTimeSlots.clear();
        });
      },
      onTimeSelected: (time) {
        setState(() {
          // Update the selected time
          _selectedTime = time;

          // Increment the service count
          _selectedServiceCount++;

          // Add selected time to the _selectedTimes set
          _selectedTimes.add(time);

          // Get the next 30-minute increment of the selected time
          final next30Min = getNext30MinSlot(time);

          // Add both the selected time and the next 30-minute increment to the disabled time slots
          _disabledTimeSlots.add(time);
          _disabledTimeSlots.add(next30Min);
        });
      },
    );
  }

  Widget _buildBottomSection(colors, fonts) {
    return _selectedServiceCount > 0
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Выбраны $_selectedServiceCount услуги",
                  style: fonts.labelSmall?.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (_selectedDate != null && _selectedTime != null)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      "Дата: ${_formatDate(_selectedDate!)}\nВремя: $_selectedTime",
                      style: fonts.bodyMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(builder: (context, state) {
      return ThemeWrapper(
        builder: (context, colors, fonts, icons, controller) {
          if (_isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_services.isEmpty) {
            return Center(
              child: Text(
                "no_result_found".tr(),
                style: fonts.headlineMain,
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _services.length,
                  padding: EdgeInsets.only(top: 16.h),
                  itemBuilder: (context, index) =>
                      _buildServiceSection(_services[index]),
                ),
              ),
              _buildBottomSection(colors, Theme.of(context).textTheme),
            ],
          );
        },
      );
    });
  }
}

String _formatDate(String dateStr) {
  try {
    final DateTime date = DateTime.parse(dateStr);
    return DateFormat('EEEE, dd MMMM')
        .format(date); // Output: Monday, 27 January
  } catch (e) {
    return 'Invalid Date'; // Handle invalid date
  }
}
