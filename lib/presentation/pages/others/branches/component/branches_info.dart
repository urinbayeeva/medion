import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class BranchesInfoCard extends StatelessWidget {
  final List<String> branchPhotos;
  final String branchName;
  final String branchAdress;
  final String branchPhoneNumber;
  final String branchWorkingHours;
  final VoidCallback branchPhoneNumberButton;
  final VoidCallback branchAdressButton;
  final VoidCallback branchMoreInfo;
  
  const BranchesInfoCard(
      {super.key,
      required this.branchPhotos,
      required this.branchName,
      required this.branchAdress,
      required this.branchPhoneNumber,
      required this.branchWorkingHours,
      required this.branchPhoneNumberButton,
      required this.branchAdressButton,
      required this.branchMoreInfo});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        margin: EdgeInsets.only(bottom: 16.h, left: 12.w, right: 12.w),
        padding: EdgeInsets.all(12.w),
        width: double.infinity,
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          children: [
            // 16.h.verticalSpace,
            _buildImageSection(colors, fonts),

            12.h.verticalSpace,
            Text(
              semanticsLabel: branchName,
              branchName,
              style: fonts.regularMain
                  .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
            ),
            12.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.w,
              children: [
                icons.location.svg(width: 20.w, height: 20.h),
                Text(
                  semanticsLabel: branchAdress,
                  overflow: TextOverflow.clip,
                  branchAdress,
                  style: fonts.smallLink
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                )
              ],
            ),
            12.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.w,
              children: [
                icons.clock
                    .svg(width: 18.w, height: 18.h, color: colors.primary900),
                Text(
                  semanticsLabel: branchWorkingHours,
                  branchWorkingHours,
                  style: fonts.smallLink
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                )
              ],
            ),
            16.h.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AnimationButtonEffect(
                    // isGrey: true,
                    onTap: branchPhoneNumberButton,
                    child: CButton(
                      backgroundColor: colors.neutral200,
                      textColor: colors.primary900,
                      title: "Позвонить",
                      iconPath: icons.phone,
                      onTap: branchPhoneNumberButton,
                    ),
                  ),
                ),
                8.w.horizontalSpace,
                Expanded(
                  child: AnimationButtonEffect(
                    // isGrey: true,
                    onTap: branchAdressButton,
                    child: CButton(
                      backgroundColor: colors.neutral200,
                      textColor: colors.primary900,
                      title: "На карте",
                      iconPath: icons.map,
                      onTap: branchAdressButton,
                    ),
                  ),
                ),
              ],
            ),
            8.h.verticalSpace,
            AnimationButtonEffect(
              // isGrey: true,
              onTap: branchMoreInfo,
              child: CButton(
                backgroundColor: colors.neutral200,
                textColor: colors.primary900,
                title: "Подробнее о клинике",
                onTap: branchMoreInfo,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildImageSection(colors, fonts) {
    return CarouselSlider(
        items: branchPhotos.map((images) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: colors.backgroundColor),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(images)),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          // autoPlay: true,
          aspectRatio: 1.6,
          enlargeCenterPage: true,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlayInterval: const Duration(seconds: 40),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
}
