import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/discount_card.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
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
            buildWhen: (o, n) {
              final status = o.fetchContentStatus != n.fetchContentStatus;
              final content = o.contentByType != n.contentByType;
              return status || content;
            },
            builder: (context, state) {
              if (state.fetchContentStatus.isInitial || state.fetchContentStatus.isInProgress) {
                return Center(child: CupertinoActivityIndicator(color: colors.error500));
              }

              final discountContent = state.contentByType["discount"] ?? [];

              if (discountContent.isEmpty || state.fetchContentStatus.isFailure) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
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
