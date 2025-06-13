import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class UnderDevPage extends StatelessWidget {
  final String appBarTitle;

  const UnderDevPage({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CAppBar(title: appBarTitle, centerTitle: true, isBack: true, trailing: 24.w.horizontalSpace),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              spacing: 24.h,
              children: [
                const Spacer(),
                Lottie.asset(
                  'assets/anim/404.json',
                  fit: BoxFit.fill,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Эта страница находится в разработке!",
                  style: fonts.smallLink.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
