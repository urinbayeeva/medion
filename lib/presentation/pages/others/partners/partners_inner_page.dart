import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/pages/others/branches/widget/image_dialog.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/phone_utils.dart';

class PartnersInnerPage extends StatelessWidget {
  final String partnerName;
  final String partnerImage;
  final String partnerUrl;
  final String partnerPhoneNumber;
  final String partnerTitle;
  final List<String> partnerImages;

  const PartnersInnerPage({
    super.key,
    required this.partnerName,
    required this.partnerImage,
    required this.partnerUrl,
    required this.partnerPhoneNumber,
    required this.partnerTitle,
    required this.partnerImages,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, ctrl) {
        return Scaffold(
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
            title: Text(partnerName, style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          body: Builder(
            builder: (context) {
              if (partnerPhoneNumber.isEmpty || partnerUrl.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons.emojiSad.svg(width: 100.w, height: 100.h),
                      12.h.verticalSpace,
                      Text(
                        textAlign: TextAlign.center,
                        "Информация об этом партнере не найдена",
                        style: fonts.smallSemLink,
                      ),
                      50.h.verticalSpace,
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.h.verticalSpace,
                        partnerImage.isEmpty
                            ? SvgPicture.asset(
                                "assets/icons/picture.svg",
                                width: 80.w,
                                height: 80.h,
                                colorFilter: ColorFilter.mode(colors.neutral500, BlendMode.srcIn),
                              )
                            : CachedImageComponent(height: 80.h, width: 80.w, imageUrl: partnerImage),
                        16.h.verticalSpace,
                        Row(
                          spacing: 6.w,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CButton(
                                height: 58.h,
                                width: 1.sw,
                                backgroundColor: colors.shade0,
                                title: '',
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("phone".tr(), style: fonts.xSmallText),
                                      SizedBox(height: 2.h),
                                      Text(
                                        partnerPhoneNumber,
                                        style: fonts.smallSemLink.copyWith(fontSize: 12.sp),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  makePhoneCall(partnerPhoneNumber);
                                },
                              ),
                            ),
                            Expanded(
                              child: CButton(
                                height: 55.h,
                                width: 1.sw,
                                backgroundColor: colors.shade0,
                                title: '',
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 2.h,
                                    children: [
                                      Text("site".tr(), style: fonts.xSmallText),
                                      Text(
                                        partnerUrl,
                                        style: fonts.smallSemLink.copyWith(fontSize: 12.sp),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  MyFunctions.openLink(partnerUrl);
                                },
                              ),
                            )
                          ],
                        ),
                        24.h.verticalSpace,
                        Text(partnerTitle, style: fonts.smallLink),
                        if (partnerImages.isNotEmpty) ...[
                          24.h.verticalSpace,
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 180.h,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                            ),
                            items: partnerImages.map((imageUrl) {
                              return WScaleAnimation(
                                onTap: () {
                                  final List<ContentBase> contentBaseList = partnerImages
                                      .where((item) => item.isNotEmpty)
                                      .map((item) => ContentBase(
                                            isVideo: false,
                                            fileLink: item,
                                            coverImage: item,
                                          ))
                                      .toList();
                                  MyFunctions.showImages(
                                    isLicence: false,
                                    isVideo: false,
                                    context: context,
                                    mainImage: imageUrl,
                                    images: [...contentBaseList],
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: CachedImageComponent(
                                    imageUrl: imageUrl,
                                    height: 180.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                        24.h.verticalSpace,
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
