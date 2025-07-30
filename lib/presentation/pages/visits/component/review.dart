import 'dart:developer';

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

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
    required this.id,
    this.review,
    required this.colors,
    required this.fonts,
    required this.icons,
  });

  final int id;
  final PatientReviewModel? review;
  final CustomColorSet colors;
  final FontSet fonts;
  final IconSet icons;

  @override
  Widget build(BuildContext context) {
    if (review != null) {
      return Column(
        children: [
          SizedBox(height: 60.h),
          ReviewCard(
            review: GetReviewModel(
              (b) => b
                ..review = "${review!.review}"
                ..ratings = "${review!.ratings}"
                ..name = review?.name ?? ''
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
