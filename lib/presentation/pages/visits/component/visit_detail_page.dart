import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_card.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_detail_card.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VisitDetailPage extends StatefulWidget {
  final String? categoryName;
  final String? serviceName;
  final String? doctorName;
  final double? servicePrice;
  final String? visitDate;
  final String? visitLocation;
  final String? visitStatus;
  final String? visitPaymentByWhom;
  final String? paymentMethod;
  final dynamic data;
  const VisitDetailPage(
      {super.key,
      this.categoryName,
      this.serviceName,
      this.doctorName,
      this.servicePrice,
      this.visitDate,
      this.visitLocation,
      this.visitStatus,
      this.visitPaymentByWhom,
      this.paymentMethod,
      this.data});

  @override
  State<VisitDetailPage> createState() => _VisitDetailPageState();
}

class _VisitDetailPageState extends State<VisitDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                padding: EdgeInsets.zero,
                bordered: true,
                isBack: true,
                title: widget.categoryName!,
                centerTitle: true,
                trailing: 24.w.horizontalSpace,
              ),
              VisitInfoDetailCard(
                categoryName: widget.categoryName,
                serviceName: widget.serviceName,
                doctorName: widget.doctorName,
                servicePrice: 20,
                visitStatus: widget.visitStatus,
                visitDate: widget.visitDate,
                visitPaymentByWhom: widget.visitPaymentByWhom,
                paymentMethod: widget.paymentMethod,
                data: widget.data,
                visitLocation: widget.visitLocation,

                //  image: widget.,x/
              )
            ],
          ),
        );
      },
    );
  }
}
