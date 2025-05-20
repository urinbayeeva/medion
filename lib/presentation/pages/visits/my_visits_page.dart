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
  List<OrderVisit> orderVisits = []; // For "My Bills" tab
  List<Visit> visits = []; // For "My Appointments" tab
  List<Order> orders = [];
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
        orderVisits =
            response.orders.expand((order) => order.orderVisits).toList();
        visits = response.visits;
      });
    } catch (e) {
      print('Failed to fetch visits: $e');
    }
  }

  String _getPdfUrlForVisit(OrderVisit visit) {
    for (var order in orders) {
      if (order.orderVisits.contains(visit)) {
        return order.orderCheckPdfUrl;
      }
    }
    return '';
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
                        'Мои приемы'.tr(), // "My Visits" now comes first
                        style: fonts.xSmallLink.copyWith(
                          color:
                              _showVisits ? colors.shade0 : colors.primary900,
                        ),
                      ),
                      Text(
                        'Мои счета'.tr(), // "My Bills" now comes second
                        style: fonts.xSmallLink.copyWith(
                          color:
                              !_showVisits ? colors.shade0 : colors.primary900,
                        ),
                      ),
                    ],
                    onChanged: (value) => setState(() => _showVisits = value),
                    current: _showVisits,
                    values: const [
                      true,
                      false
                    ], // Inverted values to match the new order
                  ),
                  12.h.verticalSpace,
                ],
              ),
            ),
            Expanded(
              child: _showVisits ? _buildVisitsList() : _buildBillsList(),
            ),
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
    if (orderVisits.isEmpty) {
      return Center(
          child: Text(
        'you_have_no_visits'.tr(),
        style: Style.regularMain(),
      ));
    }

    return ListView.builder(
      itemCount: orderVisits.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        final visit = orderVisits[index];
        final pdfUrl = _getPdfUrlForVisit(visit);
        return VisitsNewDesignCard(
          onTap: () => _navigateToOrderVisitDetails(visit, pdfUrl),
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

  void _navigateToOrderVisitDetails(OrderVisit visit, String pdfUrl) {
    context.read<BottomNavBarController>().changeNavBar(true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VisitDetailPage(
          onTap: () {
            if (pdfUrl.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentWebView(
                    url: pdfUrl,
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
          servicePrice: 0,
          paymentMethod: visit.paymentMethod,
        ),
      ),
    ).then((_) {
      context.read<BottomNavBarController>().changeNavBar(false);
    });
  }

  void _navigateToVisitDetails(Visit visit) {
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
          servicePrice: 0,
          paymentMethod: visit.paymentMethod,
        ),
      ),
    ).then((_) {
      context.read<BottomNavBarController>().changeNavBar(false);
    });
  }
}
