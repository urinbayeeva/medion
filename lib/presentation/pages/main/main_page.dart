import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/connectivity.dart';
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
  late final StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    _controller = PersistentTabController(initialIndex: widget.index ?? 0);

    // Initialize pages
    pageList = [
      const HomePage(),
      const BookingFirstPage(),
      const MyVisitsPage(),
      BlocProvider(
        create: (context) {
          final dbService = context.read<DBService>();
          return AuthBloc(
            AuthRepository(
              dbService,
              AuthService.create(dbService),
              PatientService.create(dbService),
              RefreshService.create(dbService),
            ),
            dbService,
          );
        },
        child: const ProfilePage(),
      ),
      const OthersPage(),
    ];

    // Sync with BottomNavBarController after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final navController = context.read<BottomNavBarController>();
        navController.setIndices(
          navIndex: widget.index ?? 0,
          pageIndex: 0,
        );
        // Force update if needed
        if (_controller.index != (widget.index ?? 0)) {
          _controller.index = widget.index ?? 0;
        }
      }
    });
  }

  @override
  void didUpdateWidget(MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index && widget.index != null) {
      _controller.index = widget.index!;
      // Also update the BottomNavBarController
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          final navController = context.read<BottomNavBarController>();
          navController.setIndices(
            navIndex: widget.index!,
            pageIndex: 0,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop && mounted) {
          _handleBackPress(context);
        }
      },
      child: ThemeWrapper(
        builder: (ctx, colors, fonts, icons, global) {
          return Scaffold(
            backgroundColor: colors.backgroundColor,
            body: Consumer<BottomNavBarController>(
              builder: (context, navController, _) {
                // Remove the automatic index synchronization here
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

  void _handleBackPress(BuildContext context) {
    final navController = context.read<BottomNavBarController>();
    if (navController.currentIndex != 0) {
      navController.setIndices(navIndex: 0, pageIndex: 0);
      _controller.index = 0;
    } else {
      SystemNavigator.pop();
    }
  }
}
