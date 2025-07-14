import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/visits/component/visit_detail_page.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/pages/visits/widgets/visits_new_design_card.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';

class BuildVisitList extends StatelessWidget {
  const BuildVisitList({super.key, required this.state});

  final AuthState state;

  @override
  Widget build(BuildContext context) {
    if (state.fetchPatientVisitStatus.isInitial || state.fetchPatientVisitStatus.isInProgress) {
      return const Center(child: CircularProgressIndicator(color: Style.error500));
    }
    if (state.visits.isEmpty) return EmptyState(title: 'you_have_no_visits'.tr());
    return ListView.builder(
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
    );
  }
}
