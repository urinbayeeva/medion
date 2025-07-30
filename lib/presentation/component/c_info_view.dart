import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/condition_of_discount_widget.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/discount_duration_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/date_util.dart';
import 'package:medion/utils/extensions.dart';
import 'package:share_plus/share_plus.dart';
// ... other imports

class CInfoView extends StatefulWidget {
  final List<String>? imagePaths;
  final String? title;
  final String? desc;
  final String? date;
  final bool? isDiscount;
  final String? discountAddress;
  final String? discountDuration;
  final String? phoneNumber;
  final String? phoneShortNumber;
  final String discountCondition;

  const CInfoView({
    super.key,
    this.imagePaths,
    this.title,
    this.desc,
    this.date,
    this.isDiscount,
    this.discountAddress,
    this.discountDuration,
    this.phoneNumber,
    this.phoneShortNumber,
    required this.discountCondition,
  });

  @override
  State<CInfoView> createState() => _CInfoViewState();
}

class _CInfoViewState extends State<CInfoView> {
  int _currentIndex = 0;
  late final List<String> images;

  @override
  void initState() {
    images = widget.imagePaths ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.shade0,
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 264.h,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: images.map((url) {
                      return CachedNetworkImage(
                        imageUrl: url,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Center(child: Icon(Icons.broken_image_rounded)),
                      );
                    }).toList(),
                  ),
                  // Navigation & Share Buttons
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
                            onTap: () => Navigator.pop(context),
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
                              Share.share("${widget.title ?? ''}: https://www.instagram.com/");
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
                    ),
                  ),
                  // Dot Indicators
                  if (images.length > 1) ...{
                    Positioned(
                      bottom: 12.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          final isActive = _currentIndex == entry.key;
                          return Container(
                            width: isActive ? 10.w : 8.w,
                            height: isActive ? 10.w : 8.w,
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isActive ? colors.error500 : colors.neutral200,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  }
                ],
              ),
              // Content
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    12.h.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(widget.title ?? '', style: fonts.mediumMain),
                    ),
                    ListTile(
                      leading: icons.calendarActive.svg(color: colors.neutral800),
                      title: Text(
                        widget.date != null && widget.date!.isNotEmpty
                            ? DateUtilsEx.formatDate(context, widget.date!).toCapitalized()
                            : '',
                        style: fonts.xSmallText,
                      ),
                    ),
                    4.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WHtml(data: widget.desc ?? ''),
                    ),
                    if (widget.isDiscount != null && widget.discountCondition.isNotEmpty) ...[
                      24.h.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ConditionOfDiscountWidget(
                          discountCondition: widget.discountCondition,
                        ),
                      ),
                      24.h.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: DiscountDurationWidget(
                          discountAddress: widget.discountAddress ?? "",
                          discountDuration: widget.discountDuration ?? "",
                          phoneNumber: widget.phoneNumber ?? "",
                          phoneShortNumber: widget.phoneShortNumber ?? "",
                        ),
                      ),
                      24.h.verticalSpace,
                    ],
                    24.h.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
