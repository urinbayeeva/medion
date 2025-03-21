import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
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
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "article"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, contrller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "articles".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                if (state.error) {
                  return Center(
                      child: Text('something_went_wrong'.tr(),
                          style: fonts.regularSemLink));
                }

                if (state.content.isEmpty) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons.emojiSad.svg(width: 80.w, height: 80.h),
                      4.h.verticalSpace,
                      Text('no_result_found'.tr(), style: fonts.regularSemLink),
                    ],
                  ));
                }

                return Column(
                  children: [
                    12.h.verticalSpace,
                    SizedBox(
                      height: 300.h,
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: state.content.length,
                        itemBuilder: (context, index) {
                          final article = state.content[index];
                          return ArticleCardWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  AppRoutes.getInfoViewAboutHealth(
                                      date: article.createDate,
                                      imagePath: article.primaryImage,
                                      title: article.title,
                                      desc: article.description));
                            },
                            title: article.title,
                            description: article.description,
                            image: article.primaryImage,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}
