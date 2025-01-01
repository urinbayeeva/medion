import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/nav_bar/lib/persistent_tab_view.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';

class CustomBottomNavBarItem extends PersistentBottomNavBarItem {
  CustomBottomNavBarItem({
    required String title,
    required Color activeColorPrimary,
    required Color inactiveColorPrimary,
    required String icon,
    required String inactiveIcon,
    required double iconSize,
    Key? key,
  }) : super(
          contentPadding: 0,
          icon: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: iconSize,
              maxHeight: iconSize,
              maxWidth: iconSize,
              minWidth: iconSize,
            ),
            child: icon.svg(
              height: iconSize,
              color: activeColorPrimary,
            ),
          ),
          inactiveIcon: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: iconSize,
              maxHeight: iconSize,
              maxWidth: iconSize,
              minWidth: iconSize,
            ),
            child: inactiveIcon.svg(
              height: iconSize,
              color: inactiveColorPrimary,
            ),
          ),
          title: title,
          textStyle: Style.xxSmallText(color: Style.neutral500, size: 11.sp),
          activeColorPrimary: Style.error500,
          inactiveColorPrimary: Style.neutral600,
          inactiveColorSecondary: Style.neutral600,
          activeColorSecondary: Style.neutral600,
        );
}

class CustomBottomNavBarItemWithBadge extends PersistentBottomNavBarItem {
  CustomBottomNavBarItemWithBadge({
    required String title,
    required Color activeColorPrimary,
    required Color inactiveColorPrimary,
    required String icon,
    required String inactiveIcon,
    required double iconSize,
    // required Widget badge,
    Key? key,
  }) : super(
          contentPadding: 0,
          icon: Badge(
            backgroundColor: Colors.transparent,
            // label: badge,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: iconSize,
                maxHeight: iconSize,
                maxWidth: iconSize,
                minWidth: iconSize,
              ),
              child: icon.svg(
                height: iconSize,
                color: activeColorPrimary,
              ),
            ),
          ),
          inactiveIcon: Badge(
            backgroundColor: Colors.transparent,
            // label: badge,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: iconSize,
                maxHeight: iconSize,
                maxWidth: iconSize,
                minWidth: iconSize,
              ),
              child: inactiveIcon.svg(
                height: iconSize,
                color: inactiveColorPrimary,
              ),
            ),
          ),
          title: title,
          textStyle: Style.xxSmallText(color: Style.neutral500, size: 11.sp),
          activeColorPrimary: Style.error500,
          inactiveColorPrimary: Style.neutral600,
          inactiveColorSecondary: Style.neutral600,
          activeColorSecondary: Style.neutral600,
        );
}

List<PersistentBottomNavBarItem> navBarsItems(IconSet icons) {
  double iconSize = 24.r;
  return [
    CustomBottomNavBarItem(
      iconSize: iconSize,
      inactiveIcon: icons.homeActive,
      icon: icons.home,
      title: "main".tr(),
      activeColorPrimary: Style.error500,
      inactiveColorPrimary: Style.primary900,
    ),
    CustomBottomNavBarItem(
      iconSize: iconSize,
      inactiveIcon: icons.filePlusActive,
      icon: icons.filePlus,
      title: "appointment_nav_bar".tr(),
      activeColorPrimary: Style.error500,
      inactiveColorPrimary: Style.primary900,
    ),
    CustomBottomNavBarItem(
      iconSize: iconSize,
      icon: icons.calendarActive,
      inactiveIcon: icons.calendar,
      title: "visits".tr(),
      activeColorPrimary: Style.primary500,
      inactiveColorPrimary: Style.primary900,
    ),
    CustomBottomNavBarItemWithBadge(
      iconSize: iconSize,
      icon: icons.profileActive,
      inactiveIcon: icons.profile,
      title: "profile".tr(),
      activeColorPrimary: Style.primary500,
      inactiveColorPrimary: Style.primary900,
    ),
    CustomBottomNavBarItem(
      iconSize: iconSize,
      icon: icons.otherActive,
      inactiveIcon: icons.other,
      title: "more".tr(),
      activeColorPrimary: Style.primary500,
      inactiveColorPrimary: Style.primary900,
    ),
  ];
}
