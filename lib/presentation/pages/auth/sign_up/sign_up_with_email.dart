import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
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
                    Text("Введите e-mail", style: fonts.displaySecond),
                    8.h.verticalSpace,
                    Text(
                        "Чтобы войти, записаться на приёмы врачeй\nи следить за вашими посещениями",
                        style: fonts.smallText.copyWith(
                            color: colors.neutral700,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    16.h.verticalSpace,
                    CustomTextField(
                        borderRadius: 8.r,
                        controller: phoneNumberController,
                        hintText: "example@gmail.com"),
                    const Spacer(),
                    // CButton(
                    //     title: "Выслать код",
                    //     onTap: () => Navigator.push(
                    //         context, AppRoutes.getDataEntryPage())),
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
