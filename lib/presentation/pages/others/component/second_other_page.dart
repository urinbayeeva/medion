import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class SecondOthersPage extends StatelessWidget {
  final List data;

  const SecondOthersPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          // padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(8.r),
            border: Border(
              bottom: BorderSide(width: 1, color: colors.neutral400),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Column(
                children: [
                  AnimationButtonEffect(
                    onTap: () {
                      final bottomNavBarController = context.read<BottomNavBarController>();
                      bottomNavBarController.changeNavBar(true);

                      Future<void> navigateTo(Route route) {
                        return Navigator.push(context, route).then((_) => bottomNavBarController.changeNavBar(false));
                      }

                      switch (index) {
                        case 0:
                          navigateTo(AppRoutes.getDiscountPage());
                          break;
                        case 1:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ThemeWrapper(
                                builder: (context, colors, fonts, icons, controller) {
                                  return Scaffold(
                                    backgroundColor: colors.backgroundColor,
                                    body: Column(
                                      children: [
                                        CAppBar(
                                          title: item['title'],
                                          centerTitle: true,
                                          isBack: true,
                                          trailing: 24.w.horizontalSpace,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                          break;

                        default:
                          navigateTo(AppRoutes.getUnderDevPage(appBarTitle: item["title"]));
                          break;
                      }
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(item['icon']),
                      title: Text(item['title'], style: fonts.smallLink),
                    ),
                  ),
                  if (index != data.length - 1) Divider(color: colors.neutral400, height: 1),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
