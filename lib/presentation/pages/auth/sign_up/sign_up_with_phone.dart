import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_outlined_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/phone_number_component.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/extensions.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SignUpWithPhone extends StatefulWidget {
  final Function(dynamic)? onClose;
  final bool additionalPhone;
  final List<String>? phoneNumbers;
  final String? phoneNumber;
  const SignUpWithPhone(
      {super.key,
      this.onClose,
      required this.additionalPhone,
      this.phoneNumbers,
      this.phoneNumber});

  @override
  State<SignUpWithPhone> createState() => _SignUpWithPhoneState();
}

class _SignUpWithPhoneState extends State<SignUpWithPhone> {
  late FocusNode focusNode;
  late GlobalKey<FormState> _formKey;

  late TextEditingController _phoneNumberController;
  bool _isAccepted = false;

  @override
  void initState() {
    _phoneNumberController = TextEditingController(text: "+998 ");
    _formKey = GlobalKey<FormState>();
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.successSendCode) {
            SmsAutoFill().getAppSignature.then((value) {
              Navigator.pushReplacement(
                  context,
                  AppRoutes.getVerifyCodePage(
                      additionalPhone: widget.additionalPhone,
                      autofill: value,
                      phoneNumber: formatPhoneNumberForBackend(
                          _phoneNumberController.text),
                      password: null));
            });
          }
        },
        listenWhen: (previous, current) =>
            (previous.successSendCode != current.successSendCode &&
                current.successSendCode),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              CAppBar(
                  leading: icons.left.svg(width: 24.w, height: 24.h),
                  title: ''),
              16.h.verticalSpace,
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Spacer(),
                        Text("enter_phone_number".tr(),
                            style: fonts.displaySecond),
                        8.h.verticalSpace,
                        Text("to_enter_make_appoints".tr(),
                            style: fonts.smallText.copyWith(
                                color: colors.neutral700,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400)),
                        16.h.verticalSpace,
                        Form(
                          key: _formKey,
                          child: CustomTextField(
                            focusNode: focusNode,
                            autoFocus: true,
                            title: "",
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              if (value.length >= 17) {
                                setState(() {});
                              }
                            },
                            controller: _phoneNumberController,
                            formatter: <TextInputFormatter>[
                              InternationalPhoneFormatter()
                            ],
                            hintText: '+998',
                            validator: (String? text) {
                              if (text != null && text.length < 17) {
                                return "number_entered_incorrectly".tr();
                              } else {
                                if (widget.phoneNumbers != null &&
                                    widget.phoneNumbers!.isNotEmpty) {
                                  for (var phone in widget.phoneNumbers!) {
                                    if (phone ==
                                        formatPhoneNumberForUI(
                                            _phoneNumberController.text)) {
                                      return "phone_number_already_exists";
                                    }
                                  }
                                }
                                return null;
                              }
                            },
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: _isAccepted,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isAccepted = value ?? false;
                                  });
                                },
                                activeColor: Colors.transparent,
                                checkColor: Colors.white,
                                side: BorderSide(color: colors.error500),
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.red;
                                  }
                                  return colors.shade0;
                                }),
                              ),
                              AnimationButtonEffect(
                                onTap: () {
                                  Navigator.push(context,
                                      AppRoutes.getPrivacyPolicyPage());
                                },
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: fonts.regularLink
                                        .copyWith(color: colors.primary900),
                                    children: [
                                      const TextSpan(
                                        text: 'Я согласен(а) с ',
                                      ),
                                      TextSpan(
                                        text: 'политикой \nконфиденциальности',
                                        style: TextStyle(
                                          color: colors.error500,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                AppRoutes
                                                    .getPrivacyPolicyPage());
                                            print(
                                                'Политика конфиденциальности tapped!');
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        16.h.verticalSpace,
                        CustomButton(
                            isDisabled:
                                _phoneNumberController.text.length < 17 ||
                                    _isAccepted == false,
                            title: "send_code".tr(),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                focusNode.unfocus();
                                final signature =
                                    await SmsAutoFill().getAppSignature;
                                context.read<AuthBloc>().add(
                                      AuthEvent.sendPhoneNumber(
                                        request: PhoneNumberSendReq((p0) => p0
                                          ..phoneNumber =
                                              formatPhoneNumberForBackend(
                                                  _phoneNumberController.text)),
                                      ),
                                    );
                              }
                            }),
                        27.h.verticalSpace,
                      ]),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
