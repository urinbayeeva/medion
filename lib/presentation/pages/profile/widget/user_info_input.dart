import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class UserInfoInput extends StatefulWidget {
  const UserInfoInput({super.key});

  @override
  State<UserInfoInput> createState() => _UserInfoInputState();
}

class _UserInfoInputState extends State<UserInfoInput> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isFetchingPatientInfo) {
          return const Center(
              child: CircularProgressIndicator(color: Style.error500));
        }

        if (state.errorFetchingPatientInfo) {
          return Center(child: Text('something_went_wrong'.tr()));
        }

        return ThemeWrapper(
            builder: (context, colors, fonts, icons, controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: colors.shade0,
            ),
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                4.h.verticalSpace,
                CustomTextField(
                  hintText: state.patientInfo?.patientId.toString() ?? '',
                  title: "ID клиента",
                  readOnly: true,
                ),
                CustomTextField(
                  hintText: state.patientInfo?.firstName ?? '',
                  title: "name".tr(),
                  readOnly: true,
                ),
                CustomTextField(
                  hintText: state.patientInfo?.lastName ?? '',
                  title: "second_name".tr(),
                  readOnly: true,
                ),
                // CustomTextField(
                //   hintText: state.patientInfo?.dateOfBirth ?? '',
                //   title: "Дата рождения",
                //   readOnly: true,
                // ),
                CustomTextField(
                  hintText: state.patientInfo?.phoneNumber ?? '',
                  title: "phone".tr(),
                  readOnly: true,
                ),
                // CustomTextField(
                //   hintText: state.patientInfo?.phone ?? '',
                //   title: "Дополнительный номер телефона",
                //   readOnly: true,
                // ),
                // CustomTextField(
                //   hintText: state.patientInfo?.passport ?? '',
                //   title: "Тип документа",
                //   readOnly: true,
                // ),
                CustomTextField(
                  hintText: state.patientInfo?.passport ?? '',
                  title: "number_series".tr(),
                  readOnly: true,
                ),
                // CustomTextField(
                //   hintText: state.patientInfo?.passport ?? '',
                //   title: "Дата выдачи",
                //   readOnly: true,
                // ),
                // CustomTextField(
                //   hintText: state.patientInfo?.passport ?? '',
                //   title: "Орган выдачион",
                //   readOnly: true,
                // ),
              ],
            ),
          );
        });
      },
    );
  }
}
