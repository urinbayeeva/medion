import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/component/c_radio_tile.dart';
import 'package:medion/presentation/component/c_text_field.dart';
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

class MedServicePayment extends StatefulWidget {
  const MedServicePayment({
    super.key,
    required this.diagnosis,
    required this.procedure,
    required this.doctorName,
    required this.price,
    required this.appointmentTime,
    required this.location,
    required this.imagePath,
    this.isHome = false,
  });

  final String diagnosis;
  final String procedure;
  final String doctorName;
  final String price;
  final String appointmentTime;
  final String location;
  final String imagePath;
  final bool isHome;

  @override
  State<MedServicePayment> createState() => _MedServicePaymentState();
}

class _MedServicePaymentState extends State<MedServicePayment> {
  String _selectedOption = "";
  String _selectedPayment = "Payme";

  Future<void> _launchPaymentUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

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
  void initState() {
    super.initState();
    final authBloc = context.read<AuthBloc>();
    if (authBloc.state.patientInfo == null) {
      authBloc.add(const AuthEvent.fetchPatientInfo());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: widget.isHome
                  ? CAppBar(
                      title: "payment".tr(),
                      isBack: true,
                      centerTitle: true,
                      trailing: 24.w.horizontalSpace,
                      bottom: Column(
                        spacing: 8.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'step'.tr(
                                      namedArgs: {"count": "5", "total": "5"}),
                                  style: fonts.xSmallLink.copyWith(
                                      color: colors.neutral600,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text:
                                      "  ${"payment_for_the_appointment".tr()}",
                                  style: fonts.xSmallLink.copyWith(
                                      color: colors.primary900,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const CustomProgressBar(
                            count: 5,
                            allCount: 5,
                          ),
                        ],
                      ),
                    )
                  : CAppBar(
                      title: "selecting_the_time_the_date".tr(),
                      centerTitle: true,
                      isBack: true,
                      trailing: 24.w.horizontalSpace,
                    ),
            ),
            SliverFillRemaining(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state.patientInfo == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final patientInfo = state.patientInfo;

                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // User Information Section
                          UserInfoWidget(
                            title: "your_info".tr(),
                            children: [
                              CustomTextField(
                                readOnly: true,
                                padding: EdgeInsets.only(bottom: 12.h),
                                hintText:
                                    patientInfo?.firstName ?? "Not available",
                                title: "name".tr(),
                              ),
                              CustomTextField(
                                readOnly: true,
                                padding: EdgeInsets.only(bottom: 12.h),
                                hintText:
                                    patientInfo?.lastName ?? "Not available",
                                title: "second_name".tr(),
                              ),
                              CustomTextField(
                                readOnly: true,
                                padding: EdgeInsets.only(bottom: 12.h),
                                hintText: patientInfo?.patientId?.toString() ??
                                    "Not available",
                                title: "ID",
                              ),
                              CustomTextField(
                                readOnly: true,
                                padding: EdgeInsets.only(bottom: 12.h),
                                hintText:
                                    patientInfo?.phoneNumber ?? "Not available",
                                title: "contact_phone_number".tr(),
                              ),
                            ],
                          ),

                          24.h.verticalSpace,
                          VerifyAppointmentItem(
                            hasImage: false,
                            diagnosis: widget.diagnosis,
                            procedure: widget.procedure,
                            doctorName: widget.doctorName,
                            price: widget.price,
                            appointmentTime: widget.appointmentTime,
                            location: widget.location,
                            imagePath: widget.imagePath,
                            onCancel: () {},
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
                          // Add some bottom padding to ensure all content is scrollable
                          24.h.verticalSpace,
                          ZigZagContainer(
                            color: Colors.white,
                            zigZagHeight:
                                15, // Reduced from 60 for better proportions
                            padding: EdgeInsets.all(20),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 8.h),
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
                                  ValueListenableBuilder<
                                      List<Map<String, String>>>(
                                    valueListenable:
                                        AppointmentState.selectedAppointments,
                                    builder: (context, selectedList, _) {
                                      double total = 0;
                                      double vatRate = 0.15; // 15% VAT
                                      double subtotal = 0;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Services list
                                          ...selectedList.map((appointment) {
                                            final price = double.tryParse(
                                                    appointment['price'] ??
                                                        '0') ??
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
                                                    appointment[
                                                            'serviceName'] ??
                                                        'Service',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Style.neutral600,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${"_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ "} ${"sum".tr(namedArgs: {
                                                        "amount":
                                                            _formatNumber(price)
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

                                          // // Subtotal line
                                          // Padding(
                                          //   padding:
                                          //       EdgeInsets.only(top: 8.h, bottom: 4.h),
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment.spaceBetween,
                                          //     children: [
                                          //       Text(
                                          //         "subtotal".tr(),
                                          //         style: TextStyle(
                                          //           fontSize: 14.sp,
                                          //           color: Colors.grey[600],
                                          //         ),
                                          //       ),
                                          //       Text(
                                          //         '${_formatNumber(subtotal)} UZS',
                                          //         style: TextStyle(
                                          //           fontSize: 14.sp,
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),

                                          // VAT line
                                          // Padding(
                                          //   padding: EdgeInsets.symmetric(vertical: 4.h),
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment.spaceBetween,
                                          //     children: [
                                          //       Text(
                                          //         "vat_included".tr() +
                                          //             " (15%)", // "VAT included (15%)"
                                          //         style: TextStyle(
                                          //           fontSize: 14.sp,
                                          //           color: Colors.grey[600],
                                          //         ),
                                          //       ),
                                          //       Text(
                                          //         '${_formatNumber(subtotal * vatRate)} UZS',
                                          //         style: TextStyle(
                                          //           fontSize: 14.sp,
                                          //           color: Colors.grey[600],
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),

                                          Divider(
                                              color: Colors.grey[300],
                                              thickness: 1,
                                              height: 16.h),

                                          // Total row
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.h),
                                            child: Text(
                                              "${"total".tr()}_ _ _ _ _ _ _ _ _ _ _ _ _ ${"sum".tr(namedArgs: {
                                                    "amount":
                                                        _formatNumber(subtotal)
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
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(false);
                              Navigator.pushReplacement(
                                  context, AppRoutes.getMainPage(3));
                            },
                          ),
                          8.h.verticalSpace,
                          CButton(
                            title: "pay_right_now".tr(),
                            onTap: () async {
                              final paymentProvider =
                                  Provider.of<PaymentProvider>(
                                context,
                                listen: false,
                              );
                              if (paymentProvider.multiUrl != null &&
                                  paymentProvider.multiUrl!.isNotEmpty) {
                                await _launchPaymentUrl(
                                    paymentProvider.multiUrl!);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("No payment URL available")),
                                );
                              }
                            },
                          ),
                          24.h.verticalSpace,
                        ],
                      ),
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
