import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/c_container_with_times.dart';
import 'package:medion/presentation/pages/home/doctors/widget/about_doctor_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "Врачи",
              isBack: true,
              centerTitle: true,
              trailing: icons.filter.svg(width: 24.w, height: 24.h),
              bottom: const AboutDoctorWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      24.h.verticalSpace,
                      Text("О врача", style: fonts.regularSemLink),
                      8.h.verticalSpace,
                      const CContainer(
                        text:
                            "Заместитель директора институ по Онкологии, Профессор Радиологии, Главный специалист по диагностике.",
                      ),
                      24.h.verticalSpace,
                      Text("Опыт работы", style: fonts.regularSemLink),
                      8.h.verticalSpace,
                      const CContainer(
                        text:
                            """Ежегодно участвует в международных научных конференциях, посвященных актуальным вопросам репродуктивной медицины, проводимых под эгидой ESHRE и РАРЧ в России и за рубежом.
                  
                              Участник программы стажировки в клинике "ИВИ-Валенсия", Испания.
                  
                              Активный сторонник внедрения доказательной медицины (EBM) в медицинскую практику в России.""",
                      ),
                      24.h.verticalSpace,
                      Text("График работы", style: fonts.regularSemLink),
                      8.h.verticalSpace,
                      const CContainerWithTimes(),
                      24.h.verticalSpace,
                      Text("Образование", style: fonts.regularSemLink),
                      8.h.verticalSpace,
                      const CContainer(
                        text:
                            """1998 г.: Санкт-Петербургский государственный медицинский Университет им. И.П. Павлова (СпбГМУ им. акад. И.П.Павлова), Лечебное дело,  магистратура
                  
                              2000 г.: Санкт-Петербургская медицинская академия последипломного образования (СПбМАПО), Акушерство и гинекология, ординатура
                  
                              2010 г.: Санкт-Петербургская государственная медицинская академия  им. И.И.Мечникова (СПбГМА им.И.И.Мечникова), Ультразвуковая диагностика, профессиональная переподготовка
                  
                              2015 г.: Санкт-Петербургский государственный университет (СПбГУ), Ультразвуковая диагностика, сертификат
                  
                              2015 г. :Северо-Западный государственный медицинский университет им. И.И. Мечникова (СЗГМУ им. И.И. Мечникова), Акушерство и гинекология, сертификат""",
                      ),
                      24.h.verticalSpace,
                      Text("Профессиональные награды",
                          style: fonts.regularSemLink),
                      8.h.verticalSpace,
                      const CContainer(
                        text:
                            """Член Европейского общества эмбриологии и репродукции человека (ESHRE).
                              
                              Член Российской ассоциации репродукции человека (РАРЧ).""",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
