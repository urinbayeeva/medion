import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/condition_of_discount_widget.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/discount_duration_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/date_util.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:medion/utils/extensions.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class CInfoView extends StatefulWidget {
  final int id;
  final ContentTypeEnum type;

  const CInfoView({super.key, required this.id, required this.type});

  @override
  State<CInfoView> createState() => _CInfoViewState();
}

class _CInfoViewState extends State<CInfoView> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  final ValueNotifier<List<String>> images = ValueNotifier([]);

  @override
  void initState() {
    context.read<ContentBloc>().add(ContentEvent.getSingleContent(id: widget.id, type: widget.type.itemKey));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (c, colors, fonts, icons, controller) {
        return BlocBuilder<ContentBloc, ContentState>(
          buildWhen: (o, n) {
            final single = o.singleContent != n.singleContent;
            final status = o.singleContentStatus != n.singleContentStatus;
            return single || status;
          },
          builder: (ctx, state) {
            if (state.singleContentStatus.isInProgress || state.singleContentStatus.isInitial) {
              return Scaffold(
                backgroundColor: colors.backgroundColor,
                appBar: AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: colors.shade0,
                  surfaceTintColor: Colors.black,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  leading: WScaleAnimation(
                    child: Icon(Icons.keyboard_arrow_left, size: 32.h),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  title: Shimmer.fromColors(
                    baseColor: colors.neutral300,
                    highlightColor: colors.shade0,
                    child: Text(widget.type.title.tr(), style: fonts.regularMain),
                  ),
                ),
                body: const Center(child: CupertinoActivityIndicator()),
              );
            }
            if (state.singleContentStatus.isFailure || state.singleContent == null) {
              return Scaffold(
                backgroundColor: colors.backgroundColor,
                appBar: AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: colors.shade0,
                  surfaceTintColor: Colors.black,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  leading: WScaleAnimation(
                    child: Icon(Icons.keyboard_arrow_left, size: 32.h),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  title: Text(widget.type.title.tr(), style: fonts.regularMain),
                ),
                body: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 50.h),
                    child: Lottie.asset("assets/anim/404.json"),
                  ),
                ),
              );
            }

            images.value = [...state.singleContent!.images, state.singleContent!.primaryImage];
            return Scaffold(
              backgroundColor: colors.shade0,
              body: ValueListenableBuilder(
                valueListenable: images,
                builder: (ctx, val, child) {
                  return Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: _currentIndex,
                        builder: (ctx, val, child) {
                          return Stack(
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
                                    _currentIndex.value = index;
                                  },
                                ),
                                items: images.value.map((url) {
                                  return CachedNetworkImage(
                                    imageUrl: url,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Center(child: Icon(Icons.broken_image_rounded)),
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
                                          child: icons.left.svg(
                                            color: colors.primary900,
                                          ),
                                        ),
                                      ),
                                      AnimationButtonEffect(
                                        onTap: () {
                                          Share.share(
                                              "${state.singleContent?.title ?? ''}: https://www.instagram.com/");
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
                              // Dot Indicators
                              if (images.value.length > 1) ...{
                                Positioned(
                                  bottom: 12.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: images.value.asMap().entries.map((entry) {
                                      final isActive = _currentIndex.value == entry.key;
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
                              }
                            ],
                          );
                        },
                      ),
                      // Content
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            12.h.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(state.singleContent?.title ?? '', style: fonts.mediumMain),
                            ),
                            ListTile(
                              leading: icons.calendarActive.svg(color: colors.neutral800),
                              title: Text(
                                state.singleContent?.createDate != null && state.singleContent!.createDate.isNotEmpty
                                    ? DateUtilsEx.formatDate(context, state.singleContent!.createDate).toCapitalized()
                                    : '',
                                style: fonts.xSmallText,
                              ),
                            ),
                            4.h.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: WHtml(data: state.singleContent!.decodedDescription ?? ''),
                            ),
                            if (state.singleContent!.discountCondition != null &&
                                widget.type == ContentTypeEnum.discount) ...[
                              24.h.verticalSpace,
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: ConditionOfDiscountWidget(
                                  discountCondition: state.singleContent!.discountCondition.toString(),
                                ),
                              ),
                              24.h.verticalSpace,
                              Builder(
                                builder: (ctx) {
                                  String date = '';
                                  final start = state.singleContent?.discountStartDate;
                                  final end = state.singleContent?.discountEndDate;
                                  if (start == null && end != null) {
                                    date = MyFunctions.formattedDate(end.toString());
                                  } else if (start != null && end == null) {
                                    date = MyFunctions.formattedDate(start.toString());
                                  } else {
                                    date =
                                        '${MyFunctions.formattedDate(start.toString())} - ${MyFunctions.formattedDate(end.toString())}';
                                  }

                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: DiscountDurationWidget(
                                      discountAddress: state.singleContent?.discountLocation.toString() ?? "",
                                      discountDuration: date,
                                      phoneNumber: state.singleContent!.phoneNumber.toString() ?? "",
                                      phoneShortNumber: state.singleContent!.phoneNumberShort.toString() ?? "",
                                    ),
                                  );
                                },
                              ),
                              24.h.verticalSpace,
                            ],
                            24.h.verticalSpace,
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
