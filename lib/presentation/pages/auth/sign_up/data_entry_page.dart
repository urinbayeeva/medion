import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_enum.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_selection.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DataEntryPage extends StatefulWidget {
  const DataEntryPage({super.key});

  @override
  State<DataEntryPage> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
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
                    Text("Введите ваши данные", style: fonts.displaySecond),
                    8.h.verticalSpace,
                    Text(
                        "Чтобы войти, записаться на приёмы врачeй\nи следить за вашими посещениями",
                        style: fonts.smallText.copyWith(
                            color: colors.neutral700,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    12.h.verticalSpace,
                    CustomTextField(
                        title: "Имя",
                        borderRadius: 8.r,
                        hintText: "Введите имя"),
                    16.h.verticalSpace,
                    CustomTextField(
                        title: "Фамилия",
                        borderRadius: 8.r,
                        hintText: "Введите фамилию"),
                    16.h.verticalSpace,
                    CustomTextField(
                        title: "Отчество",
                        borderRadius: 8.r,
                        hintText: "Введите отчество"),
                    16.h.verticalSpace,
                    CustomTextField(
                        title: "Серия паспорта",
                        borderRadius: 8.r,
                        hintText: "AB123456"),
                    16.h.verticalSpace,
                    Text("Выберите пол",
                        style: fonts.xSmallMain.copyWith(fontSize: 13.sp)),
                    4.h.verticalSpace,
                    GenderSelection(
                        selectedGender: Gender.men,
                        onGenderSelected: (gender) {}),
                    const Spacer(),
                    CButton(
                        title: "Войти",
                        onTap: () =>
                            Navigator.push(context, AppRoutes.getMainPage(1))),
                    29.h.verticalSpace,
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
