import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';

import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_enum.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_selection.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/utils/extensions.dart'; // Import for CreateInfoReq

class DataEntryPage extends StatefulWidget {
  final String phoneNumber;

  const DataEntryPage({super.key, required this.phoneNumber});

  @override
  State<DataEntryPage> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController otchestvoController = TextEditingController();
  final TextEditingController passportController = TextEditingController();

  Gender selectedGender = Gender.men;
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    secondNameController.dispose();
    otchestvoController.dispose();
    passportController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    final createInfoRequest = CreateInfoReq((b) => b
      ..firstName = nameController.text.trim()
      ..lastName = secondNameController.text.trim()
      ..middleName = otchestvoController.text.trim()
      ..phoneNumber = widget.phoneNumber
      ..dateOfBirth = "2022-01-23"
      ..gender = "male"
      ..passportSerial = passportController.text.trim());

    context.read<AuthBloc>().add(
          AuthEvent.sendUserInfo(request: createInfoRequest),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.successSendUserInfo) {
          Navigator.push(context, AppRoutes.getMainPage(0));
        }
      },
      child: ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              52.h.verticalSpace,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView(
                    children: [
                      16.h.verticalSpace,
                      Text("enter_your_info".tr(), style: fonts.displaySecond),
                      SizedBox(height: 8.h),
                      Text("to_enter_make_appoints".tr(),
                          style: fonts.smallText.copyWith(
                              color: colors.neutral700,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400)),
                      16.h.verticalSpace,
                      CustomTextField(
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 1,
                          maxLength: 15,
                          controller: nameController,
                          title: "name".tr(),
                          borderRadius: 8.r,
                          hintText: "enter_your_name".tr()),
                      SizedBox(height: 16.h),
                      16.h.verticalSpace,
                      CustomTextField(
                          maxLength: 15,
                          textCapitalization: TextCapitalization.sentences,
                          controller: secondNameController,
                          title: "second_name".tr(),
                          borderRadius: 8.r,
                          hintText: "enter_your_second_name".tr()),
                      16.h.verticalSpace,
                      CustomTextField(
                        maxLength: 15,
                        textCapitalization: TextCapitalization.sentences,
                        controller: otchestvoController,
                        title: "fathers_name".tr(),
                        borderRadius: 8.r,
                        hintText: "fathers_name".tr(),
                      ),
                      16.h.verticalSpace,
                      CustomTextField(
                        textCapitalization: TextCapitalization.characters,
                        maxLength: 9, // Adjusted for "AB 123456" format
                        controller: passportController,
                        title: "series_of_passport".tr(),
                        borderRadius: 8.r,
                        hintText: "AB 123456",
                      ),
                      16.h.verticalSpace,
                      Text("select_gender".tr(),
                          style: fonts.xSmallMain.copyWith(fontSize: 13.sp)),
                      SizedBox(height: 4.h),
                      GenderSelection(
                        selectedGender: selectedGender,
                        onGenderSelected: (Gender gender) {
                          setState(() {
                            selectedGender = gender;
                          });
                        },
                      ),
                      80.h.verticalSpace,
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return CButton(
                              title: state.successSendUserInfo
                                  ? "creating_patient".tr()
                                  : "sign_in".tr(),
                              onTap: () {
                                _submitForm(context);
                                // Navigator.pushReplacement(
                                //     context, AppRoutes.getMainPage(0));
                              });
                        },
                      ),
                      29.h.verticalSpace,
                      29.h.verticalSpace,
                      29.h.verticalSpace,
                      29.h.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
