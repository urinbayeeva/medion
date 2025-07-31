import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/about_health/component/item_about_health.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_enum.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AboutHealthPage extends StatefulWidget {
  const AboutHealthPage({super.key});

  @override
  State<AboutHealthPage> createState() => _AboutHealthPageState();
}

class _AboutHealthPageState extends State<AboutHealthPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "blog_health"));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "blog_health"));
    _refreshController.refreshCompleted();
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
            title: Text("about_health".tr(), style: fonts.regularMain),
          ),
          body: BlocBuilder<ContentBloc, ContentState>(
            buildWhen: (o, n) {
              final status = o.fetchContentStatus != n.fetchContentStatus;
              return status;
            },
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Style.error500,
                  ),
                );
              }

              if (state.error) {
                return Center(
                  child: Text(
                    'something_went_wrong'.tr(),
                    style: fonts.regularSemLink,
                  ),
                );
              }

              // Use contentByType["blog_health"] instead of state.content
              final blogHealthContent = state.contentByType["blog_health"] ?? [];

              if (blogHealthContent.isEmpty) {
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
                onRefresh: _onRefresh,
                controller: _refreshController,
                enablePullDown: true,
                header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: blogHealthContent.length,
                  itemBuilder: (context, index) {
                    final data = blogHealthContent[index];
                    return ItemAboutHealth(
                      onTap: () {
                        Navigator.push(
                          context,
                          AppRoutes.getInfoViewAboutHealth(id: data.id, type: ContentTypeEnum.blogHealth
                              // discountCondition: "",
                              // date: data.createDate,
                              // imagePath: [...data.images, data.primaryImage],
                              // title: data.title,
                              // desc: data.description,
                              ),
                        );
                      },
                      descMaxLine: 4,
                      time: data.createDate,
                      type: ContentEnum.aboutHealth,
                      imagePath: data.primaryImage,
                      title: data.title,
                      desc: data.decodedDescription,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
