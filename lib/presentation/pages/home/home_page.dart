import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/sources/med_service.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../application/home/home_bloc.dart';

import '../../../presentation/component/animation_effect.dart';
import '../../../presentation/component/c_appbar.dart';
import '../../../presentation/component/custom_pagination.dart';
import '../../../presentation/component/un_focus_widget.dart';
import '../../../presentation/pages/home/ads.dart';
import '../../../presentation/pages/home/directions/widgets/medical_direction_item.dart';
import '../../../presentation/pages/home/doctors/widget/doctors_item.dart';
import '../../../presentation/pages/home/news/widgets/news_item.dart';
import '../../../presentation/pages/home/widgets/adress_item.dart';
import '../../../presentation/pages/home/widgets/problem_slidebale_card.dart';
import '../../../presentation/routes/routes.dart';
import '../../../presentation/styles/style.dart';
import '../../../presentation/styles/theme_wrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController();
  bool isChildren = false;

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeEvent.fetchNews());
    context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctors());
    context
        .read<BookingBloc>()
        .add(const BookingEvent.fetchHomePageServicesBooking());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Style.dark,
      child: ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return CustomPagination(
            enablePullDown: false,
            enablePullUp: false,
            onRetry: () {
              context.read<HomeBloc>().add(const HomeEvent.fetchNews());
              context
                  .read<BookingBloc>()
                  .add(const BookingEvent.fetchHomePageServicesBooking());
              setState(() {});

              _refreshController.refreshCompleted();
            },
            controller: _refreshController,
            child: Scaffold(
              backgroundColor: colors.backgroundColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CAppBar(
                    isBack: false,
                    title: "main".tr(),
                    centerTitle: true,
                    trailing: AnimationButtonEffect(
                      onTap: () => Navigator.push(
                        context,
                        AppRoutes.getNotificationPage(),
                      ),
                      child: icons.notification.svg(color: colors.primary900),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          const Ads(),
                          16.h.verticalSpace,
                          _buildSectionHeader("what_distrubes_you", fonts),
                          12.h.verticalSpace,
                          _buildOptionsRow(colors, fonts),
                          12.h.verticalSpace,
                          ProblemSlidebaleCard(isChildren: isChildren),
                          Text("med_services".tr(),
                              style: fonts.regularSemLink),
                          12.h.verticalSpace,
                          const MedService(),
                          _buildVerticalSpacingAndHeader(
                              "directions_of_medion_clinic", fonts, "all", () {
                            Navigator.push(
                                context, AppRoutes.getDiresctionPage());
                          }),
                          BlocBuilder<BookingBloc, BookingState>(
                              builder: (context, state) {
                            final limitedItems =
                                state.homePageBookingCategory.take(10).toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: limitedItems.length,
                              itemBuilder: (context, index) {
                                final item = limitedItems[index];
                                return MedicalDirectionItem(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      AppRoutes.getDirectionInfoPage(
                                          id: item.id!),
                                    ).then((_) {
                                      // ignore: use_build_context_synchronously
                                      context
                                          .read<BottomNavBarController>()
                                          .changeNavBar(false);
                                    });
                                  },
                                  title: item.name ?? "",
                                  subtitle: "null",
                                  iconPath: item.icon ?? "",
                                );
                              },
                            );
                          }),
                          12.h.verticalSpace,
                          _buildVerticalSpacingAndHeader(
                              "doctors", fonts, "all", () {
                            Navigator.push(
                                context, AppRoutes.getAllDoctorsPage());
                          }),
                          BlocBuilder<DoctorBloc, DoctorState>(
                            builder: (context, state) {
                              if (state.error) {
                                return Center(
                                    child: Text('something_went_wrong'.tr(),
                                        style: fonts.regularSemLink));
                              }

                              return _buildDoctorCategoryList(state.doctors
                                  .expand((category) =>
                                      category.doctorData.map((doctor) => {
                                            'name': doctor.name,
                                            'profession': doctor.specialty,
                                            'image': doctor.image,
                                          }))
                                  .toList());
                            },
                          ),
                          _buildVerticalSpacingAndHeader("news", fonts, "all",
                              () {
                            Navigator.push(context, AppRoutes.getNewsPage());
                          }),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.6,
                            ),
                            itemCount: state.news.length,
                            itemBuilder: (context, index) {
                              final news = state.news[index];
                              return NewsItem(
                                crop: true,
                                imagePath: news.image ?? "",
                                title: news.title ?? "",
                                subtitle: news.info ?? "",
                              );
                            },
                          ),
                          _buildVerticalSpacingAndHeader(
                              "address_of_clinic", fonts, "all", () {
                            Navigator.push(context, AppRoutes.getMapPage());
                          }),
                          _buildAddressSection(context, colors, fonts, icons),
                          80.h.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }

  Widget _buildOptionsRow(colors, fonts) {
    return Row(
      children: [
        _buildOptionButton("adult", !isChildren, colors, fonts),
        4.w.horizontalSpace,
        _buildOptionButton("child", isChildren, colors, fonts),
      ],
    );
  }

  Widget _buildOptionButton(String text, bool active, colors, fonts) {
    return AnimationButtonEffect(
      onTap: () => setState(() => isChildren = !isChildren),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? colors.error500 : const Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(text.tr(),
            style: fonts.xSmallText
                .copyWith(color: active ? colors.shade0 : colors.primary900)),
      ),
    );
  }

  Widget _buildSectionHeader(String titleKey, fonts) {
    return Text(
      titleKey.tr(),
      style: fonts.regularSemLink,
    );
  }

  Widget _buildVerticalSpacingAndHeader(
      String titleKey, fonts, String title, VoidCallback onTap) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSectionHeader(titleKey, fonts),
          TextButton(
            onPressed: onTap,
            child: Row(
              children: [
                Text(title.tr(),
                    style: fonts.smallLink.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.w500)),
                3.w.horizontalSpace,
                icons.right.svg()
              ],
            ),
          )
        ],
      );
    });
  }

  Widget _buildAddressSection(BuildContext context, colors, fonts, icons) {
    return Column(
      children: [
        AdressItem(
          address: "street_abdulla".tr(),
          onTap: () {},
          url: '',
        ),
        AdressItem(
          address: "street_zulfiya".tr(),
          onTap: () {},
          url: '',
        ),
        AdressItem(
          address: "street_istiroxat".tr(),
          onTap: () {},
          url: '',
        ),
      ],
    );
  }
}

Widget _buildDoctorCategoryList(List<Map<String, dynamic>> doctors) {
  return ThemeWrapper(
    builder: (context, colors, fonts, icons, controller) {
      // Limit the number of doctors to 10
      final limitedDoctors = doctors.take(10).toList();

      return SizedBox(
        height: 300.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: limitedDoctors.length,
          itemBuilder: (context, index) {
            final doctor = limitedDoctors[index];
            return DoctorsItem(
              onTap: () {
                Navigator.push(
                    context,
                    AppRoutes.getAboutDoctorPage(
                        doctor['name'], doctor['profession'], doctor['name']));
              },
              imagePath: doctor['image'],
              name: doctor['name'],
              profession: doctor['profession'],
              status: doctor['status'],
              candidateScience: true,
            );
          },
        ),
      );
    },
  );
}
