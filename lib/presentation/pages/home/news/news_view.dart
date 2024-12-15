import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: MySliverAppBar(
                  expandedHeight: 300,
                  imageUrl: 'assets/images/news_first.png',
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 1, (_, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.h.verticalSpace,
                        Text("5 звёзд от ассоциации медицинского туризма",
                            style: fonts.mediumMain),
                        8.h.verticalSpace,
                        Row(
                          children: [
                            icons.calendar.svg(width: 12.w, height: 12.h),
                            4.w.horizontalSpace,
                            Text("Июль 6, 2022", style: fonts.xSmallMain),
                          ],
                        ),
                        12.h.verticalSpace,
                        Text(Constants.newsText,
                            style: fonts.smallLink.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w400)),
                        100.h.verticalSpace,
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String imageUrl;

  MySliverAppBar({required this.expandedHeight, required this.imageUrl});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double opacity = 1 - (shrinkOffset / expandedHeight);

    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Stack(
        fit: StackFit.expand,
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: CircleAvatar(
              backgroundColor: colors.shade0,
              radius: 18.r,
              child: IconButton(
                icon: icons.left.svg(width: 24.w, height: 24.h),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: CircleAvatar(
              backgroundColor: colors.shade0,
              radius: 18.r,
              child: IconButton(
                icon: icons.share.svg(width: 24.w, height: 24.h),
                onPressed: () {
                  // Implement share functionality here
                },
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
