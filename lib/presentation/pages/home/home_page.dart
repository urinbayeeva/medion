import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/infrastructure/services/push_notification.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/custom_pagination.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/ads.dart';
import 'package:medion/presentation/pages/home/notifications/notification_badge.dart';
import 'package:medion/presentation/pages/home/notifications/single_notification.dart';
import 'package:medion/presentation/pages/home/widgets/adress_item.dart';
import 'package:medion/presentation/pages/home/widgets/build_doctors.dart';
import 'package:medion/presentation/pages/home/widgets/problem_slidebale_card.dart';
import 'package:medion/presentation/pages/home/yandex_on_tap.dart';
import 'package:medion/presentation/pages/map/map_with_polylines.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'directions/widgets/medical_direction_item.dart';
import 'news/widgets/news_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController();
  bool isChildren = false;
  bool _isSingleNotificationScreenOpen = false;

  @override
  void initState() {
    super.initState();
    context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctors());
    context.read<BookingBloc>().add(const BookingEvent.fetchHomePageServicesBooking());
    context.read<HomeBloc>().add(const HomeEvent.fetchMedicalServices());
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "news"));
    context.read<HomeBloc>().add(const HomeEvent.fetchCompanyLocation());
    context.read<HomeBloc>().add(const HomeEvent.fetchAds());
    context.read<HomeBloc>().add(const HomeEvent.fetchDiseases());
    context.read<NotificationBloc>().add(const NotificationEvent.setFCMToken());
    initializeNotification(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      subscribeToNotifications(context);
    });
  }

  void initializeNotification(BuildContext context) async {
    PushNotification.initializeAndListenFirebaseMessaging(context);
  }

  void subscribeToNotifications(BuildContext context) async {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        final Map<String, dynamic> data = message.data;
        if (data.isNotEmpty) {
          log("subscribeToNotifications onMessageOpenedApp");
          openMessageApp(data: data, context: context);
        }
      },
    );

    handleInitialMessage(context);
  }

  void handleInitialMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    log("\n\nhandleInitialMessage initial message: $initialMessage\n\n");

    if (initialMessage != null && initialMessage.data.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        openMessageApp(data: initialMessage.data, context: context);
      });
    }
  }

  void openMessageApp({required Map<String, dynamic> data, required BuildContext context}) async {
    if (_isSingleNotificationScreenOpen) {
      log("Notification screen already open. Skipping...");
      return;
    }

    _isSingleNotificationScreenOpen = true;

    log("Navigating to SingleNotification screen...");
    Navigator.of(context, rootNavigator: true)
        .push(
      MaterialPageRoute(
        builder: (context) => SingleNotification(id: data["id"], type: MyFunctions.getNotificationType(data['type'])),
      ),
    )
        .then((_) {
      _isSingleNotificationScreenOpen = false;
      log("SingleNotification screen closed. Resetting flag.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocListener<AuthBloc, AuthState>(
          listenWhen: (o, n) {
            final info = o.patientInfo != n.patientInfo;
            final error = o.errorFetchingPatientInfo != n.errorFetchingPatientInfo;
            final token = o.haveToken != n.haveToken;

            return info || error || token;
          },
          listener: (context, lState) {
            log("User Status: ${lState.userStatus.name}");
            log("User have Token: ${lState.haveToken}");
            final patientInfo = lState.patientInfo == null;

            if (patientInfo || lState.errorFetchingPatientInfo) {
              context.read<AuthBloc>().add(const AuthEvent.checkAuth());
            }

            if ((lState.haveToken.isEmpty)) {
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                AppRoutes.getLangPage(),
                (route) => false,
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
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
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: colors.shade0,
                  foregroundColor: colors.darkMode900,
                  scrolledUnderElevation: 0,
                  title: Text("main".tr(), style: fonts.regularMain),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: NotificationBadge(
                        icons: icons,
                        colors: colors,
                        onTap: () {
                          context.read<BottomNavBarController>().changeNavBar(true);
                          Navigator.push(context, AppRoutes.getNotificationPage()).then((value) {
                            context.read<BottomNavBarController>().changeNavBar(false);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                body: Padding(
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
                          if (state.loading) return _buildMedicalServicesShimmer();
                          if (state.medicalServices.isEmpty) return const SizedBox.shrink();

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
                                          id: medicalService.categoryId!,
                                          name: medicalService.title,
                                        ),
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
                                              imageUrl: medicalService.image,
                                            ),
                                          ),
                                          5.h.verticalSpace,
                                          Container(
                                            width: 135.w,
                                            alignment: Alignment.center,
                                            child: Text(
                                              medicalService.title,
                                              style: fonts.xSmallLink.copyWith(color: colors.primary900),
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
                        buildWhen: (o, n) {
                          final category = o.homePageBookingCategory != n.homePageBookingCategory;
                          final length = o.homePageBookingCategory.length != n.homePageBookingCategory.length;
                          return category || length;
                        },
                        builder: (ctX, state) {
                          if (state.loading) return _buildDirectionsShimmer(fonts);
                          if (state.homePageBookingCategory.isEmpty) return const SizedBox.shrink();

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
                                      ).then((_) => ctX.read<BottomNavBarController>().changeNavBar(false));
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
                      BuildDoctorsCategory(
                        titleAndAction: _buildVerticalSpacingAndHeader("doctors", fonts, "see_all_doctors", () {
                          context.read<BottomNavBarController>().changeNavBar(true);
                          Navigator.push(context, AppRoutes.getAllDoctorsPage()).then((_) {
                            context.read<BottomNavBarController>().changeNavBar(false);
                          });
                        }),
                      ),
                      12.h.verticalSpace,
                      _buildVerticalSpacingAndHeader("news", fonts, "all", () {
                        context.read<BottomNavBarController>().changeNavBar(true);

                        Navigator.push(context, AppRoutes.getNewsPage()).then((_) {
                          context.read<BottomNavBarController>().changeNavBar(false);
                        });
                      }),
                      BlocBuilder<ContentBloc, ContentState>(
                        buildWhen: (o, n) {
                          final nws = o.contentByType["news"] != n.contentByType["news"];
                          return nws;
                        },
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
                      _buildAddressSection(context, colors, fonts, icons),
                      80.h.verticalSpace,
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
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
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
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
      },
    );
  }

  Widget _buildAddressSection(BuildContext context, colors, fonts, icons) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (o, n) => o.companyLocations != n.companyLocations,
      builder: (context, state) {
        if (state.loading) return _buildAddressShimmer();
        if (state.companyLocations.isEmpty) return const SizedBox.shrink();

        return Column(
          children: state.companyLocations
              .map(
                (location) => AdressItem(
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
                ),
              )
              .toList(),
        );
      },
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
