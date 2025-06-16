import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/others/our_activity/component/history_page.dart';
import 'package:medion/presentation/pages/others/our_activity/component/mission.dart';
import 'package:medion/presentation/pages/others/our_activity/component/our_company.dart';
import 'package:medion/presentation/pages/others/our_activity/component/pattern_background.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class OurActivityPage extends StatefulWidget {
  const OurActivityPage({super.key});

  @override
  State<OurActivityPage> createState() => _OurActivityPageState();
}

class _OurActivityPageState extends State<OurActivityPage> {
  late final BranchBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<BranchBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(const BranchEvent.fetchActivity());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: colors.backgroundColor,
            body: BlocBuilder<BranchBloc, BranchState>(
              buildWhen: (o, n) => o.medionActivity != n.medionActivity,
              builder: (context, state) {
                if (state.activityStatus.isInProgress || state.activityStatus.isInitial) {
                  return Column(
                    children: [
                      CAppBar(
                        bordered: true,
                        title: "our_activities".tr(),
                        isBack: true,
                        centerTitle: true,
                        trailing: 24.w.horizontalSpace,
                      ),
                      const Spacer(flex: 1),
                      const Center(child: CupertinoActivityIndicator()),
                      const Spacer(flex: 1),
                    ],
                  );
                }
                if (state.activityStatus.isFailure) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CAppBar(
                          bordered: true,
                          title: "our_activities".tr(),
                          isBack: true,
                          centerTitle: true,
                          trailing: 24.w.horizontalSpace,
                        ),
                        const Spacer(flex: 1),
                        icons.emojiSad.svg(width: 72.w, height: 72.h),
                        Text(
                          "no_result_found".tr(),
                          style: fonts.headlineSecondary,
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    CAppBar(
                      bordered: true,
                      title: "our_activities".tr(),
                      isBack: true,
                      centerTitle: true,
                      trailing: 24.w.horizontalSpace,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PatternBackground(patternTitle: state.medionActivity?.description ?? ''),
                          const CDivider(padding: false),
                          CustomTabbarBlack(tabs: ["about_the_company".tr(), "history".tr(), "mission".tr()]),
                          Expanded(
                            child: TabBarView(
                              children: [
                                OurCompany(fonts: fonts, title: state.medionActivity?.about ?? ""),
                                History(fonts: fonts, title: state.medionActivity?.history ?? ""),
                                Mission(fonts: fonts, title: state.medionActivity?.mission ?? ""),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
