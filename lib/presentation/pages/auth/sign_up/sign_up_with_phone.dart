import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/phone_number_component.dart';
import 'package:medion/presentation/routes/routes.dart';

import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SignUpWithPhone extends StatefulWidget {
  const SignUpWithPhone({super.key});

  @override
  State<SignUpWithPhone> createState() => _SignUpWithPhoneState();
}

class _SignUpWithPhoneState extends State<SignUpWithPhone> {
  late FocusNode focusNode;
  late GlobalKey<FormState> _formKey;

  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    _phoneNumberController = TextEditingController(text: "+998");
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
                    Text("Введите\nномер телефона", style: fonts.displaySecond),
                    8.h.verticalSpace,
                    Text(
                        "Чтобы войти, записаться на приёмы врачeй\nи следить за вашими посещениями",
                        style: fonts.smallText.copyWith(
                            color: colors.neutral700,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    16.h.verticalSpace,
                    CustomTextField(
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
                      // validator: (String? text) {
                      //   if (text != null && text.length < 17) {
                      //     return "number_entered_incorrectly".tr();
                      //   } else {
                      //     if (widget.phoneNumbers != null &&
                      //         widget.phoneNumbers!.isNotEmpty) {
                      //       for (var phone in widget.phoneNumbers!) {
                      //         if (phone ==
                      //             formatPhoneNumber(
                      //                 _phoneNumberController.text)) {
                      //           return "phone_number_already_exists".tr();
                      //         }
                      //       }
                      //     }
                      //     return null;
                      //   }
                      // },
                    ),
                    const Spacer(),
                    CButton(
                        title: "Выслать код",
                        onTap: () => Navigator.push(
                            context, AppRoutes.getVerifyCodePage())),
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
