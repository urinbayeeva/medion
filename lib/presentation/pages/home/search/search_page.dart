import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:medion/application/search/search_bloc.dart';
import 'package:medion/domain/models/search/search_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/pages/home/doctors/inner_page/home_doctor_item.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_doctor_chose.dart';
import 'package:medion/presentation/pages/home/news/widgets/news_item.dart';
import 'package:medion/presentation/pages/home/search/component/no_search_found.dart';
import 'package:medion/presentation/pages/home/search/component/searching_design_lottie.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/discount_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class SearchButtonFields {
  final int count;
  final String title;
  final bool canShow;
  final GlobalKey itemKey;
  final SearchTypeEnum type;

  const SearchButtonFields({
    this.count = -1,
    this.title = '',
    this.canShow = false,
    required this.itemKey,
    required this.type,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ValueNotifier<String> _tabTitle = ValueNotifier('all');

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  late final ValueNotifier<List<CategorySearchText>> _selectedServices;
  bool _hasSearched = false;
  Timer? _debounce;
  String _lastText = "";

  void tabForScrollSection(int index, List<SearchButtonFields> tabs) {
    final key = tabs[index].itemKey;
    final ctx = key.currentContext;

    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.1,
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        tabForScrollSection(index, tabs);
      });
    }

    // final GlobalKey key = tabs[index].itemKey;
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final context = key.currentContext;
    //
    //   log("Context: ===== ${context}");
    //
    //   if (context != null) {
    //     log("Context: ${context.size}");
    //     Scrollable.ensureVisible(
    //       context,
    //       duration: const Duration(milliseconds: 300),
    //       curve: Curves.easeInOut,
    //       alignment: 0.1,
    //     );
    //   }
    // });
  }

  @override
  void initState() {
    super.initState();
    _selectedServices = ValueNotifier([]);

    _searchController.addListener(() {
      final text = _searchController.text.trim();

      if (text == _lastText) return;

      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 400), () {
        if (!_hasSearched) {
          setState(() => _hasSearched = true);
        }
        _lastText = text;

        if (_lastText.length > 2) {
          context.read<SearchBloc>().add(
                SearchEvent.searchData(SearchReqModel((b) => b..text = text)),
              );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: colors.backgroundColor,
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
                title: CustomTextField(
                  onsuffixIconPressed: () {
                    _searchController.clear();
                  },
                  focusNode: _searchFocus,
                  controller: _searchController,
                  cursorColor: colors.error500,
                  hintText: "search".tr(),
                  suffixIcon: icons.cancel.svg(color: colors.primary900, width: 16.w, height: 16.h),
                  prefixIcon: icons.search.svg(color: colors.neutral600.withValues(alpha: 0.6)),
                ),
                bottom: PreferredSize(
                  preferredSize: Size(1.sw, 12.h),
                  child: DecoratedBox(decoration: BoxDecoration(color: colors.shade0)),
                ),
              ),
              body: Builder(
                builder: (ctx) {
                  if (!_hasSearched && _searchController.text.isEmpty) {
                    return const Center(child: SearchingDesignLottie());
                  }

                  if (state.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colors.error500,
                      ),
                    );
                  }

                  if (state.error) {
                    return const Center(child: NoSearchFound());
                  }

                  if (state.success && state.results.isNotEmpty) {
                    final results = state.results.first;

                    final hasD = results.doctors.isNotEmpty;
                    final hasC = results.categories.isNotEmpty;
                    final hasA = results.articles.isNotEmpty;
                    final hasDis = results.discounts.isNotEmpty;
                    final hasN = results.news.isNotEmpty;
                    final hasB = results.branches.isNotEmpty;
                    final hasS = results.services.isNotEmpty;

                    final bool available = !hasS && !hasN && !hasB && !hasDis;
                    if (!hasD && !hasC && !hasA && available && _searchController.text.isNotEmpty) {
                      return const NoSearchFound();
                    }

                    return NestedScrollView(
                      headerSliverBuilder: (ctx, innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            pinned: true,
                            automaticallyImplyLeading: false,
                            leadingWidth: 0,
                            backgroundColor: colors.shade0,
                            toolbarHeight: 80.h,
                            scrolledUnderElevation: 0,
                            flexibleSpace: PreferredSize(
                              preferredSize: Size(1.sw, 0.h),
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: colors.shade0),
                                child: SizedBox(
                                  width: 1.sw,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                        child: Text(
                                          "count_items_founded".tr(namedArgs: {"count": "${getTotalCount(results)}"}),
                                          style: fonts.regularSemLink,
                                        ),
                                      ),
                                      10.h.verticalSpace,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          spacing: 6.w,
                                          children: [
                                            ...List.generate(
                                              state.buttons.length,
                                              (i) {
                                                final button = state.buttons[i];
                                                if (!button.canShow) return const SizedBox.shrink();
                                                return ValueListenableBuilder(
                                                  valueListenable: _tabTitle,
                                                  builder: (context, title, child) {
                                                    return WScaleAnimation(
                                                      onTap: () {
                                                        _tabTitle.value = button.title;
                                                        tabForScrollSection(i, state.buttons);
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(left: i == 0 ? 12.w : 0),
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: 12.w,
                                                          vertical: 5.h,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: (title == button.title)
                                                              ? colors.error50
                                                              : const Color(0xffF9F9F9),
                                                          borderRadius: BorderRadius.circular(4.r),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              button.title.tr(),
                                                              style: fonts.smallMain.copyWith(
                                                                color: (title == button.title)
                                                                    ? colors.error500
                                                                    : colors.darkMode900,
                                                              ),
                                                            ),
                                                            8.w.horizontalSpace,
                                                            if (button.count != -1) ...{
                                                              Container(
                                                                height: 24.h,
                                                                width: 24.w,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: colors.error500,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "${(button.count.toString().length > 3 ? "99.." : button.count)}",
                                                                    style: fonts.xSmallLink.copyWith(
                                                                      color: colors.shade0,
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 12.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            }
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      10.h.verticalSpace,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ];
                      },
                      body: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox.fromSize(size: Size(1.sw, 0), key: state.buttons.first.itemKey),
                            ...List.generate(
                              state.buttons.length,
                              (i) {
                                final btn = state.buttons[i];

                                if (btn.canShow && btn.type.isService && hasS) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                        child: Text(
                                          key: btn.itemKey,
                                          "services".tr(),
                                          style: fonts.regularMain.copyWith(fontSize: 18.sp),
                                        ),
                                      ),

                                      ValueListenableBuilder(
                                        valueListenable: _selectedServices,
                                        builder: (ctx, selectedList, child) {
                                          return Column(
                                            children: [
                                              ...List.generate(
                                                results.services.length,
                                                (index) {
                                                  final service = results.services[index];
                                                  final isSelected = selectedList.any((c) => c.id == service.id);

                                                  return Container(
                                                    width: 1.sw,
                                                    margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                                    constraints: BoxConstraints(maxHeight: 135.h),
                                                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                                    decoration: BoxDecoration(
                                                      color: colors.shade0,
                                                      borderRadius: BorderRadius.circular(12.r),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              Text(
                                                                service.name ?? "",
                                                                style: fonts.regularText,
                                                                maxLines: 2,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                              Text(
                                                                service.description ?? "",
                                                                style: fonts.xSmallMain,
                                                                maxLines: 1,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        WScaleAnimation(
                                                          onTap: () => toggle(service),
                                                          child: Container(
                                                            padding: EdgeInsets.all(12.w),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8.r),
                                                              color: isSelected ? colors.error500 : colors.neutral200,
                                                            ),
                                                            child: isSelected
                                                                ? icons.check.svg(color: colors.shade0)
                                                                : icons.plus.svg(color: colors.primary900),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ),

                                      // ValueListenableBuilder(
                                      //   valueListenable: _selectedServices,
                                      //   builder: (context, selectedList, child) {
                                      //     return ListView.separated(
                                      //       shrinkWrap: true,
                                      //       physics: const NeverScrollableScrollPhysics(),
                                      //       padding: EdgeInsets.symmetric(horizontal: 12.w),
                                      //       itemCount: results.services.length,
                                      //       itemBuilder: (context, index) {
                                      //         final service = results.services[index];
                                      //         final isSelected = selectedList.any((c) => c.id == service.id);
                                      //
                                      //         return Container(
                                      //           width: 1.sw,
                                      //           constraints: BoxConstraints(maxHeight: 135.h),
                                      //           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                      //           decoration: BoxDecoration(
                                      //             color: colors.shade0,
                                      //             borderRadius: BorderRadius.circular(12.r),
                                      //           ),
                                      //           child: Row(
                                      //             children: [
                                      //               Expanded(
                                      //                 child: Column(
                                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                                      //                   mainAxisSize: MainAxisSize.min,
                                      //                   children: [
                                      //                     Text(
                                      //                       service.name ?? "",
                                      //                       style: fonts.regularText,
                                      //                       maxLines: 2,
                                      //                       overflow: TextOverflow.ellipsis,
                                      //                     ),
                                      //                     Text(
                                      //                       service.description ?? "",
                                      //                       style: fonts.xSmallMain,
                                      //                       maxLines: 1,
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //               WScaleAnimation(
                                      //                 onTap: () => toggle(service),
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.all(12.w),
                                      //                   decoration: BoxDecoration(
                                      //                     borderRadius: BorderRadius.circular(8.r),
                                      //                     color: isSelected ? colors.error500 : colors.neutral200,
                                      //                   ),
                                      //                   child: isSelected
                                      //                       ? icons.check.svg(color: colors.shade0)
                                      //                       : icons.plus.svg(color: colors.primary900),
                                      //                 ),
                                      //               )
                                      //             ],
                                      //           ),
                                      //         );
                                      //       },
                                      //       separatorBuilder: (context, index) => 10.h.verticalSpace,
                                      //     );
                                      //   },
                                      // )
                                    ],
                                  );
                                }

                                if (btn.canShow && btn.type.isDoctors && hasD) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        key: btn.itemKey,
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                        child: Text(
                                          "doctors".tr(),
                                          style: fonts.regularMain.copyWith(fontSize: 18.sp),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 310.h,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              ...List.generate(
                                                results.doctors.length,
                                                (index) {
                                                  final doctor = results.doctors[index];
                                                  return Padding(
                                                    padding: EdgeInsets.only(left: (index == 0) ? 12.w : 0),
                                                    child: HomeDoctorItem(
                                                      academicRank: "",
                                                      categoryType: "${doctor.workExperience}",
                                                      experience: "${doctor.workExperience}",
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                          AppRoutes.getAboutDoctorPage(
                                                            name: doctor.name.toString(),
                                                            profession: doctor.job.toString(),
                                                            status: "",
                                                            image: doctor.image.toString(),
                                                            id: doctor.id ?? 32,
                                                          ),
                                                        );
                                                      },
                                                      doctorID: doctor.id ?? 0,
                                                      name: doctor.name,
                                                      imagePath: doctor.image,
                                                      profession: doctor.job,
                                                      hasDiscount: false,
                                                      infoDescription: '',
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                if (btn.canShow && btn.type.isNews && hasN) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        key: btn.itemKey,
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                        child: Text(
                                          "news".tr(),
                                          style: fonts.regularMain.copyWith(fontSize: 18.sp),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 280.h,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: results.news.length,
                                          itemBuilder: (context, index) {
                                            final news = results.news[index];
                                            return Padding(
                                              padding: EdgeInsets.only(left: (index == 0) ? 12.w : 0),
                                              child: NewsItem(
                                                imagePath: news.image ?? "",
                                                title: news.name ?? "",
                                                subtitle: DecodedHelper.decodeHtml(news.description ?? ""),
                                                crop: true,
                                                onTap: () {
                                                  if (news.id != null) {
                                                    Navigator.of(context, rootNavigator: true).push(
                                                      AppRoutes.getInfoViewAboutHealth(
                                                          id: news.id!, type: ContentTypeEnum.news),
                                                    );
                                                  }
                                                },
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) => 10.w.horizontalSpace,
                                        ),
                                      )
                                    ],
                                  );
                                }

                                if (btn.canShow && btn.type.isArticles && hasA) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                        child: Text(
                                          key: btn.itemKey,
                                          "articles".tr(),
                                          style: fonts.regularMain.copyWith(fontSize: 18.sp),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 250.h,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: results.articles.length,
                                          itemBuilder: (context, index) {
                                            final article = results.articles[index];
                                            return Padding(
                                              padding: EdgeInsets.only(left: (index == 0) ? 12.w : 0),
                                              child: ArticleCardWidget(
                                                title: article.name ?? "",
                                                image: article.icon ?? "",
                                                onTap: () {
                                                  if (article.id != null) {
                                                    Navigator.push(
                                                      context,
                                                      AppRoutes.getInfoViewAboutHealth(
                                                        id: article.id!,
                                                        type: ContentTypeEnum.article,
                                                      ),
                                                    );
                                                  } else {
                                                    context.showPopUp(
                                                      status: PopUpStatus.warning,
                                                      message: "Id not found",
                                                      fonts: fonts,
                                                      colors: colors,
                                                      context: context,
                                                    );
                                                  }
                                                },
                                              ),
                                            );
                                          },
                                          separatorBuilder: (ctx, i) => 10.h.verticalSpace,
                                        ),
                                      )
                                    ],
                                  );
                                }

                                if (btn.canShow && btn.type.isDirections && hasC) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                        child: Text(
                                          "directions_of_medion_clinic".tr(),
                                          style: fonts.regularMain.copyWith(fontSize: 18.sp),
                                          key: btn.itemKey,
                                        ),
                                      ),

                                      ...List.generate(
                                        results.categories.length,
                                        (index) {
                                          final service = results.categories[index];

                                          return Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                                            child: MedicalDirectionItem(
                                              onTap: () {
                                                Navigator.of(context, rootNavigator: true).push(
                                                  AppRoutes.getDirectionInfoPage(
                                                    id: service.id!,
                                                    name: service.name ?? "",
                                                  ),
                                                );
                                              },
                                              title: service.name ?? "",
                                              subtitle: "",
                                              iconPath: service.icon ?? "",
                                            ),
                                          );
                                        },
                                      ),

                                      //
                                      // ListView.builder(
                                      //   padding: EdgeInsets.symmetric(horizontal: 12.w),
                                      //   shrinkWrap: true,
                                      //   physics: const NeverScrollableScrollPhysics(),
                                      //   itemCount: results.categories.length,
                                      //   itemBuilder: (context, index) {
                                      //     final service = results.categories[index];
                                      //
                                      //     return MedicalDirectionItem(
                                      //       onTap: () {
                                      //         Navigator.of(context, rootNavigator: true).push(
                                      //           AppRoutes.getDirectionInfoPage(
                                      //             id: service.id!,
                                      //             name: service.name ?? "",
                                      //           ),
                                      //         );
                                      //       },
                                      //       title: service.name ?? "",
                                      //       subtitle: "",
                                      //       iconPath: service.icon ?? "",
                                      //     );
                                      //   },
                                      // ),
                                    ],
                                  );
                                }

                                if (btn.canShow && btn.type.isDiscounts) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    key: btn.itemKey,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                                        child: Text(
                                          "discounts".tr(),
                                          style: fonts.regularMain.copyWith(fontSize: 18.sp),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 270.h,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final discount = results.discounts[index];
                                            return Padding(
                                              padding: EdgeInsets.symmetric(horizontal: (index == 0) ? 12.w : 0),
                                              child: SizedBox(
                                                width: 160.w,
                                                child: DiscountCard(
                                                  image: discount.image ?? "",
                                                  colors: colors,
                                                  title: discount.name ?? '',
                                                  date: " ",
                                                  fonts: fonts,
                                                  onTap: () {
                                                    if (discount.id != null) {
                                                      Navigator.push(
                                                        context,
                                                        AppRoutes.getInfoViewAboutHealth(
                                                          id: discount.id!,
                                                          type: ContentTypeEnum.discount,
                                                        ),
                                                      );
                                                    } else {
                                                      context.showPopUp(
                                                        status: PopUpStatus.warning,
                                                        message: "Id not found",
                                                        fonts: fonts,
                                                        colors: colors,
                                                        context: context,
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) => 10.w.horizontalSpace,
                                          itemCount: results.discounts.length,
                                        ),
                                      )
                                    ],
                                  );
                                }

                                if (btn.canShow && btn.type.isBranches && hasB) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        key: btn.itemKey,
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                                        child: Text(
                                          "branches".tr(),
                                          style: fonts.regularMain.copyWith(fontSize: 18.sp),
                                        ),
                                      ),
                                      ListView.separated(
                                        itemCount: results.branches.length,
                                        itemBuilder: (context, index) {
                                          final branches = results.branches[index];
                                          return Container(
                                            width: 1.sw,
                                            constraints: BoxConstraints(maxHeight: 135.h),
                                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                            decoration: BoxDecoration(
                                              color: colors.shade0,
                                              borderRadius: BorderRadius.circular(12.r),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  branches.name ?? "",
                                                  style: fonts.regularText,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  branches.description ?? "",
                                                  style: fonts.xSmallMain,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        separatorBuilder: (context, index) => 10.h.verticalSpace,
                                      )
                                    ],
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                            SizedBox(height: 32.h),
                          ],
                        ),
                      ),
                    );
                  }

                  return const NoSearchFound();
                },
              ),
              bottomNavigationBar: ValueListenableBuilder(
                valueListenable: _selectedServices,
                builder: (context, list, child) {
                  if (list.isEmpty) return const SizedBox.shrink();
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(color: colors.backgroundColor),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "count_services_selected".tr(namedArgs: {"count": "${list.length}"}),
                              style: fonts.xSmallLink.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold),
                            ),
                            AnimationButtonEffect(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  enableDrag: true,
                                  clipBehavior: Clip.antiAlias,
                                  constraints: BoxConstraints(
                                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                                  ),
                                  builder: (context) {
                                    return ValueListenableBuilder(
                                      valueListenable: _selectedServices,
                                      builder: (context, value, child) {
                                        return DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: colors.backgroundColor,
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                                          ),
                                          child: SingleChildScrollView(
                                            child: SizedBox(
                                              width: 1.sw,
                                              child: Column(
                                                spacing: 4.h,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  10.h.verticalSpace,
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "selected_services".tr(),
                                                          style: fonts.headlineMain.copyWith(fontSize: 16.sp),
                                                        ),
                                                        WScaleAnimation(
                                                          onTap: () {
                                                            _selectedServices.value = [];
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: Text(
                                                            "remove_all".tr(),
                                                            style: fonts.headlineMain.copyWith(
                                                              fontSize: 16.sp,
                                                              color: colors.error500,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  ...List.generate(
                                                    value.length,
                                                    (i) {
                                                      final item = value[i];
                                                      return Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                                        child: DecoratedBox(
                                                          decoration: BoxDecoration(
                                                            color: colors.shade0,
                                                            borderRadius: BorderRadius.circular(12.r),
                                                          ),
                                                          child: ListTile(
                                                            style: ListTileStyle.list,
                                                            title: Text(item.name ?? '', style: fonts.xSmallLink),
                                                            subtitle: Text(
                                                              item.description ?? '',
                                                              style: fonts.xSmallMain,
                                                            ),
                                                            trailing: GestureDetector(
                                                              onTap: () => removeItem(value[i]),
                                                              child: Image.asset(
                                                                "assets/images/trash.png",
                                                                width: 35,
                                                                height: 35,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  20.h.verticalSpace,
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: icons.right.svg(width: 20.w, height: 20.h, color: colors.darkMode900),
                            ),
                          ],
                        ),
                        12.h.verticalSpace,
                        CButton(
                          title: "next".tr(),
                          onTap: () {
                            final selectedServicesList = _selectedServices.value
                                .where((service) => service.id != null)
                                .map((service) => SelectedServices(serviceId: service.id!))
                                .toList();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedServiceDoctorChose(
                                  isHome: true,
                                  servicesIDes: <SelectedServices>[...selectedServicesList],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  void toggle(CategorySearchText b) {
    final list = List<CategorySearchText>.from(_selectedServices.value);
    final exists = list.any((item) => item.id == b.id);

    if (exists) {
      list.removeWhere((item) => item.id == b.id);
    } else {
      list.add(b);
    }
    _selectedServices.value = list;
  }

  void removeItem(CategorySearchText b) {
    log("before: ${_selectedServices.value.length}");
    final list = List<CategorySearchText>.from(_selectedServices.value)
      ..removeWhere((item) {
        log(" ${item.id} == ${b.id}");
        return item.id == b.id;
      });

    _selectedServices.value = list;
    log("after: ${_selectedServices.value.length}");
  }

  int getTotalCount(MedionResponseSearchText model) {
    return model.doctors.length +
        model.categories.length +
        model.news.length +
        model.articles.length +
        model.discounts.length +
        model.services.length +
        model.branches.length;
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    _searchController.dispose();
    super.dispose();
  }
}

class DecodedHelper {
  static String decodeHtml(String html) {
    final document = html_parser.parse(html);
    return document.body?.text ?? '';
  }
}
