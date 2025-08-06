import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:medion/utils/extensions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  final RefreshController _refreshController = RefreshController();
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  @override
  void initState() {
    super.initState();
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "discount"));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "discount"));
    _refreshController.refreshCompleted();
    return;
  }

  String _formatDiscountDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'дата не указана'.tr();
    }
    try {
      return _dateFormat.format(DateTime.parse(date));
    } catch (e) {
      return 'неверный формат даты'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
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
            title: Text("discounts".tr(), style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<ContentBloc, ContentState>(
            builder: (context, state) {
              if (state.fetchContentStatus.isInitial || state.fetchContentStatus.isInProgress) {
                return Center(
                  child: CircularProgressIndicator(color: colors.error500),
                );
              }

              if (state.fetchContentStatus.isFailure) {
                return Center(
                  child: Text(
                    'something_went_wrong'.tr(),
                    style: fonts.regularSemLink,
                  ),
                );
              }

              final discountContent = state.contentByType["discount"] ?? [];

              if (discountContent.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons.emojiSad.svg(width: 80, height: 80),
                      4.h.verticalSpace,
                      Text(
                        'no_result_found'.tr(),
                        style: fonts.regularSemLink,
                      ),
                    ],
                  ),
                );
              }

              return SmartRefresher(
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.h.verticalSpace,
                      GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.w,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 252.h,
                        ),
                        itemCount: discountContent.length,
                        itemBuilder: (context, index) {
                          final discount = discountContent[index];
                          final endDateFormatted = _formatDiscountDate(discount.discountEndDate?.toString());

                          return DiscountCard(
                            image: discount.primaryImage,
                            title: discount.title.toCapitalized(),
                            date: "Акция до {date}".tr(namedArgs: {"date": endDateFormatted}),
                            colors: colors,
                            fonts: fonts,
                            onTap: () {
                              Navigator.push(
                                context,
                                AppRoutes.getInfoViewAboutHealth(
                                  id: discount.id,
                                  type: ContentTypeEnum.discount,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
    required this.image,
    required this.colors,
    required this.title,
    required this.date,
    required this.fonts,
    required this.onTap,
  });

  final String image;
  final String title;
  final String date;
  final CustomColorSet colors;
  final FontSet fonts;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        width: 92.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.h,
          children: [
            CommonImage(
              radius: const BorderRadius.vertical(top: Radius.circular(12)),
              height: 163.h,
              width: double.infinity,
              imageUrl: image,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: fonts.xSmallLink.copyWith(fontWeight: FontWeight.w500, color: colors.darkMode900),
                  maxLines: 3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(bottom: 6.h),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  date,
                  style: fonts.xxSmallestText.copyWith(color: const Color(0xff66686C)),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data model for the discount response
class Discount {
  final String type;
  final int id;
  final String createDate;
  final String title;
  final String description;
  final String link;
  final String primaryImage;
  final List<String> images;
  final String discountCondition;
  final String? discountLocation;
  final String? discountStartDate;
  final String? discountEndDate;
  final String? phoneNumber;
  final String? phoneNumberShort;
  final int categoryId;
  final List<dynamic> banners;

  Discount({
    required this.type,
    required this.id,
    required this.createDate,
    required this.title,
    required this.description,
    required this.link,
    required this.primaryImage,
    required this.images,
    required this.discountCondition,
    this.discountLocation,
    this.discountStartDate,
    this.discountEndDate,
    this.phoneNumber,
    this.phoneNumberShort,
    required this.categoryId,
    required this.banners,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      type: json['type'] ?? '',
      id: json['id'] ?? 0,
      createDate: json['create_date'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      link: json['link'] ?? '',
      primaryImage: json['primary_image'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      discountCondition: json['discount_condition'] ?? '',
      discountLocation: json['discount_location'],
      discountStartDate: json['discount_start_date'],
      discountEndDate: json['discount_end_date'],
      phoneNumber: json['phone_number'],
      phoneNumberShort: json['phone_number_short'],
      categoryId: json['category_id'] ?? 0,
      banners: json['banners'] ?? [],
    );
  }

  // Helper getters for decoded title and description
  String get decodedTitle => title; // Add decoding logic if needed
  String get decodedDescription => description; // Add decoding logic if needed
}
