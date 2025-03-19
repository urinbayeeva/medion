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
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocConsumer<ProfileBloc, ProfileState>(
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
                              child: BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, profileState) {
                                  return BlocBuilder<AuthBloc, AuthState>(
                                    builder: (context, authState) {
                                      String? backendImageUrl =
                                          authState.patientInfo?.image;
                                      String? pickedImagePath =
                                          profileState.pickedImagePath;

                                      return CircleAvatar(
                                        radius: 70.r,
                                        backgroundColor: colors.neutral200,
                                        backgroundImage: backendImageUrl !=
                                                    null &&
                                                backendImageUrl.isNotEmpty
                                            ? NetworkImage(backendImageUrl)
                                            : pickedImagePath != null
                                                ? FileImage(
                                                        File(pickedImagePath))
                                                    as ImageProvider
                                                : null,
                                        child: (backendImageUrl == null ||
                                                    backendImageUrl.isEmpty) &&
                                                pickedImagePath == null
                                            ? icons.nonUser.svg(
                                                height: 110.h,
                                                color: colors.neutral500,
                                              )
                                            : null,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              left: 200,
                              right: null,
                              child: AnimationButtonEffect(
                                onTap: () async {
                                  try {
                                    if (!mounted) return;

                                    Future.microtask(() {
                                      if (mounted) {
                                        context.read<ProfileBloc>().add(
                                            ProfileEvent.pickImage(context));
                                      }
                                    });
                                  } catch (e) {
                                    print("Error picking image: $e");
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: colors.error500,
                                  child:
                                      icons.edit.svg(width: 16.w, height: 16.h),
                                ),
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
        listener: (context, state) {},
      );
    });
  }
}
