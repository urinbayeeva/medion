import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/others/customer_review/customer_review.dart';
import 'package:medion/presentation/pages/others/customer_review/generate_star.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/enums/feedback_status_enum.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
    required this.colors,
    required this.icons,
    required this.fonts,
    required this.status,
    this.margin,
  });

  final CustomerReviewModel review;
  final CustomColorSet colors;
  final IconSet icons;
  final FontSet fonts;
  final FeedBackStatus status;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: colors.shade0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(review.name, style: fonts.regularMain),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: 20,
              child: GenerateStar(rank: review.rating, colors: colors, icons: icons),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Divider(color: colors.neutral100),
              Positioned(
                top: -5,
                bottom: -5,
                right: 18.w,
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.shade0,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: icons.quote.svg(height: 24.h, width: 24.w),
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(review.description, style: fonts.xSmallMain),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 6,
              children: [
                icons.location.svg(height: 20.h, width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        review.location,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: fonts.xSmallMain.copyWith(color: colors.neutral500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(review.dateTime, style: fonts.xSmallMain),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 4,
                  children: [
                    if (!status.isNone) ...{
                      if (status.icon.isNotEmpty) ...{status.icon.svg(height: 16.h, width: 16.w)},
                      Text(status.title, style: fonts.xSmallText.copyWith(color: colors.error500)),
                    }
                  ],
                )
              ],
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
