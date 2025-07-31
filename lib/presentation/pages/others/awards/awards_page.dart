import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/about_health/component/item_about_health.dart';
import 'package:medion/presentation/pages/others/about_health/sources/about_healt_data.dart';
import 'package:medion/presentation/pages/others/awards/sources/data_awards.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_enum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AwardsPage extends StatefulWidget {
  const AwardsPage({super.key});

  @override
  State<AwardsPage> createState() => _AwardsPageState();
}

class _AwardsPageState extends State<AwardsPage> {
  @override
  void initState() {
    super.initState();
    context.read<BranchBloc>().add(const BranchEvent.fetchAwards());
  }

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
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
            title: Text("achievments".tr(), style: fonts.regularMain),
          ),
          body: BlocBuilder<BranchBloc, BranchState>(
            buildWhen: (o, n) {
              final status = o.awardStatus != n.awardStatus;
              final awards = o.awards != n.awards;
              return awards || status;
            },
            builder: (context, state) {
              if (state.awardStatus.isInitial || state.awardStatus.isInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.awards.isEmpty || state.awardStatus.isFailure) {
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
              return CustomListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                refreshController: refreshController,
                onRefresh: () {
                  setState(() {});
                  context.read<BranchBloc>().add(const BranchEvent.fetchAwards());
                  refreshController.refreshCompleted();
                },
                itemBuilder: (int index, item) {
                  final data = state.awards[index];
                  return IgnorePointer(
                    ignoring: true,
                    child: ItemAboutHealth(
                      descMaxLine: 4,
                      type: ContentEnum.awards,
                      imageSize: 279.h,
                      title: data.decodedTitle,
                      desc: data.decodedDescription,
                      imagePath: data.image ?? '',
                    ),
                  );
                },
                data: state.awards,
                emptyWidgetModel: ErrorWidgetModel(title: "", subtitle: ''),
                status: FormzSubmissionStatus.success,
              );
            },
          ),
        );
      },
    );
  }
}
