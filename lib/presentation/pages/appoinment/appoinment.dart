import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
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
                count: 1,
                allCount: 5,
                hasProgressBar: true,
                isBack: true,
                title: "Выберите тип услуги",
                centerTitle: true,
                trailing: 13.w.horizontalSpace),
          ],
        ),
      );
    });
  }
}
