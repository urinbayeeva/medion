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
          onTap: () => _navigateToVisitDetails(visit, context),
          doctorName: visit.doctorFullName ?? "",
          doctorJob: visit.doctorJobName ?? "",
          serviceName: visit.serviceName ?? "",
          location: visit.address ?? "",
          timaAndDate: visit.visitDate.toString().replaceAll("-", "."),
          visitTime: visit.visitTime.toString(),
          paymentStatus: (visit.paymentStatus == 'paid'),
          doctorImage: visit.image ?? "",
          radius: BorderRadius.circular(12),
          listEnum: MyFunctions.getVisitStatus(visit.visitStatus),
        );
      },
    );
  }

  void _navigateToVisitDetails(PatientVisit visit, BuildContext context) {
    context.read<BottomNavBarController>().changeNavBar(true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VisitDetailPage(
          id: visit.id!,
          onTap: () {},
          longitude: visit.longitude!,
          latitude: visit.latitude!,
          image: visit.image!,
          doctorName: visit.doctorFullName,
          categoryName: visit.categoryName,
          visitDate: visit.visitDate,
          visitLocation: visit.address,
          visitPaymentByWhom: visit.paymentMethod,
          visitStatus: visit.visitStatus,
          serviceName: visit.serviceName,
          servicePrice: visit.price,
          paymentMethod: visit.paymentMethod,
          status: MyFunctions.getVisitStatus(visit.visitStatus),
        ),
      ),
    ).then((_) {
      context.read<BottomNavBarController>().changeNavBar(false);
    });
  }
}
