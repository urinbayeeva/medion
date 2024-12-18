import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/connectivity.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/presentation/component/nav_bar/lib/persistent_tab_view.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
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
  ScrollController scrollController = ScrollController();
  late List<Widget> pageList;
  late PersistentTabController _controller = PersistentTabController();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  int currentIndex = 0;

  @override
  void initState() {
    scrollController = ScrollController();
    Future.delayed(Duration.zero, () {
      // ignore: use_build_context_synchronously
      context.read<BottomNavBarController>().changeNavBar(false);
    });
    DBService dbService = context.read<DBService>();
    _controller = PersistentTabController(initialIndex: widget.index ?? 0);
    super.initState();

    pageList = [
      const HomePage(),
      const AppointmentPage(),
      const MyVisitsPage(),
      const ProfilePage(),
      const OthersPage(),
    ];

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      if (!(await ConnectivityX().create())) {
        _showConnectionError();
      } else {
        EasyLoading.dismiss();
      }
    } else {
      _showConnectionError();
    }
  }

  _showConnectionError() {
    EasyLoading.showWidget(builder: (context) {
      return ThemeWrapper(builder: (ctx, colors, fonts, icons, global) {
        return Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: colors.error500,
                borderRadius: BorderRadius.circular(16.r)),
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text(
              "No Internet",
              textAlign: TextAlign.center,
              style: fonts.smallMain.copyWith(color: colors.shade0),
            ),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: ThemeWrapper(
        builder: (ctx, colors, fonts, icons, global) {
          return Scaffold(
            backgroundColor: colors.shade0,
            body: Consumer<BottomNavBarController>(
              builder: (context, theme, _) {
                return PersistentTabView(
                  context,
                  onItemSelected: (int index) {
                    onDebounce(() {
                      if (index == 0) {}
                      setState(() {});
                    });

                    if (currentIndex == 0) {
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                    currentIndex = index;
                  },
                  resizeToAvoidBottomInset: false,
                  backgroundColor: colors.transparent,
                  navBarHeight: 60.h,
                  controller: _controller,
                  screens: pageList,
                  confineInSafeArea: false,
                  hideNavigationBarWhenKeyboardShows: true,
                  hideNavigationBar: theme.hiddenNavBar,
                  navBarStyle: NavBarStyle.simple,
                  popAllScreensOnTapAnyTabs: true,
                  popAllScreensOnTapOfSelectedTab: false,
                  popActionScreens: PopActionScreensType.all,
                  stateManagement: false,
                  items: navBarsItems(icons),
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
