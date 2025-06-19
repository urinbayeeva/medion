// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String aboutApp = "Version loading...";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());

    final result = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        aboutApp = "Version ${result.version}";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.patientInfo == null && isLoading) return const Center(child: CircularProgressIndicator());

              return Column(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        AppRoutes.getUserDetailsPage(),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, profileState) {
                              String? backendImageUrl = state.patientInfo?.image;
                              String? pickedImagePath = profileState.pickedImagePath;

                              return CircleAvatar(
                                radius: 70.r,
                                backgroundColor: colors.neutral200,
                                backgroundImage: backendImageUrl != null && backendImageUrl.isNotEmpty
                                    ? NetworkImage(backendImageUrl)
                                    : pickedImagePath != null
                                        ? FileImage(File(pickedImagePath)) as ImageProvider
                                        : null,
                                child: (backendImageUrl == null || backendImageUrl.isEmpty) && pickedImagePath == null
                                    ? icons.nonUser.svg(height: 110.h, color: colors.neutral500)
                                    : null,
                              );
                            },
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
                  ),
                  24.h.verticalSpace,
                  Text(
                    state.patientInfo?.firstName ?? '',
                    style: fonts.regularLink.copyWith(
                      fontSize: 16.sp,
                      color: colors.neutral900,
                    ),
                  ),
                  24.h.verticalSpace,
                  NavListWidget(context: context),
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
              );
            },
          ),
        );
      },
    );
  }
}
