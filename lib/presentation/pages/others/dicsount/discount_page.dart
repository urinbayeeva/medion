import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/extensions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';

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
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "discount"));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "discount"));
    _refreshController.refreshCompleted();
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
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
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
            Expanded(
              child: BlocBuilder<ContentBloc, ContentState>(
                builder: (context, state) {
                  if (state.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colors.error500,
                      ),
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
                          icons.emojiSad.svg(width: 80.w, height: 80.h),
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
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.68,
                            ),
                            itemCount: discountContent.length,
                            itemBuilder: (context, index) {
                              final discount = discountContent[index];
                              final endDateFormatted = _formatDiscountDate(
                                  discount.discountEndDate?.toString());

                              return ArticleCardWidget(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    AppRoutes.getInfoViewAboutHealth(
                                      imagePath: discount.primaryImage,
                                      title:
                                          discount.decodedTitle.toCapitalized(),
                                      desc: discount.decodedDescription
                                          .toCapitalized(),
                                      date: discount.createDate,
                                      isDiscount: true,
                                      discountAddress: discount.discountLocation
                                              ?.toString() ??
                                          '',
                                      discountDuration: discount
                                                  .discountStartDate !=
                                              null
                                          ? "${_formatDiscountDate(discount.discountStartDate?.toString())} - $endDateFormatted"
                                          : endDateFormatted,
                                      phoneShortNumber: discount
                                              .phoneNumberShort
                                              ?.toString() ??
                                          '',
                                      phoneNumber:
                                          discount.phoneNumber?.toString() ??
                                              '',
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
              ),
            ),
          ],
        ),
      );
    });
  }
}
