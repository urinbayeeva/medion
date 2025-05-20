import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/others/image_preview.dart';
import 'package:medion/presentation/pages/others/our_activity/component/pattern_background.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class OurActivityPage extends StatefulWidget {
  const OurActivityPage({super.key});

  @override
  State<OurActivityPage> createState() => _OurActivityPageState();
}

class _OurActivityPageState extends State<OurActivityPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                bordered: true,
                title: "our_activities".tr(),
                isBack: true,
                centerTitle: true,
                trailing: 24.w.horizontalSpace,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 180.h,
                        child: PatternBackground(
                            patternTitle: "medion_activity".tr())),
                    const CDivider(padding: false),
                    CustomTabbarBlack(
                      leftTab: "about_the_company".tr(),
                      middleTab: "history".tr(),
                      nextMiddle: "mission".tr(),
                      rightTab: "license".tr(),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Tab 1: About the Company
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  24.h.verticalSpace,
                                  Text("about_the_company".tr(),
                                      style: fonts.regularMain),
                                  8.h.verticalSpace,
                                  CContainer(
                                    text:
                                        """Ежегодно участвует в международных научных конференциях, посвященных актуальным вопросам репродуктивной медицины, проводимых под эгидой ESHRE и РАРЧ в России и за рубежом. 

Участник программы стажировки в клинике "ИВИ-Валенсия", Испания.

Активный сторонник внедрения доказательной медицины (EBM) в медицинскую практику в России.""",
                                  ),
                                  24.h.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                          // Tab 2: History
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  24.h.verticalSpace,
                                  Text("history".tr(),
                                      style: fonts.regularMain),
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
                          ),
                          // Tab 3: Mission
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  24.h.verticalSpace,
                                  Text("mission".tr(),
                                      style: fonts.regularMain),
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
                          ),
                          // Tab 4: License
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  24.h.verticalSpace,
                                  Text("license".tr(),
                                      style: fonts.regularMain),
                                  8.h.verticalSpace,
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const ImagePreviewPage(
                                                imagePath:
                                                    "assets/images/litsenziyaaa.png",
                                              ),
                                            ),
                                          );
                                        },
                                        child: Image.asset(
                                          "assets/images/litsenziyaaa.png",
                                          height: 250,
                                        ),
                                      ),
                                      8.w.horizontalSpace,
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const ImagePreviewPage(
                                                imagePath:
                                                    "assets/images/litsenziya.png",
                                              ),
                                            ),
                                          );
                                        },
                                        child: Image.asset(
                                          "assets/images/litsenziya.png",
                                          height: 250,
                                        ),
                                      ),
                                    ],
                                  ),
                                  24.h.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
