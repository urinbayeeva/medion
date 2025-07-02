import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_enum.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_selection.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

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
  final TextEditingController birthDateController = TextEditingController();

  Gender selectedGender = Gender.men;
  bool isLoading = false;
  DateTime? selectedDate;

  @override
  void dispose() {
    nameController.dispose();
    secondNameController.dispose();
    otchestvoController.dispose();
    passportController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthDateController.text = DateFormat('yyyy-MM-dd').format(picked); // Format date for API
      });
    }
  }

  void _submitForm(BuildContext context) {
    final createInfoRequest = CreateInfoReq((b) => b
      ..offerta = false
      ..firstName = nameController.text.trim()
      ..lastName = secondNameController.text.trim()
      ..middleName = otchestvoController.text.trim()
      ..phoneNumber = widget.phoneNumber
      ..dateOfBirth = birthDateController.text
      ..gender = selectedGender == Gender.men ? "male" : "female"
      ..passportSerial = passportController.text.trim());

    context.read<AuthBloc>().add(AuthEvent.sendUserInfo(request: createInfoRequest));
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.successSendUserInfo) {
              context.read<DBService>().setLang(isSaved: true);
              Navigator.pushAndRemoveUntil(context, AppRoutes.getMainPage(0), (route) => false);
            } else {
              context.showPopUp(
                status: PopUpStatus.warning,
                message: "something_went_wrong".tr(),
                fonts: fonts,
                colors: colors,
                context: context,
              );
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: colors.shade0,
              foregroundColor: colors.darkMode900,
              scrolledUnderElevation: 0,
              leading: WScaleAnimation(
                child: Icon(Icons.keyboard_arrow_left, size: 32.h),
                onTap: () => Navigator.of(context).pop(),
              ),
              title: const SizedBox.shrink(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("enter_your_info".tr(), style: fonts.displaySecond, textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        "to_enter_make_appoints".tr(),
                        style: fonts.smallLink.copyWith(color: colors.neutral700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    16.h.verticalSpace,
                    CustomTextField(
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 1,
                      maxLength: 15,
                      controller: nameController,
                      title: "name".tr(),
                      borderRadius: 8.r,
                      hintText: "enter_your_name".tr(),
                      onChanged: (c) => setState(() {}),
                    ),
                    16.h.verticalSpace,
                    CustomTextField(
                      maxLength: 15,
                      textCapitalization: TextCapitalization.sentences,
                      controller: secondNameController,
                      title: "second_name".tr(),
                      onChanged: (c) => setState(() {}),
                      borderRadius: 8.r,
                      hintText: "enter_your_second_name".tr(),
                    ),
                    16.h.verticalSpace,
                    CustomTextField(
                      maxLength: 15,
                      textCapitalization: TextCapitalization.sentences,
                      controller: otchestvoController,
                      title: "fathers_name".tr(),
                      onChanged: (c) => setState(() {}),
                      borderRadius: 8.r,
                      hintText: "fathers_name".tr(),
                    ),
                    16.h.verticalSpace,
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: birthDateController,
                          title: "birth_date".tr(),
                          borderRadius: 8.r,
                          hintText: "select_birth_date".tr(),
                        ),
                      ),
                    ),
                    16.h.verticalSpace,
                    CustomTextField(
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 9,
                      // Adjusted for "AB 123456" format
                      controller: passportController,
                      title: "series_of_passport".tr(),
                      borderRadius: 8.r,
                      onChanged: (c) => setState(() {}),
                      hintText: "AB 123456",
                    ),
                    16.h.verticalSpace,
                    Text("select_gender".tr(), style: fonts.xSmallMain.copyWith(fontSize: 13.sp)),
                    SizedBox(height: 4.h),
                    GenderSelection(
                      selectedGender: selectedGender,
                      onGenderSelected: (Gender gender) {
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: SafeArea(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (c, state) {
                  final enDate = birthDateController.text.isNotEmpty;
                  final enName = nameController.text.isNotEmpty;
                  final enLName = secondNameController.text.isNotEmpty;
                  final enMName = otchestvoController.text.isNotEmpty;
                  final enPas = passportController.text.isNotEmpty;
                  final enableButton = enPas && enMName && enDate && enName && enLName;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CButton(
                      backgroundColor: enableButton ? null : colors.neutral300,
                      title: state.successSendUserInfo ? "creating_patient".tr() : "sign_in".tr(),
                      onTap: () {
                        if (enableButton) {
                          _submitForm(context);
                        } else {
                          context.showPopUp(
                            status: PopUpStatus.warning,
                            message: "enter_your_info".tr(),
                            fonts: fonts,
                            colors: colors,
                            context: context,
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
