import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_card.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MyVisitsPage extends StatefulWidget {
  const MyVisitsPage({super.key});

  @override
  State<MyVisitsPage> createState() => _MyVisitsPageState();
}

class _MyVisitsPageState extends State<MyVisitsPage> {
  bool isOnline = true;
  bool isLoading = false;
  List<dynamic> visitsData = [];

  @override
  void initState() {
    super.initState();
    _fetchPatientVisits();
  }

  Future<void> _fetchPatientVisits() async {
    setState(() {
      isLoading = true;
    });

    if (isOnline) {
      final dbService = await DBService.create;
      final token = dbService.token.accessToken;

      if (token != null && token.isNotEmpty) {
        final response = await _getPatientVisits(token);
        setState(() {
          isLoading = false;
          if (response != null) {
            visitsData = response;
          }
        });
      } else {
        setState(() {
          isLoading = false;
          // Handle token absence or invalid token scenario
        });
      }
    } else {
      setState(() {
        isLoading = false;
        visitsData = [];
      });
    }
  }

  Future<List<dynamic>?> _getPatientVisits(String token) async {
    final url =
        'https://his.uicgroup.tech/apiweb/profile/patient_visits_mobile';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Decode the response body using UTF-8
      final decodedBody = utf8.decode(response.bodyBytes);

      print("Decoded body: $decodedBody");

      return jsonDecode(decodedBody);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
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
              padding: EdgeInsets.zero,
              bottom: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomToggle(
                        iconList: [
                          Text(
                            'online'.tr(),
                            style: fonts.xSmallLink.copyWith(
                              color:
                                  isOnline ? colors.shade0 : colors.primary900,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'offline'.tr(),
                            style: fonts.xSmallLink.copyWith(
                              color:
                                  !isOnline ? colors.shade0 : colors.primary900,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            isOnline = value;
                            _fetchPatientVisits(); // Re-fetch data when toggled
                          });
                        },
                        current: isOnline,
                        values: const [true, false],
                      ),
                    ),
                  ),
                ],
              ),
              bordered: true,
              isBack: false,
              title: "my_visits".tr(),
              centerTitle: true,
              trailing: icons.calendar.svg(width: 24.w, height: 24.h),
            ),
            8.h.verticalSpace,
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (isLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: colors.error500,
                    ));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        if (visitsData.isEmpty)
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  icons.bigCalendar
                                      .svg(width: 72.w, height: 75.h),
                                  12.h.verticalSpace,
                                  Text(
                                    "you_have_no_visits".tr(),
                                    style: fonts.smallLink.copyWith(
                                      color: colors.neutral600,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            shrinkWrap: true,
                            itemCount: visitsData.length,
                            itemBuilder: (context, index) {
                              final visit = visitsData[index];
                              return VisitInfoCard(
                                doctorName: visit['doctor_full_name'],
                                doctorJob: visit['doctor_job_name'],
                                visitStatus: visit['visit_status'],
                                visitTime: visit['visit_time'],
                              );
                            },
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
