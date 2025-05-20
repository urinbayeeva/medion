import 'package:chopper/chopper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/phone_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnersInnerPage extends StatefulWidget {
  final String partnerName;
  final String partnerImage;
  final String partnerUrl;
  final String partnerPhoneNumber;
  final String partnerTitle;
  const PartnersInnerPage(
      {super.key,
      required this.partnerName,
      required this.partnerImage,
      required this.partnerUrl,
      required this.partnerPhoneNumber,
      required this.partnerTitle});

  @override
  State<PartnersInnerPage> createState() => _PartnersInnerPageState();
}

class _PartnersInnerPageState extends State<PartnersInnerPage> {
  Future<void> getUrl() async {
    final String url = "https://${widget.partnerUrl}";
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, contoller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
                bordered: true,
                title: widget.partnerName,
                centerTitle: true,
                isBack: true,
                trailing: 24.w.horizontalSpace),
            if (widget.partnerPhoneNumber.isEmpty ||
                widget.partnerUrl.isEmpty) ...[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons.emojiSad.svg(width: 100.w, height: 100.h),
                      12.h.verticalSpace,
                      Text(
                          textAlign: TextAlign.center,
                          "Информация об этом партнере не найдена",
                          style: fonts.smallSemLink.copyWith()),
                      50.h.verticalSpace,
                    ],
                  ),
                ),
              )
            ] else
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.h.verticalSpace,
                    widget.partnerImage.isEmpty
                        ? SvgPicture.asset("assets/icons/picture.svg",
                            width: 80.w, height: 80.h, color: colors.neutral500)
                        : CachedImageComponent(
                            height: 80.h,
                            width: 80.w,
                            imageUrl: widget.partnerImage),
                    16.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AnimationButtonEffect(
                            onTap: () {
                              makePhoneCall(widget.partnerPhoneNumber);
                            },
                            child: Container(
                              width: 195.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: colors.shade0,
                                border: Border.all(
                                    width: 1, color: colors.neutral400),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("phone".tr(), style: fonts.xSmallText),
                                  SizedBox(height: 2.h),
                                  Text(
                                    widget.partnerPhoneNumber,
                                    style: fonts.smallSemLink
                                        .copyWith(fontSize: 12.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        4.w.horizontalSpace,
                        Expanded(
                          child: AnimationButtonEffect(
                            onTap: () {
                              getUrl();
                            },
                            child: Container(
                              width: 140.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: colors.shade0,
                                border: Border.all(
                                    width: 1, color: colors.neutral400),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("site".tr(), style: fonts.xSmallText),
                                  SizedBox(height: 2.h),
                                  Text(
                                    widget.partnerUrl,
                                    style: fonts.smallSemLink
                                        .copyWith(fontSize: 12.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    24.h.verticalSpace,
                    Text(widget.partnerTitle, style: fonts.smallLink),
                  ],
                ),
              ))
          ],
        ),
      );
    });
  }
}
