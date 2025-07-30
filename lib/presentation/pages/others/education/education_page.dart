import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hive/hive.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/education/widgets/study_info_card.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
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
            title: Text("education".tr(), style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<BranchBloc, BranchState>(
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
              if (state.loading) return _buildShimmerLoading(colors, fonts);

              final studyItems = _getStudyItems(state);

              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  if (state.study?.bannerImage != null && state.study?.bannerLink != null) ...{
                    DecoratedBox(
                      decoration: BoxDecoration(color: colors.shade0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 190.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CommonImage(
                                  height: 188.h,
                                  width: 1.sw,
                                  imageUrl: state.study!.bannerImage ?? '',
                                ),
                                Positioned(
                                  bottom: 12.h,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    child: CButton(
                                      title: "",
                                      onTap: () {
                                        MyFunctions.openLink(state.study?.bannerLink ?? '');
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "podrobno".tr(),
                                              style: fonts.xSmallLink.copyWith(
                                                color: colors.shade0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            icons.linkIcon.svg(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 12.w),
                            //   child: Expanded(
                            //     child: Text(
                            //       state.study?.name ?? "",
                            //       style: fonts.smallText.copyWith(fontWeight: FontWeight.w400),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    )
                  },

                  1.h.verticalSpace,
                  if (state.study?.decodedDescription != null && state.study!.decodedDescription.isNotEmpty) ...{
                    Container(
                      decoration: BoxDecoration(
                        color: colors.shade0,
                        image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                          fit: BoxFit.contain,
                          image: AssetImage(icons.pattern),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.study?.decodedDescription ?? '',
                            style: fonts.xSmallMain,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  },
                  // if (state.study?.name != null && state.study!.name!.isNotEmpty) ...[
                  //   Stack(
                  //     children: [
                  //       CommonImage(
                  //         imageUrl: state.study!.bannerLink!,
                  //         fit: BoxFit.cover,
                  //         errorImageAsset: icons.medionIcon,
                  //         width: double.infinity,
                  //       ),
                  //       Positioned(
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             color: Colors.black.withValues(alpha: 0.3),
                  //           ),
                  //           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  //           height: MediaQuery.of(context).size.height * 0.7,
                  //           child: Center(
                  //             child: Column(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 Text(
                  //                   state.study?.name ?? "",
                  //                   style: fonts.regularMain.copyWith(color: Colors.white),
                  //                   textAlign: TextAlign.center,
                  //                 ),
                  //                 8.h.verticalSpace,
                  //                 Text(
                  //                   state.study?.decodedDescription ?? "",
                  //                   style: fonts.regularLink.copyWith(color: Colors.white70),
                  //                   textAlign: TextAlign.center,
                  //                   maxLines: 15,
                  //                   overflow: TextOverflow.ellipsis,
                  //                 ),
                  //                 const Spacer(),
                  //                 CButton(
                  //                   backgroundColor: colors.neutral400,
                  //                   textColor: colors.primary900,
                  //                   onTap: () async {
                  //                     final link =
                  //                         (state.study?.bannerLink != null || state.study!.bannerLink!.isNotEmpty)
                  //                             ? state.study!.bannerLink!
                  //                             : "https://medion.uz";
                  //                     await launchUrl(Uri.parse(link));
                  //                   },
                  //                   title: "open_our_web".tr(),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ],
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
                          moreInfoOnTap: () async {
                            final patient = context.read<AuthBloc>().state.patientInfo;
                            if (patient != null) {
                              showMoreInfoDialog(
                                bloc: context.read<BranchBloc>(),
                                patient: patient,
                                id: studyInfo?.id ?? -1,
                              );
                            } else {
                              context.showPopUp(
                                status: PopUpStatus.error,
                                message: "User not found",
                                fonts: fonts,
                                colors: colors,
                                context: context,
                              );
                            }
                          },
                          applyOnTap: () {
                            final info = context.read<AuthBloc>().state.patientInfo;
                            if (info != null) {
                              showApply(
                                id: studyInfo?.id ?? -1,
                                info: info,
                                bloc: context.read<BranchBloc>(),
                              );
                            }
                          },
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
        ListView.builder(
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

  void showMoreInfoDialog({
    required PatientInfo patient,
    required BranchBloc bloc,
    required int id,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      useSafeArea: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: StudyLeadWidget(
              id: id,
              patient: patient,
              bloc: bloc,
              apply: () {
                showApply(info: patient, bloc: bloc, id: id);
              },
            ),
          ),
        );
      },
    );
  }

  void showApply({
    required PatientInfo info,
    required BranchBloc bloc,
    required int id,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      useSafeArea: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Apply(info: info, bloc: bloc, id: id),
          ),
        );
      },
    );
  }
}

class Apply extends StatefulWidget {
  const Apply({
    super.key,
    required this.info,
    required this.bloc,
    required this.id,
  });

  final PatientInfo info;
  final BranchBloc bloc;
  final int id;

  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  late final ValueNotifier<String> _nameNotifier;
  late final ValueNotifier<String> _phoneNotifier;
  late final ValueNotifier<String> _lastNameNotifier;

  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _lastNameCtrl;
  late final FocusNode _nameFocus;
  late final FocusNode _lastNameFocus;
  late final FocusNode _phoneFocus;

  @override
  void initState() {
    _nameCtrl = TextEditingController(text: widget.info.firstName ?? '');
    _phoneCtrl = TextEditingController(text: widget.info.phoneNumber ?? '');
    _lastNameCtrl = TextEditingController(text: widget.info.lastName ?? '');
    _nameNotifier = ValueNotifier(_nameCtrl.text);
    _phoneNotifier = ValueNotifier(_phoneCtrl.text);
    _lastNameNotifier = ValueNotifier(_lastNameCtrl.text);
    _nameFocus = FocusNode();
    _phoneFocus = FocusNode();
    _lastNameFocus = FocusNode();

    _nameCtrl.addListener(() {
      _nameNotifier.value = _nameCtrl.text;
    });
    _phoneCtrl.addListener(() {
      _phoneNotifier.value = _phoneCtrl.text;
    });
    _lastNameCtrl.addListener(() {
      _lastNameNotifier.value = _lastNameCtrl.text;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<BranchBloc, BranchState>(
          bloc: widget.bloc,
          buildWhen: (o, n) {
            return o.studyLeadStatus != n.studyLeadStatus;
          },
          builder: (context, state) {
            if (state.studyLeadStatus.isFailure) {
              return Container(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
                decoration: BoxDecoration(color: colors.shade0),
                child: Column(
                  spacing: 6.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    12.h.verticalSpace,
                    icons.cancel.svg(height: 48.h, width: 48.w),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.h),
                        child: Text(
                          "something_went_wrong".tr(),
                          textAlign: TextAlign.center,
                          style: fonts.regularMain,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.h),
                        child: Text(
                          "something_went_wrong_subtitle".tr(),
                          textAlign: TextAlign.center,
                          style: fonts.xSmallMain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0.w).copyWith(bottom: 10.h),
                      child: CButton(
                        backgroundColor: const Color(0xffF2F2F3),
                        title: "Окей".tr(),
                        textColor: colors.darkMode900,
                        child: (state.studyLeadStatus.isInProgress)
                            ? const Center(child: CupertinoActivityIndicator())
                            : null,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state.studyLeadStatus.isSuccess) {
              return Container(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
                decoration: BoxDecoration(color: colors.shade0),
                child: Column(
                  spacing: 6.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    12.h.verticalSpace,
                    icons.donePay.svg(height: 48.h, width: 48.w),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.h),
                        child: Text(
                          "Ma'lumotingiz muvoffaqqiyatli yuklandi ",
                          textAlign: TextAlign.center,
                          style: fonts.regularMain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0.w).copyWith(bottom: 10.h),
                      child: CButton(
                        backgroundColor: const Color(0xffF2F2F3),
                        title: "Окей".tr(),
                        textColor: colors.darkMode900,
                        child: (state.studyLeadStatus.isInProgress)
                            ? const Center(child: CupertinoActivityIndicator())
                            : null,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(12.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("apply_for_ed".tr(), style: fonts.regularMain),
                        WScaleAnimation(
                          onTap: () => Navigator.of(context).pop(),
                          child: SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: icons.cancel.svg(),
                          ),
                        ),
                      ],
                    ),
                    12.h.verticalSpace,
                    Text("name".tr(), style: fonts.regularText),
                    CustomTextField(
                      focusNode: _nameFocus,
                      controller: _nameCtrl,
                      onChanged: (value) {},
                      hintText: 'enter_your_name'.tr(),
                    ),
                    SizedBox(height: 8.h),
                    Text("second_name".tr(), style: fonts.regularText),
                    CustomTextField(
                      focusNode: _lastNameFocus,
                      controller: _lastNameCtrl,
                      onChanged: (value) {},
                      hintText: 'enter_your_second_name'.tr(),
                    ),
                    SizedBox(height: 8.h),
                    Text("phone".tr(), style: fonts.regularText),
                    CustomTextField(
                      focusNode: _phoneFocus,
                      controller: _phoneCtrl,
                      onChanged: (value) {},
                      hintText: 'enter_phone'.tr(),
                    ),
                    20.h.verticalSpace,
                    ValueListenableBuilder(
                      valueListenable: _phoneNotifier,
                      builder: (ctx, val, child) {
                        return ValueListenableBuilder(
                          valueListenable: _lastNameNotifier,
                          builder: (co, va, ch) {
                            return ValueListenableBuilder(
                              valueListenable: _nameNotifier,
                              builder: (c, v, ch) {
                                final phone = _phoneNotifier.value.isNotEmpty;
                                final name = _lastNameNotifier.value.isNotEmpty;
                                final lastName = _nameNotifier.value.isNotEmpty;

                                return CButton(
                                  backgroundColor: (phone && name && lastName) ? colors.error500 : colors.neutral200,
                                  title: "continue".tr(),
                                  textColor: (phone && name && lastName) ? colors.shade0 : colors.darkMode900,
                                  onTap: () {
                                    final name = "${_nameCtrl.text} ${_lastNameCtrl.text}";
                                    final phone = _phoneCtrl.text;
                                    final courseId = widget.id;
                                    final companyId = state.study?.companyId ?? -1;

                                    if (courseId != -1 && companyId != -1) {
                                      widget.bloc.add(
                                        BranchEvent.studyLead(
                                          report: StudyLead(
                                            (v) => v
                                              ..name = name
                                              ..phone = phone
                                              ..companyId = companyId
                                              ..courseId = courseId,
                                          ),
                                        ),
                                      );
                                    } else {
                                      context.showPopUp(
                                        status: PopUpStatus.warning,
                                        message: "Sizning malumotlaringizda kamchilik mavjud",
                                        fonts: fonts,
                                        colors: colors,
                                        context: context,
                                      );
                                    }
                                    _nameCtrl.clear();
                                    _lastNameCtrl.clear();
                                    _phoneCtrl.clear();
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class StudyLeadWidget extends StatelessWidget {
  final int id;
  final PatientInfo patient;
  final BranchBloc bloc;
  final VoidCallback apply;

  const StudyLeadWidget({
    super.key,
    required this.id,
    required this.patient,
    required this.bloc,
    required this.apply,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controllers) {
        return BlocBuilder<BranchBloc, BranchState>(
          bloc: bloc,
          buildWhen: (o, n) {
            return o.studyLeadStatus != n.studyLeadStatus;
          },
          builder: (c, state) {
            return Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
              decoration: BoxDecoration(color: colors.shade0),
              child: Column(
                spacing: 6.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xffEDEDED),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                      child: SizedBox(
                        width: 1.sw,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "full_information_support".tr(),
                                maxLines: 2,
                                style: fonts.regularMain,
                              ),
                            ),
                            WScaleAnimation(
                              onTap: () => Navigator.of(context).pop(),
                              child: icons.cancel.svg(height: 24.h, width: 24.w),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          types.length,
                          (i) {
                            final title = types[i];
                            return Text("•\t $title", style: fonts.regularText);
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w).copyWith(bottom: 10.h),
                    child: CButton(
                      backgroundColor: const Color(0xffF2F2F3),
                      title: "apply_for_ed".tr(),
                      textColor: colors.darkMode900,
                      child: (state.studyLeadStatus.isInProgress)
                          ? const Center(child: CupertinoActivityIndicator())
                          : null,
                      onTap: () {
                        Navigator.of(context).pop();

                        Future.delayed(const Duration(milliseconds: 300), () {
                          apply();
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

List<String> types = const <String>[
  "Терапия",
  "Xирургия",
  "Гинекология",
  "Неврология",
  "Эндокринология",
];

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
