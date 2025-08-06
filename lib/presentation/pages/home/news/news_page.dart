import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/pages/home/news/widgets/news_item.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "news"));
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("news".tr(), style: fonts.regularMain),
          ),
          body: BlocBuilder<ContentBloc, ContentState>(
            buildWhen: (o, n) {
              final content = o.contentByType != n.contentByType;
              final status = o.fetchContentStatus != n.fetchContentStatus;
              return content || status;
            },
            builder: (context, state) {
              if (state.fetchContentStatus.isInitial || state.fetchContentStatus.isInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.fetchContentStatus.isFailure) {
                return Center(
                  child: Text('something_went_wrong'.tr(), style: fonts.regularSemLink),
                );
              }

              final newsContent = state.contentByType["news"] ?? [];

              if (newsContent.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons.emojiSad.svg(width: 80.w, height: 80.h),
                      4.h.verticalSpace,
                      Text(
                        'no_result_found'.tr(),
                        style: fonts.regularSemLink,
                      ),
                    ],
                  ),
                );
              }

              return SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                onRefresh: _onRefresh,
                child: GridView.builder(
                  padding: EdgeInsets.all(8.w),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2.3 / 3,
                  ),
                  itemBuilder: (context, index) {
                    final item = newsContent[index];
                    return NewsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          AppRoutes.getInfoViewAboutHealth(
                            id: item.id,
                            type: ContentTypeEnum.news,
                          ),
                        );
                      },
                      crop: true,
                      imagePath: item.primaryImage,
                      title: item.decodedTitle,
                      subtitle: item.decodedDescription,
                    );
                  },
                  itemCount: newsContent.length,
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "news"));
    _refreshController.refreshCompleted();
  }
}
