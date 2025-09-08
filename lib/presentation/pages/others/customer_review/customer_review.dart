import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/customer_review/filter/filter_review_branches.dart';
import 'package:medion/presentation/pages/others/customer_review/filter/filter_review_directions.dart';
import 'package:medion/presentation/pages/others/customer_review/filter/review_filter.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/filter_interval_enum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'new_review_card.dart';

class CustomerReview extends StatefulWidget {
  const CustomerReview({super.key});

  @override
  State<CustomerReview> createState() => _CustomerReviewState();
}

class _CustomerReviewState extends State<CustomerReview> {
  late final BranchBloc _bloc;

  final ValueNotifier<int> selectedRank = ValueNotifier(-2);
  late final ValueNotifier<List<ReviewInfoModel>> selectedDirections;
  late final ValueNotifier<List<ReviewInfoModel>> selectedBranches;
  late final ValueNotifier<FilterIntervalEnum> selectedInterval;
  late final TextEditingController _controller;
  late final RefreshController _refresh;

  @override
  void initState() {
    _bloc = context.read<BranchBloc>();
    selectedBranches = ValueNotifier([]);
    selectedDirections = ValueNotifier([]);
    selectedInterval = ValueNotifier(FilterIntervalEnum.year);
    _refresh = RefreshController();
    _bloc.add(const BranchEvent.getReviews());
    _controller = TextEditingController();
    super.initState();
  }

  Future<void> _openFilter({
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
    required IconSet icons,
    required ReviewModel review,
  }) async {
    final w = ValueNotifier(1.sw);
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return ValueListenableBuilder(
          valueListenable: w,
          builder: (context, width, child) {
            return AnimatedContainer(
              constraints: BoxConstraints(maxHeight: 0.9.sh),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: width,
              decoration: BoxDecoration(
                color: colors.backgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: ReviewFilter(
                  clear: () {
                    selectedInterval.value = FilterIntervalEnum.year;
                    selectedRank.value = -9;
                    selectedDirections.value = [];
                    selectedBranches.value = [];
                  },
                  selectedInterval: selectedInterval,
                  selectedRank: selectedRank,
                  review: review,
                  applyTab: () {
                    final availableRank = selectedRank.value > 0;
                    final availableBranch = selectedBranches.value.isNotEmpty;
                    final availableDirections = selectedDirections.value.isNotEmpty;
                    final availableInterval =
                        selectedInterval.value.startTime.isNotEmpty || selectedInterval.value.endTime.isNotEmpty;
                    if (availableRank || availableBranch || availableDirections || availableInterval) {
                      ///  get with params

                      _bloc.add(BranchEvent.getReviews(
                        branches: selectedBranches.value,
                        directions: selectedDirections.value,
                        rank: selectedRank.value,
                        startDate: selectedInterval.value.startTime,
                        endDate: selectedInterval.value.endTime,
                      ));
                    } else {
                      /// get default
                      _bloc.add(const BranchEvent.getReviews());
                    }
                  },
                  branchTab: () async {
                    _openBranches(context: context, w: w, colors: colors, review: review);
                    await Future.delayed(const Duration(milliseconds: 100));
                    w.value = 1.sw - 20.w;
                  },
                  directionTab: () async {
                    _openDirections(context: context, w: w, colors: colors, review: review);
                    await Future.delayed(const Duration(milliseconds: 100));
                    w.value = 1.sw - 20.w;
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _openDirections({
    required BuildContext context,
    required ValueNotifier w,
    required CustomColorSet colors,
    required ReviewModel review,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          constraints: BoxConstraints(maxHeight: 0.88.sh),
          width: 1.sw,
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          child: ReviewDirection(
            review: review,
            selectedDirection: selectedDirections,
          ),
        );
      },
    ).then((v) => w.value = 1.sw);
  }

  Future<void> _openBranches({
    required BuildContext context,
    required ValueNotifier w,
    required CustomColorSet colors,
    required ReviewModel review,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          constraints: BoxConstraints(maxHeight: 0.88.sh),
          width: 1.sw,
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          child: FilterReviewBranches(
            review: review,
            selectedBranches: selectedBranches,
          ),
        );
      },
    ).then((v) => w.value = 1.sw);
  }

  @override
  Widget build(BuildContext context) {
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
            title: Text("customers_reviews".tr(), style: fonts.regularMain),
            actions: [
              BlocBuilder<BranchBloc, BranchState>(
                bloc: _bloc,
                builder: (context, state) {
                  return WScaleAnimation(
                    onTap: () async {
                      if (state.reviews != null) {
                        _openFilter(
                          review: state.reviews!,
                          context: context,
                          colors: colors,
                          fonts: fonts,
                          icons: icons,
                        );
                      }
                    },
                    child: icons.filter.svg(width: 20.w, height: 20.h),
                  );
                },
              ),
              12.w.horizontalSpace,
            ],
          ),
          body: BlocBuilder<BranchBloc, BranchState>(
            bloc: _bloc,
            builder: (context, state) {
              final reviews = (state.reviews != null && state.reviews!.reviews.isEmpty) || state.reviews == null;

              if (state.getReviewStatus.isFailure || reviews) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
                  ),
                );
              }

              if (state.getReviewStatus.isInProgress || state.getReviewStatus.isInitial) {
                return const Center(child: CupertinoActivityIndicator());
              }
              return SmartRefresher(
                onRefresh: () async {
                  context.read<BranchBloc>().add(const BranchEvent.getReviews());
                },
                controller: _refresh,
                enablePullDown: true,
                header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                child: ListView.builder(
                  itemCount: state.reviews!.reviews.length,
                  itemBuilder: (context, index) {
                    final review = state.reviews!.reviews[index];
                    final rating = int.tryParse(review.ratings ?? "") ?? 0;
                    return ReviewCardNew(
                      name: review.patientName ?? "",
                      clinicName: review.companyName ?? "",
                      clinicLocation: review.location ?? review.location ?? "",
                      rating: rating,
                      review: review.review ?? "",
                      date: review.dateTime ?? "",
                      clinicImage: review.companyLogoUrl ?? "",
                      integratorLogoUrl: review.integratorLogoUrl ?? "",
                      doctorImage: review.doctorImage ?? "",
                      doctorJob: review.doctorJobName ?? "",
                      doctorName: review.doctorName ?? "",
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
