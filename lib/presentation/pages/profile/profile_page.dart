import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: BlocConsumer<AuthBloc, AuthState>(
            listenWhen: (old, nyu) {
              final register = old.verifyStatus != nyu.verifyStatus;
              final sendCode = old.successSendCode != nyu.successSendCode;

              return register || sendCode;
            },
            listener: (context, lState) {
              context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
            },
            buildWhen: (o, n) {
              final info = o.patientInfo != n.patientInfo;
              final image = o.patientInfo?.image != n.patientInfo?.image;
              final status = o.userInfoStatus != n.userInfoStatus;
              return info || status || image;
            },
            builder: (context, state) {
              String? backendImageUrl = state.patientInfo?.image;
              return SmartRefresher(
                onRefresh: () {
                  context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
                  _refreshController.refreshCompleted();
                },
                controller: _refreshController,
                enablePullDown: true,
                header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                child: ListView(
                  // physics: ,
                  // addAutomaticKeepAlives: ,
                  // scrollDirection: ,
                  // shrinkWrap: ,
                  // clipBehavior: ,
                  // controller: ,
                  // addRepaintBoundaries: ,
                  // addSemanticIndexes: ,
                  // dragStartBehavior: ,
                  // hitTestBehavior: ,
                  // itemExtentBuilder: ,
                  // keyboardDismissBehavior: ,
                  // restorationId: ,
                  // prototypeItem: ,
                  // primary: ,
                  // itemExtent: ,
                  // cacheExtent: ,
                  children: [
                    if (state.userInfoStatus.isInitial || state.userInfoStatus.isInProgress) ...{
                      SafeArea(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 10.h),
                          padding: EdgeInsets.only(bottom: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colors.shade0,
                          ),
                          width: double.infinity,
                          height: 175.h,
                          child: Shimmer.fromColors(
                            baseColor: colors.neutral200,
                            highlightColor: colors.shade0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50.r,
                                  backgroundColor: Colors.black,
                                ),
                                12.h.verticalSpace,
                                Text('profile'.tr(), style: fonts.regularText),
                              ],
                            ),
                          ),
                        ),
                      )
                    } else if (state.patientInfo == null || state.userInfoStatus.isFailure) ...{
                      SafeArea(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
                          padding: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: colors.shade0),
                          width: double.infinity,
                          height: 175.h,
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
                      SizedBox(
                        height: 0.28.sh,
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, AppRoutes.getUserDetailsPage()),
                          child: SafeArea(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  BlocBuilder<ProfileBloc, ProfileState>(
                                    builder: (context, profileState) {
                                      String? pickedImagePath = profileState.pickedImagePath;
                                      return CircleAvatar(
                                        radius: 60.r,
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
                                  Positioned(
                                    bottom: -20.h,
                                    left: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 20.r,
                                      backgroundColor: colors.error500,
                                      child: icons.edit.svg(width: 16.w, height: 16.h),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -50.h,
                                    left: 0,
                                    right: 0,
                                    child: Text(
                                      state.patientInfo?.firstName ?? '',
                                      textAlign: TextAlign.center,
                                      style: fonts.regularLink.copyWith(fontSize: 16.sp, color: colors.neutral900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    },
                    const NavListWidget(),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
