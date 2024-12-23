import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class UserInfoInput extends StatelessWidget {
  const UserInfoInput({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.h.verticalSpace,
            const CustomTextField(hintText: "123456", title: "ID клиента"),
            const CustomTextField(hintText: "Kamoliddin", title: "Имя"),
            const CustomTextField(hintText: "Zokirov", title: "Фамилия"),
            const CustomTextField(hintText: "12.08.01", title: "Дата рождения"),
            const CustomTextField(
                hintText: "+998(93) 231-03-03", title: "Телефон"),
            const CustomTextField(
                hintText: "+998(93) 231-03-03",
                title: "Дополнительный номер телефона"),
            const CustomTextField(hintText: "Пасспорт", title: "Тип документа"),
            const CustomTextField(
                hintText: "AD763873422", title: "Серия и номер паспорта"),
            const CustomTextField(hintText: "12.08.01", title: "Дата выдачи"),
            const CustomTextField(
                hintText: "Мирзо Улугбек IIB", title: "Орган выдачион"),
          ],
        ),
      );
    });
  }
}
