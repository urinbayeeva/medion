import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/profile/widget/user_info_input.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (o, n) => o.patientInfo != n.patientInfo,
          builder: (context, state) {
            return Scaffold(
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
                title: Text("personal_information".tr(), style: fonts.regularMain),
              ),
              backgroundColor: colors.backgroundColor,
              body: SmartRefresher(
                onRefresh: () {
                  context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
                  _refreshController.refreshCompleted();
                },
                controller: _refreshController,
                enablePullDown: true,
                header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
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
                                  buildWhen: (previous, current) => previous.pickedImagePath != current.pickedImagePath,
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
            );
          },
        );
      },
    );
  }
}
