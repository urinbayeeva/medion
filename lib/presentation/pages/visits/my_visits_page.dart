// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/calendar_style.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/header_style.dart';
import 'package:medion/presentation/component/table_calendar/src/shared/utils.dart';
import 'package:medion/presentation/component/table_calendar/src/table_calendar.dart';
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/application/auth/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
// ... other imports ...

class MyVisitsPage extends StatefulWidget {
  const MyVisitsPage({super.key});

  @override
  State<MyVisitsPage> createState() => _MyVisitsPageState();
}

class _MyVisitsPageState extends State<MyVisitsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DateTime _firstDay = DateTime(2020, 1, 1);
  final DateTime _lastDay = DateTime(2030, 1, 1);
  DateTime? _selectedDate;
  bool _isDateSelected = false;

  // Month selection
  String? _selectedMonth;
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _loadVisitsData();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.index != 2 && _selectedMonth != null) {
      setState(() => _selectedMonth = null);
    }
  }

  void _loadVisitsData() {
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientVisits());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ThemeWrapper(
          builder: (context, colors, fonts, icons, _) {
            return Scaffold(
              backgroundColor: colors.backgroundColor,
              body: Column(
                children: [
                  _buildAppBar(colors, fonts, icons),
                  SizedBox(height: 8.h),
                  _buildContentArea(state, colors, fonts),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAppBar(colors, fonts, icons) {
    return CAppBar(
      leading: _tabController.index == 2
          ? 80.w.horizontalSpace
          : 60.w.horizontalSpace,
      padding: EdgeInsets.zero,
      bordered: true,
      isBack: false,
      title: "my_visits".tr(),
      centerTitle: true,
      bottom: _buildTabBar(colors, fonts),
      trailing: _buildTrailingButtons(icons),
    );
  }

  Widget _buildTabBar(colors, fonts) {
    return TabBar(
      controller: _tabController,
      indicatorWeight: 3,
      overlayColor: MaterialStateProperty.all(colors.shade0),
      indicatorColor: colors.error500,
      tabs: [
        _buildTab("all".tr(), fonts),
        _buildTab("week".tr(), fonts),
        _buildTab("month".tr(), fonts),
        _buildTab("year".tr(), fonts),
      ],
    );
  }

  Widget _buildTab(String text, fonts) {
    return Tab(
      child: Text(
        text,
        style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
      ),
    );
  }

  Widget _buildTrailingButtons(icons) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isDateSelected || _selectedMonth != null)
          AnimationButtonEffect(
            onTap: _resetSelections,
            child: Icon(Icons.cancel, size: 20.w),
          ),
        if (_tabController.index == 2) _buildMonthDropdown(),
        if (_tabController.index != 2)
          AnimationButtonEffect(
            onTap: _showCalendarDialog,
            child: SvgPicture.asset("assets/icons/calendar.svg"),
          ),
      ],
    );
  }

  Widget _buildMonthDropdown() {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: PopupMenuButton<String>(
        color: Colors.white,
        elevation: 0,
        icon: Text(_selectedMonth ?? DateFormat.MMMM().format(DateTime.now())),
        onSelected: (month) => setState(() => _selectedMonth = month),
        itemBuilder: (context) => _months.map((month) {
          return PopupMenuItem<String>(
            value: month,
            child: Text(month),
          );
        }).toList(),
      ),
    );
  }

  void _resetSelections() {
    setState(() {
      _selectedDate = null;
      _isDateSelected = false;
      _selectedMonth = null;
    });
  }

  Widget _buildContentArea(AuthState state, colors, fonts) {
    return Expanded(
      child: state.isLoadingVisits
          ? _buildLoadingIndicator(colors)
          : _buildTabViews(state, colors, fonts),
    );
  }

  Widget _buildLoadingIndicator(colors) {
    return Center(
      child: CircularProgressIndicator(color: colors.error500),
    );
  }

  Widget _buildTabViews(AuthState state, colors, fonts) {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildVisitsList(state.patientVisits, colors, fonts),
        _buildVisitsList(
          VisitDataFilter.filterByPeriod(
            state.patientVisits,
            VisitPeriod.week,
            selectedMonth: null,
            months: _months,
          ),
          colors,
          fonts,
        ),
        _buildVisitsList(
          VisitDataFilter.filterByPeriod(
            state.patientVisits,
            VisitPeriod.month,
            selectedMonth: _selectedMonth,
            months: _months,
          ),
          colors,
          fonts,
        ),
        _buildVisitsList(
          VisitDataFilter.filterByPeriod(
            state.patientVisits,
            VisitPeriod.year,
            selectedMonth: null,
            months: _months,
          ),
          colors,
          fonts,
        ),
      ],
    );
  }

  Widget _buildVisitsList(List<dynamic> visits, colors, fonts) {
    try {
      final groupedVisits = VisitDataGrouper.groupByDate(visits);
      final filteredVisits = _applyDateFilter(groupedVisits);

      if (filteredVisits.isEmpty ||
          filteredVisits.values.every((list) => list.isEmpty)) {
        return _buildEmptyState(colors, fonts);
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: filteredVisits.length,
        itemBuilder: (context, index) {
          final date = filteredVisits.keys.elementAt(index);
          final visitsForDate = filteredVisits[date] ?? [];
          if (visitsForDate.isEmpty) return SizedBox.shrink();
          return _buildVisitCard(visitsForDate, date, colors, fonts);
        },
      );
    } catch (e) {
      return _buildEmptyState(colors, fonts);
    }
  }

  Widget _buildVisitItem(dynamic visit, colors, fonts) {
    final visitData = visit.visits.first;
    return Column(
      children: [
        VisitInfoCard(
          onTap: () => _navigateToVisitDetail(visitData),
          doctorJob: visitData.doctorSpecialization ?? "N/A",
          doctorName: visitData.doctorFullName ?? "N/A",
          visitDate: visitData.visitDate,
          serviceName: visitData.serviceName,
          visitTime: visitData.visitTime,
          visitStatus: visitData.paymentStatus == "paid" ? "Paid" : "Not Paid",
          image: visitData.imageUrl,
          categoryName: visitData.categoryName,
        ),
        SizedBox(height: 12.h),
        _buildVisitFooter(visit, visitData, colors, fonts),
      ],
    );
  }

  Widget _buildVisitFooter(dynamic visit, dynamic visitData, colors, fonts) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('dd MMMM yyyy')
                  .format(DateTime.parse(visitData.visitDate)),
              // style: fonts.small.copyWith(fontWeight: FontWeight.bold),
            ),
            CButton(
              backgroundColor: colors.neutral200,
              textColor: colors.primary900,
              width: 160.w,
              height: 38.h,
              onTap: () => _openInvoice(visit),
              title: "open_invoice".tr(),
            ),
          ],
        ),
        Divider(color: colors.neutral300, height: 16.h),
      ],
    );
  }

  Widget _buildVisitCard(List<dynamic> visits, String date, colors, fonts) {
    return AnimationButtonEffect(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.all(12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (visits.isNotEmpty)
              Text(
                "${"order".tr()}: ${visits.first.orderNumber}",
                // style: fonts.medium.copyWith(fontWeight: FontWeight.w600),
              ),
            SizedBox(height: 12.h),
            ...visits.map((visit) => _buildVisitItem(visit, colors, fonts)),
          ],
        ),
      ),
    );
  }

  Map<String, List<dynamic>> _applyDateFilter(
      Map<String, List<dynamic>> visits) {
    if (_selectedDate == null) return visits;

    final selectedDateStr = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    final visitsForDate = visits[selectedDateStr] ?? [];

    return visitsForDate.isNotEmpty ? {selectedDateStr: visitsForDate} : {};
  }

  Widget _buildEmptyState(colors, fonts) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/emoji-sad_d.svg",
            width: 73.w,
            height: 75.h,
          ),
          SizedBox(height: 12.h),
          Text(
            _selectedDate == null
                ? "you_have_no_visits".tr()
                : "you_have_no_visits_on".tr(namedArgs: {
                    "date":
                        DateFormat('dd MMMM yyyy', context.locale.toString())
                            .format(_selectedDate!)
                  }),
            style: fonts.smallLink.copyWith(
              color: colors.neutral600,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToVisitDetail(dynamic visitData) {
    context.read<BottomNavBarController>().changeNavBar(true);
    Navigator.push(
      context,
      AppRoutes.getVisitDetailPage(
        longitude: visitData.longitude,
        latitude: visitData.latitude,
        categoryName: visitData.categoryName,
        serviceName: visitData.serviceName,
        doctorName: visitData.doctorFullName,
        servicePrice: 10,
        visitDate: "${visitData.visitDate}, ${visitData.visitTime}",
        visitLocation: visitData.address,
        visitStatus: visitData.paymentStatus,
        visitPaymentByWhom: "",
        paymentMethod: visitData.paymentMethod,
        data: [visitData],
        image: visitData.imageUrl,
      ),
    ).then((_) => context.read<BottomNavBarController>().changeNavBar(false));
  }

  void _openInvoice(dynamic visit) {
    context.read<BottomNavBarController>().changeNavBar(true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentWebView(
          isInvoice: true,
          url: visit.orderCheckPdfUrl,
        ),
      ),
    ).then((_) => context.read<BottomNavBarController>().changeNavBar(false));
  }

  void _showCalendarDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Style.shade0,
          content: SizedBox(
            height: 400.h,
            width: 560.w,
            child: TableCalendar(
              locale: context.locale.toString(),
              rowHeight: 40,
              daysOfWeekHeight: 35,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                markerSize: 48,
                todayDecoration: BoxDecoration(
                  color: Style.error500,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              focusedDay: _selectedDate ?? DateTime.now(),
              firstDay: _firstDay,
              lastDay: _lastDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              onDaySelected: (selectedDay, _) {
                setState(() {
                  _selectedDate = selectedDay;
                  _isDateSelected = true;
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}

class VisitDataFilter {
  static List<dynamic> filterByPeriod(
    List<dynamic> visits,
    VisitPeriod period, {
    String? selectedMonth,
    required List<String> months,
  }) {
    if (period == VisitPeriod.all) return visits;

    final now = DateTime.now();
    DateTime startDate;
    DateTime? endDate;

    switch (period) {
      case VisitPeriod.week:
        startDate = now.subtract(const Duration(days: 7));
        break;

      case VisitPeriod.month:
        if (selectedMonth != null) {
          final monthIndex = months.indexOf(selectedMonth) + 1;
          final year = now.year;
          startDate = DateTime(year, monthIndex, 1);
          endDate = monthIndex < 12
              ? DateTime(year, monthIndex + 1, 1)
              : DateTime(year + 1, 1, 1);
          break;
        }
        startDate = DateTime(now.year, now.month - 1, now.day);
        break;

      case VisitPeriod.year:
        startDate = DateTime(now.year, 1, 1);
        break;

      default:
        return visits;
    }

    return visits.where((visit) {
      if (visit?.visits?.first?.visitDate == null) return false;
      final visitDate = DateTime.parse(visit.visits.first.visitDate);

      if (endDate != null) {
        return visitDate.isAfter(startDate) && visitDate.isBefore(endDate!);
      }
      return visitDate.isAfter(startDate);
    }).toList();
  }
}

class VisitDataGrouper {
  static Map<String, List<dynamic>> groupByDate(List<dynamic> visits) {
    final Map<String, List<dynamic>> groupedVisits = {};

    for (final visit in visits) {
      if (visit?.visits?.first?.visitDate != null) {
        final date = visit.visits.first.visitDate;
        groupedVisits.putIfAbsent(date, () => []).add(visit);
      }
    }

    final sortedKeys = groupedVisits.keys.toList()
      ..sort((a, b) => b.compareTo(a));
    return Map.fromEntries(
        sortedKeys.map((key) => MapEntry(key, groupedVisits[key]!)));
  }
}

enum VisitPeriod { all, week, month, year }
