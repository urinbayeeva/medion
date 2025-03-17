import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_not_available.dart';
import 'package:medion/presentation/component/c_radio_tile.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/c_zigzag_container.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/component/user_info_widget.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Future<void> _launchPaymentUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  String _selectedOption = "";
  String _selectedPayment = "Payme";

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state.patientInfo == null) {
        return const Center(
            child: CircularProgressIndicator(
          color: Style.error500,
        ));
      }
      return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              UserInfoWidget(title: "your_info".tr(), children: [
                CustomTextField(
                  padding: const EdgeInsets.only(bottom: 12),
                  hintText: state.patientInfo?.firstName ?? "Not available",
                  title: "name".tr(),
                ),
                CustomTextField(
                  padding: const EdgeInsets.only(bottom: 12),
                  hintText: state.patientInfo?.lastName ?? "Not available",
                  title: "second_name".tr(),
                ),
                CustomTextField(
                  padding: const EdgeInsets.only(bottom: 12),
                  hintText: state.patientInfo?.patientId?.toString() ??
                      "Not available",
                  title: "ID",
                ),
                CustomTextField(
                  padding: const EdgeInsets.only(bottom: 12),
                  hintText: state.patientInfo?.phoneNumber ?? "Not available",
                  title: "contact_phone_number".tr(),
                )
              ]),
              12.h.verticalSpace,
              ValueListenableBuilder<List<Map<String, String>>>(
                  valueListenable: AppointmentState.selectedAppointments,
                  builder: (context, selectedList, _) {
                    return Column(
                      children: selectedList
                          .map((appointment) => _buildAppointmentItem(
                              appointment, colors, fonts, context))
                          .toList(),
                    );
                  }),
              12.h.verticalSpace,
              UserInfoWidget(title: "who_pays".tr(), children: [
                CustomRadioTile<String>(
                  value: "myself".tr(),
                  groupValue: _selectedOption,
                  title: Text("myself".tr()),
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                CustomRadioTile<String>(
                  value: "employer".tr(),
                  groupValue: _selectedOption,
                  title: Text(
                    "employer".tr(),
                    style: fonts.headlineMain
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                CustomRadioTile<String>(
                  value: "insurance_company".tr(),
                  groupValue: _selectedOption,
                  title: Text(
                    "insurance_company".tr(),
                    style: fonts.headlineMain
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
              ]),
              12.h.verticalSpace,
              UserInfoWidget(title: "payment_methods".tr(), children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomRadioTile<String>(
                        value: "Payme",
                        groupValue: _selectedPayment,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            icons.payme.asset(width: 24.w, height: 24.h),
                            4.w.horizontalSpace,
                            Text(
                              "Payme",
                              style: fonts.headlineMain.copyWith(
                                  fontSize: 14.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        onChanged: (value) async {
                          setState(() {
                            _selectedPayment = value!;
                          });
                        },
                      ),
                    ),
                    8.w.horizontalSpace,
                    Expanded(
                      child: CustomRadioTile<String>(
                        value: "Click",
                        groupValue: _selectedPayment,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            icons.click.svg(width: 24.w, height: 24.h),
                            4.w.horizontalSpace,
                            Text(
                              "Click",
                              style: fonts.headlineMain.copyWith(
                                  fontSize: 14.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        onChanged: (value) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: colors.shade0,
                                  content: const CNotAvailable(),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                )
              ]),
              12.h.verticalSpace,
              ValueListenableBuilder<List<Map<String, String>>>(
                  valueListenable: AppointmentState.selectedAppointments,
                  builder: (context, selectedList, _) {
                    return Column(
                      children: selectedList
                          .map((appointment) => _buildPaymentInfo(
                              appointment, colors, fonts, context))
                          .toList(),
                    );
                  }),

              40.h.verticalSpace,
              Container(
                color: colors.shade0,
                child: Column(
                  children: [
                    // CButton(
                    //     title: "Внести предоплату (15%) - 69 000 сум",
                    //     onTap: () {},
                    //     backgroundColor: colors.neutral200,
                    //     textColor: colors.secondary900),
                    // 8.h.verticalSpace,
                    CButton(
                        title: "pay_the_full_amount".tr(),
                        onTap: () async {
                       
                        }),
                  ],
                ),
              ),
              // 12.h.verticalSpace,
            ]),
          ),
        ));
      });
    });
  }
}

Widget _buildAppointmentItem(
    Map<String, String> appointment, colors, fonts, BuildContext context) {
  return VerifyAppointmentItem(
    hasImage: false,
    diagnosis: appointment['serviceName'] ?? '',
    procedure: appointment['specialty'] ?? '',
    doctorName: 'Dr. ${appointment['doctorName']}',
    price: appointment['price'] ?? '',
    appointmentTime:
        '${DateFormat('EEE, dd MMMM', context.locale.toString()).format(DateTime.parse(appointment['date']!))} ${appointment['time']}',
    location: appointment['location'] ?? '',
    imagePath: '',
    onCancel: () {
      AppointmentState.removeAppointment(appointment['serviceId']!);
    },
  );
}

Widget _buildPaymentInfo(Map appointment, colors, fonts, BuildContext context) {
  double totalPrice = 0;

  if (appointment.containsKey('services') && appointment['services'] is List) {
    for (var service in appointment['services']) {
      totalPrice += double.tryParse(service['price']?.toString() ?? '0') ?? 0;
    }
  } else {
    totalPrice = double.tryParse(appointment['price']?.toString() ?? '0') ?? 0;
  }

  String formattedTotalPrice = totalPrice.toStringAsFixed(0);

  return CZigZagContainer(
      child: Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 22.h),
    decoration:
        BoxDecoration(color: colors.shade0, boxShadow: colors.shadowMMMM),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "your_check".tr(),
            style: fonts.regularSemLink.copyWith(
                color: colors.primary900,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600),
          ),
          12.h.verticalSpace,
          Text(
            appointment['serviceName'] ?? '',
            style: fonts.smallMain.copyWith(
                color: colors.neutral600,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600),
          ),
          8.h.verticalSpace,
          Text(
            "1x${appointment['price'] ?? ''}_ _ _ _ _ _ _ _ _ _ _ _ ${"sum".tr(namedArgs: {
                  "amount": "${appointment['price'] ?? ''}"
                })}",
            style: fonts.xSmallMain.copyWith(
                color: colors.neutral600,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400),
          ),
          8.h.verticalSpace,
          Text(
              "${"total".tr()} _ _ _ _ _ _ _ _ _ _ _ _ _ _${"sum".tr(namedArgs: {
                    "amount": formattedTotalPrice
                  })}",
              style: fonts.xSmallMain.copyWith(
                  color: colors.neutral600,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    ),
  ));
}



