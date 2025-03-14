import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/about_health/component/item_about_health.dart';
import 'package:medion/presentation/pages/others/about_health/sources/about_healt_data.dart';
import 'package:medion/presentation/pages/others/equipment/sources/data_equipment.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  // Separate RefreshControllers for each CustomListView
  final RefreshController _refreshController1 = RefreshController();
  final RefreshController _refreshController2 = RefreshController();

  @override
  void initState() {
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "equipment"));
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controllers to prevent memory leaks
    _refreshController1.dispose();
    _refreshController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "equipment".tr(),
              isBack: true,
              centerTitle: true,
              bordered: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: BlocBuilder<ContentBloc, ContentState>(
                builder: (context, state) {
                  if (state.error) {
                    return Center(
                      child: Text(
                        'something_went_wrong'.tr(),
                        style: fonts.regularSemLink,
                      ),
                    );
                  }
                  if (state.content.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        // First ListView: Parent equipment items
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: state.content.length,
                          itemBuilder: (context, index) {
                            final data = state.content[index];
                            return ItemAboutHealth(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  AppRoutes.getInfoViewAboutHealth(
                                    date: data.createDate,
                                    imagePath: data.primaryImage,
                                    title: data.decodedTitle,
                                    desc: data.decodedDescription,
                                  ),
                                );
                              },
                              imagePath: data.primaryImage,
                              title: data.decodedTitle,
                              desc: data.decodedDescription,
                            );
                          },
                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: state.content[0].children.length,
                          itemBuilder: (context, index) {
                            final childData = state.content[0].children[index];
                            return ItemAboutHealth(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  AppRoutes.getInfoViewAboutHealth(
                                    imagePath: childData.primaryImage,
                                    date: childData.createDate,
                                    title: childData.decodedTitle,
                                    desc: childData.decodedDescription,
                                  ),
                                );
                              },
                              imagePath: childData.primaryImage,
                              title: childData.decodedTitle,
                              desc: childData.decodedDescription,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
