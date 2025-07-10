import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';
import 'package:medion/utils/extensions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscountPage extends StatefulWidget {
  final int? discountId;

  const DiscountPage({super.key, this.discountId});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  final RefreshController _refreshController = RefreshController();
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  @override
  void initState() {
    super.initState();
    if (widget.discountId != null) {
      // Fetch single discount by ID if provided
      _fetchDiscountById(widget.discountId!);
    } else {
      // Fetch all discounts as before
      context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "discount"));
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    if (widget.discountId == null) {
      context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "discount"));
      _refreshController.refreshCompleted();
    }
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

  // Method to fetch discount by ID using http and navigate to details page
  Future<void> _fetchDiscountById(int pk) async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.baseUrlP}/content/discount').replace(
          queryParameters: {
            'type': 'discount',
            'pk': pk.toString(), // Use pk from widget.discountId
            'lang': 'en_US',
          },
        ),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final discount = Discount.fromJson(jsonData);
        final endDateFormatted = _formatDiscountDate(discount.discountEndDate?.toString());

        // Navigate to the details page
        // if (mounted) {
        //   await Navigator.push(
        //     context,
        //     AppRoutes.getInfoViewAboutHealth(
        //       discountCondition: "",
        //       imagePath: discount.images,
        //       title: discount.decodedTitle.toCapitalized(),
        //       desc: discount.decodedDescription.toCapitalized(),
        //       date: discount.createDate,
        //       isDiscount: true,
        //       discountAddress: discount.discountLocation ?? '',
        //       discountDuration: discount.discountStartDate != null
        //           ? "${_formatDiscountDate(discount.discountStartDate?.toString())} - $endDateFormatted"
        //           : endDateFormatted,
        //       phoneShortNumber: discount.phoneNumberShort ?? '',
        //       phoneNumber: discount.phoneNumber ?? '',
        //     ),
        //   );
        // Pop twice to go back two screens
        // if (mounted && Navigator.canPop(context)) {
        //   Navigator.pop(context);
        // }
        // }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('failed_to_fetch_discount'.tr())),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('something_went_wrong'.tr())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "discounts".tr(),
                centerTitle: true,
                isBack: true,
                trailing: 28.w.horizontalSpace,
              ),
              if (widget.discountId != null) ...[
                Expanded(child: _buildLoadingView(colors)),
              ] else ...[
                Expanded(child: _buildDiscountListView(colors, fonts, icons)),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingView(colors) {
    return Center(
      child: CircularProgressIndicator(color: colors.error500),
    );
  }

  Widget _buildDiscountListView(colors, fonts, icons) {
    return BlocBuilder<ContentBloc, ContentState>(
      builder: (context, state) {
        if (state.loading) {
          return Center(
            child: CircularProgressIndicator(color: colors.error500),
          );
        }

        if (state.error) {
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
                (icons as IconSet).emojiSad.svg(width: 80, height: 80),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: discountContent.length,
                  itemBuilder: (context, index) {
                    final discount = discountContent[index];
                    final endDateFormatted = _formatDiscountDate(discount.discountEndDate?.toString());

                    return ArticleCardWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          AppRoutes.getInfoViewAboutHealth(
                            discountCondition: "",
                            imagePath: discount.images.toList(),
                            title: discount.decodedTitle.toCapitalized(),
                            desc: discount.decodedDescription.toCapitalized(),
                            date: discount.createDate,
                            isDiscount: true,
                            discountAddress: discount.discountLocation?.toString() ?? '',
                            discountDuration: discount.discountStartDate != null
                                ? "${_formatDiscountDate(discount.discountStartDate?.toString())} - $endDateFormatted"
                                : endDateFormatted,
                            phoneShortNumber: discount.phoneNumberShort?.toString() ?? '',
                            phoneNumber: discount.phoneNumber?.toString() ?? '',
                          ),
                        );
                      },
                      title: discount.title.toCapitalized(),
                      description: "Акция до {date}".tr(namedArgs: {
                        "date": endDateFormatted,
                      }),
                      image: discount.primaryImage,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
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
