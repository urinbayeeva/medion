import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CInfoView extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? desc;

  const CInfoView({super.key, this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.shade0,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    imagePath != null && imagePath!.isNotEmpty
                        ? CachedImageComponent(
                            height: MediaQuery.of(context).size.height * 0.19,
                            width: double.infinity,
                            imageUrl: imagePath!,
                          )
                        : Image.asset(
                            'assets/placeholder.png', // Default image path
                            width: double.infinity,
                            height: 264.h,
                            fit: BoxFit.cover,
                          ),
                    Positioned(
                      top: 60.h,
                      left: 16.w,
                      right: 16.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: colors.shade0,
                            foregroundColor: colors.primary900,
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<BottomNavBarController>()
                                    .changeNavBar(true);
                                Navigator.pop(context);
                              },
                              child: icons.left.svg(width: 24.w, height: 24.h),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: colors.shade0,
                            foregroundColor: colors.primary900,
                            child: icons.share.svg(width: 24.w, height: 24.h),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                12.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(title ?? '', style: fonts.mediumMain),
                ),
                8.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(desc ?? '', style: fonts.smallLink),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
