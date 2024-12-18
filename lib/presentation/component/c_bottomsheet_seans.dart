import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CBottomsheetSeans extends StatelessWidget {
  final int chose;
  const CBottomsheetSeans({super.key, required this.chose});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colors.neutral200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text("2/1", style: fonts.xxSmallTagSecond),
                ),
                6.w.horizontalSpace,
                Text(
                  "Выбраны $chose сеанс",
                  style: fonts.xSmallLink
                      .copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            16.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundColor: colors.neutral200,
                  child: icons.nargiza.asset(),
                ),
                11.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.w,
                  children: [
                    Text("Б. Наргиза Акбаровна", style: fonts.smallMain),
                    Container(
                      padding: EdgeInsets.all(8.2.w),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 115, 246, 0.07),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Text(
                        "09:30 - 10:00",
                        style: fonts.xSmallMain
                            .copyWith(color: const Color(0xFF0E73F6)),
                      ),
                    ),
                    Text(
                      "МРТ головного мозга, гипофиза, \nангиография сосудов головного мозга",
                      style:
                          fonts.xSmallMain.copyWith(color: colors.neutral500),
                    )
                  ],
                )
              ],
            ),
            const CDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundColor: colors.neutral200,
                  child: icons.nonUser.svg(),
                ),
                11.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.w,
                  children: [
                    Text("Выберите сеанс врача для этой услуги",
                        style: fonts.smallMain),
                    Container(
                      padding: EdgeInsets.all(8.2.w),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 5, 6, 0.07),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Text(
                        "Cеанс не выбран",
                        style:
                            fonts.xSmallMain.copyWith(color: colors.error500),
                      ),
                    ),
                    Text(
                      "МРТ головного мозга, гипофиза, \nангиография сосудов головного мозга",
                      style:
                          fonts.xSmallMain.copyWith(color: colors.neutral500),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
