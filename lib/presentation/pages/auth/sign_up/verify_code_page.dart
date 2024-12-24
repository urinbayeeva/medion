import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/custom_pin_put.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyCodePage extends StatefulWidget {
  final Function(dynamic)? onClose;
  final String? password;
  final bool additionalPhone;

  const VerifyCodePage({
    super.key,
    this.onClose,
    this.password,
    required this.additionalPhone,
    required this.phoneNumber,
    required this.autofill,
  });

  final String phoneNumber;
  final String autofill;

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  late TextEditingController _smsController;
  late SmsAutoFill smsAutoFill;

  late String codeValue;
  int refresh = 0;

  @override
  void initState() {
    _smsController = TextEditingController();
    smsAutoFill = SmsAutoFill();
    codeValue = "";
    //
    listenOtp();
    super.initState();
  }

  @override
  void dispose() {
    _smsController.dispose();
    SmsAutoFill().unregisterListener();

    super.dispose();
  }

  void listenOtp() async {
    await smsAutoFill.listenForCode().then((value) {
      smsAutoFill.code.listen((event) {
        _smsController.text = event;
      });
    });
  }

  @override
  void codeUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CAppBar(
                leading: icons.left.svg(width: 24.w, height: 24.h), title: ''),
            16.h.verticalSpace,
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Spacer(),
                    Text("enter_verification_code".tr(),
                        style: fonts.displaySecond),
                    8.h.verticalSpace,
                    Text("to_enter_make_appoints".tr(),
                        style: fonts.smallText.copyWith(
                            color: colors.neutral700,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    16.h.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 24.h, horizontal: 12.w),
                      child: SizedBox(
                        height: 52.h,
                        child: FocusScope(
                          child: CustomPinFieldAutoFill(
                              autoFocus: true,
                              keyboardType: TextInputType.phone,
                              controller: _smsController,
                              currentCode: codeValue,
                              cursor: Cursor(
                                width: 2.w,
                                height: 22.h,
                                color: colors.primary500,
                                radius: Radius.circular(1.r),
                                enabled: true,
                              ),
                              codeLength: 4,
                              decoration: BoxLooseDecoration(
                                gapSpace: 8.w,
                                textStyle: fonts.regularText,
                                strokeColorBuilder: CustomColorBuilder(
                                  colors.neutral300,
                                  colors.primary900,
                                ),
                              ),
                              onCodeChanged: (code) {
                                // setState(() {
                                //   codeValue = code.toString();
                                //   if (codeValue.length == 6) {
                                //     verify(context);
                                //   }
                                // });
                              }),
                        ),
                      ),
                    ),
                    const Spacer(),

                    Align(
                      alignment: Alignment.center,
                      child: AnimationButtonEffect(
                          onTap: () {},
                          child: Text("resend".tr(),
                              style: fonts.regularText.copyWith(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400))),
                    ),
                    24.h.verticalSpace,
                    CButton(
                        title: "verify".tr(),
                        onTap: () => Navigator.push(
                            context, AppRoutes.getDataEntryPage())),
                    27.h.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class CustomColorBuilder extends ColorBuilder {
  final Color enteredColor;
  final Color notEnteredColor;
  var maxIndex = 0;

  CustomColorBuilder(this.enteredColor, this.notEnteredColor);

  @override
  Color indexProperty(int index) {
    return index == maxIndex ? notEnteredColor : enteredColor;
  }

  @override
  void notifyChange(String enteredPin) {
    maxIndex = enteredPin.length;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PinListenColorBuilder &&
          runtimeType == other.runtimeType &&
          enteredColor == other.enteredColor &&
          notEnteredColor == other.notEnteredColor &&
          maxIndex == other.maxIndex;

  @override
  int get hashCode =>
      enteredColor.hashCode ^ notEnteredColor.hashCode ^ maxIndex.hashCode;
}
