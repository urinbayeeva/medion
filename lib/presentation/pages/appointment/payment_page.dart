import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/application/visit/visit_bloc.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_radio_tile.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/appointment/appoinment_state.dart';
import 'package:medion/presentation/pages/appointment/component/user_info_widget.dart';
import 'package:medion/presentation/pages/appointment/component/verify_appointment_item.dart';
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/pages/appointment/verify_appointment.dart';
import 'package:medion/presentation/pages/main/main_page.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
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
  final List<AppointmentItem> appointments;
  final BookingBloc bloc;

  const PaymentPage({
    super.key,
    this.isHome = false,
    required this.appointments,
    required this.bloc,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final ValueNotifier<String> _paymentMethod = ValueNotifier('');
  final ValueNotifier<String> _url = ValueNotifier('');
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
        // if (_showWebView && _paymentUrl != null) {
        //   return Scaffold(
        //     body: Stack(
        //       children: [
        //         WebViewWidget(controller: _webViewController),
        //         Positioned(
        //           top: 40.h,
        //           right: 16.w,
        //           child: CircleAvatar(
        //             radius: 20.r,
        //             backgroundColor: Colors.white.withValues(alpha: 0.8),
        //             child: IconButton(
        //               icon: Icon(Icons.close, size: 20.w),
        //               onPressed: () {
        //                 setState(() {
        //                   _showWebView = false;
        //                 });
        //               },
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: Text("payment".tr(), style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<VisitBloc, VisitState>(
            buildWhen: (o, n) {
              final status = o.createVisitStatus != n.createVisitStatus;
              final info = o.visits != n.visits;
              return status || info;
            },
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          12.h.verticalSpace,
                          BlocBuilder<AuthBloc, AuthState>(
                            buildWhen: (o, n) {
                              final info = o.patientInfo != n.patientInfo;
                              return info;
                            },
                            builder: (context, state) {
                              if (state.patientInfo == null) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Style.error500,
                                  ),
                                );
                              }

                              final patientInfo = state.patientInfo;
                              return UserInfoWidget(
                                fonts: fonts,
                                title: "your_info".tr(),
                                children: [
                                  CustomTextField(
                                    readOnly: true,
                                    hintTextStyle: fonts.smallText.copyWith(fontSize: 14.sp),
                                    padding: const EdgeInsets.only(bottom: 12),
                                    hintText: patientInfo?.firstName ?? "Not available",
                                    title: "name".tr(),
                                  ),
                                  CustomTextField(
                                    readOnly: true,
                                    hintTextStyle: fonts.smallText.copyWith(fontSize: 14.sp),
                                    padding: const EdgeInsets.only(bottom: 12),
                                    hintText: patientInfo?.lastName ?? "Not available",
                                    title: "second_name".tr(),
                                  ),
                                  CustomTextField(
                                    readOnly: true,
                                    hintTextStyle: fonts.smallText.copyWith(fontSize: 14.sp),
                                    padding: const EdgeInsets.only(bottom: 12),
                                    hintText: patientInfo?.patientId?.toString() ?? "Not available",
                                    title: "ID",
                                  ),
                                  CustomTextField(
                                    readOnly: true,
                                    hintTextStyle: fonts.smallText.copyWith(fontSize: 14.sp),
                                    padding: const EdgeInsets.only(bottom: 12),
                                    hintText: patientInfo?.phoneNumber ?? "Not available",
                                    title: "contact_phone_number".tr(),
                                  ),
                                ],
                              );
                            },
                          ),
                          12.h.verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: colors.shade0,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
                            child: Builder(
                              builder: (context) {
                                // if (state.visits == null) {
                                //   return const SizedBox.shrink();
                                // }
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("your_techniques".tr(), style: fonts.regularMain),
                                    10.verticalSpace,
                                    ...widget.appointments.map(
                                      (appointment) => _buildAppointmentItem(
                                        appointment: appointment,
                                        context: context,
                                        bloc: widget.bloc,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          12.h.verticalSpace,
                          UserInfoWidget(
                            fonts: fonts,
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

                          if (state.visits == null) ...{
                            const SizedBox.shrink()
                          } else ...{
                            ValueListenableBuilder(
                              valueListenable: _paymentMethod,
                              builder: (context, value, child) {
                                return Container(
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
                                      if (state.visits != null) ...{
                                        ...List.generate(
                                          state.visits!.paymentUrls.length,
                                          (i) {
                                            final item = state.visits!.paymentUrls[i];
                                            final type = state.visits!.paymentUrls[i].type;
                                            final isPayme = type.toLowerCase().contains("payme");
                                            final isClick = type.toLowerCase().contains("click");
                                            final isMultiCard = type.toLowerCase().contains("card");

                                            return PaymentButton(
                                              image: (isPayme)
                                                  ? Image.asset("assets/images/payme_img.png")
                                                  : (isClick)
                                                      ? icons.click.svg()
                                                      : SizedBox(),
                                              title: state.visits!.paymentUrls[i].type,
                                              colors: colors,
                                              fonts: fonts,
                                              onTap: () {
                                                log("Url: ${item.url}");
                                                _url.value = item.url;
                                                _paymentMethod.value = type.toLowerCase();
                                              },
                                              icons: icons,
                                              isSelected: _paymentMethod.value == type.toLowerCase(),
                                            );
                                          },
                                        ),
                                      },
                                    ],
                                  ),
                                );
                              },
                            ),
                          },

                          12.h.verticalSpace,
                          ClipPath(
                            clipper: ZigZagClipper(),
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "your_check".tr(),
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  12.h.verticalSpace,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final services = <VisitResponseService>[...?state.visits?.services];
                                          return ListView.separated(
                                            itemCount: services.length,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            separatorBuilder: (context, index) => 10.h.verticalSpace,
                                            itemBuilder: (context, index) {
                                              final service = services[index];
                                              return Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                spacing: 6.h,
                                                children: [
                                                  1.h.verticalSpace,
                                                  _PaymentRow(
                                                    label: "${index + 1}. ${service.serviceName ?? ''}",
                                                    value: "sum".tr(
                                                      namedArgs: {
                                                        "amount": _formatNumber(service.priceSubtotal ?? 0),
                                                      },
                                                    ),
                                                  ),
                                                  _PaymentRow(
                                                    label: '${"nds".tr()} ${service.taxPercentage}% ',
                                                    value: "sum".tr(
                                                      namedArgs: {
                                                        "amount": _formatNumber(service.taxAmount ?? 0),
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  if (state.visits?.total != null) ...{
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8.h),
                                      child: _PaymentRow(
                                        label: "total".tr(),
                                        labelStyle: fonts.regularMain,
                                        value: "sum".tr(
                                          namedArgs: {"amount": _formatNumber(state.visits!.total!.totalAmount ?? 0)},
                                        ),
                                      ),
                                    ),
                                    10.h.verticalSpace,
                                    // Padding(
                                    //   padding: EdgeInsets.symmetric(vertical: 8.h),
                                    //   child: _PaymentRow(
                                    //     label: "${"total".tr()} ${"nds".tr()}",
                                    //     labelStyle: fonts.regularMain,
                                    //     value: "sum".tr(
                                    //       namedArgs: {"amount": _formatNumber(state.visits!.total!.totalTax ?? 0)},
                                    //     ),
                                    //   ),
                                    // ),
                                  },
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
                          4.h.verticalSpace,
                          CButton(
                            backgroundColor: Style.neutral200,
                            textColor: Style.primary900,
                            title: "pay_not_right_now".tr(),
                            onTap: () async {
                              widget.bloc.add(const BookingEvent.clearAllAppointmentAndService());

                              context.read<BottomNavBarController>().changeNavBar(false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MainPage(index: 2)),
                              );
                            },
                          ),
                          8.h.verticalSpace,
                          CButton(
                            title: "pay_right_now".tr(),
                            onTap: () async {
                              if (_url.value.length > 4) {
                                widget.bloc.add(const BookingEvent.clearAllAppointmentAndService());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentWebView(url: _url.value),
                                  ),
                                );
                              } else {
                                context.showPopUp(
                                  status: PopUpStatus.warning,
                                  message: "no_selected_payment_type".tr(),
                                  fonts: fonts,
                                  colors: colors,
                                  context: context,
                                );
                              }
                            },
                          ),
                          16.h.verticalSpace,
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

  Widget _buildAppointmentItem({
    required AppointmentItem appointment,
    required BuildContext context,
    required BookingBloc bloc,
  }) {
    String appointmentDate = appointment.date ?? '';
    String appointmentTime = appointment.time ?? '';

    String formattedDate = appointmentDate.isNotEmpty
        ? DateFormat('EEE, dd MMMM', context.locale.toString()).format(
            DateTime.tryParse(appointmentDate) ?? DateTime.now(),
          )
        : "Not available";

    return VerifyAppointmentItem(
      hasCancelButton: false,
      hasImage: false,
      diagnosis: appointment.serviceName ?? 'Unknown',
      procedure: appointment.specialty ?? 'Unknown',
      doctorName: 'Dr. ${appointment.doctorName ?? "Unknown"}',
      price: appointment.price,
      appointmentTime: "$formattedDate ${appointmentTime.isNotEmpty ? appointmentTime : "Not available"}",
      location: appointment.location ?? 'Unknown',
      imagePath: appointment.imagePath ?? "",
      onCancel: () {
        bloc.add(BookingEvent.removeAppointment(serviceId: appointment.serviceId));
        // final serviceId = appointment['serviceId'];
        // if (serviceId != null) {
        //   AppointmentState.removeAppointment(serviceId);
        // }
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

class _PaymentRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;

  const _PaymentRow({required this.label, required this.value, this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 10.w,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 0.35.sw),
          child: Text(
            label,
            maxLines: 2,
            style: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return CustomPaint(
                size: Size(constraints.maxWidth, 1),
                painter: DottedLinePainter(),
              );
            },
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 0.3.sw),
          child: Text(
            value,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashWidth = 4.0;
    const dashSpace = 4.0;
    double startX = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
