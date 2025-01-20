import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/home/doctors/widget/about_doctor_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AboutDoctor extends StatelessWidget {
  final String? name;
  final String? profession;
  final String? status;
  const AboutDoctor({super.key, this.name, this.profession, this.status});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(builder: (context, state) {
      if (state.error) {
        return Center(
            child: Text(
          'something_went_wrong'.tr(),
        ));
      }

      return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: colors.backgroundColor,
            body: Column(
              children: [
                CAppBar(
                  title: "doctors".tr(),
                  isBack: true,
                  centerTitle: true,
                  trailing: icons.filter.svg(width: 24.w, height: 24.h),
                  bottom: Column(
                    children: [
                      AboutDoctorWidget(
                        name: name,
                        profession: profession,
                        specialty: status,
                        image: "",
                      ),
                      16.h.verticalSpace,
                      CustomTabbarBlack(
                        leftTab: "about_the_doctor".tr(),
                        middleTab: "working_experience".tr(),
                        nextMiddle: "education".tr(),
                        rightTab: "working_hours".tr(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildContentSection("about_the_doctor".tr(),
                          "Заместитель директора институ по Онкологии, Профессор Радиологии, Главный специалист по диагностике."),
                      _buildContentSection("working_experience".tr(),
                          "Ежегодно участвует в международных научных конференциях..."),
                      _buildContentSection("education".tr(),
                          "1998 г.: Санкт-Петербургский государственный медицинский Университет..."),
                      _buildContentSection(
                          "working_hours".tr(), "Пн-Пт: 09:00-18:00"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}

Widget _buildContentSection(
  title,
  content,
) {
  return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.h.verticalSpace,
          Text(title, style: fonts.regularSemLink),
          8.h.verticalSpace,
          CContainer(text: content),
          24.h.verticalSpace,
        ],
      ),
    );
  });
}
