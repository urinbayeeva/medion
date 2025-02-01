import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/about_health/component/item_about_health.dart';
import 'package:medion/presentation/pages/others/about_health/sources/about_healt_data.dart';
import 'package:medion/presentation/pages/others/awards/sources/data_awards.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AwardsPage extends StatefulWidget {
  const AwardsPage({super.key});

  @override
  State<AwardsPage> createState() => _AwardsPageState();
}

class _AwardsPageState extends State<AwardsPage> {
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "achievments".tr(),
              centerTitle: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: CustomListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                refreshController: refreshController,
                onRefresh: () {
                  setState(() {});
                  refreshController.refreshCompleted();
                },
                itemBuilder: (int index, item) {
                  final data = item;
                  return ItemAboutHealth(
                    imageSize: 279.h,
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     AppRoutes.getInfoViewAboutHealth(
                      //         imagePath: data['image'],
                      //         title: data["title"],
                      //         desc: data['decs']));
                    },
                    title: data['title'],
                    desc: data['decs'],
                    imagePath: data['image'],
                  );
                },
                data: dataAwards,
                emptyWidgetModel:
                    ErrorWidgetModel(title: "title", subtitle: 'subtitle'),
                status: FormzSubmissionStatus.success,
              ),
            )
          ],
        ),
      );
    });
  }
}
