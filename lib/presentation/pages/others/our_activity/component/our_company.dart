import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class OurCompany extends StatelessWidget {
  const OurCompany({super.key, required this.fonts, required this.title});

  final FontSet fonts;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.h.verticalSpace,
            Text("about_the_company".tr(), style: fonts.regularMain),
            8.h.verticalSpace,
            WHtml(data: title),

//             CContainer(
//               text:
//                   """Ежегодно участвует в международных научных конференциях, посвященных актуальным вопросам репродуктивной медицины, проводимых под эгидой ESHRE и РАРЧ в России и за рубежом.
//
// Участник программы стажировки в клинике "ИВИ-Валенсия", Испания.
//
// Активный сторонник внедрения доказательной медицины (EBM) в медицинскую практику в России.""",
//             ),
            24.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
