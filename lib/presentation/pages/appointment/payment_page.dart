import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_radio_tile.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/component/user_info_widget.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/pages/main/main_page.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final bool isHome;

  const PaymentPage({super.key, this.isHome = false});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final ValueNotifier<String> _paymentMethod = ValueNotifier('');
  final ValueNotifier<String> paymentUrl = ValueNotifier('');
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

    paymentUrl.value = paymentProvider.clickUrl ?? paymentProvider.paymeUrl ?? paymentProvider.multiUrl ?? '';
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
                    backgroundColor: Colors.white.withValues(alpha: 0.8),
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
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("payment".tr(), style: fonts.regularMain),
            // actions: [
            //   WScaleAnimation(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               const PaymentWebView(url: "https://his.uicgroup.tech/apimulticard/2270?callback=true"),
            //         ),
            //       );
            //     },
            //     child: icons.share.svg(),
            //   ),
            //   12.w.horizontalSpace,
            //   WScaleAnimation(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               const PaymentWebView(url: "https://his.uicgroup.tech/apipayme/2269?callback=true"),
            //         ),
            //       );
            //     },
            //     child: icons.download.svg(),
            //   ),
            //   12.w.horizontalSpace,
            //   WScaleAnimation(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               const PaymentWebView(url: "https://his.uicgroup.tech/apiclick/2270?callback=true"),
            //         ),
            //       );
            //     },
            //     child: icons.phone.svg(),
            //   ),
            //   12.w.horizontalSpace,
            // ],
          ),
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

              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          12.h.verticalSpace,
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
                                hintText: patientInfo?.patientId?.toString() ?? "Not available",
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
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: colors.shade0,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
                            child: ValueListenableBuilder<List<Map<String, String>>>(
                              valueListenable: AppointmentState.selectedAppointments,
                              builder: (context, selectedList, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("your_techniques".tr(), style: fonts.regularMain),
                                    10.verticalSpace,
                                    ...selectedList.map((appointment) => _buildAppointmentItem(appointment, context)),
                                  ],
                                );
                              },
                            ),
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
                                title: Text("employer".tr()),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          12.h.verticalSpace,
                          ValueListenableBuilder(
                            valueListenable: _paymentMethod,
                            builder: (context, value, child) {
                              return Container(
                                height: 110.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: colors.shade0,
                                ),
                                padding: EdgeInsets.all(12.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10.h,
                                  children: [
                                    Text("Способ оплаты", style: fonts.regularMain),
                                    Row(
                                      spacing: 8.w,
                                      children: [
                                        Expanded(
                                          child: PaymentButton(
                                            image: Image.asset("assets/images/payme_img.png"),
                                            title: "Payme",
                                            colors: colors,
                                            fonts: fonts,
                                            onTap: () {
                                              _paymentMethod.value = 'payme';
                                            },
                                            icons: icons,
                                            isSelected: _paymentMethod.value == "payme",
                                          ),
                                        ),
                                        Expanded(
                                          child: PaymentButton(
                                            image: icons.click.svg(),
                                            title: "Click",
                                            colors: colors,
                                            fonts: fonts,
                                            icons: icons,
                                            isSelected: _paymentMethod.value == "click",
                                            onTap: () {
                                              _paymentMethod.value = 'click';
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),

                          12.h.verticalSpace,
                          ClipPath(
                            clipper: ZigZagClipper(),
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              padding: const EdgeInsets.all(20),
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
                                    valueListenable: AppointmentState.selectedAppointments,
                                    builder: (context, selectedList, _) {
                                      double subtotal = 0;
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ...selectedList.map(
                                            (appointment) {
                                              final price = double.tryParse(appointment['price'] ?? '0') ?? 0;
                                              subtotal += price;

                                              return Padding(
                                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                                child: Row(
                                                  children: [
                                                    ConstrainedBox(
                                                      constraints: BoxConstraints(maxWidth: 0.5.sw),
                                                      child: Text(
                                                        appointment['serviceName'] ?? 'Service',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                          color: Style.neutral600,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Expanded(
                                                      child: LayoutBuilder(
                                                        builder: (context, constraints) {
                                                          return Text(
                                                            '_' * (constraints.maxWidth ~/ 8.6),
                                                            style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 12.sp,
                                                              letterSpacing: 2,
                                                            ),
                                                            overflow: TextOverflow.clip,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Text(
                                                      "sum".tr(namedArgs: {"amount": _formatNumber(subtotal)}),
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Style.neutral600,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8.h),
                                            child: Row(
                                              children: [
                                                ConstrainedBox(
                                                  constraints: BoxConstraints(maxWidth: 0.5.sw),
                                                  child: Text(
                                                    "total".tr(),
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Style.neutral600,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: LayoutBuilder(
                                                    builder: (context, constraints) {
                                                      return Text(
                                                        '_' * (constraints.maxWidth ~/ 8.6),
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12.sp,
                                                          letterSpacing: 2,
                                                        ),
                                                        overflow: TextOverflow.clip,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  "sum".tr(namedArgs: {"amount": _formatNumber(subtotal)}),
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Style.neutral600,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          12.h.verticalSpace,
                          Text("if_you_make_an_advance_payment".tr(), style: Style.smallLink()),
                          80.h.verticalSpace, // Extra space to avoid overlap
                        ],
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: colors.shade0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CButton(
                            backgroundColor: Style.neutral200,
                            textColor: Style.primary900,
                            title: "pay_not_right_now".tr(),
                            onTap: () async {
                              context.read<BottomNavBarController>().changeNavBar(false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MainPage(index: 2)),
                              );
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
                                        builder: (context) => PaymentWebView(url: paymentProvider.multiUrl!),
                                      ),
                                    );
                                  } else {
                                    await _initializePaymentUrl();
                                    if (paymentProvider.multiUrl?.isNotEmpty ?? false) {
                                      _openPaymentWebView(paymentProvider.multiUrl!);
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("payment_url_not_available".tr()),
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
                    ),
                  ),
                ],
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
      price: "${appointment['price']}",
      appointmentTime: "$formattedDate ${appointmentTime.isNotEmpty ? appointmentTime : "Not available"}",
      location: appointment['location'] ?? 'Unknown',
      imagePath: appointment['doctorPhoto'] ?? "",
      onCancel: () {
        final serviceId = appointment['serviceId'];
        if (serviceId != null) {
          AppointmentState.removeAppointment(serviceId);
        }
      },
    );
  }
}

class CheckWidget extends StatelessWidget {
  const CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ZigZagClipper(),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Ваш чек',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const zigzagHeight = 10.0;
    const zigzagCount = 20;

    final path = Path();

    path.moveTo(0, zigzagHeight);
    for (int i = 0; i < zigzagCount; i++) {
      double x2 = (i + 0.5) * size.width / zigzagCount;
      double x3 = (i + 1) * size.width / zigzagCount;
      path.lineTo(x2, 0);
      path.lineTo(x3, zigzagHeight);
    }

    path.lineTo(size.width, size.height - zigzagHeight);

    for (int i = zigzagCount; i > 0; i--) {
      double x2 = (i - 0.5) * size.width / zigzagCount;
      double x3 = (i - 1) * size.width / zigzagCount;
      path.lineTo(x2, size.height);
      path.lineTo(x3, size.height - zigzagHeight);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    required this.title,
    required this.colors,
    required this.fonts,
    required this.onTap,
    this.isSelected = false,
    required this.image,
    required this.icons,
  });

  final String title;
  final Widget image;
  final CustomColorSet colors;
  final IconSet icons;
  final FontSet fonts;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(6.w, 4.h, 6.w, 4.h),
        width: double.infinity,
        height: 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xffEDEDED)),
          color: !isSelected ? colors.shade0 : const Color(0xffEDEDED),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.w,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 6.w,
              children: [
                SizedBox(width: 24, height: double.infinity, child: image),
                Text(title, style: fonts.regularMain),
              ],
            ),
            if (isSelected) ...{
              icons.donePay.svg(),
            }
          ],
        ),
      ),
    );
  }
}
