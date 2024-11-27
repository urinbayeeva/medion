import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/domain/sources/directions_data.dart';
import 'package:medion/domain/sources/doctors_data.dart';
import 'package:medion/domain/sources/news_data.dart';
import 'package:medion/presentation/pages/home/widgets/adress_item.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/domain/sources/med_service.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/pages/home/news/widgets/news_item.dart';
import 'package:medion/presentation/pages/home/widgets/problem_slidebale_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CAppBar(
              padding: EdgeInsets.zero,
              isBack: false,
              title: "Главная",
              centerTitle: true,
              trailing: icons.notification
                  .svg(width: 24.w, height: 24.h, color: colors.primary900),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.h.verticalSpace,
                      _buildImageSection(colors, fonts),
                      16.h.verticalSpace,
                      Text("Что вас беспокоит",
                          style:
                              fonts.regularSemLink.copyWith(fontSize: 17.sp)),
                      SizedBox(height: 12.h),
                      _buildOptionsRow(colors, fonts),
                      SizedBox(height: 12.h),
                      const ProblemSlidebaleCard(),
                      24.h.verticalSpace,
                      Text("Медицинские сервисы",
                          style:
                              fonts.regularSemLink.copyWith(fontSize: 17.sp)),
                      12.h.verticalSpace,
                      const MedService(),
                      24.h.verticalSpace,
                      Text("Направления сеть клиник Medion",
                          style:
                              fonts.regularSemLink.copyWith(fontSize: 17.sp)),
                      12.h.verticalSpace,
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: directionsData.length,
                        itemBuilder: (context, index) {
                          final item = directionsData[index];
                          return MedicalDirectionItem(
                            title: item['title'],
                            subtitle: item['subtitle'],
                            iconPath: item['icon'],
                            onTap: () {
                              Navigator.push(
                                  context, AppRoutes.getDiresctionPage());
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(false);
                            },
                          );
                        },
                      ),
                      8.h.verticalSpace,
                      CButton(title: "Все направления", onTap: () {}),
                      24.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Врачи",
                              style: fonts.regularSemLink
                                  .copyWith(fontSize: 17.sp)),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(true);
                              Navigator.push(
                                  context, AppRoutes.getAllDoctorsPage());
                            },
                            icon: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Все",
                                  style: fonts.smallTagFirst.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: colors.primary900),
                                ),
                                3.w.horizontalSpace,
                                icons.right.svg(width: 16.w, height: 16.h),
                                12.h.verticalSpace,
                              ],
                            ),
                          ),
                        ],
                      ),
                      14.h.verticalSpace,
                      SizedBox(
                        height: 310.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: doctorsData.length,
                          itemBuilder: (context, index) {
                            final item = doctorsData[index];
                            return DoctorsItem(
                              imagePath: item['image'],
                              name: item['name'],
                              profession: item['profession'],
                              candidateScience: false,
                              status: item['status'],
                            );
                          },
                        ),
                      ),
                      24.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Новости",
                              style: fonts.regularSemLink
                                  .copyWith(fontSize: 17.sp)),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Все",
                                  style: fonts.smallTagFirst.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: colors.primary900),
                                ),
                                3.w.horizontalSpace,
                                icons.right.svg(width: 16.w, height: 16.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 330.h,
                        child: ListView.builder(
                          // shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: newsData.length,
                          itemBuilder: (context, index) {
                            final item = newsData[index];
                            return NewsItem(
                              imagePath: item['image'],
                              title: item['title'],
                              subtitle: item['subtitle'],
                            );
                          },
                        ),
                      ),
                      24.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Адреса клиник",
                              style: fonts.regularSemLink
                                  .copyWith(fontSize: 17.sp)),
                          AnimationButtonEffect(
                            onTap: () {
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(true);
                              Navigator.push(context, AppRoutes.getMapPage());
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                    color: colors.shade0,
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Row(
                                  children: [
                                    icons.location
                                        .svg(width: 20.w, height: 20.h),
                                    3.66.w.horizontalSpace,
                                    Text("На карте", style: fonts.xSmallLink)
                                  ],
                                )),
                          ),
                        ],
                      ),
                      12.h.verticalSpace,
                      AdressItem(
                          address:
                              "Ул. Абдуллы Кадыри, 39/1 - \nMedion Innovation",
                          url: '',
                          onTap: () {}),
                      AdressItem(
                          address:
                              "Ул. Абдуллы Кадыри, 39/1 - \nMedion Innovation",
                          url: '',
                          onTap: () {}),
                      AdressItem(
                          address:
                              "Ул. Абдуллы Кадыри, 39/1 - \nMedion Innovation",
                          url: '',
                          onTap: () {}),
                      80.h.verticalSpace,
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

  Widget _buildImageSection(colors, fonts) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Image.asset("assets/images/doctor.jpg",
              width: double.infinity, fit: BoxFit.cover),
          Positioned(
              right: 160, child: Image.asset("assets/images/linear.png")),
          Positioned(
            top: 16.h,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Отдел радиологии\nработает круглосуточно",
                  style: fonts.regularMain
                      .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                8.h.verticalSpace,
                Text(
                  "МРТ, МСКТ клиники Медион\nработает круглосуточно\nдля удобства клиентов",
                  style: fonts.xSmallText
                      .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
                ),
                30.h.verticalSpace,
                DotsIndicator(
                  dotsCount: 3,
                  position: 0,
                  decorator: DotsDecorator(
                    activeColor: colors.error500,
                    color: colors.neutral200,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                12.h.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsRow(colors, fonts) {
    return Row(
      children: [
        Text("Темы", style: fonts.smallMain),
        SizedBox(width: 12.w),
        _buildOptionButton("Взрослые", colors.error500,
            fonts.xSmallText.copyWith(color: colors.shade0)),
        SizedBox(width: 4.w),
        _buildOptionButton("Взрослые", const Color(0xFFEBEBEB),
            fonts.xSmallText.copyWith(color: colors.primary900)),
      ],
    );
  }

  Widget _buildOptionButton(String text, Color color, TextStyle textStyle) {
    return AnimationButtonEffect(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100.r)),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
