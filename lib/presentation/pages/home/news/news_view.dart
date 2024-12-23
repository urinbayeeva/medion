import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late ScrollController scrollController;
  late String currency;

  List<dynamic> news = [];
  bool isLoading = true;

  @override
  void initState() {
    scrollController = ScrollController();
    fetchNews();
    super.initState();
  }

  Future<void> fetchNews() async {
    final url = Uri.parse("https://his.uicgroup.tech/apiweb/home/news");
    try {
      final response = await http.get(
        url,
        headers: {
          "Accept-Language": "ru_RU",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          news = data;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load news")),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SmartRefresher(
                  controller: _refreshController,
                  onRefresh: () async {
                    await fetchNews();
                    _refreshController.refreshCompleted();
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverPersistentHeader(
                        delegate: MySliverAppBar(
                          expandedHeight: 350,
                          imageUrl: 'assets/images/news_first.png',
                        ),
                        pinned: true,
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: news.length,
                          (_, index) {
                            final item = news[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8.h),
                                  Text(
                                    item["title"] ?? "No title",
                                    style: fonts.mediumMain.copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    item["info"] ?? "No info available",
                                    style: fonts.smallLink.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 12.h),
                                  item["image"] != null
                                      ? Image.network(
                                          item["image"],
                                          fit: BoxFit.cover,
                                        )
                                      : SizedBox.shrink(),
                                  SizedBox(height: 120.h),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
