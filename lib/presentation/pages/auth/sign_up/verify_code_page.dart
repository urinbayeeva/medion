// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/count_down.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/custom_pin_put.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyCodePage extends StatefulWidget {
  final Function(dynamic)? onClose;
  final String? password;
  final bool additionalPhone;
  final String phoneNumber;
  final String autofill;

  const VerifyCodePage({
    super.key,
    this.onClose,
    this.password,
    required this.additionalPhone,
    required this.phoneNumber,
    required this.autofill,
  });

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

  Future<void> _handleMultiUserCase(List<User> users) async {
    User? selectedUser = users.first;

    await showDialog<User>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Style.shade0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              titlePadding: const EdgeInsets.only(top: 16),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              insetPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              title: const Center(
                child: Column(
                  children: [
                    Text(
                      'Select User',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Style.primary900,
                      ),
                    ),
                  ],
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: users.map((user) {
                    final isSelected = user == selectedUser;
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(user.name),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle,
                              color: Style.error500)
                          : null,
                      onTap: () {
                        setState(() => selectedUser = user);
                      },
                    );
                  }).toList(),
                ),
              ),
              actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: CButton(
                    title: "next".tr(),
                    onTap: () {
                      Navigator.pop(context, selectedUser);
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    ).then((User? selected) {
      if (selected != null) {
        context.read<DBService>().setToken(Token(
              accessToken: selected.accessToken,
              refreshToken: selected.refreshToken,
              tokenType: selected.tokenType,
            ));

        final isNewPatient = !selected.offerta;
        if (isNewPatient) {
          context.read<BottomNavBarController>().changeNavBar(false);

          Navigator.pushAndRemoveUntil(
            context,
            AppRoutes.getDataEntryPage(widget.phoneNumber),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            AppRoutes.getMainPage(0),
            (route) => false,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.registrationResponse != null) {
            final response = state.registrationResponse!;

            if (response.multiUser) {
              _handleMultiUserCase(response.users.toList());
            } else {
              if (state.isNewPatient == false) {
                context.read<BottomNavBarController>().changeNavBar(false);
                Navigator.pushAndRemoveUntil(
                  context,
                  AppRoutes.getMainPage(0),
                  (route) => false,
                );
              } else if (state.errorSendCode != true &&
                  state.isNewPatient == true) {
                Navigator.pushAndRemoveUntil(
                  context,
                  AppRoutes.getDataEntryPage(widget.phoneNumber),
                  (route) => false,
                );
              }
            }
          }
        },
        builder: (context, state) {
          return ThemeWrapper(
            builder: (context, colors, fonts, icons, controller) {
              return Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.white,
                body: Column(
                  children: [
                    CAppBar(
                      leading: icons.left.svg(width: 24.w, height: 24.h),
                      title: '',
                      isBack: true,
                    ),
                    16.h.verticalSpace,
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      codeValue = code!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.center,
                              child: AnimationButtonEffect(
                                onTap: () {},
                                child: CountDownComp(
                                  refresh: refresh,
                                  seconds: 59,
                                  onTap: () {
                                    refresh++;
                                    context.read<AuthBloc>().add(
                                          AuthEvent.verificationSend(
                                            request: RegisterReq((p0) => p0
                                              ..phoneNumber = widget.phoneNumber
                                              ..code = _smsController.text),
                                          ),
                                        );
                                  },
                                ),
                              ),
                            ),
                            24.h.verticalSpace,
                            CButton(
                              title: "verify".tr(),
                              onTap: () {
                                if (_smsController.text.length != 4) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'please_enter_full_code'.tr())),
                                  );
                                  return;
                                }
                                context.read<AuthBloc>().add(
                                      AuthEvent.verificationSend(
                                        request: RegisterReq((p0) => p0
                                          ..phoneNumber = widget.phoneNumber
                                          ..code = _smsController.text),
                                      ),
                                    );
                                context.read<DBService>().setBool(
                                    isSaved: true, key: DBService.intro);
                                context
                                    .read<DBService>()
                                    .setLang(isSaved: true);
                              },
                            ),
                            27.h.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
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
