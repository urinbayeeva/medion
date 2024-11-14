import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/appoinment/widgets/time_table_doctor.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorAppoinmentSelectPage extends StatefulWidget {
  final String doctorsName;
  final String doctorsJob;
  final String doctorsExperience;
  final String doctorsImage;
  const DoctorAppoinmentSelectPage(
      {super.key,
      required this.doctorsName,
      required this.doctorsJob,
      required this.doctorsExperience,
      required this.doctorsImage});

  @override
  State<DoctorAppoinmentSelectPage> createState() =>
      _DoctorAppoinmentSelectPageState();
}

class _DoctorAppoinmentSelectPageState
    extends State<DoctorAppoinmentSelectPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "Выберите время врача",
              centerTitle: true,
              isBack: true,
              trailing: icons.filter.svg(width: 20.w, height: 20.h),
              hasCalendar: true,
              bordered: true,
            ),
            16.h.verticalSpace,
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    TimeTableDoctor(
                      doctorName: widget.doctorsName,
                      doctorsJob: widget.doctorsJob,
                      doctorsExperience: widget.doctorsExperience,
                      doctorsImage: widget.doctorsImage,
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: colors.shade0,
              ),
              padding: EdgeInsets.only(
                  top: 16.h, left: 16.w, right: 16.w, bottom: 8.h),
              child: CButton(
                  title: "Продолжить",
                  onTap: () {
                    Navigator.push(
                        context, AppRoutes.getPaymentForAppoinment());
                  },
                  iconPath: icons.right),
            ),
            24.h.verticalSpace,
          ],
        ),
      );
    });
  }
}
