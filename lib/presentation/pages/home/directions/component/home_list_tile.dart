import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class HomeListTile extends StatelessWidget {
  final String? icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final String? img;
  const HomeListTile({
    super.key,
    this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return ListTile(
        
          minVerticalPadding: 0,
          onTap: onTap,
          leading: icon != null
              ? img != null
                  ? CachedImageComponent(
                      imageUrl: img!,
                      height: 42.r,
                      width: 42.r,
                      borderRadius: 8.r,
                      fit: BoxFit.cover,
                    )
                  : icon!.svg(height: 24.r, width: 24.r)
              : null,
          title: Text(
            semanticsLabel: title,
            title,
            style: Style.regularText(size: 16.sp),
          ),
          trailing: onTap != null
              ? icons.search.svg(
                  height: 24.h,
                  width: 24.h,
                )
              : trailing,
          subtitle: subtitle != null
              ? Text(
                  semanticsLabel: subtitle!,
                  subtitle!,
                  style:
                      Style.regularLink(size: 12.sp, color: colors.neutral500),
                )
              : null,
        );
      },
    );
  }
}
