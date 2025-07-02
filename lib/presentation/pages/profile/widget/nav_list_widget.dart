import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_data.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:medion/presentation/component/c_bottomsheet_profile.dart';

class NavListWidget extends StatefulWidget {
  final List? data;
  final List? routes;
  final BuildContext context;

  const NavListWidget({super.key, this.data, this.routes, required this.context});

  @override
  State<NavListWidget> createState() => _NavListWidgetState();
}

class _NavListWidgetState extends State<NavListWidget> {
  late DBService dbService;

  @override
  void initState() {
    super.initState();
    _initDbService();
  }

  Future<void> _initDbService() async {
    dbService = context.read<DBService>();
    // dbService = await DBService.create;
  }

  @override
  Widget build(BuildContext x) {
    final resolvedData = widget.data ?? navListData;

    return ThemeWrapper(builder: (ct, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: resolvedData.length,
          itemBuilder: (ctx, index) {
            return _buildNavItem(
              data: resolvedData[index],
              isLastItem: index == resolvedData.length - 1,
              onTap: () => _handleNavTap(widget.context, index, resolvedData.length),
            );
          },
        ),
      );
    });
  }

  Widget _buildNavItem({
    required Map<String, dynamic> data,
    required bool isLastItem,
    required VoidCallback onTap,
  }) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Column(
          children: [
            AnimationButtonEffect(
              onTap: onTap,
              child: ListTile(
                leading: SvgPicture.asset(data['icon']),
                title: Text(data['title'], style: fonts.regularLink),
                trailing: icons.right.svg(
                  width: 20.w,
                  height: 20.h,
                  color: const Color(0xFFDEDEDE),
                ),
              ),
            ),
            if (!isLastItem) Divider(color: colors.neutral400, height: 1),
          ],
        );
      },
    );
  }

  void _handleNavTap(BuildContext context, int index, int totalItems) {
    context.read<BottomNavBarController>().changeNavBar(true);
    final resolvedRoutes = widget.routes ??
        [
          AppRoutes.getUserDetailsPage(),
          AppRoutes.getResultsPage(),
          AppRoutes.getRecipesPage(),
          AppRoutes.getWalletPage(),
          AppRoutes.getSettingsPage(),
        ];

    if (index < resolvedRoutes.length) {
      Navigator.push(context, resolvedRoutes[index]).then((_) {
        context.read<BottomNavBarController>().changeNavBar(false);
      });
    }
  }

  void _showProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CBottomsheetProfile(
        onTapBack: () {
          context.read<BottomNavBarController>().changeNavBar(false);
          Navigator.pop(context);
        },
        onTapLogOut: () async {
          await dbService.signOut();
          await dbService.setLang(isSaved: false);
          context.read<AuthBloc>().add(const AuthEvent.checkAuth());

          Navigator.of(context, rootNavigator: true)
              .pushAndRemoveUntil(AppRoutes.getLangPage(), (Route<dynamic> route) => false)
              .then((_) {
            context.read<BottomNavBarController>().changeNavBar(false);
          });
        },
      ),
    ).then((_) {
      context.read<BottomNavBarController>().changeNavBar(false);
    });
  }
}
