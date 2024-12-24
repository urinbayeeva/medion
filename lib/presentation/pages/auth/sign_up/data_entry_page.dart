import 'package:easy_localization/easy_localization.dart';
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
                    Text("enter_your_info".tr(), style: fonts.displaySecond),
                    8.h.verticalSpace,
                    Text("to_enter_make_appoints".tr(),
                        style: fonts.smallText.copyWith(
                            color: colors.neutral700,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    12.h.verticalSpace,
                    CustomTextField(
                        title: "name".tr(),
                        borderRadius: 8.r,
                        hintText: "enter_your_name".tr()),
                    16.h.verticalSpace,
                    CustomTextField(
                        title: "second_name".tr(),
                        borderRadius: 8.r,
                        hintText: "enter_your_second_name".tr()),
                    16.h.verticalSpace,
                    CustomTextField(
                      title: "athers_name".tr(),
                      borderRadius: 8.r,
                      hintText: "athers_name".tr(),
                    ),
                    16.h.verticalSpace,
                    CustomTextField(
                        title: "series_of_passport".tr(),
                        borderRadius: 8.r,
                        hintText: "AB123456"),
                    16.h.verticalSpace,
                    Text("select_gender".tr(),
                        style: fonts.xSmallMain.copyWith(fontSize: 13.sp)),
                    4.h.verticalSpace,
                    GenderSelection(
                        selectedGender: Gender.men,
                        onGenderSelected: (gender) {}),
                    const Spacer(),
                    CButton(
                        title: "sign_in".tr(),
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
