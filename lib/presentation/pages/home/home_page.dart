import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/sources/med_service.dart';
import 'package:medion/presentation/component/c_bottom_icon.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_choose.dart';
import 'package:medion/presentation/pages/home/news/news_page.dart';
import 'package:medion/presentation/pages/home/yandex_on_tap.dart';
import 'package:medion/presentation/pages/map/map_page.dart';
import 'package:medion/presentation/pages/map/map_with_polylines.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/helpers/decode_html.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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
    context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctors());
    context.read<BookingBloc>().add(const BookingEvent.fetchHomePageServicesBooking());
    context.read<HomeBloc>().add(const HomeEvent.fetchMedicalServices());
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "news"));
    context.read<HomeBloc>().add(const HomeEvent.fetchCompanyLocation());
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return CustomPagination(
          enablePullDown: true,
          enablePullUp: true,
          onRetry: () {
            context.read<HomeBloc>().add(const HomeEvent.fetchNews());
            context.read<BookingBloc>().add(const BookingEvent.fetchHomePageServicesBooking());
            context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "news"));
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
                  trailing: Row(
                    children: [
                      AnimationButtonEffect(
                        onTap: () {
                          Navigator.push(
                            context,
                            AppRoutes.getNotificationPage(),
                          );
                        },
                        child: icons.notification.svg(color: colors.primary900, width: 24.w, height: 24.h),
                      ),
                      8.w.horizontalSpace,
                      AnimationButtonEffect(
                        onTap: () {
                          context.read<BottomNavBarController>().changeNavBar(true);
                          Navigator.push(
                            context,
                            AppRoutes.getSearchPage(),
                          ).then((_) {
                            context.read<BottomNavBarController>().changeNavBar(false);
                          });
                        },
                        child: icons.search.svg(color: colors.primary900, width: 22.w, height: 22.h),
                      ),
                    ],
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
                        12.h.verticalSpace,
                        _buildVerticalSpacingAndHeader("med_services", fonts, "all", () {
                          context.read<BottomNavBarController>().changeNavBar(true);
                          Navigator.push(context, AppRoutes.getMedServicesPage()).then((_) {
                            context.read<BottomNavBarController>().changeNavBar(false);
                          });
                        }),
                        12.h.verticalSpace,
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state.loading) {
                              return _buildMedicalServicesShimmer();
                            }
                            if (state.medicalServices.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return SizedBox(
                              height: 140.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.medicalServices.length,
                                itemBuilder: (context, index) {
                                  final medicalService = state.medicalServices[index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                    child: AnimationButtonEffect(
                                      onTap: () {
                                        context.read<BottomNavBarController>().changeNavBar(true);
                                        Navigator.push(
                                          context,
                                          AppRoutes.getDirectionInfoPage(
                                              id: medicalService.categoryId!, name: medicalService.title),
                                        ).then((_) {
                                          context.read<BottomNavBarController>().changeNavBar(false);
                                        });
                                      },
                                      child: SizedBox(
                                        width: 135.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 100.h,
                                              child: CachedImageComponent(
                                                borderRadius: 8.r,
                                                fit: BoxFit.cover,
                                                width: 135.w,
                                                height: 100.h,
                                                imageUrl: medicalService.image ?? '',
                                              ),
                                            ),
                                            5.h.verticalSpace,
                                            Container(
                                              width: 135.w,
                                              alignment: Alignment.center,
                                              child: Text(
                                                medicalService.title ?? '',
                                                style: fonts.xSmallLink.copyWith(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: colors.primary900,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        12.h.verticalSpace,
                        BlocBuilder<BookingBloc, BookingState>(
                          builder: (ctX, state) {
                            if (state.loading) {
                              return _buildDirectionsShimmer(fonts);
                            }
                            if (state.homePageBookingCategory.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            final limitedItems = state.homePageBookingCategory.take(10).toList();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildSectionHeader("directions_of_medion_clinic", fonts),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: limitedItems.length,
                                  itemBuilder: (ctx, index) {
                                    final item = limitedItems[index];
                                    return MedicalDirectionItem(
                                      onTap: () {
                                        context.read<BottomNavBarController>().changeNavBar(true);
                                        Navigator.push(
                                          context,
                                          AppRoutes.getDirectionInfoPage(id: item.id!, name: item.name!),
                                        ).then(
                                          (_) {
                                            ctX.read<BottomNavBarController>().changeNavBar(false);
                                          },
                                        );
                                      },
                                      title: item.name ?? "",
                                      subtitle: "",
                                      iconPath: item.icon ?? "",
                                    );
                                  },
                                ),
                                8.h.verticalSpace,
                                CButton(
                                  title: "directions_of_medion_clinic".tr(),
                                  onTap: () {
                                    Navigator.push(context, AppRoutes.getDiresctionPage());
                                  },
                                )
                              ],
                            );
                          },
                        ),
                        12.h.verticalSpace,
                        BlocBuilder<DoctorBloc, DoctorState>(
                          buildWhen: (o, n) => o.doctors != n.doctors,
                          builder: (context, state) {
                            if (state.error ||
                                state.doctors?.doctorData == null ||
                                state.doctors!.doctorData!.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            if (!state.success) {
                              return _buildDoctorsShimmer(fonts);
                            }

                            return Column(
                              children: [
                                _buildVerticalSpacingAndHeader("doctors", fonts, "see_all_doctors", () {
                                  context.read<BottomNavBarController>().changeNavBar(true);

                                  Navigator.push(context, AppRoutes.getAllDoctorsPage()).then((_) {
                                    // ignore: use_build_context_synchronously
                                    context.read<BottomNavBarController>().changeNavBar(false);
                                  });
                                }),
                                _buildDoctorCategoryList(
                                  (state.doctors?.doctorData != null)
                                      ? state.doctors!.doctorData!
                                          .map(
                                            (category) => {
                                              'name': category.name,
                                              'profession': category.specialty.toString(),
                                              'image': category.image,
                                              'id': category.id,
                                              'work_experience': category.workExperience.toString(),
                                              'info_description': decodeHtml(category.infoDescription.toString()),
                                              'gender': category.gender.toString(),
                                              'has_discount': category.hasDiscount,
                                            },
                                          )
                                          .toList()
                                      : [],
                                ),
                              ],
                            );
                          },
                        ),
                        12.h.verticalSpace,
                        _buildVerticalSpacingAndHeader("news", fonts, "all", () {
                          context.read<BottomNavBarController>().changeNavBar(true);

                          Navigator.push(context, AppRoutes.getNewsPage()).then((_) {
                            context.read<BottomNavBarController>().changeNavBar(false);
                          });
                        }),
                        BlocBuilder<ContentBloc, ContentState>(
                          builder: (context, state) {
                            if (state.loading) {
                              return _buildNewsShimmer();
                            }
                            if (state.error) {
                              return Center(
                                child: Text('something_went_wrong'.tr(), style: fonts.regularSemLink),
                              );
                            }

                            final newsContent = state.contentByType["news"] ?? [];
                            return SizedBox(
                              height: 260.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: newsContent.length,
                                itemBuilder: (context, index) {
                                  final news = newsContent[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: NewsItem(
                                      inner: true,
                                      onTap: () {
                                        context.read<BottomNavBarController>().changeNavBar(true);

                                        Navigator.push(
                                          context,
                                          AppRoutes.getInfoViewAboutHealth(
                                            discountCondition: "",
                                            imagePath: news.images.toList(),
                                            title: news.decodedTitle,
                                            desc: news.decodedDescription,
                                            date: news.createDate,
                                          ),
                                        ).then((_) {
                                          context.read<BottomNavBarController>().changeNavBar(false);
                                        });
                                      },
                                      crop: true,
                                      imagePath: news.primaryImage,
                                      title: news.decodedTitle,
                                      subtitle: news.decodedDescription,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        _buildVerticalSpacingAndHeader("address_of_clinic", fonts, "all", () {
                          context.read<BottomNavBarController>().changeNavBar(true);

                          Navigator.push(context, AppRoutes.getMapPage()).then((_) {
                            context.read<BottomNavBarController>().changeNavBar(false);
                          });
                        }),
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state.loading) {
                              return _buildAddressShimmer();
                            }
                            return _buildAddressSection(context, colors, fonts, icons);
                          },
                        ),
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
    });
  }

  Widget _buildMedicalServicesShimmer() {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ShimmerView(
              child: SizedBox(
                width: 135.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShimmerContainer(
                      height: 100.h,
                      width: 135.w,
                      borderRadius: 8.r,
                    ),
                    5.h.verticalSpace,
                    ShimmerContainer(
                      height: 16.h,
                      width: 100.w,
                      borderRadius: 4.r,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDirectionsShimmer(fonts) {
    return Column(
      children: [
        _buildVerticalSpacingAndHeader("directions_of_medion_clinic", fonts, "all", () {}),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ShimmerView(
              child: ShimmerContainer(
                height: 70.h,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 8.h),
                borderRadius: 8.r,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDoctorsShimmer(fonts) {
    return Column(
      children: [
        _buildVerticalSpacingAndHeader("doctors", fonts, "see_all_doctors", () {}),
        SizedBox(
          height: 350.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: ShimmerView(
                  child: ShimmerContainer(
                    height: 350.h,
                    width: 200.w,
                    borderRadius: 12.r,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsShimmer() {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: ShimmerView(
              child: ShimmerContainer(
                height: 260.h,
                width: 200.w,
                borderRadius: 12.r,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddressShimmer() {
    return Column(
      children: List.generate(
        3,
        (index) => ShimmerView(
          child: ShimmerContainer(
            height: 100.h,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 12.h),
            borderRadius: 12.r,
          ),
        ),
      ),
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
        child: Text(
          text.tr(),
          style: fonts.xSmallText.copyWith(
            color: active ? colors.shade0 : colors.primary900,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String titleKey, fonts) {
    return Text(
      titleKey.tr(),
      style: fonts.regularSemLink,
    );
  }

  Widget _buildVerticalSpacingAndHeader(String titleKey, fonts, String title, VoidCallback onTap) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSectionHeader(titleKey, fonts),
          TextButton(
            onPressed: onTap,
            child: Row(
              children: [
                Text(
                  title.tr(),
                  style: fonts.smallLink.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                3.w.horizontalSpace,
                icons.right.svg(),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildAddressSection(BuildContext context, colors, fonts, icons) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.companyLocations.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          children: state.companyLocations
              .map((location) => AdressItem(
                    yandexOnTap: () {
                      launchYandexTaxi(
                        context,
                        location.position.latitude,
                        location.position.longitude,
                      );
                    },
                    address: location.address,
                    onTap: () {
                      context.read<BottomNavBarController>().changeNavBar(true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapWithPolylines(
                            name: location.address,
                            workingHours: location.workHours,
                            image: location.icon,
                            destination: Point(
                              latitude: location.position.latitude,
                              longitude: location.position.longitude,
                            ),
                          ),
                        ),
                      ).then((_) {
                        context.read<BottomNavBarController>().changeNavBar(false);
                      });
                    },
                    url: location.icon,
                    name: location.fullName.toString(),
                  ))
              .toList(),
        );
      },
    );
  }

  _buildDoctorCategoryList(List<Map<String, dynamic>> doctors) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        final limitedDoctors = doctors.take(10).toList();
        if (limitedDoctors.isEmpty) return const SizedBox.shrink();

        return SizedBox(
          height: 350.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: limitedDoctors.length,
            itemBuilder: (context, index) {
              final doctor = limitedDoctors[index];
              return DoctorsItem(
                onTap: () {
                  context.read<BottomNavBarController>().changeNavBar(true);
                  Navigator.push(
                    context,
                    AppRoutes.getAboutDoctorPage(
                      doctor['name'].toString(),
                      doctor['profession'].toString(),
                      doctor['name'].toString(),
                      doctor['image'].toString(),
                      doctor['id'],
                    ),
                  ).then((_) {
                    context.read<BottomNavBarController>().changeNavBar(false);
                  });
                },
                hasDiscount: doctor['has_discount'] ?? false,
                imagePath: doctor['image'].toString(),
                name: doctor['name'].toString(),
                profession: doctor['profession'].toString(),
                status: doctor['profession'].toString(),
                gender: doctor['gender'].toString(),
                candidateScience: false,
                isInnerPageUsed: true,
                doctorID: doctor['id'],
                experience: "experience".tr(
                  namedArgs: {"count": doctor['work_experience'].toString()},
                ),
                academicRank: doctor['academic_rank']?.toString() ?? "", // Add academicRank
              );
            },
          ),
        );
      },
    );
  }
}
