import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/home/directions/widgets/service_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';

import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class DirectionInfoPage extends StatefulWidget {
  final String appBarTitle, informationTitle, professionServiceType, price;
  final List<Map<String, dynamic>> doctorsList;

  const DirectionInfoPage({
    super.key,
    required this.appBarTitle,
    required this.informationTitle,
    required this.doctorsList,
    required this.professionServiceType,
    required this.price,
  });

  @override
  State<DirectionInfoPage> createState() => _DirectionInfoPageState();
}

class _DirectionInfoPageState extends State<DirectionInfoPage> {
  int selectedIndex = 0;

  Widget buildDoctorItem(Map<String, dynamic> doctor, bool isInnerPage) {
    return DoctorsItem(
      // isInnerPageUsed: isInnerPage,
      onTap: (){},
      name: doctor['name'],
      profession: doctor['profession'],
      experience: doctor['experience'],
      imagePath: doctor['image'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CAppBar(
              title: widget.appBarTitle,
              centerTitle: true,
              onTap: () {
                Navigator.pop(context);
                context.read<BottomNavBarController>().changeNavBar(false);
              },
              isBack: true,
              trailing: Row(
                children: [
                  icons.valyutaChange.svg(width: 20.w, height: 20.h),
                  6.w.horizontalSpace,
                  icons.filter.svg(width: 20.w, height: 20.h)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(12.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomToggle<int>(
                      iconList: ['Об.я информация', 'Врачи', 'Услуги']
                          .asMap()
                          .entries
                          .map((entry) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    entry.value,
                                    style: fonts.xSmallLink.copyWith(
                                      color: selectedIndex == entry.key
                                          ? colors.shade0
                                          : colors.primary900,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedIndex = value),
                      current: selectedIndex,
                      values: const [0, 1, 2],
                      height: 38.h,
                      indicatorSize: Size(double.infinity, 40.h),
                      backgroundColor: colors.neutral200,
                      indicatorColor: colors.error500,
                      elevation: false,
                    ),
                    12.h.verticalSpace,
                    if (selectedIndex == 0) ...[
                      Text("Общая информация", style: fonts.regularSemLink),
                      8.h.verticalSpace,
                      CContainer(text: widget.informationTitle),
                      24.h.verticalSpace,
                      Text("Врачи", style: fonts.regularSemLink),
                      12.h.verticalSpace,
                      SizedBox(
                        height: 350,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.doctorsList.length,
                          itemBuilder: (_, index) =>
                              buildDoctorItem(widget.doctorsList[index], true),
                        ),
                      ),
                      24.h.verticalSpace,
                      Text("Услуги", style: fonts.regularSemLink),
                      8.h.verticalSpace,
                      ServiceWidget(
                        consultInfo: widget.professionServiceType,
                        consultPrice: widget.price,
                      ),
                      15.h.verticalSpace,
                      Container(
                        width: double.infinity,
                        color: colors.shade0,
                        child: Column(
                          children: [
                            CButton(
                              title: "Записаться на приём",
                              onTap: () {
                                final selectedDoctor =
                                    widget.doctorsList[selectedIndex];

                                Navigator.push(
                                  context,
                                  AppRoutes.getDoctorAppointmentPage(
                                    context: context,
                                    doctorsName: selectedDoctor['name'],
                                    doctorsJob: selectedDoctor['profession'],
                                    doctorsExperience:
                                        selectedDoctor['experience'],
                                    doctorsImage: selectedDoctor['image'],
                                  ),
                                );

                                context
                                    .read<BottomNavBarController>()
                                    .changeNavBar(true);
                              },
                              iconPath: icons.right,
                            ),
                            24.h.verticalSpace
                          ],
                        ),
                      ),
                    ],
                    if (selectedIndex == 1)
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: widget.doctorsList.length,
                        itemBuilder: (_, index) =>
                            buildDoctorItem(widget.doctorsList[index], false),
                      ),
                    if (selectedIndex == 2) ...[
                      ServiceWidget(
                        consultInfo: widget.professionServiceType,
                        consultPrice: widget.price,
                      ),
                      24.h.verticalSpace,
                      CButton(
                        title: "Записаться на приём",
                        onTap: () {
                          final selectedDoctor =
                              widget.doctorsList[selectedIndex];
                          Navigator.push(
                            context,
                            AppRoutes.getDoctorAppointmentPage(
                              context: context,
                              doctorsName: selectedDoctor['name'],
                              doctorsJob: selectedDoctor['profession'],
                              doctorsExperience: selectedDoctor['experience'],
                              doctorsImage: selectedDoctor['image'],
                            ),
                          );
                          context
                              .read<BottomNavBarController>()
                              .changeNavBar(true);
                        },
                        iconPath: icons.right,
                      ),
                      24.h.verticalSpace,
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
