// lib/presentation/pages/visits/my_visits_page.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/patient_visits_service.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/pages/visits/component/visit_detail_page.dart';
import 'package:medion/presentation/pages/visits/widgets/visits_new_design_card.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MyVisitsPage extends StatefulWidget {
  const MyVisitsPage({super.key});

  @override
  State<MyVisitsPage> createState() => _MyVisitsPageState();
}

class _MyVisitsPageState extends State<MyVisitsPage> {
  List<PatientOrder> orders = [];
  List<PatientVisit> visits = [];
  DBService? _dbService;
  bool _isLoading = true;
  bool _showVisits = true;

  @override
  void initState() {
    super.initState();
    _initializeDBService();
  }

  Future<void> _initializeDBService() async {
    try {
      _dbService = await DBService.create;
      setState(() => _isLoading = false);
      await _loadVisits();
    } catch (e) {
      print('Failed to initialize DBService: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadVisits() async {
    if (_dbService == null) return;
    final token = _dbService!.token.accessToken;
    if (token == null || token.isEmpty || _dbService!.isTokenExpired(token)) {
      return;
    }

    final service = PatientVisitsService(token: token);
    try {
      final response = await service.getPatientVisits();
      setState(() {
        orders = response.orders;
        visits = response.visits;
      });
    } catch (e) {
      print('Failed to fetch visits: $e');
    }
  }

  String formatVisitDateTime(String visitDate, String visitTime) {
    try {
      String startTime = visitTime.split(' - ')[0];
      final dateTimeString = '$visitDate $startTime';
      final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
      final parsedDate = dateFormat.parse(dateTimeString);
      return DateFormat('d MMMM HH:mm').format(parsedDate);
    } catch (e) {
      print('Error formatting date: $e');
      return visitDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "my_visits".tr(),
              centerTitle: true,
              isBack: false,
              trailing: 24.w.horizontalSpace,
              bottom: Column(
                children: [
                  CustomToggle(
                    iconList: [
                      Text(
                        'Мои приемы'.tr(),
                        style: fonts.xSmallLink.copyWith(
                          color:
                              _showVisits ? colors.shade0 : colors.primary900,
                        ),
                      ),
                      Text(
                        'Мои счета'.tr(),
                        style: fonts.xSmallLink.copyWith(
                          color:
                              !_showVisits ? colors.shade0 : colors.primary900,
                        ),
                      ),
                    ],
                    onChanged: (value) => setState(() => _showVisits = value),
                    current: _showVisits,
                    values: const [true, false],
                  ),
                  12.h.verticalSpace,
                ],
              ),
            ),
            Expanded(
              child: _showVisits ? _buildVisitsList() : _buildBillsList(),
            ),
            60.h.verticalSpace,
          ],
        ),
      );
    });
  }

  Widget _buildBillsList() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Style.error500,
        ),
      );
    }
    if (orders.isEmpty) {
      return Center(
          child: Text(
        'you_have_no_visits'.tr(),
        style: Style.regularMain(),
      ));
    }

    return ListView.builder(
      itemCount: orders.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        final order = orders[index];
        final service = order.saleOrderLines.isNotEmpty
            ? order.saleOrderLines.first.service
            : '';
        final formattedDate = order.saleOrderLines.isNotEmpty
            ? order.saleOrderLines.first.formattedDate
            : '';

        return VisitsNewDesignCard(
          onTap: () => _navigateToOrderDetails(order),
          doctorName: '', // Not available in orders
          doctorJob: '', // Not available in orders
          serviceName: service,
          location: '', // Not available in orders
          timaAndDate: formattedDate, // Use the formatted date
          paymentStatus: order.saleOrderPaymentStatus,
          doctorImage: '', // Not available in orders
        );
      },
    );
  }

  Widget _buildVisitsList() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Style.error500,
        ),
      );
    }
    if (visits.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconSet.create.emojiSad.svg(width: 74.w, height: 78.h),
          4.h.verticalSpace,
          Center(
              child: Text(
            'you_have_no_visits'.tr(),
            style: Style.regularMain(),
          )),
        ],
      );
    }

    return ListView.builder(
      itemCount: visits.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        final visit = visits[index];
        return VisitsNewDesignCard(
          onTap: () => _navigateToVisitDetails(visit),
          doctorName: visit.doctorFullName,
          doctorJob: visit.doctorJobName,
          serviceName: visit.serviceName,
          location: visit.address,
          timaAndDate: formatVisitDateTime(visit.visitDate, visit.visitTime),
          paymentStatus: visit.paymentStatus,
          doctorImage: visit.image,
        );
      },
    );
  }

  void _navigateToOrderDetails(PatientOrder order) {
    context.read<BottomNavBarController>().changeNavBar(true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VisitDetailPage(
          onTap: () {
            if (order.saleOrderCheckPdfUrl.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentWebView(
                    url: order.saleOrderCheckPdfUrl,
                    isInvoice: true,
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('PDF URL is not available')),
              );
            }
          },
          longitude: 0.0, // Not available in orders
          latitude: 0.0, // Not available in orders
          image: '', // Not available in orders
          doctorName: '', // Not available in orders
          categoryName: '', // Not available in orders
          visitDate: order.saleOrderLines.isNotEmpty
              ? order.saleOrderLines.first.createDate.split(' ').first
              : '',
          visitLocation: '', // Not available in orders
          visitPaymentByWhom: '', // Not available in orders
          visitStatus: '', // Not available in orders
          serviceName: order.saleOrderLines.isNotEmpty
              ? order.saleOrderLines.first.service
              : '',
          servicePrice: order.saleOrderPrice,
          paymentMethod: '', // Not available in orders
        ),
      ),
    ).then((_) {
      context.read<BottomNavBarController>().changeNavBar(false);
    });
  }

  void _navigateToVisitDetails(PatientVisit visit) {
    context.read<BottomNavBarController>().changeNavBar(true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VisitDetailPage(
          onTap: () {},
          longitude: visit.longitude,
          latitude: visit.latitude,
          image: visit.image,
          doctorName: visit.doctorFullName,
          categoryName: visit.categoryName,
          visitDate: visit.visitDate,
          visitLocation: visit.address,
          visitPaymentByWhom: visit.paymentMethod,
          visitStatus: visit.visitStatus,
          serviceName: visit.serviceName,
          servicePrice: visit.price,
          paymentMethod: visit.paymentMethod,
        ),
      ),
    ).then((_) {
      context.read<BottomNavBarController>().changeNavBar(false);
    });
  }
}
