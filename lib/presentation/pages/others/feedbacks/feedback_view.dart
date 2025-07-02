import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/feedbacks/drop_down_widget.dart';
import 'package:medion/presentation/pages/others/feedbacks/rank_widget.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key, this.noBack = false, this.branch = ''});

  final bool noBack;
  final String branch;

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  late final TextEditingController _controller;
  late final BranchBloc _bloc;
  late final FocusNode _focusNode;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<BranchBloc>();

    _controller = TextEditingController()
      ..addListener(() {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 400), () {
          _bloc.add(BranchEvent.fillingReviewData(comment: _controller.text));
        });
      });

    _focusNode = FocusNode();

    _bloc.add(const BranchEvent.fetchBranches());
    _bloc.add(BranchEvent.fillingReviewData(branch: widget.branch, rank: -1, comment: ''));
  }

  @override
  Widget build(BuildContext buildContext) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocConsumer<BranchBloc, BranchState>(
              listenWhen: (o, n) => o.postReviewStatus != n.postReviewStatus,
              listener: (context, lState) {
                if (lState.postReviewStatus.isFailure) {
                  context.showPopUp(
                    context: context,
                    status: PopUpStatus.warning,
                    colors: colors,
                    fonts: fonts,
                    message: 'something_went_wrong'.tr(),
                  );
                }
                if (lState.postReviewStatus.isSuccess) {
                  _controller.clear();
                  _bloc.add(BranchEvent.fillingReviewData(branch: widget.branch, rank: -1, comment: ''));
                  context.showPopUp(
                    context: context,
                    status: PopUpStatus.success,
                    colors: colors,
                    fonts: fonts,
                    message: "success".tr(),
                  );
                }
              },
              buildWhen: (o, n) {
                final reviewBranch = o.reviewBranch != n.reviewBranch;
                final reviewRank = o.reviewRank != n.reviewRank;
                final reviewComment = o.reviewComment != n.reviewComment;
                final branches = o.branches != n.branches;
                final status = o.getBranchesStatus != n.getBranchesStatus;
                final post = o.postReviewStatus != n.postReviewStatus;

                return branches || status || reviewComment || reviewRank || reviewBranch || post;
              },
              builder: (context, state) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colors.shade0,
                  ),
                  child: SizedBox(
                    height: 460,
                    width: 350,
                    child: Stack(
                      children: [
                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            AppBar(
                              centerTitle: true,
                              elevation: 0,
                              backgroundColor: colors.shade0,
                              foregroundColor: colors.darkMode900,
                              scrolledUnderElevation: 0,
                              leadingWidth: 0,
                              automaticallyImplyLeading: false,
                              actions: [
                                if (!widget.noBack) ...{
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.w),
                                    child: WScaleAnimation(
                                      child: Icon(Icons.clear, size: 24.h),
                                      onTap: () => Navigator.of(context).pop(),
                                    ),
                                  )
                                }
                              ],
                              title: Text("leave_feedback".tr(), style: fonts.regularMain),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "send_to_us_feedbacks".tr(),
                                style: fonts.regularText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            12.verticalSpace,
                            Text("branches".tr(), style: fonts.xSmallText.copyWith(color: colors.neutral600)),
                            const SizedBox(height: 60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("give_stars".tr(), style: fonts.xSmallText.copyWith(color: colors.neutral600)),
                                RankWidget(
                                  icons: icons,
                                  colors: colors,
                                  onTap: (val) {
                                    _bloc.add(BranchEvent.fillingReviewData(rank: val));
                                  },
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Text("feedback".tr(), style: fonts.xSmallText.copyWith(color: colors.neutral600)),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 100.h),
                              child: TextField(
                                expands: true,
                                maxLines: null,
                                minLines: null,
                                focusNode: _focusNode,
                                controller: _controller,
                                keyboardType: TextInputType.multiline,
                                textAlignVertical: TextAlignVertical.top,
                                cursorColor: colors.neutral300,
                                style: fonts.regularText.copyWith(fontSize: 16.sp),
                                decoration: InputDecoration(
                                  hintText: 'leave_feedback'.tr(),
                                  hintStyle: fonts.regularText.copyWith(color: colors.neutral600, fontSize: 16.sp),
                                  filled: true,
                                  fillColor: colors.shade0,
                                  contentPadding: EdgeInsets.all(12.h),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(color: colors.neutral300),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(color: colors.neutral300),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(color: colors.neutral300, width: 1.5),
                                  ),
                                ),
                              ),
                            ),
                            12.verticalSpace,
                            CButton(
                              backgroundColor: (state.reviewRank != -1 &&
                                      state.reviewBranch.isNotEmpty &&
                                      _controller.text.length > 3)
                                  ? null
                                  : colors.neutral300,
                              title: 'send'.tr(),
                              child: state.postReviewStatus.isInProgress ? const CupertinoActivityIndicator() : null,
                              onTap: () {
                                final canPress = state.reviewRank != -1 &&
                                    state.reviewBranch.isNotEmpty &&
                                    _controller.text.length > 3;
                                if (canPress) {
                                  final post = PostReviewModel(
                                    (v) => v
                                      ..ratings = state.reviewRank.toString()
                                      ..review = state.reviewComment
                                      ..companyId = 123
                                      ..patientId = 456
                                      ..isAnonym = false,
                                  );

                                  _bloc.add(BranchEvent.postReviews(review: post));
                                } else {
                                  context.showPopUp(
                                    context: context,
                                    status: PopUpStatus.warning,
                                    colors: colors,
                                    fonts: fonts,
                                    message: "something_went_wrong".tr(),
                                  );
                                }
                              },
                            ),
                            12.verticalSpace,
                          ],
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 140,
                          child: (widget.branch.isNotEmpty && widget.branch.length > 4)
                              ? IgnorePointer(
                                  ignoring: true,
                                  child: DropDownWidget(
                                    fonts: fonts,
                                    colors: colors,
                                    branch: widget.branch,
                                    items: state.branches,
                                    onChange: (String val) {},
                                  ),
                                )
                              : DropDownWidget(
                                  fonts: fonts,
                                  colors: colors,
                                  items: state.branches,
                                  onChange: (String val) {
                                    _bloc.add(BranchEvent.fillingReviewData(branch: val));
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
