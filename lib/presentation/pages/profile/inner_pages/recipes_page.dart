import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/profile/widget/recipces_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "recipe".tr(),
              isBack: true,
              centerTitle: true,
              trailing: icons.calendar.svg(
                width: 20.w,
                height: 20.h,
              ),
            ),
            12.h.verticalSpace,
            const RecipcesWidget(
              title:
                  "21.01.2024 - Прием (осмотр, консультация) кардиолога - Жалилов Ш.З.",
              innerTitle: 'Paracetamol Strength, 20 mg, Spray',
              methodOfAdministration: 'перорально',
              regardingToFood: 'после еды',
              recipeDate: '21.01.2024 10 дней',
              recipeTimes: '11:00; 15:00; 17:00',
              comments: 'раздражения слизистой ',
              recipeCount: '3',
            ),
          ],
        ),
      );
    });
  }
}
