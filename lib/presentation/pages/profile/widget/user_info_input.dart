import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/c_text_field.dart';
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
    init();
  }

  void init() async {
    if (mounted) {
      setState(() {});
    }

    try {
      final dbService = await DBService.create;
      final accessToken = dbService.token.accessToken;

      print("TOKEN ------------------ $accessToken");

      if (accessToken != null && accessToken.isNotEmpty) {
        context
            .read<AuthBloc>()
            .add(AuthEvent.fetchPatientInfo(accessToken: accessToken));
      } else {
        print("Access token is missing");
      }
    } catch (e) {
      print("Error fetching token: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
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
                hintText: "${state.patientInfo!.patientId}",
                title: "ID клиента",
                readOnly: true,
              ),
              CustomTextField(
                  hintText: state.patientInfo!.firstName, title: "Имя"),
              CustomTextField(
                  hintText: state.patientInfo!.lastName, title: "Фамилия"),
              CustomTextField(
                  hintText: state.patientInfo!.dateOfBirth,
                  title: "Дата рождения"),
              CustomTextField(
                  hintText: state.patientInfo!.phone, title: "Телефон"),
              CustomTextField(
                  hintText: state.patientInfo!.phoneNumber,
                  title: "Дополнительный номер телефона"),
              const CustomTextField(
                  hintText: "Пасспорт", title: "Тип документа"),
              CustomTextField(
                  hintText: state.patientInfo!.passport,
                  title: "Серия и номер паспорта"),
              // CustomTextField(hintText: "12.08.01", title: "Дата выдачи"),
              // CustomTextField(
              //     hintText: "Мирзо Улугбек IIB", title: "Орган выдачион"),
            ],
          ),
        );
      });
    });
  }
}
