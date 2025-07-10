import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/deep_link/deep_link_handle.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/presentation/component/nav_bar/lib/persistent_tab_view.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/booking/booking_first_page.dart';
import 'package:medion/presentation/pages/home/home_page.dart';
import 'package:medion/presentation/pages/main/component/bottom_navigation_components.dart';
import 'package:medion/presentation/pages/others/others_page.dart';
import 'package:medion/presentation/pages/profile/profile_page.dart';
import 'package:medion/presentation/pages/visits/my_visits_page.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/debounce.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final int? index;

  const MainPage({super.key, this.index});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final ScrollController scrollController;
  late final List<Widget> pageList;
  late final PersistentTabController _controller;
  late final DynamicLinkService dynamicLinkService;

  // late final StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.refreshToken());

    scrollController = ScrollController();
    _controller = PersistentTabController(initialIndex: widget.index ?? 0);

    // Initialize pages
    pageList = [
      const HomePage(),
      const BookingFirstPage(),
      const MyVisitsPage(),
      const ProfilePage(),
      const OthersPage(),
    ];
  }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: ThemeWrapper(
        builder: (ctx, colors, fonts, icons, global) {
          return Scaffold(
            backgroundColor: colors.backgroundColor,
            body: Consumer<BottomNavBarController>(
              builder: (context, navController, _) {
                return PersistentTabView(
                  context,
                  controller: _controller,
                  screens: pageList,
                  items: navBarsItems(icons),
                  onItemSelected: (int index) {
                    if (mounted) {
                      navController.setIndices(
                        navIndex: index,
                        pageIndex: index == 2 ? navController.pageIndex : 0,
                      );
                      if (index == 0 && scrollController.hasClients) {
                        scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOutCubic,
                        );
                      }
                    }
                  },
                  resizeToAvoidBottomInset: false,
                  backgroundColor: colors.transparent,
                  navBarHeight: 60.h,
                  confineInSafeArea: false,
                  hideNavigationBarWhenKeyboardShows: true,
                  hideNavigationBar: navController.hiddenNavBar,
                  navBarStyle: NavBarStyle.simple,
                  popAllScreensOnTapAnyTabs: true,
                  popAllScreensOnTapOfSelectedTab: false,
                  popActionScreens: PopActionScreensType.all,
                  stateManagement: false,
                  handleAndroidBackButtonPress: true,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
