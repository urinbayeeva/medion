import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/customer_review/review_card.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/feedback_status_enum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomerReview extends StatefulWidget {
  const CustomerReview({super.key});

  @override
  State<CustomerReview> createState() => _CustomerReviewState();
}

class _CustomerReviewState extends State<CustomerReview> {
  late final TextEditingController _controller;
  late final RefreshController _refresh;

  @override
  void initState() {
    _refresh = RefreshController();
    context.read<BranchBloc>().add(const BranchEvent.getReviews());
    _controller = TextEditingController();
    super.initState();
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
          ),
          body: BlocBuilder<BranchBloc, BranchState>(
            builder: (context, state) {
              if (state.getReviewStatus.isFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/anim/404.json"),
                      Text("no_result_found".tr(), style: fonts.regularMain),
                    ],
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
                  itemCount: state.reviews.length,
                  itemBuilder: (context, index) {
                    final review = state.reviews[index];
                    return ReviewCard(
                      review: review,
                      colors: colors,
                      icons: icons,
                      fonts: fonts,
                      status: MyFunctions.getFeedBackStatus(review.status),
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

class CustomerReviewModel {
  final String name;
  final int rating;
  final String title;
  final String description;
  final String location;
  final String dateTime;

  const CustomerReviewModel({
    this.name = '',
    this.rating = -1,
    this.title = '',
    this.description = '',
    this.location = '',
    this.dateTime = '',
  });
}
