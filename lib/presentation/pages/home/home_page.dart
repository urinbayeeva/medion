import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/domain/sources/directions_data.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/domain/sources/doctors_data.dart';
import 'package:medion/presentation/component/custom_pagination.dart';
import 'package:medion/presentation/component/un_focus_widget%20copy.dart';
import 'package:medion/presentation/pages/home/directions/component/inner_pages/image_item.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/pages/home/widgets/adress_item.dart';
import 'package:medion/domain/sources/med_service.dart';
import 'package:medion/presentation/pages/home/widgets/problem_slidebale_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController = RefreshController();
  bool isChildren = false;

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeEvent.fetchNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Style.dark,
      child: ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          // if (state.news.isEmpty) {
          //   return Center(
          //     child: Text(
          //       semanticsLabel: "no_result_found".tr(),
          //       "no_result_found".tr(),
          //       style: Style.headlineMain(),
          //     ),
          //   );
          // }
          return OnUnFocusTap(
            child: CustomPagination(
              controller: _refreshController,
              onRetry: () {},
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
                          Navigator.push(
                              context, AppRoutes.getNotificationPage());
                        },
                        child: icons.notification.svg(
                            width: 24.w,
                            height: 24.h,
                            color: colors.primary900),
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
                              SizedBox(
                                height: 280.h,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: directionsData.length,
                                  itemBuilder: (context, index) {
                                    final item = directionsData[index];
                                    return MedicalDirectionItem(
                                      onTap: () async {
                                        context
                                            .read<BottomNavBarController>()
                                            .changeNavBar(true);
                                        // _onItemTapped(index);
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
                                  // data: directionsData,
                                  // emptyWidgetModel: ErrorWidgetModel(
                                  //     title: "title", subtitle: "subtitle"),
                                  // status: FormzSubmissionStatus.success),
                                ),
                              ),
                              24.h.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "all".tr(),
                                          style: fonts.smallTagFirst.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: colors.primary900),
                                        ),
                                        3.w.horizontalSpace,
                                        icons.right
                                            .svg(width: 16.w, height: 16.h),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "all".tr(),
                                          style: fonts.smallTagFirst.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: colors.primary900),
                                        ),
                                        3.w.horizontalSpace,
                                        icons.right
                                            .svg(width: 16.w, height: 16.h),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // CustomListView(
                              //     itemBuilder: (index, context) {
                              //       final News item = state.news[index];
                              //       return NewsItem(
                              //         imagePath: item.image ?? "",
                              //         title: item.title ?? "",
                              //         subtitle: item.info ?? "",
                              //       );
                              //     },
                              //     data: state.news,
                              //     emptyWidgetModel:
                              //         ErrorWidgetModel(title: "", subtitle: ""),
                              //     status: FormzSubmissionStatus.success),
                              24.h.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  onTap: () {
                                    // context
                                    //     .read<BottomNavBarController>()
                                    //     .changeNavBar(true);
                                    // showModalBottomSheet(
                                    //     isDismissible: true,
                                    //     backgroundColor: Colors.white,
                                    //     shape: const RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.only(
                                    //             topLeft: Radius.circular(60),
                                    //             topRight: Radius.circular(60))),
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return Container(
                                    //         decoration: BoxDecoration(
                                    //           borderRadius:
                                    //         ),
                                    //         child:
                                    //             const AdressViewPage(), // Removed const for demonstration
                                    //       );
                                    //     }).then((value) {
                                    //   context
                                    //       .read<BottomNavBarController>()
                                    //       .changeNavBar(false);
                                    // });
                                  }),
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
            ),
          );
        });
      }),
    );
  }

  Widget _buildImageSection(colors, fonts) {
    return CarouselSlider(
        items: images.map((images) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: colors.backgroundColor),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r), child: images),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2,
          enlargeCenterPage: true,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlayInterval: const Duration(seconds: 40),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }

  Widget _buildOptionsRow(colors, fonts) {
    return Row(
      children: [
        Text("theme".tr(), style: fonts.smallMain),
        SizedBox(width: 12.w),
        _buildOptionButton(
            "adult".tr(),
            isChildren ? const Color(0xFFEBEBEB) : colors.error500,
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
