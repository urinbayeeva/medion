import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/calendar_style.dart';
import 'package:medion/presentation/component/table_calendar/src/customization/header_style.dart';
import 'package:medion/presentation/pages/profile/widget/results_data_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/presentation/component/table_calendar/table_calendar.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage>
    with SingleTickerProviderStateMixin {
  bool isAnalyse = true;
  late TabController _tabController;

  final DateTime firstDay = DateTime(2020, 1, 1);
  final DateTime lastDay = DateTime(2030, 1, 1);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "my_results".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
              bottom: Column(
                children: [
                  _buildTabBar(colors, fonts),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  ResultsDataWidget(type: 'lis'),
                  ResultsDataWidget(type: 'fis'),
                  ResultsDataWidget(type: 'ris'),
                  ResultsDataWidget(type: 'consultation'),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTabBar(colors, fonts) {
    return TabBar(
      controller: _tabController,
      indicatorWeight: 3,
      overlayColor: MaterialStateProperty.all(colors.shade0),
      indicatorColor: colors.error500,
      tabs: [
        _buildTab("LIS".tr(), fonts),
        _buildTab("FIS".tr(), fonts),
        _buildTab("RIS".tr(), fonts),
        _buildTab("doctors_reports".tr(), fonts),
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
}
