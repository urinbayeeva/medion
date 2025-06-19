import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/pages/others/education/widgets/study_info_card.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    List<Map<String, dynamic>> _getStudyItems(BranchState state) {
                      return [
                        {
                          'title': "mission".tr(),
                          'image': "assets/icons/goal.svg",
                          'data': state.study?.decodedMission,
                        },
                        {
                          'title': "values".tr(),
                          'image': "assets/icons/heartbeat.svg",
                          'data': state.study?.decodedValues,
                        },
                        {
                          'title': "goals".tr(),
                          'image': "assets/icons/flag_red.svg",
                          'data': state.study?.decodedGoals,
                        },
                        {
                          'title': "audience".tr(),
                          'image': "assets/icons/group_red.svg",
                          'data': state.study?.decodedAudience,
                        },
                        {
                          'title': "why_us".tr(),
                          'image': "assets/icons/stethoscope copy.svg",
                          'data': state.study?.decodedWhyUs,
                        },
                      ];
                    }

                    // Show shimmer when loading
                    if (state.loading) {
                      return _buildShimmerLoading(colors, fonts);
                    }

                    final studyItems = _getStudyItems(state);

                    // if (state.study == null ||
                    //     state.study!.courses == null ||
                    //     state.study!.courses!.isEmpty) {
                    //   return Center(
                    //     child: Text(
                    //       "no_result_found".tr(),
                    //       style: fonts.regularMain,
                    //     ),
                    //   );
                    // }

                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        if (state.study?.bannerImage != null && state.study!.bannerImage!.isNotEmpty) ...[
                          Stack(
                            children: [
                              // Background image
                              CachedNetworkImage(
                                imageUrl: state.study?.bannerImage ?? '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 250.h, // Adjust as needed
                              ),

                              // Black blur overlay
                              Container(
                                width: double.infinity,
                                height: 250.h,
                                color: Colors.black.withOpacity(0.5),
                              ),

                              // Centered text
                              Positioned.fill(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          state.study?.name ?? "",
                                          style: fonts.regularMain.copyWith(
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        8.h.verticalSpace,
                                        Text(
                                          state.study?.decodedDescription ?? "",
                                          style: fonts.regularLink.copyWith(
                                            color: Colors.white70,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        8.h.verticalSpace,
                                        CButton(
                                          backgroundColor: colors.neutral400,
                                          textColor: colors.primary900,
                                          onTap: () async {
                                            await launchUrl(Uri.parse(state.study!.bannerLink ?? ""));
                                          },
                                          title: "open_our_web".tr(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        12.h.verticalSpace,
                        if ((state.study?.courses?.length ?? 0) != 0) ...[
                          ListView.builder(
                            itemCount: state.study?.courses?.length ?? 0,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final studyInfo = state.study?.courses?[index];
                              return StudyInfoCard(
                                title: studyInfo?.name ?? "",
                                description: studyInfo?.description ?? "No Description",
                                imagePath: studyInfo?.image ?? "",
                                moreInfoOnTap: () {},
                                applyOnTap: () {},
                              );
                            },
                          ),
                        ],
                        24.h.verticalSpace,
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: studyItems.length,
                          itemBuilder: (context, index) {
                            final item = studyItems[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: CustomExpansionListTile(
                                hasIcon: item['image'],
                                title: item['title'],
                                description: "", // You can modify this if needed
                                children: [
                                  Text(
                                    item['data'] ?? "no_result_found".tr(),
                                    style: fonts.smallLink,
                                  ),
                                ],
                              ),
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

  Widget _buildShimmerLoading(colors, fonts) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: [
        12.h.verticalSpace,
        Shimmer.fromColors(
          baseColor: colors.neutral200,
          highlightColor: colors.neutral100,
          child: Container(
            height: 24.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: colors.neutral200,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        4.h.verticalSpace,
        Shimmer.fromColors(
          baseColor: colors.neutral200,
          highlightColor: colors.neutral100,
          child: Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.neutral200,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        12.h.verticalSpace,
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            // Show 3 shimmer cards for courses
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: colors.neutral200,
                highlightColor: colors.neutral100,
                child: Container(
                  height: 120.h,
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                    color: colors.neutral200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              );
            },
          ),
        ),
        24.h.verticalSpace,
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          // Show shimmer for all 5 expansion tiles
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: colors.neutral200,
              highlightColor: colors.neutral100,
              child: Container(
                height: 60.h,
                margin: EdgeInsets.only(bottom: 8.h),
                decoration: BoxDecoration(
                  color: colors.neutral200,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
          },
        ),
        24.h.verticalSpace,
      ],
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
