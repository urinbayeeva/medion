import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/feedbacks/rank_widget.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class FeedBackWithoutLocation extends StatefulWidget {
  const FeedBackWithoutLocation({super.key, this.noBack = false, required this.id});

  final bool noBack;
  final int id;

  @override
  State<FeedBackWithoutLocation> createState() => _FeedBackWithoutLocationState();
}

class _FeedBackWithoutLocationState extends State<FeedBackWithoutLocation> {
  late final TextEditingController _controller;
  late final ValueNotifier<int> _rank;

  late final FocusNode _focusNode;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _rank = ValueNotifier(0);
    _controller = TextEditingController()
      ..addListener(() {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 400), () {});
      });

    _focusNode = FocusNode();
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
            child: BlocConsumer<NotificationBloc, NotificationState>(
              listenWhen: (o, n) => o.postNotificationReviewStatus != n.postNotificationReviewStatus,
              listener: (context, lState) {
                if (lState.postNotificationReviewStatus.isFailure) {
                  context.showPopUp(
                    context: context,
                    status: PopUpStatus.warning,
                    colors: colors,
                    fonts: fonts,
                    message: 'something_went_wrong'.tr(),
                  );
                }
                if (lState.postNotificationReviewStatus.isSuccess) {
                  _controller.clear();
                  // _bloc.add(const BranchEvent.fillingReviewData(rank: -1, comment: ''));
                  _rank.value = 0;
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
                final post = o.postNotificationReviewStatus != n.postNotificationReviewStatus;

                return post;
              },
              builder: (context, state) {
                return Container(
                  width: 350,
                  padding: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colors.shade0,
                  ),
                  child: ValueListenableBuilder(
                      valueListenable: _rank,
                      builder: (context, val, child) {
                        return Column(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("give_stars".tr(), style: fonts.xSmallText.copyWith(color: colors.neutral600)),
                                    RankWidget(
                                      icons: icons,
                                      colors: colors,
                                      onTap: (val) {
                                        _rank.value = val;
                                        // _bloc.add(BranchEvent.fillingReviewData(rank: val));
                                      },
                                    ),
                                  ],
                                ),
                                12.verticalSpace,
                                Text(
                                  "feedback".tr(),
                                  style: fonts.xSmallText.copyWith(color: colors.neutral600),
                                ),
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
                                    onChanged: (v) => setState(() {}),
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
                              ],
                            ),
                            CButton(
                              backgroundColor:
                                  (_rank.value >= 1 && _controller.text.length > 3) ? null : colors.neutral300,
                              title: 'send'.tr(),
                              child: state.postNotificationReviewStatus.isInProgress
                                  ? const CupertinoActivityIndicator()
                                  : null,
                              onTap: () {
                                final canPress = _rank.value >= 1 && _controller.text.length > 3;

                                if (canPress) {
                                  final post = PostVisitReviewModel(
                                    (v) => v
                                      ..ratings = _rank.value.toString()
                                      ..review = _controller.text
                                      ..visitId = widget.id,
                                  );

                                  context.read<NotificationBloc>().add(
                                        NotificationEvent.postNotificationReview(review: post),
                                      );
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
                          ],
                        );
                      }),
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
