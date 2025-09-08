import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_logout_bottomsheet.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/home/directions/component/home_list_tile.dart';
import 'package:medion/presentation/pages/profile/widget/settings_data.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
import 'package:medion/utils/phone_utils.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final ValueNotifier<String> _version = ValueNotifier("");

  @override
  void initState() {
    _version.value = context.read<DBService>().getVersion;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isRu = EasyLocalization.of(context)!.locale.languageCode == 'ru';

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            title: Text("settings".tr(), style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${"version".tr()} ${_version.value}"),
          ),
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.shade0,
                ),
                child: Column(
                  children: [
                    HomeListTile(
                      title: "language".tr(),
                      icon: icons.globe,
                      trailing: CustomToggle(
                        height: 32.h,
                        indicatorColor: colors.primary500,
                        backgroundColor: colors.neutral50,
                        indicatorSize: Size.fromWidth(78.w),
                        iconList: [
                          Text(
                            "РУ",
                            style: fonts.captionSemiBold.copyWith(color: isRu ? colors.shade0 : colors.neutral700),
                            semanticsLabel: "РУ",
                          ),
                          Text(
                            "UZ",
                            style: fonts.captionSemiBold.copyWith(color: !isRu ? colors.shade0 : colors.neutral700),
                            semanticsLabel: "UZ",
                          ),
                        ],
                        onChanged: (bool value) {
                          EasyLocalization.of(context)!.setLocale(
                            value ? const Locale('ru', 'RU') : const Locale('uz', 'UZ'),
                          );
                          setState(() {});
                        },
                        current: isRu,
                        values: const [true, false],
                      ),
                    ),
                    Divider(color: colors.backgroundColor, thickness: 2),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: settingsData.length,
                      itemBuilder: (context, index) {
                        return _buildNavItem(
                          context: context,
                          data: settingsData[index],
                          isLastItem: index == settingsData.length - 1,
                          onTap: () => _handleNavTap(context, index, colors, fonts),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildNavItem({
    required BuildContext context,
    required Map<String, dynamic> data,
    required bool isLastItem,
    required VoidCallback onTap,
  }) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        final String title = data["title"];
        return Column(
          children: [
            AnimationButtonEffect(
              onTap: onTap,
              child: ListTile(
                leading: SvgPicture.asset(data['icon']),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title.tr(), style: fonts.regularLink),
                  ],
                ),
                trailing: icons.right.svg(
                  width: 20.w,
                  height: 20.h,
                  color: const Color(0xFFDEDEDE),
                ),
              ),
            ),
            if (!isLastItem) Divider(color: colors.backgroundColor, thickness: 2),
          ],
        );
      },
    );
  }

  void _handleNavTap(
    BuildContext context,
    int index,
    CustomColorSet colors,
    FontSet fonts,
  ) {
    // void setNavBarState(bool state) {
    //   if (mounted) {
    //     context.read<BottomNavBarController>().changeNavBar(state);
    //   }
    // }

    if (index == 0) {
      makePhoneCall("+998781400010");
    } else if (index == 1) {
      // setNavBarState(true);
      showModalBottomSheet(
        context: context,
        builder: (item) => CBottomsheetProfile(
          onTapBack: () => Navigator.of(context).pop(),
          onTapLogOut: () async {
            context.read<DBService>().setLang(isSaved: false);
            context.read<DBService>().signOut();
            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
              AppRoutes.getSignUpPage(),
              (Route<dynamic> route) => false,
            );
          },
        ),
      );
    } else {
      context.showPopUp(
        status: PopUpStatus.warning,
        message: "message",
        fonts: fonts,
        colors: colors,
        context: context,
      );
    }
  }
}
