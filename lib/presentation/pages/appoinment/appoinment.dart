import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/appoinment/component/upcoming_reception_data.dart';
import 'package:medion/presentation/pages/appoinment/widgets/upcoming_reception_item.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AppoinmentPage extends StatelessWidget {
  const AppoinmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              bordered: true,
              padding: EdgeInsets.zero,
              isBack: true,
              title: "Уведомления",
              centerTitle: true,
              trailing: icons.notification
                  .svg(width: 24.w, height: 24.h, color: colors.primary900),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
                itemCount: upcomingReceptionData.length,
                itemBuilder: (context, index) {
                  final item = upcomingReceptionData[index];
                  return UpcomingReceptionItem(
                    image: item['doctor_image'],
                    doctorName: item['doctor_name'],
                    address: item['adrees'],
                    time: item['time'],
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
