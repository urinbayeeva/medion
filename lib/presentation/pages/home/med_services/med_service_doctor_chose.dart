import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedServiceDoctorChose extends StatefulWidget {
  const MedServiceDoctorChose({super.key});

  @override
  State<MedServiceDoctorChose> createState() => _MedServiceDoctorChoseState();
}

class _MedServiceDoctorChoseState extends State<MedServiceDoctorChose> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "selecting_the_time_the_date".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            )
          ],
        ),
      );
    });
  }
}
