import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/infrastructure/services/image_service/image_service.dart';
// import 'package:medion/infrastructure/services/image_service/image_service.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/profile/widget/user_info_input.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

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
                                builder: (context, state) {
                                  return state.pickedImagePath != null
                                      ? CircleAvatar(
                                          radius: 70.r,
                                          backgroundImage: FileImage(
                                              File(state.pickedImagePath!)),
                                        )
                                      : CircleAvatar(
                                          radius: 70.r,
                                          backgroundColor:
                                              colors.neutral500.withOpacity(.3),
                                          child: icons.nonUser.svg(
                                            height: 110.h,
                                            color: colors.neutral500,
                                          ),
                                        );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              left: 10,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<ProfileBloc>()
                                      .add(ProfileEvent.pickImage(context));

                                  // ImageService.showPicker(context);
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
