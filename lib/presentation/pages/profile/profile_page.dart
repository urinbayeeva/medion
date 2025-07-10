import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const String aboutApp = "Version loading...";
  final ValueNotifier<String> _version = ValueNotifier(aboutApp);

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
    _version.value = "${"version".tr()} ${context.read<DBService>().getVersion}";
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 75),
            child: ValueListenableBuilder(
              valueListenable: _version,
              builder: (context, val, child) {
                return Text(
                  _version.value,
                  style: fonts.regularLink.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: colors.primary900,
                  ),
                );
              },
            ),
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (o, n) {
              final info = o.patientInfo != n.patientInfo;
              return info;
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (state.patientInfo == null) ...{
                    SafeArea(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
                        padding: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: colors.shade0),
                        width: double.infinity,
                        height: 175,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Lottie.asset("assets/anim/sad.json")),
                            Text('something_went_wrong'.tr(), style: fonts.regularText),
                          ],
                        ),
                      ),
                    )
                  } else ...{
                    GestureDetector(
                      onTap: () => Navigator.push(context, AppRoutes.getUserDetailsPage()),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SafeArea(
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
                                      child: (backendImageUrl == null || backendImageUrl.isEmpty) &&
                                              pickedImagePath == null
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
                  },
                  24.h.verticalSpace,
                  const NavListWidget(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
