import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/profile/widget/results_data_widget.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> with SingleTickerProviderStateMixin {
  bool isAnalyse = true;
  late TabController _tabController;
  late final AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
    _bloc.add(const AuthEvent.fetchPatientAnalyze());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("my_results".tr(), style: fonts.regularMain),
            bottom: TabBar(
              controller: _tabController,
              indicatorWeight: 3,
              overlayColor: WidgetStateProperty.all(colors.shade0),
              indicatorColor: colors.error500,
              tabs: [
                Tab(child: Text("analyzes".tr(), style: fonts.xSmallLink.copyWith(fontSize: 12.sp))),
                Tab(child: Text("doctors_reports".tr(), style: fonts.xSmallLink.copyWith(fontSize: 12.sp))),
              ],
            ),
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            bloc: _bloc,
            buildWhen: (o, n) {
              final analyze = o.patientAnalyze != n.patientAnalyze;
              final status = o.fetchPatientAnalyseStatus != n.fetchPatientAnalyseStatus;
              return analyze || status;
            },
            builder: (context, state) {
              if (state.fetchPatientAnalyseStatus.isInProgress || state.fetchPatientAnalyseStatus.isInitial) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (state.fetchPatientAnalyseStatus.isFailure) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
                  ),
                );
              }

              return TabBarView(
                controller: _tabController,
                children: [
                  ResultsDataWidget(
                    items: [
                      ...?state.patientAnalyze?.fisDocuments,
                      ...?state.patientAnalyze?.lisDocuments,
                      ...?state.patientAnalyze?.risDocuments,
                    ],
                    type: 'lis',
                  ),
                  ResultsDataWidget(
                    items: [...?state.patientAnalyze?.consultationDocuments],
                    type: 'consultation',
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
