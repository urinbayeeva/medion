import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("5 звёзд от ассоциации медицинского туризма"),
                      8.h.verticalSpace,
                      Row(
                        children: [
                          icons.calendar.svg(width: 12.w, height: 12.h),
                          4.w.horizontalSpace,
                          Text("Июль 6, 2022"),
                        ],
                      )
                    ],
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
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: CircleAvatar(
              backgroundColor: colors.shade0,
              radius: 20.r,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
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
              radius: 20.r,
              child: IconButton(
                icon: Icon(Icons.share, color: Colors.black),
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
