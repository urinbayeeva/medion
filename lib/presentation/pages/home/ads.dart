import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/news/news_page.dart';
import 'package:medion/presentation/pages/others/article/article_page.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/dicsount/discount_page.dart';
import 'package:medion/presentation/pages/others/equipment/equipment_page.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/ads_enums.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class Ads extends StatefulWidget {
  const Ads({super.key});

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> with AutomaticKeepAliveClientMixin {
  late final CarouselSliderController controller;
  static final ValueNotifier<int> _dotsCount = ValueNotifier(0);

  @override
  void initState() {
    controller = CarouselSliderController();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, ctrl) {
        return BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (o, n) {
            final length = o.ads.length != n.ads.length;
            final ads = o.ads != n.ads;

            return length || ads;
          },
          builder: (ctx, state) {
            if (state.ads.isEmpty) {
              return CarouselSlider(
                items: List.generate(1, (_) => _buildShimmerAd()),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 10),
                ),
              );
            }
            return Stack(
              children: [
                CarouselSlider(
                  carouselController: controller,
                  items: state.ads.toList().asMap().entries.map((entry) {
                    final ad = entry.value;
                    final imageUrl = _getLocalizedImageUrl(ad, context);
                    final AdsEnum type = MyFunctions.findAdsType(ad.type);
                    return GestureDetector(
                      onTap: () {
                        if (ad.contentId == null && ad.link.toString().isEmpty) {
                          context.showPopUp(
                            status: PopUpStatus.warning,
                            message: "Invalid Id",
                            fonts: fonts,
                            colors: colors,
                            context: context,
                          );
                          return;
                        }

                        if (type.isNews) {
                          Navigator.of(context, rootNavigator: true)
                              .push(AppRoutes.getInfoViewAboutHealth(id: ad.contentId!, type: ContentTypeEnum.news))
                              .then((_) => context.read<BottomNavBarController>().changeNavBar(false));
                        }
                        if (type.isDiscount) {
                          if (ad.contentId != null) {
                            Navigator.of(context, rootNavigator: true).push(
                              AppRoutes.getInfoViewAboutHealth(
                                id: ad.contentId!,
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
                        }
                        if (type.isArticles) {
                          Navigator.of(context, rootNavigator: true)
                              .push(AppRoutes.getInfoViewAboutHealth(id: ad.contentId!, type: ContentTypeEnum.article))
                              .then((_) => context.read<BottomNavBarController>().changeNavBar(false));
                        }
                        if (type.isEquipment) {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(builder: (context) => const EquipmentPage()),
                          );
                        }
                        if (type.isPartner) {
                          Navigator.of(context, rootNavigator: true).push(AppRoutes.getPartnersPage());
                        }
                        if (type.isBlogHealth) {
                          Navigator.of(context, rootNavigator: true).push(AppRoutes.getAboutHealthPage());
                        }
                        if (type.isNone) {
                          MyFunctions.openLink(ad.link.toString());
                        }
                      },
                      child: Container(
                        width: 1.sw,
                        height: 60.h,
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: colors.neutral300.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(30.r),
                            bottomLeft: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors.shade0,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          margin: EdgeInsets.only(bottom: 3.h, left: 2.w),
                          child: CommonImage(
                            shimmer: (context, url) => _buildShimmerAd(),
                            radius: BorderRadius.circular(10.r),
                            imageUrl: imageUrl,
                            errorImageAsset: "assets/images/medion_app_logo.png",
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: state.ads.length > 1 ? true : false,
                    aspectRatio: 16 / 9.8,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 10),
                    scrollPhysics:
                        state.ads.length <= 1 ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
                    onPageChanged: (index, reason) => _dotsCount.value = index,
                  ),
                ),
                if (state.ads.length >= 2) ...{
                  ValueListenableBuilder(
                    valueListenable: _dotsCount,
                    builder: (context, value, child) {
                      return Positioned(
                        bottom: 20.h,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color(0xff242222).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                              child: DotsIndicator(
                                dotsCount: state.ads.length,
                                position: _dotsCount.value,
                                decorator: DotsDecorator(
                                  color: const Color(0xffFFFFFF).withValues(alpha: 0.25),
                                  activeColor: colors.shade0,
                                  size: const Size.square(9.0),
                                  activeSize: const Size.square(9.0),
                                  spacing: EdgeInsets.symmetric(horizontal: 2.w),
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                }
              ],
            );
          },
        );
      },
    );
  }

  String _getLocalizedImageUrl(dynamic ad, BuildContext context) {
    final locale = context.locale;
    if (locale.languageCode == 'ru') {
      return ad.imageForMobileRu ?? ad.imageForMobileUz ?? '';
    }
    return ad.imageForMobileUz ?? ad.imageForMobileRu ?? '';
  }

  Widget _buildShimmerAd() {
    return ShimmerView(
      child: Container(
        width: double.infinity,
        height: 230.h,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
