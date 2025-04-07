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
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/pages/appointment/widget/zigzag.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:intl/intl.dart';

String _formatNumber(double number) {
  return number
      .toStringAsFixed(0)
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]} ',
      )
      .trim();
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedOption = "";
  bool _showWebView = false;
  String? _paymentUrl;
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    final authBloc = context.read<AuthBloc>();
    if (authBloc.state.patientInfo == null) {
      authBloc.add(const AuthEvent.fetchPatientInfo());
    }
    _initializePaymentUrl();
  }

  Future<void> _initializePaymentUrl() async {
    final paymentProvider = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );
  }

  void _openPaymentWebView(String url) {
    setState(() {
      _paymentUrl = url;
      _showWebView = true;
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.white)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {},
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(url));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        if (_showWebView && _paymentUrl != null) {
          return Scaffold(
            body: Stack(
              children: [
                WebViewWidget(controller: _webViewController),
                Positioned(
                  top: 40.h,
                  right: 16.w,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.white.withOpacity(0.8),
                    child: IconButton(
                      icon: Icon(Icons.close, size: 20.w),
                      onPressed: () {
                        setState(() {
                          _showWebView = false;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.patientInfo == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Style.error500,
                  ),
                );
              }

              final patientInfo = state.patientInfo;

              return Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                          hintText: patientInfo?.patientId?.toString() ??
                              "Not available",
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
                        return Column(
                          children: selectedList
                              .map((appointment) => _buildAppointmentItem(
                                    appointment,
                                    context,
                                  ))
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
                      zigZagHeight: 15,
                      padding: EdgeInsets.all(20),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "your_check".tr(),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            12.h.verticalSpace,
                            ValueListenableBuilder<List<Map<String, String>>>(
                              valueListenable:
                                  AppointmentState.selectedAppointments,
                              builder: (context, selectedList, _) {
                                double subtotal = 0;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...selectedList.map((appointment) {
                                      final price = double.tryParse(
                                              appointment['price'] ?? '0') ??
                                          0;
                                      subtotal += price;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 6.h),
                                            child: Text(
                                              appointment['serviceName'] ??
                                                  'Service',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Style.neutral600,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${"_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ "} ${"sum".tr(namedArgs: {
                                                  "amount": _formatNumber(price)
                                                })}",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Style.neutral500,
                                            ),
                                          ),
                                          if (selectedList
                                                  .indexOf(appointment) !=
                                              selectedList.length - 1)
                                            Divider(
                                                height: 1.h,
                                                color: Colors.grey[300]),
                                        ],
                                      );
                                    }).toList(),
                                    Divider(
                                        color: Colors.grey[300],
                                        thickness: 1,
                                        height: 16.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      child: Text(
                                        "${"total".tr()}_ _ _ _ _ _ _ _ _ _ _ _ _ ${"sum".tr(namedArgs: {
                                              "amount": _formatNumber(subtotal)
                                            })}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Style.neutral600,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                        Navigator.pushReplacement(
                            context, AppRoutes.getMainPage(3));
                      },
                    ),
                    8.h.verticalSpace,
                    Consumer<PaymentProvider>(
                      builder: (context, paymentProvider, _) {
                        return CButton(
                          title: "pay_right_now".tr(),
                          onTap: () async {
                            if (paymentProvider.multiUrl?.isNotEmpty ?? false) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentWebView(
                                          url: paymentProvider.multiUrl!)));
                            } else {
                              await _initializePaymentUrl();
                              if (paymentProvider.multiUrl?.isNotEmpty ??
                                  false) {
                                _openPaymentWebView(paymentProvider.multiUrl!);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("payment_url_not_available".tr()),
                                  ),
                                );
                              }
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
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
      price: "${appointment['price']}" ?? '0',
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
}
