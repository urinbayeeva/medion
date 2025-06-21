import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "article"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
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
            title: Text("articles".tr(), style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<ContentBloc, ContentState>(
            builder: (context, state) {
              if (state.loading) return const Center(child: CupertinoActivityIndicator());

              if (state.error) {
                return Center(child: Text('something_went_wrong'.tr(), style: fonts.regularSemLink));
              }

              final articles = state.contentByType["article"] ?? [];

              if (articles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons.emojiSad.svg(width: 80.w, height: 80.h),
                      4.h.verticalSpace,
                      Text('no_result_found'.tr(), style: fonts.regularSemLink),
                    ],
                  ),
                );
              }

              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  12.h.verticalSpace,
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return ArticleCardWidget(
                        onTap: () => Navigator.push(
                          context,
                          AppRoutes.getInfoViewAboutHealth(
                            discountCondition: "",
                            date: article.createDate,
                            imagePath: [...article.images, article.primaryImage],
                            title: article.title,
                            desc: article.decodedDescription,
                          ),
                        ),
                        title: article.title,
                        description: article.decodedDescription,
                        image: article.primaryImage,
                      );
                    },
                  ),
                  40.h.verticalSpace,
                ],
              );
            },
          ),
        );
      },
    );
  }
}
