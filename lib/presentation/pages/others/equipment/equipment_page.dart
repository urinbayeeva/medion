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
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "equipment"));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "equipment"));
    _refreshController.refreshCompleted();
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

                  final equipmentContent =
                      state.contentByType["equipment"] ?? [];

                  if (equipmentContent.isEmpty) {
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
                    onRefresh: _onRefresh,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Parent equipment items
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            itemCount: equipmentContent.length,
                            itemBuilder: (context, index) {
                              final data = equipmentContent[index];
                              return ItemAboutHealth(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    AppRoutes.getInfoViewAboutHealth(
                                      discountCondition: "",
                                      date: data.createDate,
                                      imagePath: data.images.toList(),
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

                          // Child equipment items
                          if (equipmentContent.isNotEmpty &&
                              equipmentContent[0].children.isNotEmpty)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemCount: equipmentContent[0].children.length,
                              itemBuilder: (context, index) {
                                final childData =
                                    equipmentContent[0].children[index];
                                return ItemAboutHealth(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      AppRoutes.getInfoViewAboutHealth(
                                        discountCondition: "",
                                        imagePath: equipmentContent[index]
                                            .images
                                            .toList(),
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
