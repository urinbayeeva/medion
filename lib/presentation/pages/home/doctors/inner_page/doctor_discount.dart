import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorDiscountScreen extends StatefulWidget {
  const DoctorDiscountScreen({super.key, required this.discount, required this.doctor});

  final Discount discount;
  final ModelDoctor doctor;

  @override
  State<DoctorDiscountScreen> createState() => _DoctorDiscountScreenState();
}

class _DoctorDiscountScreenState extends State<DoctorDiscountScreen> {
  int _currentIndex = 0;
  List<String> images = [];

  @override
  void initState() {
    images = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return Scaffold(
          body: Column(
            children: [
              CAppBar(
                bordered: true,
                title: "discounts".tr(),
                isBack: true,
                centerTitle: true,
                trailing: 24.w.horizontalSpace,
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: colors.shade0),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctor.name.asString,
                        style: fonts.smallMain,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        widget.discount.title ?? '',
                        style: fonts.smallLink,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
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
                      return CommonImage(
                        imageUrl: url,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
                              child: icons.left.svg(color: colors.primary900),
                            ),
                          ),
                          AnimationButtonEffect(
                            onTap: () {
                              // Share.share("${widget.title ?? ''}: https://www.instagram.com/");
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
                  if (images.length > 1)
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
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
