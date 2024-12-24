import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/domain/sources/directions_data.dart';
import 'package:medion/domain/sources/doctors_data.dart';
import 'package:medion/domain/sources/news_data.dart';
import 'package:medion/presentation/component/un_focus_widget%20copy.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/pages/home/news/widgets/news_item.dart';
import 'package:medion/presentation/pages/home/widgets/adress_item.dart';
import 'package:medion/domain/sources/med_service.dart';
import 'package:medion/presentation/pages/home/widgets/problem_slidebale_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChildren = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Style.dark,
      child: ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return OnUnFocusTap(
          child: Scaffold(
            backgroundColor: colors.backgroundColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CAppBar(
                  padding: EdgeInsets.zero,
                  isBack: false,
                  title: "main".tr(),
                  centerTitle: true,
                  trailing: AnimationButtonEffect(
                    onTap: () {
                      context
                          .read<BottomNavBarController>()
                          .changeNavBar(false);
                      Navigator.push(context, AppRoutes.getNotificationPage());
                    },
                    child: icons.notification.svg(
                        width: 24.w, height: 24.h, color: colors.primary900),
                  ),
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
                          Text("what_distrubes_you".tr(),
                              style: fonts.regularSemLink
                                  .copyWith(fontSize: 17.sp)),
                          12.h.verticalSpace,
                          _buildOptionsRow(colors, fonts),
                          12.h.verticalSpace,
                          const ProblemSlidebaleCard(),
                          24.h.verticalSpace,
                          Text("med_services".tr(),
                              style: fonts.regularSemLink
                                  .copyWith(fontSize: 17.sp)),
                          12.h.verticalSpace,
                          const MedService(),
                          24.h.verticalSpace,
                          Text("directions_of_medion_clinic".tr(),
                              style: fonts.regularSemLink
                                  .copyWith(fontSize: 17.sp)),
                          12.h.verticalSpace,
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: directionsData.length,
                            itemBuilder: (context, index) {
                              final item = directionsData[index];
                              return MedicalDirectionItem(
                                onTap: () async {
                                  context
                                      .read<BottomNavBarController>()
                                      .changeNavBar(true);
                                  _onItemTapped(index);
                                  Navigator.push(
                                    context,
                                    AppRoutes.getDirectionInfoPage(
                                      appBarTitle: item["title"],
                                      informationTitle:
                                          item["information_title"],
                                      doctorsList: item["doctorsList"],
                                      professionServiceType:
                                          item["professionServiceType"],
                                      price: item["price"],
                                    ),
                                  ).then((_) async {
                                    // ignore: use_build_context_synchronously
                                    context
                                        .read<BottomNavBarController>()
                                        .changeNavBar(false);
                                  });
                                },
                                title: item['title'],
                                subtitle: item['subtitle'],
                                iconPath: item['icon'],
                              );
                            },
                          ),
                          8.h.verticalSpace,
                          CButton(
                            title: "all_directions".tr(),
                            onTap: () {
                              Navigator.push(
                                  context, AppRoutes.getDiresctionPage());
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(false);
                            },
                          ),
                          24.h.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("doctors".tr(),
                                  style: fonts.regularSemLink
                                      .copyWith(fontSize: 17.sp)),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  context
                                      .read<BottomNavBarController>()
                                      .changeNavBar(true);
                                  Navigator.push(context,
                                          AppRoutes.getAllDoctorsPage())
                                      .then((value) {
                                    context
                                        .read<BottomNavBarController>()
                                        .changeNavBar(false);
                                  });
                                },
                                icon: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "all".tr(),
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
                                  onTap: () {},
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
                              Text("news".tr(),
                                  style: fonts.regularSemLink
                                      .copyWith(fontSize: 17.sp)),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  context
                                      .read<BottomNavBarController>()
                                      .changeNavBar(false);
                                  Navigator.push(
                                      context, AppRoutes.getNewsPage());
                                },
                                icon: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "all".tr(),
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
                              Text("address_of_clinic".tr(),
                                  style: fonts.regularSemLink
                                      .copyWith(fontSize: 17.sp)),
                              AnimationButtonEffect(
                                onTap: () {
                                  context
                                      .read<BottomNavBarController>()
                                      .changeNavBar(true);
                                  Navigator.push(
                                      context, AppRoutes.getMapPage());
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                        color: colors.shade0,
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Row(
                                      children: [
                                        icons.location
                                            .svg(width: 20.w, height: 20.h),
                                        3.66.w.horizontalSpace,
                                        Text("on_map".tr(),
                                            style: fonts.xSmallLink)
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          12.h.verticalSpace,
                          AdressItem(
                              address: "street_abdulla".tr(),
                              url: '',
                              onTap: () {}),
                          AdressItem(
                              address: "street_zulfiya".tr(),
                              url: '',
                              onTap: () {}),
                          AdressItem(
                              address: "street_istiroxat".tr(),
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
          ),
        );
      }),
    );
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
        Text("theme".tr(), style: fonts.smallMain),
        SizedBox(width: 12.w),
        _buildOptionButton(
            "adult".tr(),
            isChildren ? Color(0xFFEBEBEB) : colors.error500,
            fonts.xSmallText.copyWith(
                color: isChildren ? colors.primary900 : colors.shade0)),
        SizedBox(width: 4.w),
        _buildOptionButton(
            "child".tr(),
            isChildren ? colors.error500 : const Color(0xFFEBEBEB),
            fonts.xSmallText.copyWith(
                color: isChildren ? colors.shade0 : colors.primary900)),
      ],
    );
  }

  Widget _buildOptionButton(String text, Color color, TextStyle textStyle) {
    return AnimationButtonEffect(
      onTap: () {
        setState(() {
          isChildren = !isChildren;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100.r)),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
