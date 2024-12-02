import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.shade0,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text("Войдите,\nчтобы начать",
                  style:
                      fonts.displaySecond.copyWith(color: colors.primary900)),
              8.h.verticalSpace,
              Text(
                  "Продолжая, вы соглашаетесь с нашими Условиями использования и подтверждаете, что прочитали наше заявление о конфиденциальности и файлах cookie",
                  style: fonts.xSmallText.copyWith(
                      color: colors.neutral600,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400)),
              32.h.verticalSpace,
              _buildListTile(
                  imagePath: icons.medicalHistoryFirst,
                  title: "Запишитесь на приём врача онлайн",
                  description: "30+ направлений и их услуги"),
              14.h.verticalSpace,
              _buildListTile(
                  imagePath: icons.calendarFirst,
                  title: "Следите за своими посещениями",
                  description: "Ваши предстоящие и последние посещения"),
              14.h.verticalSpace,
              _buildListTile(
                  imagePath: icons.folderFirst,
                  title: "Легко получайте результаты анализов",
                  description: "Ваши заключения врачей и анализы"),
              const Spacer(),
              CButton(
                iconPath: icons.phoneTwo,
                title: "Продолжить с номером телефона",
                onTap: () {
                  Navigator.push(context, AppRoutes.getSignUpWithPhone());
                },
              ),
              12.h.verticalSpace,
              CButton(
                backgroundColor: colors.neutral200,
                textColor: colors.primary900,
                // hasBorderRadius: true,
                iconPath: icons.mail,
                title: "Продолжить с e-mail",
                onTap: () =>
                    Navigator.push(context, AppRoutes.getSignUpPageWithEmail()),
              ),
              27.h.verticalSpace,
            ],
          ),
        ),
      );
    });
  }

  Widget _buildListTile(
      {required String imagePath,
      required String title,
      required String description}) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(imagePath, width: 32.w, height: 32.h),
          title: Text(
            title,
            style: fonts.smallText.copyWith(
                color: colors.primary900,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            description,
            style: fonts.xSmallText.copyWith(
                color: colors.neutral600,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400),
          ));
    });
  }
}
