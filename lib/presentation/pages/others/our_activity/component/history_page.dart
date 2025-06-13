import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/styles/theme.dart';

class History extends StatelessWidget {
  const History({super.key, required this.fonts});

  final FontSet fonts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.h.verticalSpace,
            Text("history".tr(), style: fonts.regularMain),
            8.h.verticalSpace,
            CContainer(
              text:
                  """В клинике "Скандинавия" мы стремимся быть вашим помощником на пути к долгой, здоровой и качественной жизни. Используя последние технологии в области медицины, учитывая все нюансы жизни каждого пациента, мы предлагаем решения с доказанной эффективностью, которые позволяют вам сохранить и улучшить здоровье.

Мы уважаем вас, а значит ценим каждую минуту вашего времени. Поэтому в каждом отделении «Скандинавии» созданы все условия, которые позволят вам получить качественное медицинское обслуживание тогда, когда это удобно именно вам.

Мы уважаем вас, а значит ценим каждую минуту вашего времени. Поэтому в каждом отделении «Скандинавии» созданы все условия, которые позволят вам получить качественное медицинское обслуживание тогда, когда это удобно именно вам.""",
            ),
            24.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
