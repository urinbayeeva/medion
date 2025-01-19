import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String aboutApp = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final result = await PackageInfo.fromPlatform();
    aboutApp = "Version ${result.version.toString()}";

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
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: colors.backgroundColor,
              body: Center(
                child: Column(
                  children: [
                    const Spacer(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: state.patientInfo != null
                              ? CircleAvatar(
                                  radius: 70.r,
                                  // backgroundImage:
                                  // FileImage(File(state.patientInfo?.profileImagePath ?? '')),
                                )
                              : CircleAvatar(
                                  radius: 70.r,
                                  backgroundColor:
                                      colors.neutral500.withOpacity(.3),
                                  child: icons.nonUser.svg(
                                    height: 110.h,
                                    color: colors.neutral500,
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: -20,
                          left: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: colors.error500,
                            child: icons.edit.svg(width: 16.w, height: 16.h),
                          ),
                        ),
                      ],
                    ),
                    24.h.verticalSpace,
                    state.patientInfo != null
                        ? Text(state.patientInfo?.firstName ?? "User Name")
                        : Text("null"),
                    24.h.verticalSpace,
                    const NavListWidget(),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          aboutApp,
                          style: fonts.regularLink.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: colors.primary900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
