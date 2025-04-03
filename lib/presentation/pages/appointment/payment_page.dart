import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_radio_tile.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/c_zigzag_container.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/component/user_info_widget.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/pages/appointment/widget/zigzag.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';
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
    final authBloc = context.read<AuthBloc>();
    if (authBloc.state.patientInfo == null) {
      authBloc.add(const AuthEvent.fetchPatientInfo());
    }
  }

  // Helper function to format numbers with spaces
  String _formatNumber(double number) {
    return number
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        print("🟢  -> ${state.patientInfo}");

        if (state.patientInfo == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: Style.error500,
            ),
          );
        }

        final patientInfo = state.patientInfo;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoWidget(
                  title: "your_info".tr(),
                  children: [
                    CustomTextField(
                      readOnly: true,
                      padding: const EdgeInsets.only(bottom: 12),
                      hintText: patientInfo?.firstName ?? "Not available",
                      title: "name".tr(),
                    ),
                    CustomTextField(
                      readOnly: true,
                      padding: const EdgeInsets.only(bottom: 12),
                      hintText: patientInfo?.lastName ?? "Not available",
                      title: "second_name".tr(),
                    ),
                    CustomTextField(
                      readOnly: true,
                      padding: const EdgeInsets.only(bottom: 12),
                      hintText:
                          patientInfo?.patientId?.toString() ?? "Not available",
                      title: "ID",
                    ),
                    CustomTextField(
                      readOnly: true,
                      padding: const EdgeInsets.only(bottom: 12),
                      hintText: patientInfo?.phoneNumber ?? "Not available",
                      title: "contact_phone_number".tr(),
                    ),
                  ],
                ),
                12.h.verticalSpace,
                ValueListenableBuilder<List<Map<String, String>>>(
                  valueListenable: AppointmentState.selectedAppointments,
                  builder: (context, selectedList, _) {
                    print("🟡 Debug: Selected Appointments -> $selectedList");

                    return Column(
                      children: selectedList
                          .map((appointment) => _buildAppointmentItem(
                              appointment,
                              // colors,
                              // fonts,
                              context))
                          .toList(),
                    );
                  },
                ),
                12.h.verticalSpace,
                UserInfoWidget(
                  title: "who_pays".tr(),
                  children: [
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
                        // style: Style.headlineMain.copyWith(
                        //   fontSize: 14.sp,
                        //   fontWeight: FontWeight.w500,
                        // ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                  ],
                ),
                12.h.verticalSpace,
                ZigZagContainer(
                  color: Colors.white,
                  zigZagHeight: 15, // Reduced from 60 for better proportions
                  padding: EdgeInsets.all(20),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Receipt header
                        Text(
                          "your_check".tr(),
                          style: TextStyle(
                            fontSize: 18.sp, // Slightly larger
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        12.h.verticalSpace, // Increased spacing

                        // Services list
                        ValueListenableBuilder<List<Map<String, String>>>(
                          valueListenable:
                              AppointmentState.selectedAppointments,
                          builder: (context, selectedList, _) {
                            double total = 0;
                            double vatRate = 0.15; // 15% VAT
                            double subtotal = 0;

                            return Column(
                              children: [
                                // Services list
                                ...selectedList.map((appointment) {
                                  final price = double.tryParse(
                                          appointment['price'] ?? '0') ??
                                      0;
                                  subtotal += price;

                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6.h), // Increased spacing
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                appointment['serviceName'] ??
                                                    'Service',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Text(
                                              '${_formatNumber(price)} UZS',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (selectedList.indexOf(appointment) !=
                                          selectedList.length - 1)
                                        Divider(
                                            height: 1.h,
                                            color: Colors.grey[300]),
                                    ],
                                  );
                                }).toList(),

                                // Subtotal line
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.h, bottom: 4.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "subtotal".tr(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Text(
                                        '${_formatNumber(subtotal)} UZS',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // VAT line
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "vat_included".tr() +
                                            " (15%)", // "VAT included (15%)"
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Text(
                                        '${_formatNumber(subtotal * vatRate)} UZS',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Divider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                    height: 16.h),

                                // Total row
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "total".tr(),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${_formatNumber(subtotal * (1 + vatRate))} UZS',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                12.h.verticalSpace,
                Text("if_you_make_an_advance_payment".tr(),
                    style: Style.smallLink()),
                40.h.verticalSpace,
                CButton(
                  backgroundColor: Style.neutral200,
                  textColor: Style.primary900,
                  title: "pay_not_right_now".tr(),
                  onTap: () async {
                    context.read<BottomNavBarController>().changeNavBar(false);
                    Navigator.pushReplacement(
                        context, AppRoutes.getMainPage(3));
                  },
                ),
                8.h.verticalSpace,
                CButton(
                  title: "pay_right_now".tr(),
                  onTap: () async {
                    final paymentProvider = Provider.of<PaymentProvider>(
                      context,
                      listen: false,
                    );
                    if (paymentProvider.multiUrl != null &&
                        paymentProvider.multiUrl!.isNotEmpty) {
                      await _launchPaymentUrl(paymentProvider.multiUrl!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("No payment URL available")),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildAppointmentItem(
  Map<String, String> appointment,
  BuildContext context,
) {
  String appointmentDate = appointment['date'] ?? '';
  String appointmentTime = appointment['time'] ?? '';

  String formattedDate = appointmentDate.isNotEmpty
      ? DateFormat('EEE, dd MMMM', context.locale.toString()).format(
          DateTime.tryParse(appointmentDate) ?? DateTime.now(),
        )
      : "Not available";

  return VerifyAppointmentItem(
    hasImage: false,
    diagnosis: appointment['serviceName'] ?? 'Unknown',
    procedure: appointment['specialty'] ?? 'Unknown',
    doctorName: 'Dr. ${appointment['doctorName'] ?? "Unknown"}',
    price: appointment['price'] ?? '0',
    appointmentTime:
        "$formattedDate ${appointmentTime.isNotEmpty ? appointmentTime : "Not available"}",
    location: appointment['location'] ?? 'Unknown',
    imagePath: '',
    onCancel: () {
      final serviceId = appointment['serviceId'];
      if (serviceId != null) {
        AppointmentState.removeAppointment(serviceId);
      }
    },
  );
}
