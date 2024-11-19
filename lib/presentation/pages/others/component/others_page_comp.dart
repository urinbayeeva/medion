import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class OthersPageComp extends StatelessWidget {
  final List data;
  const OthersPageComp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
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
                  onTap: () {},
                  child: ListTile(
                    leading: SvgPicture.asset(item['icon']),
                    title: Text(
                      item['title'],
                    ),
                  ),
                ),
                if (index != data.length - 1)
                  Divider(
                    color: colors.neutral400,
                    height: 1,
                  ),
              ],
            );
          },
        ),
      );
    });
  }
}
