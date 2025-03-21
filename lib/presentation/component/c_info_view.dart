import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/condition_of_discount_widget.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/discount_duration_widget.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_detail_card.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/date_util.dart';
import 'package:medion/utils/extensions.dart';
import 'package:share_plus/share_plus.dart';

class CInfoView extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? desc;
  final String? date;
  final bool? isDiscount;
  final String? discountAddress;
  final String? discountDuration;
  final String? phoneNumber;
  final String? phoneShortNumber;

  const CInfoView(
      {super.key,
      this.imagePath,
      this.title,
      this.desc,
      this.date,
      this.isDiscount,
      this.discountAddress,
      this.discountDuration,
      this.phoneNumber,
      this.phoneShortNumber});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.shade0,
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CachedNetworkImage(
                  imageUrl: imagePath!,
                  height: 264.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimationButtonEffect(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: colors.shade0,
                              child: icons.left.svg(
                                color: colors.primary900,
                              ),
                            ),
                          ),
                          AnimationButtonEffect(
                            onTap: () {
                              Share.share(
                                  "${title!}: https://www.instagram.com/");
                            },
                            child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: colors.shade0,
                              child: icons.share.svg(
                                width: 24.w,
                                height: 24.h,
                                color: colors.primary900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: [
                12.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(title ?? '', style: fonts.mediumMain),
                ),
                ListTile(
                  leading: icons.calendarActive.svg(color: colors.neutral800),
                  title: Text(
                    DateUtilsEx.formatDate(context, date!).toCapitalized(),
                    style: fonts.xSmallText,
                  ),
                ),
                4.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(desc ?? '', style: fonts.smallLink),
                ),
                if (isDiscount != null) ...[
                  24.h.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const ConditionOfDiscountWidget(),
                  ),
                  24.h.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: DiscountDurationWidget(
                      discountAddress: discountAddress ?? "",
                      discountDuration: discountDuration ?? "",
                      phoneNumber: phoneNumber ?? "",
                      phoneShortNumber: phoneShortNumber ?? "",
                    ),
                  ),
                  24.h.verticalSpace,
                ]
              ],
            ))
          ],
        ),
      );
    });
  }
}

// SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     imagePath != null && imagePath!.isNotEmpty
//                         ? CachedImageComponent(
//                             height: MediaQuery.of(context).size.height * 0.19,
//                             width: double.infinity,
//                             imageUrl: imagePath!,
//                           )
//                         : Image.asset(
//                             'assets/placeholder.png', // Default image path
//                             width: double.infinity,
//                             height: 264.h,
//                             fit: BoxFit.cover,
//                           ),
//                     Positioned(
//                       top: 60.h,
//                       left: 16.w,
//                       right: 16.w,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: colors.shade0,
//                             foregroundColor: colors.primary900,
//                             child: GestureDetector(
//                               onTap: () {
//                                 context
//                                     .read<BottomNavBarController>()
//                                     .changeNavBar(true);
//                                 Navigator.pop(context);
//                               },
//                               child: icons.left.svg(width: 24.w, height: 24.h),
//                             ),
//                           ),
//                           CircleAvatar(
//                             backgroundColor: colors.shade0,
//                             foregroundColor: colors.primary900,
//                             child: icons.share.svg(width: 24.w, height: 24.h),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ],
//             ),
//           ),
//         ),
