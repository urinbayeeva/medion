import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/sources/news_data.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/home/news/widgets/news_item.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 56),
            child: CAppBar(
              bordered: true,
              title: "Новости",
              centerTitle: true,
              trailing: 24.w.horizontalSpace,
            )),
        body: GridView.builder(
          padding: EdgeInsets.all(8.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 3 / 5,
          ),
          itemCount: newsData.length,
          itemBuilder: (context, index) {
            final item = newsData[index];
            return NewsItem(
              imagePath: item['image'],
              title: item['title'],
              subtitle: item['subtitle'],
            );
          },
        ),
      );
    });
  }
}
