import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/pages/others/about_health/component/item_about_health.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/equipment/equipment_detail_page.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_enum.dart';
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
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "equipment"));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "equipment"));
    _refreshController.refreshCompleted();
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
            title: Text("equipment".tr(), style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<ContentBloc, ContentState>(
            buildWhen: (o, n) {
              final status = o.fetchContentStatus != n.fetchContentStatus;
              return status;
            },
            builder: (context, state) {
              if (state.fetchContentStatus.isInitial || state.fetchContentStatus.isInProgress) {
                return const Center(
                  child: CircularProgressIndicator(color: Style.error500),
                );
              }

              if (state.fetchContentStatus.isFailure) {
                return Center(
                  child: Text(
                    'something_went_wrong'.tr(),
                    style: fonts.regularSemLink,
                  ),
                );
              }

              final equipmentContent = state.contentByType["equipment"] ?? [];

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
                enablePullDown: true,
                header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: equipmentContent.length,
                  itemBuilder: (context, index) {
                    final data = equipmentContent[index];
                    return ItemAboutHealth(
                      type: ContentEnum.equipments,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EquipmentDetailPage(content: data),
                          ),
                        );
                      },
                      imagePath: data.primaryImage,
                      title: data.decodedTitle,
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
