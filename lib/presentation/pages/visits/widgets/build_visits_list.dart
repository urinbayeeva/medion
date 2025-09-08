import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/visits/component/visit_detail_page.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/pages/visits/widgets/visits_new_design_card.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BuildVisitList extends StatelessWidget {
  const BuildVisitList({
    super.key,
    required this.state,
    required this.onRefresh,
    required this.refreshController,
  });

  final AuthState state;
  final VoidCallback onRefresh;
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    if (state.fetchPatientVisitStatus.isInitial || state.fetchPatientVisitStatus.isInProgress) {
      return const Center(child: CircularProgressIndicator(color: Style.error500));
    }
    if (state.visits.isEmpty) {
      return EmptyState(
        title: '',
        body: Center(
          child: Column(
            children: [
              Text(
                'you_have_no_visits'.tr(),
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff00040A),
                ),
              ),
              Text(
                "make_an_appoinment_doctor_online".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff66686C),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SmartRefresher(
      onRefresh: onRefresh,
      controller: refreshController,
      enablePullDown: true,
      header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
      child: ListView.builder(
        itemCount: state.visits.length,
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) {
          final visit = state.visits[index];
          return VisitsNewDesignCard(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            doctorName: visit.doctorFullName ?? "",
            id: visit.id.toString(),
            doctorJob: visit.doctorJobName ?? "",
            serviceName: visit.serviceName ?? "",
            location: visit.address ?? "",
            timaAndDate: visit.visitDate.toString().replaceAll("-", "."),
            visitTime: visit.visitTime.toString(),
            paymentStatus: (visit.paymentStatus == 'paid'),
            doctorImage: visit.image ?? "",
            radius: BorderRadius.circular(12),
            listEnum: MyFunctions.getVisitStatus(visit.visitStatus),
            onTap: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) {
                  return VisitDetailPage(
                    id: visit.id!,
                    onTap: () {},
                    image: visit.image!,
                    doctorName: visit.doctorFullName,
                    visitDate: visit.visitDate,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
