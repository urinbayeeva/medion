import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CustomFeedback extends StatelessWidget {
  const CustomFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  // height: 56.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: colors.secondary800,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r)),
                      border:
                          Border.all(width: 2, color: const Color(0xFFF2F2F3))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Алишер",
                          style: fonts.smallLink.copyWith(
                              color: colors.primary900,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600)),
                      4.h.verticalSpace,
                      RatingBar(
                        itemSize: 14,
                        glowColor: colors.error500,
                        allowHalfRating: true,
                        minRating: 3,
                        initialRating: 3,
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star, color: colors.error500),
                          half: Icon(Icons.star, color: colors.error500),
                          empty: Icon(Icons.star, color: colors.error500),
                        ),
                        onRatingUpdate: (value) {},
                        maxRating: 5,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.h.verticalSpace,
                      Text(
                          "Отношение чуткое. Внимательное. Профессионал своего дела, любит свою работу и со всей ответственностью\nотносится к ней. Самый лучший! Желаю Вам здоровья, семейного благополучия,\nдолгих лет жизни. Низкий Вам поклон!",
                          style: fonts.xSmallText.copyWith(fontSize: 13.sp)),
                      10.h.verticalSpace,
                      Text(
                        "10.12.2022",
                        style:
                            fonts.xSmallText.copyWith(color: const Color(0xFF808284)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                right: 20,
                top: 40,
                child: CircleAvatar(
                  radius: 24.r,
                  backgroundColor: colors.shade0,
                  child: icons.quote.svg(width: 24.w, height: 24.h),
                ))
          ],
        ),
      );
    });
  }
}
