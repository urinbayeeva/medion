import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_choose.dart';
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
    images = ["${widget.discount.image}"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.shade0,
          body: SingleChildScrollView(
            child: Column(
              children: [
                CAppBar(
                  bordered: true,
                  title: "discounts".tr(),
                  isBack: true,
                  centerTitle: true,
                  trailing: 24.w.horizontalSpace,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        SizedBox(
                          height: 200.h,
                          child: CommonImage(
                            imageUrl: widget.doctor.image.toString(),
                            errorWidget: (context, url, error) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: DecoratedBox(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                child: Image.asset(
                                  "assets/images/doctor_placeholder.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          widget.doctor.name.asString,
                          style: fonts.smallMain,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          widget.discount.title ?? '',
                          style: fonts.smallLink,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          "Акция до {date}".tr(
                            namedArgs: {"date": _formatDiscountDate(widget.discount.discountEndDate?.toString())},
                          ),
                          style: fonts.smallLink,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: 10.h),
                        CButton(
                          title: "appointment_nav_bar".tr(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedServiceChoose(
                                  serviceTypeId: 0,
                                  isDoctorService: true,
                                  doctorId: widget.doctor.id,
                                ),
                              ),
                            );
                          },
                          height: 38.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 264.h,
                        viewportFraction: 0.8,
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonImage(
                            imageUrl: url,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            radius: BorderRadius.circular(8),
                          ),
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
                                child: icons.left.svg(width: 24.w, height: 24.h, color: colors.primary900),
                              ),
                            ),
                            AnimationButtonEffect(
                              onTap: () {
                                // Share.share("${widget.title ?? ''}: https://www.instagram.com/");
                              },
                              child: CircleAvatar(
                                radius: 20.r,
                                backgroundColor: colors.shade0,
                                child: icons.right.svg(width: 24.w, height: 24.h, color: colors.primary900),
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
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDiscountDate(String? date) {
    final DateFormat dateFormat = DateFormat('dd.MM.yyyy');
    if (date == null || date.isEmpty) {
      return 'дата не указана'.tr();
    }
    try {
      return dateFormat.format(DateTime.parse(date));
    } catch (e) {
      return 'неверный формат даты'.tr();
    }
  }
}
