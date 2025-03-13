import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/domain/models/news_model/news_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/home/news/widgets/news_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<ContentBloc>().add(ContentEvent.fetchContent(type: "news"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<ContentBloc, ContentState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                bordered: true,
                title: "news".tr(),
                centerTitle: true,
                trailing: 24.w.horizontalSpace,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(8.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.w,
                    mainAxisSpacing: 8.h,
                    childAspectRatio: 2.3 / 3,
                  ),
                  itemBuilder: (context, index) {
                    final item = state.content[index];
                    return NewsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          AppRoutes.getInfoViewAboutHealth(
                            date: item.createDate,
                            imagePath: item.primaryImage,
                            title: item.decodedTitle,
                            desc: item.decodedDescription,
                          ),
                        );
                      },
                      crop: true,
                      imagePath: item.primaryImage,
                      title: item.decodedTitle,
                      subtitle: item.decodedDescription,
                    );
                  },
                  itemCount: state.content.length,
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
