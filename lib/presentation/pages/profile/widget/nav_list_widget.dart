import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/profile/widget/nav_list_data.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class NavListWidget extends StatelessWidget {
  const NavListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: colors.shade0),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: navListData.length,
            itemBuilder: (context, item) {
              final data = navListData[item];
              return Column(
                children: [
                  AnimationButtonEffect(
                      onTap: () {},
                      child: ListTile(
                        leading: SvgPicture.asset(data['icon']),
                        title: Text(data['title'], style: fonts.regularLink),
                        trailing: icons.right.svg(
                            width: 20.w,
                            height: 20.h,
                            color: const Color(0xFFDEDEDE)),
                      )),
                  if (item != data.length - 3)
                    Divider(
                      color: colors.neutral400,
                      height: 1,
                    ),
                ],
              );
            }),
      );
    });
  }
}
