import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/nav_bar/lib/persistent_tab_view.dart';
import 'package:medion/presentation/pages/appoinment/appoinment.dart';
import 'package:medion/presentation/pages/home/home_page.dart';
import 'package:medion/presentation/pages/main/component/bottom_navigation_components.dart';
import 'package:medion/presentation/pages/visits/my_visits_page.dart';
import 'package:medion/presentation/routes/routes.dart';
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

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    pageList = [
      const HomePage(),
      const AppoinmentPage(),
      const MyVisitsPage(),
      const AppoinmentPage(),
      const AppoinmentPage(),
    ];
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
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
              );
            },
          ),
        );
      },
    );
  }
}
