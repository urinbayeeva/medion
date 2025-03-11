import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/about_health/component/item_about_health.dart';
import 'package:medion/presentation/pages/others/about_health/sources/about_healt_data.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AboutHealthPage extends StatefulWidget {
  const AboutHealthPage({super.key});

  @override
  State<AboutHealthPage> createState() => _AboutHealthPageState();
}

class _AboutHealthPageState extends State<AboutHealthPage> {
  @override
  void initState() {
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "blog_health"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "about_health".tr(),
              centerTitle: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(child: BlocBuilder<ContentBloc, ContentState>(
                builder: (context, state) {
              if (state.error) {
                return Center(
                    child: Text('something_went_wrong'.tr(),
                        style: fonts.regularSemLink));
              }
              return CustomListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                refreshController: refreshController,
                onRefresh: () {
                  setState(() {});
                  refreshController.refreshCompleted();
                },
                itemBuilder: (int index, item) {
                  final data = state.content[index];
                  return ItemAboutHealth(
                    onTap: () {
                      Navigator.push(
                          context,
                          AppRoutes.getInfoViewAboutHealth(
                            date: data.createDate,
                            imagePath: data.primaryImage,
                            title: data.title,
                            desc: data.description,
                          ));
                    },
                    imagePath: data.primaryImage,
                    title: data.title,
                    desc: data.description,
                  );
                },
                data: state.content,
                emptyWidgetModel:
                    ErrorWidgetModel(title: "title", subtitle: 'subtitle'),
                status: FormzSubmissionStatus.success,
              );
            }))
          ],
        ),
      );
    });
  }
}
