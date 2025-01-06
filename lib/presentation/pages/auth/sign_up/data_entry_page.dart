import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/user_model.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_enum.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_selection.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:http/http.dart' as http;

class DataEntryPage extends StatefulWidget {
  const DataEntryPage({super.key});

  @override
  State<DataEntryPage> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController otchestvoController = TextEditingController();
  final TextEditingController passportController = TextEditingController();

  Gender selectedGender = Gender.men;
  bool isLoading = false; // Loading state

  @override
  void dispose() {
    nameController.dispose();
    secondNameController.dispose();
    otchestvoController.dispose();
    passportController.dispose();
    super.dispose();
  }

  // /// Send Data to API

  // /// API - Save User Data
  // Future<void> saveUserToApi() async {
  //   setState(() => isLoading = true); // Show loading indicator

  //   try {
  //     // API URL
  //     const String url = 'https://his.uicgroup.tech/apiweb/patient/create';

  //     // Prepare data
  //     final user = UserModel(
  //       id: "1111",
  //       firstName: nameController.text,
  //       lastName: secondNameController.text,
  //       middleName: otchestvoController.text,
  //       phoneNumber: "",
  //       additionalPhoneNumber: "",
  //       documentType: "Pasport",
  //       passportSerial: passportController.text,
  //       dateOfBirth: "",
  //       dateOfIssue: "",
  //       issueOrganization: "",
  //     );

  //     // Send HTTP POST request
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //       body: jsonEncode(user.toJson()),
  //     );

  //     // Handle Response
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final data = jsonDecode(response.body);
  //       if (data['status'] == 'success') {
  //         Navigator.push(context, AppRoutes.getMainPage(0));
  //       } else {
  //         _showError(data['message']);
  //       }
  //     } else {
  //       _showError('Server Error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     _showError('An error occurred. Please try again.');
  //   } finally {
  //     setState(() => isLoading = false); // Hide loading
  //   }
  // }

  // /// Show Error Message
  // void _showError(String message) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
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
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                        controller: secondNameController,
                        title: "second_name".tr(),
                        borderRadius: 8.r,
                        hintText: "enter_your_second_name".tr()),
                    16.h.verticalSpace,
                    CustomTextField(
                      controller: otchestvoController,
                      title: "fathers_name".tr(),
                      borderRadius: 8.r,
                      hintText: "fathers_name".tr(),
                    ),
                    16.h.verticalSpace,
                    CustomTextField(
                        controller: passportController,
                        title: "series_of_passport".tr(),
                        borderRadius: 8.r,
                        hintText: "AB123456"),
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
                    CButton(
                        title: isLoading
                            ? "creating_patient".tr()
                            : "sign_in".tr(),
                        onTap: () {
                          Navigator.push(context, AppRoutes.getMainPage(0));
                        }),
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
    });
  }
}
