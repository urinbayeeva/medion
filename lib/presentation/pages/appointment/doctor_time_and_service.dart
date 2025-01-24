import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/sources/doctors_time.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_bottomsheet_seans.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';

import 'package:medion/presentation/pages/appointment/component/doctors_date_item.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/extensions.dart';

class DoctorTimeAndService extends StatefulWidget {
  final int? seansCount;
  final VoidCallback onTap;
  const DoctorTimeAndService({super.key, this.seansCount, required this.onTap});

  @override
  State<DoctorTimeAndService> createState() => _DoctorTimeAndServiceState();
}

class _DoctorTimeAndServiceState extends State<DoctorTimeAndService> {
  int chose = 1;
  List<dynamic> _services = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    fetchServiceData();
  }

  Future<void> fetchServiceData() async {
    try {
      final response = await http.post(
        Uri.parse('https://his.uicgroup.tech/apiweb/booking/doctors'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
        body: json.encode({
          "service_ids": [1961, 2021, 2023, 2024, 2078, 2391]
        }),
      );

      if (response.statusCode == 200) {
        final utf8Body = utf8.decode(response.bodyBytes);
        setState(() {
          _services = json.decode(utf8Body);
          _isLoading = false;
          print("RESPONSE BODY: ${_services = json.decode(utf8Body)}");
        });
      } else {
        print("RESPONSE: ${response.body}");
        setState(() {
          _error = 'Failed to load services';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      if (_services.isEmpty) {
        return Center(
          child: Text(
            semanticsLabel: "no_result_found".tr(),
            "no_result_found".tr(),
            style: Style.headlineMain(),
          ),
        );
      }
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _services.length,
              padding: EdgeInsets.only(top: 16.h),
              itemBuilder: (context, index) {
                var service = _services[index];
                var companies = service['companies_doctors'];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 16.w),
                      child: Text(
                        service['service_name'] ?? 'Unknown Service',
                        style: fonts.smallMain.copyWith(
                            fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ...companies.map<Widget>((company) {
                      var doctors = company['doctor'] as List<dynamic>;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...doctors.map<Widget>((doctor) {
                            return Column(
                              children: [
                                DoctorsDateItem(
                                  name: doctor['name'] ?? 'Unknown Name',
                                  profession: doctor['specialty'] ??
                                      'Unknown Profession',
                                  image: doctor['image'],
                                  dates: doctor['schedules'],
                                ),
                              ],
                            );
                          }),
                        ],
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            width: double.infinity,
            color: chose >= 1 ? null : colors.shade0,
            decoration: chose >= 1
                ? BoxDecoration(
                    color: colors.shade0,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r)),
                  )
                : null,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (chose >= 1) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Выбраны $chose услуги",
                      style: fonts.xSmallLink.copyWith(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                    AnimationButtonEffect(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                      color: colors.shade0,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.r),
                                          topRight: Radius.circular(8.r))),
                                  child: const CBottomsheetSeans(
                                    chose: 1,
                                  ));
                            });
                      },
                      child: icons.right.svg(
                          width: 20.w,
                          height: 20.h,
                          color: colors.iconGreyColor),
                    )
                  ],
                ),
                12.h.verticalSpace,
              ],
              CButton(
                title: "next".tr(),
                onTap: widget.onTap,
              ),
              // 24.h.verticalSpace,
            ]),
          ),
        ],
      );
    });
  }
}
