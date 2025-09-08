import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/others/customer_review/customer_review.dart';
import 'package:medion/presentation/pages/others/customer_review/review_card.dart';
import 'package:medion/presentation/pages/others/feedbacks/feedback_view.dart';
import 'package:medion/presentation/pages/others/feedbacks/feedback_view_vithout_location.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/enums/visits_enum.dart';

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
    required this.id,
    this.review,
    required this.colors,
    required this.fonts,
    required this.icons,
    required this.isDone,
  });

  final int id;
  final PatientReviewModel? review;
  final CustomColorSet colors;
  final FontSet fonts;
  final IconSet icons;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    log("Review: ${review?.review.toString()}");

    if (isDone == false) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            80.h.verticalSpace,
            Container(
              width: 1.sw,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: colors.error50,
                border: Border.all(color: colors.error500),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10.w,
                children: [
                  icons.warningExclamation.svg(height: 20.h, width: 20.h),
                  Flexible(
                    child: Text(
                      "you_cant_comment_until_completed_service".tr(),
                      style: fonts.xSmallText.copyWith(fontSize: 12.sp, color: colors.error500),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
    if (review == null && review?.review == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 50.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
          child: FeedBackWithoutLocation(id: id, noBack: true, isFromVisitScreen: true),
        ),
      );
    }

    if (review != null) {
      return Column(
        children: [
          SizedBox(height: 60.h),
          ReviewCard(
            review: GetReviewModel(
              (b) => b
                ..review = "${review!.review}"
                ..ratings = "${review!.ratings}"
                ..patientName = review?.name ?? ''
                ..dateTime = review?.createDate ?? ""
                ..location = review?.location ?? "",
            ),
            colors: colors,
            icons: icons,
            fonts: fonts,
            status: MyFunctions.getFeedBackStatus("${review?.status}"),
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 50.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
        child: FeedBackWithoutLocation(id: id, noBack: true),
      ),
    );
  }
}
