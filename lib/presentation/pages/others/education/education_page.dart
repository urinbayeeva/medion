import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/pages/others/education/widgets/study_info_card.dart';
import 'package:medion/presentation/pages/others/our_activity/component/pattern_background.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  void initState() {
    super.initState();
    context.read<BranchBloc>().add(const BranchEvent.fetchStudy());
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "education".tr(),
                centerTitle: true,
                isBack: true,
                trailing: 24.w.horizontalSpace,
              ),
              Expanded(
                child: BlocBuilder<BranchBloc, BranchState>(
                  builder: (context, state) {
                    List<Map<String, dynamic>> _getStudyItems(
                        BranchState state) {
                      return [
                        {
                          'title': "mission".tr(),
                          'image': "assets/icons/goal.svg",
                          'data': state.study?.mission,
                        },
                        {
                          'title': "values".tr(),
                          'image': "assets/icons/heartbeat.svg",
                          'data': state.study?.values,
                        },
                        {
                          'title': "goals".tr(),
                          'image': "assets/icons/flag_red.svg",
                          'data': state.study?.goals,
                        },
                        {
                          'title': "audience".tr(),
                          'image': "assets/icons/group_red.svg",
                          'data': state.study?.audience,
                        },
                        {
                          'title': "why_us".tr(),
                          'image': "assets/icons/stethoscope copy.svg",
                          'data': state.study?.whyUs,
                        },
                      ];
                    }

                    final studyItems = _getStudyItems(state);
                    // if (state) {
                    //   return const Center(child: CircularProgressIndicator());
                    // }

                    if (state.study == null ||
                        state.study!.courses == null ||
                        state.study!.courses!.isEmpty) {
                      return Center(
                        child: Text(
                          "no_result_found".tr(),
                          style: fonts.regularMain,
                        ),
                      );
                    }

                    return ListView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      children: [
                        SizedBox(
                          height: 100.h,
                          child: PatternBackground(
                            patternTitle: state.study?.description ??
                                "No description available",
                          ),
                        ),
                        12.h.verticalSpace,
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.study!.courses!.length,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final studyInfo = state.study!.courses![index];
                              return StudyInfoCard(
                                title: studyInfo.name ?? "No Title",
                                description:
                                    studyInfo.description ?? "No Description",
                                imagePath: studyInfo.image ?? "",
                                moreInfoOnTap: () {},
                                applyOnTap: () {},
                              );
                            },
                          ),
                        ),
                        24.h.verticalSpace,
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: studyItems.length,
                          itemBuilder: (context, index) {
                            final item = studyItems[index];
                            return CustomExpansionListTile(
                              hasIcon: item['image'],
                              title: item['title'],
                              description: "", // You can modify this if needed
                              children: [
                                Text(
                                  item['data'] ?? "No data available",
                                  style: fonts.smallLink,
                                ),
                              ],
                            );
                          },
                        ),
                        24.h.verticalSpace,
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> image = [
  "assets/icons/goal.svg",
  "assets/icons/heartbeat.svg",
  "assets/icons/flag_red.svg",
  "assets/icons/group_red.svg",
  "assets/icons/stethoscope copy.svg"
];

List<String> title = [
  "mission".tr(),
  "values".tr(),
  "goals".tr(),
  "audience".tr(),
  "why_us".tr(),
];
