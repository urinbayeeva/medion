import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
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
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/ads.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/pages/home/news/widgets/news_item.dart';
import 'package:medion/presentation/pages/home/notifications/notification_badge.dart';
import 'package:medion/presentation/pages/home/notifications/single_notification.dart';
import 'package:medion/presentation/pages/home/widgets/adress_item.dart';
import 'package:medion/presentation/pages/home/widgets/build_doctors.dart';
import 'package:medion/presentation/pages/home/widgets/problem_slidebale_card.dart';
import 'package:medion/presentation/pages/map/map_with_polylines.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _servicesScrollController;
  late final ScrollController _newsScrollController;
  late final ScrollController _doctorsScrollController;
  late final ScrollController _problemSlidebarController;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocus;

  final RefreshController _refreshController = RefreshController();
  bool isChildren = false;
  bool _isSingleNotificationScreenOpen = false;

  @override
  void initState() {
    super.initState();

    _servicesScrollController = ScrollController();
    _newsScrollController = ScrollController();
    _doctorsScrollController = ScrollController();
    _problemSlidebarController = ScrollController();
    context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctors());
    context.read<BookingBloc>().add(const BookingEvent.fetchHomePageServicesBooking());
    context.read<HomeBloc>().add(const HomeEvent.fetchMedicalServices());
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "news"));
    context.read<HomeBloc>().add(const HomeEvent.fetchCompanyLocation());
    context.read<HomeBloc>().add(const HomeEvent.fetchAds());
    context.read<HomeBloc>().add(const HomeEvent.fetchDiseases());
    context.read<NotificationBloc>().add(const NotificationEvent.setFCMToken());
    initializeNotification(context);
    _searchFocus = FocusNode();
    _searchController = TextEditingController();

    _searchFocus.addListener(() {
      if (_searchFocus.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context, rootNavigator: true).push(AppRoutes.getSearchPage()).then(
                (v) => _searchFocus.unfocus(),
              );
        });
      }
    });

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
          debugPrint("-- subscribeToNotifications onMessageOpenedApp");
          openMessageApp(data: data, context: context);
        }
      },
    );

    handleInitialMessage(context);
  }

  void handleInitialMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    debugPrint("-- \n\nhandleInitialMessage initial message: $initialMessage\n\n");

    if (initialMessage != null && initialMessage.data.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        openMessageApp(data: initialMessage.data, context: context);
      });
    }
  }

  void openMessageApp({required Map<String, dynamic> data, required BuildContext context}) async {
    if (_isSingleNotificationScreenOpen) {
      debugPrint("-- Notification screen already open. Skipping...");
      return;
    }

    _isSingleNotificationScreenOpen = true;

    debugPrint("-- Navigating to SingleNotification screen...");
    Navigator.of(context, rootNavigator: true)
        .push(
      MaterialPageRoute(
        builder: (context) => SingleNotification(id: data["id"], type: MyFunctions.getNotificationType(data['type'])),
      ),
    )
        .then((_) {
      _isSingleNotificationScreenOpen = false;
      debugPrint("-- SingleNotification screen closed. Resetting flag.");
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
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (ctx, state) {
              return Scaffold(
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
                          Navigator.of(context, rootNavigator: true)
                              .push(AppRoutes.getNotificationPage())
                              .then((value) => context.read<BottomNavBarController>().changeNavBar(false));
                        },
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.zero,
                  child: SmartRefresher(
                    onRefresh: () {
                      context.read<BookingBloc>().add(const BookingEvent.fetchHomePageServicesBooking());
                      context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "news"));
                      context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctors());
                      context.read<HomeBloc>().add(const HomeEvent.fetchMedicalServices());
                      context.read<HomeBloc>().add(const HomeEvent.fetchCompanyLocation());
                      context.read<HomeBloc>().add(const HomeEvent.fetchAds());
                      context.read<HomeBloc>().add(const HomeEvent.fetchDiseases());
                      setState(() {});
                      _refreshController.refreshCompleted();
                    },
                    controller: _refreshController,
                    enablePullDown: true,
                    header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                    child: ListView(
                      addAutomaticKeepAlives: true,
                      key: const PageStorageKey<String>('home_list_view'),
                      padding: EdgeInsets.zero,
                      children: [
                        12.h.verticalSpace,
                        const Ads(),
                        16.h.verticalSpace,
                        CustomTextField(
                          controller: _searchController,
                          focusNode: _searchFocus,
                          keyboardType: TextInputType.none,
                          cursorColor: Colors.transparent,
                          enableBorderColor: colors.neutral400,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          hintText: "${"search".tr()}...",
                          prefixIcon: icons.search.svg(height: 16.h, width: 16.w, color: const Color(0xff9AA0A6)),
                        ),
                        20.h.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _buildSectionHeader("what_distrubes_you", fonts),
                        ),
                        12.h.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              _buildOptionButton("adult", !isChildren, colors, fonts),
                              4.w.horizontalSpace,
                              _buildOptionButton("child", isChildren, colors, fonts),
                            ],
                          ),
                        ),
                        12.h.verticalSpace,
                        ProblemSlidebaleCard(isChildren: isChildren, controller: _problemSlidebarController),
                        12.h.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: _buildVerticalSpacingAndHeader(
                            titleKey: "med_services",
                            fonts: fonts,
                            title: "all",
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(AppRoutes.getMedServicesPage()).then((_) {
                                context.read<BottomNavBarController>().changeNavBar(false);
                              });
                            },
                          ),
                        ),
                        12.h.verticalSpace,
                        BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (o, n) {
                            final service = o.medicalServices != n.medicalServices;
                            return service;
                          },
                          builder: (context, state) {
                            if (state.loading || state.medicalServices.isEmpty) return _buildMedicalServicesShimmer();
                            // if () return const SizedBox.shrink();
                            return SizedBox(
                              height: 140.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                key: const PageStorageKey<String>('med_services'),
                                controller: _servicesScrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.medicalServices.length,
                                itemBuilder: (context, index) {
                                  final medicalService = state.medicalServices[index];
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB((index == 0) ? 12.w : 8.w, 0, 8.w, 0),
                                    child: AnimationButtonEffect(
                                      onTap: () {
                                        Navigator.of(context, rootNavigator: true)
                                            .push(AppRoutes.getDirectionInfoPage(
                                                id: medicalService.categoryId!, name: medicalService.title))
                                            .then((_) => context.read<BottomNavBarController>().changeNavBar(false));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: colors.shade0,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: BlocBuilder<BookingBloc, BookingState>(
                            buildWhen: (o, n) {
                              final category = o.homePageBookingCategory != n.homePageBookingCategory;
                              final length = o.homePageBookingCategory.length != n.homePageBookingCategory.length;
                              final status =
                                  o.fetchHomePageBookingCategoriesStatus != n.fetchHomePageBookingCategoriesStatus;
                              return category || length || status;
                            },
                            builder: (ctX, state) {
                              if (state.fetchHomePageBookingCategoriesStatus.isInProgress ||
                                  state.fetchHomePageBookingCategoriesStatus.isInitial) {
                                return _buildDirectionsShimmer(fonts);
                              }
                              if (state.homePageBookingCategory.isEmpty) return const SizedBox.shrink();

                              final limitedItems = state.homePageBookingCategory.take(10).toList();

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSectionHeader("directions_of_medion_clinic", fonts),
                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    key: const PageStorageKey<String>('directions_of_medion_clinic'),
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: limitedItems.length,
                                    itemBuilder: (ctx, index) {
                                      final item = limitedItems[index];
                                      return MedicalDirectionItem(
                                        onTap: () {
                                          Navigator.of(context, rootNavigator: true)
                                              .push(AppRoutes.getDirectionInfoPage(id: item.id!, name: item.name!))
                                              .then((_) => ctX.read<BottomNavBarController>().changeNavBar(false));
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
                                      Navigator.of(context, rootNavigator: true)
                                          .push(AppRoutes.getDiresctionPage())
                                          .then((v) {
                                        context.read<BottomNavBarController>().changeNavBar(false);
                                      });
                                    },
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        12.h.verticalSpace,
                        BuildDoctorsCategory(
                          controller: _doctorsScrollController,
                          titleAndAction: _buildVerticalSpacingAndHeader(
                            titleKey: "doctors",
                            fonts: fonts,
                            title: "see_all_doctors",
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(AppRoutes.getAllDoctorsPage()).then((v) {
                                context.read<BottomNavBarController>().changeNavBar(false);
                              });
                            },
                          ),
                        ),
                        12.h.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: _buildVerticalSpacingAndHeader(
                            titleKey: "news",
                            fonts: fonts,
                            title: "all",
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(AppRoutes.getNewsPage()).then((_) {
                                context.read<BottomNavBarController>().changeNavBar(false);
                              });
                            },
                          ),
                        ),
                        BlocBuilder<ContentBloc, ContentState>(
                          buildWhen: (o, n) {
                            final nws = o.contentByType["news"] != n.contentByType["news"];
                            final status = o.fetchContentStatus != n.fetchContentStatus;
                            return nws || status;
                          },
                          builder: (context, state) {
                            if (state.fetchContentStatus.isInProgress || state.fetchContentStatus.isFailure) {
                              return _buildNewsShimmer();
                            }
                            if (state.fetchContentStatus.isFailure) {
                              return Center(
                                child: Text('something_went_wrong'.tr(), style: fonts.regularSemLink),
                              );
                            }

                            final newsContent = state.contentByType["news"] ?? [];
                            return SizedBox(
                              height: 275.h,
                              child: ListView.builder(
                                controller: _newsScrollController,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: newsContent.length,
                                key: const PageStorageKey<String>('home_news'),
                                itemBuilder: (context, index) {
                                  final news = newsContent[index];
                                  return Padding(
                                    padding: EdgeInsets.only(right: 4.0.w, left: (index == 0) ? 12.w : 0),
                                    child: NewsItem(
                                      onTap: () => Navigator.of(context, rootNavigator: true)
                                          .push(
                                              AppRoutes.getInfoViewAboutHealth(id: news.id, type: ContentTypeEnum.news))
                                          .then((_) {
                                        context.read<BottomNavBarController>().changeNavBar(false);
                                      }),
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
                        5.h.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _buildVerticalSpacingAndHeader(
                            titleKey: "address_of_clinic",
                            fonts: fonts,
                            title: "on_map".tr(),
                            isLocation: true,
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(AppRoutes.getMapPage()).then((v) {
                                context.read<BottomNavBarController>().changeNavBar(false);
                              });
                            },
                          ),
                        ),
                        4.h.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                          child: _buildAddressSection(context: context, colors: colors, fonts: fonts, icons: icons),
                        ),
                        80.h.verticalSpace,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
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
                    ShimmerContainer(height: 100.h, width: 135.w, borderRadius: 8.r),
                    5.h.verticalSpace,
                    ShimmerContainer(height: 16.h, width: 100.w, borderRadius: 4.r),
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
        _buildVerticalSpacingAndHeader(
          titleKey: "directions_of_medion_clinic",
          fonts: fonts,
          title: "all",
          onTap: () {},
          isLocation: true,
        ),
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
            child: ShimmerView(child: ShimmerContainer(height: 260.h, width: 200.w, borderRadius: 12.r)),
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

  Widget _buildOptionButton(String text, bool active, colors, FontSet fonts) {
    return AnimationButtonEffect(
      onTap: () => setState(() => isChildren = !isChildren),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8),
        constraints: BoxConstraints(minWidth: 0.2.sw),
        decoration: BoxDecoration(
          color: active ? colors.error500 : const Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            text.tr(),
            style: fonts.xSmallText.copyWith(
              fontWeight: FontWeight.w500,
              color: active ? colors.shade0 : colors.primary900,
            ),
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

  Widget _buildVerticalSpacingAndHeader({
    required String titleKey,
    required FontSet fonts,
    required String title,
    required VoidCallback onTap,
    bool isLocation = false,
  }) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionHeader(titleKey, fonts),
            if (isLocation) ...{
              WScaleAnimation(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colors.shade0,
                  ),
                  child: Row(
                    spacing: 4,
                    children: [
                      icons.location.svg(color: colors.darkMode900),
                      Text(title, style: fonts.smallText),
                    ],
                  ),
                ),
              )
            } else ...{
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
            }
          ],
        );
      },
    );
  }

  Widget _buildAddressSection({
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
    required IconSet icons,
  }) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (o, n) => o.companyLocations != n.companyLocations,
      builder: (context, state) {
        if (state.loading) return _buildAddressShimmer();
        if (state.companyLocations.isEmpty) return const SizedBox.shrink();

        return Column(
          spacing: 8.h,
          children: [
            ...List.generate(
              state.companyLocations.length,
              (index) {
                final location = state.companyLocations[index];
                return HomeLocationCard(
                  location: location,
                  colors: colors,
                  fonts: fonts,
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
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
                    );
                  },
                );
              },
            ),
          ],
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
