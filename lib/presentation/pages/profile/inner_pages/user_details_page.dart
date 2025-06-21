import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/profile/widget/user_info_input.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/file_handler.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: colors.backgroundColor,
              body: Column(
                children: [
                  CAppBar(
                    title: "personal_information".tr(),
                    isBack: true,
                    centerTitle: true,
                    trailing: 24.w.horizontalSpace,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          24.h.verticalSpace,
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: BlocBuilder<AuthBloc, AuthState>(
                                  buildWhen: (previous, current) =>
                                      previous.patientInfo?.image != current.patientInfo?.image ||
                                      previous.isFetchingPatientInfo != current.isFetchingPatientInfo,
                                  builder: (context, authState) {
                                    return BlocBuilder<ProfileBloc, ProfileState>(
                                      buildWhen: (previous, current) =>
                                          previous.pickedImagePath != current.pickedImagePath,
                                      builder: (context, profileState) {
                                        String? backendImageUrl = authState.patientInfo?.image;
                                        String? pickedImagePath = profileState.pickedImagePath;

                                        // Use a cached ImageProvider to avoid reloading
                                        ImageProvider? imageProvider;
                                        if (pickedImagePath != null) {
                                          imageProvider = FileImage(File(pickedImagePath));
                                        } else if (backendImageUrl != null && backendImageUrl.isNotEmpty) {
                                          imageProvider = NetworkImage(backendImageUrl);
                                        }

                                        return AnimationButtonEffect(
                                          onTap: () async {
                                            try {
                                              if (!mounted) return;
                                              context.read<ProfileBloc>().add(ProfileEvent.pickImage(context));
                                            } catch (e) {
                                              print("Error picking image: $e");
                                            }
                                          },
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              CircleAvatar(
                                                radius: 70.r,
                                                backgroundColor: colors.neutral200,
                                                backgroundImage: imageProvider,
                                                child: imageProvider == null
                                                    ? icons.nonUser.svg(
                                                        height: 110.h,
                                                        color: colors.neutral500,
                                                      )
                                                    : null,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(4.w),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: colors.neutral500,
                                                ),
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  size: 24.r,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          30.h.verticalSpace,
                          const UserInfoInput(),
                          80.h.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
