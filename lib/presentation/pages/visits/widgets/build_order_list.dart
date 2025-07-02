import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/pages/visits/widgets/order_card_w.dart';
import 'package:medion/presentation/pages/visits/widgets/visits_new_design_card.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class BuildOrderList extends StatelessWidget {
  const BuildOrderList({super.key, required this.state});

  final AuthState state;

  @override
  Widget build(BuildContext context) {
    if (state.fetchPatientVisitStatus.isInitial || state.fetchPatientVisitStatus.isInProgress) {
      return const Center(child: CircularProgressIndicator(color: Style.error500));
    }
    if (state.moves.isEmpty) return EmptyState(title: 'no_result_found'.tr());
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return ListView.builder(
          itemCount: state.moves.length,
          padding: EdgeInsets.zero,
          itemBuilder: (_, index) {
            final order = state.moves[index];
            final service = order.saleOrderLines.isNotEmpty ? (order.saleOrderLines.first.service ?? "") : '';

            return OrderCard(
              colors: colors,
              order: order,
              fonts: fonts,
              child: VisitsNewDesignCard(
                doctorName: 'doctorName',
                doctorJob: 'doctorJob',
                serviceName: service,
                location: 'location',
                visitTime: "12:30 - 13:00",
                timaAndDate: "12.23.2030",
                paymentStatus: order.saleOrderPaymentStatus == 'paid',
                doctorImage: 'doctorImage',
                listEnum: MyFunctions.getVisitStatus("ordered"),
              ),
            );
          },
        );
      },
    );
  }
}
